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

if (isset($_GET['mahoadon'])) {
    $mahoadon = $_GET['mahoadon'];

    $sql = "SELECT c.*, s.tensach, s.giasach, s.anhbia FROM chitiethoadon c
            JOIN sach s ON c.masach = s.masach
            WHERE c.mahoadon = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $mahoadon);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $orderDetails = [];
        while ($row = $result->fetch_assoc()) {
            $orderDetails[] = $row;
        }
    } else {
        echo "Không tìm thấy chi tiết đơn hàng.";
        exit();
    }
} else {
    echo "Không có mã đơn hàng.";
    exit();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng</title>
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
            margin: 30px auto;
            text-align: center;
        }

        h2 {
            text-align: center;
            padding-bottom: 20px;
            padding-top: 10px;
        }

        table {
            width: 100%;  
            margin: 0 auto;  
            border-collapse: collapse;
            margin-bottom: 30px;
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

        .back-button {
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

        .back-button:hover {
            background-color: #ffa500;
        }
    </style>
</head>
<body>

<?php include 'header.php' ?>

<div class="container">
    <h2>Chi tiết đơn hàng</h2>
    <table>
        <thead>
            <tr>
                <th>Ảnh sách</th>
                <th>Tên sách</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng tiền</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($orderDetails as $item): ?>
                <tr>
                    <td><img src="images/<?= $item['anhbia'] ?>" class="product-image"></td>
                    <td><?= $item['tensach'] ?></td>
                    <td><?= $item['soluong'] ?></td>
                    <td><?= number_format($item['giasach'], 0, ',', '.') ?>đ</td>
                    <td><?= number_format($item['giasach'] * $item['soluong'], 0, ',', '.') ?>đ</td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div style="text-align: center;">
        <a href="donhang.php" class="back-button">Quay lại danh sách đơn hàng</a>
    </div>
</div>

<?php include 'footer.php' ?>

</body>
</html>
