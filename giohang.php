<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "quanlynhasach";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
// Nhận yêu cầu cập nhật số lượng sách trong giỏ hàng
if (isset($_GET['action']) && $_GET['action'] == 'add' && isset($_POST['masach']) && isset($_POST['quantity'])) {
    $masach = $_POST['masach'];
    $quantity = $_POST['quantity'];

    $sql = "SELECT * FROM sach WHERE masach = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $masach);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $book = $result->fetch_assoc();
    } else {
        echo "<p class='text-danger'>Không tìm thấy thông tin sách.</p>";
        exit();
    }

    // Kiểm tra nếu sách đã có trong giỏ hàng
    if (isset($_SESSION['cart'][$masach])) {
        $_SESSION['cart'][$masach]['soluong'] += $quantity;
    } else {
        // Trường hợp sách chưa có trong giỏ hàng, thêm mới
        $_SESSION['cart'][$masach] = [
            'tensach' => $book['tensach'],
            'giasach' => $book['giasach'],
            'soluong' => $quantity,
            'anhbia' => $book['anhbia']
        ];
    }
}

// Cập nhật số lượng sách trong giỏ hàng
if (isset($_GET['action']) && $_GET['action'] == 'update' && isset($_POST['masach']) && isset($_POST['quantity'])) {
    $masach = $_POST['masach'];
    $quantity = $_POST['quantity'];

    $sql = "SELECT * FROM sach WHERE masach = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $masach);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $book = $result->fetch_assoc();
        $maxQuantity = $book['soluongton']; 
        if ($quantity > $maxQuantity) {
            echo "<script>alert('Số lượng yêu cầu vượt quá số lượng tồn kho!');</script>";
        }
        else if ($quantity <= 0) {
            unset($_SESSION['cart'][$masach]);
        } else {
            // Cập nhật số lượng sách trong giỏ hàng
            $_SESSION['cart'][$masach]['soluong'] = $quantity;
        }
    }
}

if (isset($_GET['action']) && $_GET['action'] == 'remove' && isset($_GET['masach'])) { 
    $masach = $_GET['masach']; 
    if (isset($_SESSION['cart'][$masach])) 
        { 
            unset($_SESSION['cart'][$masach]); 
        } 
}
// Kiểm tra giỏ hàng sau khi cập nhật
$cartItems = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
// Tính tổng số tiền của đơn hàng
$totalAmount = 0;
foreach ($cartItems as $item) {
    $totalAmount += $item['giasach'] * $item['soluong'];
}
$_SESSION['totalAmount'] = $totalAmount;
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body,
            html {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
            }

            .container {
                width: 80%;
                margin: 20px auto;
            }

            h2 {
                text-align: center;
                padding-bottom: 20px;
                padding-top: 10px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
                margin-left: 70px;
            }

            th,
            td {
                padding: 15px;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .product-image {
                width: 80px;
                height: auto;
                border-radius: 5px;
            }

            .checkout-form {
                text-align: center;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
            }

            .checkout-form label {
                font-size: 18px;
                margin-right: 10px;
            }

            .checkout-form input {
                padding: 10px;
                font-size: 16px;
                width: 60%;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .checkout-button, 
            .continue-button {
                padding: 12px 25px;
                font-size: 18px;
                font-weight: bold;
                color: white;
                background-color: #044785;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }
            .continue-button {
                background-color: #28a745;
            }

            .continue-button:hover {
                background-color: #218838;
            }
            .checkout-button:hover {
                background-color: #ffa500;
            }
            .total-amount {
                font-size: 18px;
                font-weight: bold;
                text-align: right;
            }

            .cart-buttons {
                display: flex;
                justify-content: space-between;
            }
            .empty-cart {
                display: flex; 
                flex-direction: column; 
                justify-content: center; 
                align-items: center; 
                height: 100vh; 
                text-align: center; 
            }
            input[type="number"] {
                display: inline-block;
                width: 60px; 
                text-align: center; 
                vertical-align: middle; 
            }

            button {
                display: inline-block;
                vertical-align: middle; 
            }   

            .form-control-sm {
                display: inline-block;
                vertical-align: middle;
            }
    </style>
</head>
<body>
<?php include 'header.php' ?>

<div class="container">
    <?php if (count($cartItems) > 0): ?>
    <h2>Giỏ hàng</h2>
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>Tên Sách</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Tổng giá</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($cartItems as $masach => $item): ?>
                    <tr>
                        <td><img src="images/<?= $item['anhbia'] ?>" class="product-image"></td>
                        <td><?= $item['tensach'] ?></td>
                        <td><?= number_format($item['giasach'], 0, ',', '.') ?>đ</td>
                        <td>
                            <form method="POST" action="giohang.php?action=update" id="form_<?= $masach ?>">
                            <input type="hidden" name="masach" value="<?= $masach ?>">
                            <button type="button" class="btn btn-outline-secondary btn-sm me-2" onclick="updateQuantity('quantity_<?= $masach ?>', -1, <?= $masach ?>)">-</button>
                            <input type="number" name="quantity" id="quantity_<?= $masach ?>" value="<?= $item['soluong'] ?>" min="1" class="form-control form-control-sm text-center" style="width: 60px;" readonly>
                            <button type="button" class="btn btn-outline-secondary btn-sm ms-2" onclick="updateQuantity('quantity_<?= $masach ?>', 1, <?= $masach ?>)">+</button>
                        </form>
                        </td>
                        <td><?= number_format($item['giasach'] * $item['soluong'], 0, ',', '.') ?>đ</td>
                        <td><a href="giohang.php?action=remove&masach=<?= $masach ?>" class="btn btn-danger btn-sm">Xóa</a></td>
                    </tr>
                <?php endforeach; ?>
                <tr>
                    <td colspan="4" style="text-align: right; font-size: 20px;">Tổng cộng:</td>
                    <td style="font-weight: bold; font-size: 20px;"><?= number_format($totalAmount, 0, ',', '.') ?>đ</td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: center;">
                        <div class="cart-buttons">
                            <a href="homepage.php" class="checkout-button">Tiếp tục mua hàng</a>
                            <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
                                <a href="thanhtoan.php" class="checkout-button">Thanh toán</a>
                            <?php else: ?>
                                <a href="dangnhap.php" class="checkout-button" onclick="alert('Bạn cần đăng nhập để thanh toán!');">Thanh toán</a>
                            <?php endif; ?>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    <?php else: ?>
        <div class="empty-cart">
        <h3>Giỏ hàng của bạn chưa có sản phẩm</h3>
        <a href="homepage.php" class="checkout-button">Tiếp tục mua hàng</a>
        </div>
    <?php endif; ?>
</div>


<?php include 'footer.php' ?>
<script>
        function updateQuantity(quantityId, change, masach) {
            let quantityField = document.getElementById(quantityId);
            let currentQuantity = parseInt(quantityField.value);
            let newQuantity = currentQuantity + change;

            if (newQuantity > 0) {
                quantityField.value = newQuantity;
                // Tự động gửi form sau khi cập nhật
                document.getElementById('form_' + masach).submit();
            } else {
                alert("Số lượng phải lớn hơn 0!");
            }
        }
</script>
</body>
</html>
