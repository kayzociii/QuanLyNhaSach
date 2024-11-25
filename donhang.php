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


$mauser = $_SESSION['user']; 
$sql = "SELECT hoadon.mahoadon, hoadon.hoten, hoadon.ngaydathang, hoadon.tongtien 
        FROM hoadon
        JOIN khachhang ON hoadon.makhachhang = khachhang.makhachhang
        WHERE hoadon.makhachhang = ?"; 
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $mauser);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn Hàng</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body, html { font-family: Arial, sans-serif; background-color: #f9f9f9; }
        .container { width: 80%; margin: 20px auto; }
        h2 { text-align: center; padding-bottom: 20px; padding-top: 10px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
        th, td { padding: 15px; border-bottom: 1px solid #ddd; }
        th { background-color: #f2f2f2; font-weight: bold; }
        .checkout-button { padding: 12px 25px; font-size: 18px; font-weight: bold; color: white; background-color: #044785; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease; }
        .checkout-button:hover { background-color: #ffa500; }
    </style>
</head>
<body>
<?php include 'header.php'; ?>

<div class="container">
    <h2>Thông tin đơn hàng</h2>
    <?php if ($result->num_rows > 0): ?>
    <table>
        <thead>
            <tr>
                <th>ID Đơn Hàng</th>
                <th>Tên Khách Hàng</th>
                <th>Ngày Đặt</th>
                <th>Tổng Tiền</th>
                <th>Thao Tác</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= $row['mahoadon'] ?></td>
                <td><?= $row['hoten'] ?></td>
                <td><?= date('d/m/Y', strtotime($row['ngaydathang'])) ?></td>
                <td><?= number_format($row['tongtien'], 0, ',', '.') ?>đ</td>
                <td><a href="chitietdonhang.php?mahoadon=<?= $row['mahoadon'] ?>">Xem chi tiết</a></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
    <?php else: ?>
        <p>Hiện tại bạn chưa có đơn hàng nào.</p>
    <?php endif; ?>
</div>

<?php include 'footer.php'; ?>
</body>
</html>
