<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .form-container {
            width: 100%;
            max-width: 500px; 
            background-color: #f8f8f8;
            padding: 30px;
            margin-left: 500px;
        }

        h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group a {
            text-decoration: none;
            color: #4CAF50;
            font-size: 14px;
            display: block;
            text-align: center;
        }

        .form-group a:hover {
            text-decoration: underline;
        }
    </style>
</head>

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

// Kiểm tra nếu người dùng đã đăng nhập
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: dangnhap.php");
    exit();
}

// Lấy thông tin người dùng hiện tại
$user_id = $_SESSION['user']; // ID của người dùng đã đăng nhập

$sql = "SELECT * FROM user u INNER JOIN khachhang k ON u.makhachhang = k.makhachhang WHERE u.mauser = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
} else {
    echo "Không tìm thấy thông tin tài khoản.";
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $hoten = $_POST['hoten'];
    $email = $_POST['email'];
    $diachi = $_POST['diachi'];
    $sodienthoai = $_POST['sodienthoai'];
    $ngaysinh = $_POST['ngaysinh'];

    $sql_update_khachhang = "UPDATE khachhang SET hoten = ?, email = ?, diachi = ?, sodienthoai = ?, ngaysinh = ? WHERE makhachhang = ?";
    $stmt_update_khachhang = $conn->prepare($sql_update_khachhang);
    $stmt_update_khachhang->bind_param("sssssi", $hoten, $email, $diachi, $sodienthoai, $ngaysinh, $row['makhachhang']);
    $stmt_update_khachhang->execute();

    echo "<script>
    alert('Cập nhật thông tin thành công!');
    window.location.href = 'thongtinkhachhang.php';
    </script>";

    exit();
}

$stmt->close();
$conn->close();
?>

<body>
    <?php include 'header.php'; ?>

    <div class="form-container">
        <h2>Chỉnh sửa thông tin tài khoản</h2>
        <form action="thongtinkhachhang.php" method="POST">
            <div class="form-group">
                <label for="hoten">Họ và tên</label>
                <input type="text" name="hoten" value="<?= htmlspecialchars($row['hoten']) ?>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" name="email" value="<?= htmlspecialchars($row['email']) ?>" required>
            </div>
            <div class="form-group">
                <label for="diachi">Địa chỉ</label>
                <input type="text" name="diachi" value="<?= htmlspecialchars($row['diachi']) ?>" required>
            </div>
            <div class="form-group">
                <label for="sodienthoai">Số điện thoại</label>
                <input type="text" name="sodienthoai" value="<?= htmlspecialchars($row['sodienthoai']) ?>" required>
            </div>
            <div class="form-group">
                <label for="ngaysinh">Ngày sinh</label>
                <input type="date" name="ngaysinh" value="<?= htmlspecialchars($row['ngaysinh']) ?>" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Cập nhật thông tin">
            </div>
        </form>
    </div>

    <?php include 'footer.php'; ?>
</body>

</html>
