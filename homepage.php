<?php
//đăng xuất
session_start();
if (isset($_GET['action']) && $_GET['action'] === 'logout') {
    session_destroy();  
    header("Location: homepage.php");  
    exit();
}

//phiên đăng nhập
$timeout_duration = 1800;
if (isset($_SESSION['last_activity'])) {
    $inactive_time = time() - $_SESSION['last_activity']; 
    if ($inactive_time > $timeout_duration) {
        session_unset();     
        session_destroy();   
        header("Location: homepage.php"); 
        exit();
    }
}

$_SESSION['last_activity'] = time();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhà Sách PKT</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }
        .nav {
            position: sticky;
            top: 0;
            width: 100%;
            background-color: #004a8f;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            z-index: 1000; 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); 
        }
        .nav .dropdown {
            position: relative;
        }
        .nav .user-options {
            display: flex;
            align-items: center;
            gap: 10px;  
        }
        .nav .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            background-color: inherit;
            color: white;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        .nav .dropdown .dropdown-content {
            display: none;
            position: absolute;
            background-color: #004a8f;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
        .nav .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown i{
            margin-right: 3px;
            margin-left: 3px;
        }
        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #00366f;
        }
        .search-bar {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            position: relative;
            max-width: 500px;
            margin: 0 20px;
        }
        .search-bar input{
            width: 100%;
            padding: 10px 40px 10px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .search-bar form {
            width: 100%;
            padding: 10px 40px 10px 10px;
            box-sizing: border-box;
        }  
        .search-bar i {
            position: absolute;
            right: 15px;
            top: 50%; 
            transform: translateY(-50%);
            color: white;
        }
        .user-options span{
            color: white;
        }
        .user-options a{
            color: white;
            text-decoration: none;
        }
        .carousel {
            position: relative;
            width: 80%;
            height: auto;
            overflow: hidden;
            margin: auto;
        }
        .carousel-inner img {
            width: 100%;
            height: 550px;
            object-fit: cover;
        }

        .banner-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .banner-9 {
            background-size: cover;
            background-position: center center; 
            height: 400px; 
            width: 100%; 
            margin-bottom: 30px; 
            display: flex;
            justify-content: center; 
            align-items: center; 
        }
        
        .categories {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            display: flex;
            justify-content: center; 
        }

        .category-list {
            width: 300px;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .category-list h4 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        .category-list ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .category-list ul li {
            margin-bottom: 8px;
        }

        .image-gallery {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            width: calc(100% - 320px);
            margin-right: 100px;
        }

        .image-item {
            width: 300px;
            position: relative;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .image-item:hover {
            transform: scale(1.05);
        }

        .image-item img {
            width: 100%;
            height: auto;
            border-bottom: 3px solid #f2f2f2;
        }

        .book-details {
            padding: 15px;
            text-align: center;
        }

        .book-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .book-genre {
            font-size: 14px;
            color: #777;
            margin-bottom: 5px;
        }

        .book-price {
            font-size: 16px;
            color: #e74c3c;
            font-weight: bold;
        }

        .image-item:hover .book-details {
            background-color: #f9f9f9;
        }
        .pagination {
        display: flex;
        justify-content: center;
        text-align: center;
        margin-top: 20px;
        margin-bottom: 20px;
        }

        .pagination a {
        display: inline-block;
        margin: 0 5px;
        padding: 10px 15px;
        text-decoration: none;
        background-color: #f1f1f1;
        color: #333;
        border: 1px solid #ddd;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        }

        .pagination a:hover {
        background-color: #007bff;
        color: #fff;
        }

        .pagination a.active {
        background-color: #007bff;
        color: #fff;
        pointer-events: none;
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


$sql_chude = "SELECT machude, tenchude FROM chude";
$result_chude = $conn->query($sql_chude);

// giới hạn sách hiển thị mỗi trang
$books_per_page = 12;


$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page = max($page, 1); 


$offset = ($page - 1) * $books_per_page;

// tính tổng số sách
$total_books_sql = "SELECT COUNT(*) AS total FROM sach";
$total_books_result = $conn->query($total_books_sql);
$total_books_row = $total_books_result->fetch_assoc();
$total_books = $total_books_row['total'];

// tính tổng số trang
$total_pages = ceil($total_books / $books_per_page);

// lọc sách theo chủ đề
$machude = isset($_GET['machude']) ? $_GET['machude'] : null;
$search_term = isset($_GET['search']) ? $_GET['search'] : '';

$sql_sach = "SELECT sach.masach, sach.tensach, sach.giasach, sach.anhbia, chude.tenchude 
             FROM sach 
             JOIN chude ON sach.machude = chude.machude";

if ($machude) {
    $sql_sach .= " WHERE sach.machude = ?";
}
if ($search_term) {
    $sql_sach .= " AND sach.tensach LIKE ?";
}
$sql_sach .= " LIMIT ? OFFSET ?";

$stmt = $conn->prepare($sql_sach);

if ($machude && $search_term) {
    $search_term = "%$search_term%";
    $stmt->bind_param("ssii", $search_term, $machude, $books_per_page, $offset);
} elseif ($machude) {
    $stmt->bind_param("iii", $machude, $books_per_page, $offset);
} elseif ($search_term) {
    $search_term = "%$search_term%";
    $stmt->bind_param("sii", $search_term, $books_per_page, $offset);
} else {
    $stmt->bind_param("ii", $books_per_page, $offset);
}

$stmt->execute();
$result_sach = $stmt->get_result();


function getCartItemCount() {
    if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
        $totalQuantity = 0;
        foreach ($_SESSION['cart'] as $item) {
            $totalQuantity += $item['soluong'];
        }
        return $totalQuantity;
    }
    return 0;
}
// ẩn mấy cái carousel khi user thực hiện việc tìm kiếm
$is_hidden = isset($_GET['search']) || isset($_GET['machude']);
?>

<body>
    <?php include 'header.php'; ?>

    <div class="nav">
        <div class="dropdown">
            <button class="dropbtn"><i class="fas fa-bars"></i> Danh Mục <i class="fas fa-caret-down"></i></button>
            <div class="dropdown-content">
                <!-- lọc theo chủ đề -->
                <?php
                if ($result_chude->num_rows > 0) {
                    while ($row = $result_chude->fetch_assoc()) {
                        echo '<a href="?machude=' . $row['machude'] . '">' . $row['tenchude'] . '</a>';
                    }
                } else {
                    echo '<a href="#">Không có chủ đề</a>';
                }
                ?>
            </div>        
        </div>
        <div class="search-bar"> 
            <form method="GET" action="" id="searchForm"> 
                <input type="text" name="search" placeholder="Tìm kiếm sách..." value="<?= isset($_GET['search']) ? $_GET['search'] : '' ?>"> 
                <i class="fas fa-search" onclick="document.getElementById('searchForm').submit();"></i> 
            </form> 
        </div>
        <div class="user-options">
                <!-- kiểm tra đăng nhập -->
            <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
            <div class="dropdown">
                <span class="dropbtn">Xin chào, <?= htmlspecialchars($_SESSION['hoten']) ?> <i class="fas fa-caret-down"></i></span>
                <div class="dropdown-content">
                <a href="thongtinkhachhang.php">Tài khoản của tôi</a>
                <a href="donhang.php">Đơn hàng của tôi</a>
                <a href="?action=logout">Đăng xuất</a> 
                </div>
            </div>
            <?php else: ?>
            <a href="dangnhap.php"><i class="fas fa-user"></i> Đăng Nhập</a>
            <?php endif; ?>
            <a href="giohang.php"><i class="fas fa-shopping-cart"></i> Giỏ Hàng (<?= getCartItemCount(); ?>)</a>
        </div>
    </div>

    <!-- carousel, banner,.. -->
    <?php if (!$is_hidden): ?>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/poster1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="images/poster2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="images/poster3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <div class="container my-4">
        <div class="row">
            <!-- Banner 4 (Chiếm 6 cột) -->
            <div class="col-12 col-md-6">
                <img src="images/banner4.png" class="banner-image" alt="Banner 4">
            </div>
            <!-- Banner 5 (Chiếm 3 cột) -->
            <div class="col-12 col-md-3">
                <img src="images/banner5.png" class="banner-image" alt="Banner 5">
            </div>
            <!-- Banner 6 (Chiếm 3 cột) -->
            <div class="col-12 col-md-3">
                <img src="images/banner6.png" class="banner-image" alt="Banner 6">
            </div>
        </div>
    </div>

    <div class="container my-4">
        <div class="row">
            <!-- Banner 7 (Chiếm 8 cột) -->
            <div class="col-12 col-md-6">
                <img src="images/banner7.png" class="banner-image banner7" alt="Banner 7">
            </div>
            <!-- Banner 8 (Chiếm 4 cột) -->
            <div class="col-12 col-md-6">
                <img src="images/banner8.png" class="banner-image" alt="Banner 8">
            </div>
        </div>
    </div>
    <?php endif; ?>
    <!-- tìm sách theo chủ đề -->
    <div class="details">
        <div class="categories">
            <div class="image-gallery">
                <?php
                if ($result_sach->num_rows > 0) {
                    while ($row = $result_sach->fetch_assoc()) {
                        ?>
                        <div class="image-item">
                            <a href="chitietsach.php?masach=<?= $row['masach'] ?>">
                                <img src="images/<?= $row['anhbia'] ?>" alt="<?= $row['tensach'] ?>">
                            </a>
                            <div class="book-details">
                                <h5 class="book-title"><?= $row['tensach'] ?></h5>
                                <p class="book-genre"><?= $row['tenchude'] ?></p>
                                <p class="book-price"><?= number_format($row['giasach'], 0, ',', '.') ?>đ</p>
                            </div>
                        </div>
                        <?php
                    }
                } else {
                    echo "<p>Không có sách nào được tìm thấy.</p>";
                }
                ?>
            </div>
        </div>
    </div>
    <!-- phân trang -->
    <div class="pagination">
    <?php if ($page > 1): ?>
        <a href="?page=<?= $page - 1 ?>&search=<?= htmlspecialchars($search_term) ?>&machude=<?= $machude ?>">&#171; Trang trước</a>
    <?php endif; ?>

    <?php for ($i = 1; $i <= $total_pages; $i++): ?>
        <a href="?page=<?= $i ?>&search=<?= htmlspecialchars($search_term) ?>&machude=<?= $machude ?>" class="<?= $i == $page ? 'active' : '' ?>"><?= $i ?></a>
    <?php endfor; ?>

    <?php if ($page < $total_pages): ?>
        <a href="?page=<?= $page + 1 ?>&search=<?= htmlspecialchars($search_term) ?>&machude=<?= $machude ?>">Trang sau &#187;</a>
    <?php endif; ?>
    </div>
    <?php include 'footer.php'; ?>
</body>
</html>
