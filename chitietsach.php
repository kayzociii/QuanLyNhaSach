<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sách</title>
    <!-- Thêm Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .book-detail-container {
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .book-image img {
            border-radius: 10px;
            max-width: 100%;
            height: auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .book-title {
            font-size: 32px;
            font-weight: bold;
            color: #343a40;
            margin-bottom: 10px;
        }

        .book-genre {
            font-size: 18px;
            color: #6c757d;
            margin-bottom: 20px;
        }

        .book-price {
            font-size: 24px;
            color: #e74c3c;
            font-weight: bold;
        }

        .book-description {
            margin-top: 20px;
            font-size: 16px;
            color: #495057;
            line-height: 1.8;
        }

        .btn-custom {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
        }

        .btn-add-cart {
            background-color: #007bff;
            color: #fff;
        }

        .btn-add-cart:hover {
            background-color: #0056b3;
        }

        .btn-buy-now {
            background-color: #28a745;
            color: #fff;
        }

        .btn-buy-now:hover {
            background-color: #1e7e34;
        }
    </style>
</head>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "quanlynhasach";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

if (isset($_GET['masach'])) {
    $masach = $_GET['masach'];
    $sql = "SELECT sach.masach, sach.tensach, sach.giasach, sach.anhbia, sach.mota, sach.soluongton, chude.tenchude
            FROM sach 
            JOIN chude ON sach.machude = chude.machude
            WHERE sach.masach = ?";
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
} else {
    echo "<p class='text-danger'>Không tìm thấy mã sách.</p>";
    exit();
}

// Xử lý thêm vào giỏ hàng
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $soluong = (int)$_POST['quantity'];
    if ($soluong > $book['soluongton']) {
        echo "<script>alert('Số lượng yêu cầu vượt quá số lượng tồn kho!');</script>";
    } else {
        $_SESSION['cart'][$masach] = [
            'tensach' => $book['tensach'],
            'giasach' => $book['giasach'],
            'soluong' => $soluong,
            'anhbia' => $book['anhbia']
        ];
        echo "<script>alert('Sản phẩm đã được thêm vào giỏ hàng!');</script>";
    }
}
?>

<body>
    <?php include 'header.php'; ?>
    <div class="container book-detail-container">
        <div class="row align-items-center">
            <!-- Hình ảnh sách -->
            <div class="col-md-5 book-image">
                <img src="images/<?= $book['anhbia'] ?>" alt="<?= $book['tensach'] ?>">
            </div>
            <!-- Chi tiết sách -->
            <div class="col-md-7">
                <h1 class="book-title"><?= $book['tensach'] ?></h1>
                <p class="book-genre"><strong>Chủ đề:</strong> <?= $book['tenchude'] ?></p>
                <p class="book-price"><?= number_format($book['giasach'], 0, ',', '.') ?>đ</p>
                <p class="book-description"><?= $book['mota'] ?></p>

                <!-- Form tăng giảm số lượng -->
                
            <form method="POST" action="giohang.php?action=add">
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-outline-secondary btn-sm me-2" onclick="decreaseQuantity()">-</button>
                <input type="number" name="quantity" id="quantity" value="1" min="1" class="form-control form-control-sm text-center" style="width: 60px;" readonly>
                <button type="button" class="btn btn-outline-secondary btn-sm ms-2" onclick="increaseQuantity()">+</button>
            </div>
                <input type="hidden" name="masach" value="<?= $masach ?>">
                <button type="submit" class="btn btn-custom btn-add-cart mt-3">
                <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                </button>
            </form>

            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>

    <script>
        let maxQuantity = <?= $book['soluongton'] ?>;
        let quantityField = document.getElementById('quantity');

        function decreaseQuantity() {
            let currentQuantity = parseInt(quantityField.value);
            if (currentQuantity > 1) {
                quantityField.value = currentQuantity - 1;
            }
        }

        function increaseQuantity() {
            let currentQuantity = parseInt(quantityField.value);
            if (currentQuantity < maxQuantity) {
                quantityField.value = currentQuantity + 1;
            } else {
                alert("Không thể thêm nhiều hơn số lượng tồn kho!");
            }
        }
    </script>
</body>

</html>
