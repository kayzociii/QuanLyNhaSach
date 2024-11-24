<?php
session_start();
// Kết nối tới cơ sở dữ liệu
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "quanlynhasach";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Lấy `mauser` từ session
$mauser = $_SESSION['user']; 

// Truy vấn lấy `makhachhang` từ bảng `user`
$sql = "SELECT makhachhang FROM user WHERE mauser = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $mauser);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $makhachhang = $row['makhachhang'];
} else {
    echo "Không tìm thấy thông tin khách hàng. Vui lòng đăng nhập lại.";
    exit();
}

// Kiểm tra giỏ hàng có trống hay không
if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
    echo "<p>Giỏ hàng trống. Không thể thanh toán.</p>";
    echo "<a href='homepage.php'>Trở về trang chủ</a>";
    exit();
}

// Xử lý thanh toán
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $hoten = $_POST['hoten'];
    $diachi = $_POST['diachi'];
    $sodienthoai = $_POST['sodienthoai'];
    $maphuongthuc = $_POST['maphuongthuc'];
    $ngaydathang = date('Y-m-d H:i:s');
    $tongtien = $_POST['tongtien'];

    // Thêm dữ liệu vào bảng `hoadon`
    $sql = "INSERT INTO hoadon (hoten, diachi, sodienthoai, ngaydathang, tongtien, makhachhang, maphuongthuc) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssdis", $hoten, $diachi, $sodienthoai, $ngaydathang, $tongtien, $makhachhang, $maphuongthuc);
    $stmt->execute();

    // Lấy mã hóa đơn vừa tạo
    $mahoadon = $conn->insert_id;

    // Lưu chi tiết hóa đơn vào bảng `chitiethoadon`
    foreach ($_SESSION['cart'] as $masach => $item) {
        $soluong = $item['soluong'];
        $dongia = $item['giasach'];

        //Thêm chi tiết hóa đơn
        $sql = "INSERT INTO chitiethoadon (mahoadon, masach, soluong, dongia) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("iiid", $mahoadon, $masach, $soluong, $dongia);
        $stmt->execute();

        // Trừ số lượng tồn trong bảng sach
        $sql = "UPDATE sach SET soluongton = soluongton - ?, ngaycapnhat = NOW() WHERE masach = ? AND soluongton >= ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("iii", $soluong, $masach, $soluong);
        $stmt->execute();

        // Kiểm tra nếu số lượng tồn không đủ
        if ($stmt->affected_rows == 0) {
            echo "<p>Số lượng tồn kho không đủ cho sách mã: $masach</p>";
            echo "<a href='cart.php'>Quay lại giỏ hàng</a>";
            exit();
        }
    }

    // Xóa giỏ hàng sau khi thanh toán
    unset($_SESSION['cart']);

    echo "<script>
        alert('Thanh toán thành công!');
        window.location.href = 'homepage.php';
    </script>";
    exit();
}

// Lấy danh sách phương thức thanh toán
$sql = "SELECT * FROM phuongthucthanhtoan";
$result = $conn->query($sql);
$paymentMethods = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $paymentMethods[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
    <style>
        h2 {
            text-align: center;
            margin-bottom: 20px;
            padding-top: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
            width: 500px;
            margin-left: 400px;     
        }
        label {
            margin: 10px 0 5px;
        }
        input, select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            padding: 12px;
            background-color: #044785;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }
        button:hover {
            background-color: #ffa500;
        }

        span {
            font-weight: bold; 
            text-align: right; 
            margin-top: 20px;
        }

        .cart-table {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
        }
        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .cart-table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<?php include 'header.php' ?>
<div class="container">
    <h2>Thanh toán đơn hàng</h2>
    <form method="POST">
        <label for="hoten">Họ tên:</label>
        <input type="text" id="hoten" name="hoten" required>

        <label for="diachi">Địa chỉ:</label>
        <input type="text" id="diachi" name="diachi" required>

        <label for="sodienthoai">Số điện thoại:</label>
        <input type="text" id="sodienthoai" name="sodienthoai" required>

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Tên sách</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Tổng giá</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($_SESSION['cart'] as $item) { 
                    echo "<tr>
                        <td>{$item['tensach']}</td>
                        <td>{$item['soluong']}</td>
                        <td>{$item['giasach']}</td>
                        <td>" . $item['giasach'] * $item['soluong'] . "</td>
                    </tr>";
                }
                ?>
            </tbody>
        </table>
        <span id="tongtien">Tổng tiền: <?= number_format($_SESSION['totalAmount'], 0, ',', '.') ?> VND</span>
        <input type="hidden" id="tongtien" name="tongtien" value="<?= $_SESSION['totalAmount'] ?>">

        <label for="maphuongthuc">Phương thức thanh toán:</label>
<select id="maphuongthuc" name="maphuongthuc" required style="margin-bottom: 20px;" onchange="showQRCode()">
    <?php foreach ($paymentMethods as $method): ?>
        <option value="<?= $method['maphuongthuc'] ?>"><?= $method['tenphuongthuc'] ?></option>
    <?php endforeach; ?>
</select>
<div id="qrCodeContainer" style="text-align: center; margin-top: 20px; display: none;">
    <img id="qrCodeImage" src="images/momoqr.png" alt="QR Code Momo" style="width: 200px; height: auto;">
    <p>Quét mã để thanh toán qua Ví điện tử Momo</p>
</div>


        <button type="submit" style="margin-bottom: 50px;">Đặt hàng</button>
    </form>
</div>
<?php include 'footer.php' ?>
<script>
    function showQRCode() {
    // Lấy giá trị được chọn từ dropdown
    const paymentMethod = document.getElementById("maphuongthuc").value;

    // Lấy vùng chứa mã QR
    const qrCodeContainer = document.getElementById("qrCodeContainer");

    // Nếu phương thức là Momo (maphuongthuc = 2), hiển thị mã QR
    if (paymentMethod == "2") {
        qrCodeContainer.style.display = "block"; // Hiển thị vùng chứa
    } else {
        qrCodeContainer.style.display = "none"; // Ẩn vùng chứa
    }
}
</script>
</body>
</html>
