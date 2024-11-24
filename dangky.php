<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $hoten = $_POST['hoten'];
    $email = $_POST['email'];
    $diachi = $_POST['diachi'];
    $sodienthoai = $_POST['sodienthoai'];
    $ngaysinh = $_POST['ngaysinh'];

    $conn->begin_transaction();

    try {
        $sql_khachhang = "INSERT INTO khachhang (hoten, email, diachi, sodienthoai, ngaysinh) 
                          VALUES (?, ?, ?, ?, ?)";
        $stmt_khachhang = $conn->prepare($sql_khachhang);
        $stmt_khachhang->bind_param("sssss", $hoten, $email, $diachi, $sodienthoai, $ngaysinh);
        $stmt_khachhang->execute();

        $makhachhang = $conn->insert_id;

        $sql_user = "INSERT INTO user (tendangnhap, password, quyen, makhachhang) 
                     VALUES (?, ?, 'khachhang', ?)";
        $stmt_user = $conn->prepare($sql_user);
        $stmt_user->bind_param("ssi", $username, $password, $makhachhang);
        $stmt_user->execute();

        $conn->commit();

        echo "Đăng ký thành công!";
        header("Location: dangnhap.php");
        exit();
    } catch (Exception $e) {
        $conn->rollback();
        echo "Đăng ký thất bại: " . $e->getMessage();
    } finally {
        $stmt_khachhang->close();
        $stmt_user->close();
        $conn->close();
    }
}
?>

<body>
    <?php include 'header.php'; ?>

    <div class="form-container">
        <h2>Đăng ký</h2>
        <form action="dangky.php" method="POST">
            <div class="form-group">
                <label for="username">Tên tài khoản</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label for="hoten">Họ và tên</label>
                <input type="text" name="hoten" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" name="email" required>
            </div>
            <div class="form-group">
                <label for="diachi">Địa chỉ</label>
                <input type="text" name="diachi" required>
            </div>
            <div class="form-group">
                <label for="sodienthoai">Số điện thoại</label>
                <input type="text" name="sodienthoai" required>
            </div>
            <div class="form-group">
                <label for="ngaysinh">Ngày sinh</label>
                <input type="date" name="ngaysinh" required>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" name="password" required>
            </div>
            <div class="row">
                <div class="form-group">
                    <a href="dangnhap.php">Đã có tài khoản rồi</a>
                </div>
                <div class="form-group">
                    <a href="homepage.php">Trang chủ</a>
                </div>
            </div>
            <div class="form-group">
                <input type="submit" value="Đăng kí">
            </div>
        </form>
    </div>

    <?php include 'footer.php'; ?>
</body>

</html>