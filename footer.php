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
        .footer {
            background-color: #0063af;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        .footer-section {
            background-color: #f8f9fa; 
            padding: 40px 0;
            border-top: 2px solid #ddd; 
        }
        .footer-column {
            margin-bottom: 30px;
        }
        .footer-column h5 {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .footer-column a {
            color: #007bff; 
            text-decoration: none;
            display: block;
            margin-bottom: 8px;
        }
        .footer-column a:hover {
            text-decoration: underline;
        }
        .social-icons {
            display: flex;
            justify-content: left; 
            gap: 20px; 
        }
        .social-icons a {
            font-size: 30px; 
            color: #333;
            text-decoration: none;
        }
        .social-icons a:hover {
            color: #007bff; 
        }
    </style>
</head>
<body>
    <!-- Footer -->
    <div class="footer-section">
        <div class="container">
            <div class="row">
                <!-- Cột 1: Về Chúng Tôi -->
                <div class="col-md-3 footer-column">
                    <h5>Về Chúng Tôi</h5>
                    <a href="#">Giới Thiệu Về Nhà Sách</a>
                    <a href="#">Giới Thiệu Chương Trình Khách Hàng</a>
                    <a href="#">Hệ Thống Nhà Sách </a>
                    <a href="#">Điều Khoản Sử Dụng</a>
                    <a href="#">Chính Sách Bảo Mật</a>
                    <a href="#">Chính Sách Bán Hàng</a>
                    <a href="#">Phương Thức Vận Chuyển</a>
                </div>

                <!-- Cột 2: Tài Khoản Của Tôi -->
                <div class="col-md-3 footer-column">
                    <h5>Tài Khoản Của Tôi</h5>
                    <a href="dangnhap.php">Đăng nhập</a>
                    <a href="dangky.php">Tạo tài khoản</a>
                </div>

                <!-- Cột 3: Hỗ Trợ Khách Hàng -->
                <div class="col-md-3 footer-column">
                    <h5>Hỗ Trợ Khách Hàng</h5>
                    <a href="#">Các Câu Hỏi Thường Gặp</a>
                    <a href="#">Chính Sách Đổi/Trả Hàng</a>
                    <a href="#">Quy Định Viết Bình Luận</a>
                </div>

                <!-- Cột 4: Liên Hệ Với Chúng Tôi -->
                <div class="col-md-3 footer-column">
                    <h5>Liên Hệ Với Chúng Tôi</h5>
                    <p>Hotline: <strong>1900 9100</strong></p>
                    <p>Email: <strong>nhasachpkt@gmail.com</strong></p>
                    <div class="social-icons">
                        <a href="#" class="fab fa-facebook"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-instagram"></a>
                        <a href="#" class="fab fa-youtube"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>