<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
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
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT user.*, khachhang.hoten AS TenKhachHang 
            FROM user 
            JOIN khachhang ON user.makhachhang = khachhang.makhachhang 
            WHERE user.tendangnhap = ? AND user.password = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        if ($row['quyen'] == 'khachhang') {
            $_SESSION['user'] = $row['mauser'];
            $_SESSION['hoten'] = $row['TenKhachHang'];
            $_SESSION['loggedin'] = true;
            header("Location: homepage.php");
            exit();
        } elseif ($row['quyen'] == 'admin'){
            $_SESSION['hoten'] = $row['TenKhachHang'];
            $_SESSION['loggedin'] = true;
            header("Location: Admin");
            exit();
        } else {
            $error_message = "Bạn không có quyền truy cập.";
        }
    } else {
        $error_message = "Tên đăng nhập hoặc mật khẩu không đúng.";
    }

    $stmt->close();
    }
    $conn->close();
?>

<body>
    <?php include 'header.php'; ?>

    <div class="form-container">
        <h2>Đăng nhập</h2>
        <form action="dangnhap.php" method="POST">
            <div class="form-group">
                <label for="username">Tên người dùng</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" name="password" required>
            </div>
            <!-- Hiển thị lỗi -->
            <?php if (!empty($error_message)): ?>
                <span style="color: red; font-size: 14px;"><?= htmlspecialchars($error_message) ?></span>
            <?php endif; ?>
            <div class="row">
                <div class="form-group">
                    <a href="dangky.php">Đăng ký tài khoản mới</a>
                </div>
            </div>
            <div class="form-group">
                <input type="submit" value="Đăng nhập">
            </div>
        </form>
    </div>

    <?php include 'footer.php'; ?>
</body>

</html>