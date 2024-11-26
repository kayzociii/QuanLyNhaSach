-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 05:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlynhasach`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `machitiethoadon` int(8) NOT NULL,
  `mahoadon` int(8) NOT NULL,
  `masach` int(8) NOT NULL,
  `soluong` int(5) NOT NULL,
  `dongia` decimal(18,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`machitiethoadon`, `mahoadon`, `masach`, `soluong`, `dongia`) VALUES
(24, 24, 1, 1, 48000),
(25, 24, 7, 2, 119000),
(26, 25, 1, 3, 48000),
(27, 25, 2, 8, 85000),
(28, 26, 5, 2, 149000);

-- --------------------------------------------------------

--
-- Table structure for table `chude`
--

CREATE TABLE `chude` (
  `machude` int(8) NOT NULL,
  `tenchude` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chude`
--

INSERT INTO `chude` (`machude`, `tenchude`) VALUES
(1, 'Sách Văn Học'),
(2, 'Sách Thiếu Nhi'),
(3, 'Sách Kinh Tế'),
(4, 'Sách Kĩ Năng Sống'),
(5, 'Manga/Truyện Tranh'),
(6, 'Light Novel');

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `mahoadon` int(8) NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `sodienthoai` varchar(11) NOT NULL,
  `ngaydathang` datetime NOT NULL,
  `tongtien` decimal(18,0) NOT NULL,
  `makhachhang` int(8) NOT NULL,
  `maphuongthuc` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`mahoadon`, `hoten`, `diachi`, `sodienthoai`, `ngaydathang`, `tongtien`, `makhachhang`, `maphuongthuc`) VALUES
(24, 'Ngo Nguyen Anh Tu', '2 Hon Chong, Nha Trang, Khanh Hoa', '01212231313', '2024-11-24 07:04:55', 286000, 2, 1),
(25, 'Nguyễn Thanh Khang', '2 Hon Chong, Nha Trang, Khanh Hoa', '0345678910', '2024-11-24 09:37:16', 824000, 2, 1),
(26, 'Nguyễn Thanh Khang', '2 Hon Chong, Nha Trang, Khanh Hoa', '0345678910', '2024-11-24 11:13:58', 298000, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `makhachhang` int(8) NOT NULL,
  `hoten` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `diachi` varchar(100) NOT NULL,
  `sodienthoai` varchar(11) NOT NULL,
  `ngaysinh` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`makhachhang`, `hoten`, `email`, `diachi`, `sodienthoai`, `ngaysinh`) VALUES
(1, 'Nguyễn Hoàng Đức Khang', 'nhdkhang1710@gmail.com', 'Nha Trang, Khánh Hòa', '0342874729', '2003-10-17'),
(2, 'Nguyễn Thanh Phong', 'phong147@gmail.com', 'Nha Trang, Khánh Hòa', '0222222222', '2003-09-26'),
(3, 'Ngô Nguyễn Anh Tú', 'tulokho@gmail.com', 'Nha Trang, Khánh Hòa', '0386112334', '2003-10-16'),
(4, 'Nguyễn Văn Bình', 'binhbinh12@gmail.com', 'Thành phố Hồ Chí Minh', '0905946933', '2004-06-15'),
(6, 'Nguyễn Thanh Khang', 'thanhkhang@gmail.com', 'Nha Trang, Khánh Hòa', '0345678910', '2004-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `manhanvien` int(8) NOT NULL,
  `tennhanvien` varchar(50) NOT NULL,
  `emailnhanvien` varchar(70) NOT NULL,
  `diachinhanvien` varchar(100) NOT NULL,
  `sdtnhanvien` varchar(11) NOT NULL,
  `ngaysinhnhanvien` date NOT NULL,
  `chucvunhanvien` varchar(30) NOT NULL,
  `mauser` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nhaxuatban`
--

CREATE TABLE `nhaxuatban` (
  `manhaxuatban` int(8) NOT NULL,
  `tennhaxuatban` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `nhaxuatban`
--

INSERT INTO `nhaxuatban` (`manhaxuatban`, `tennhaxuatban`) VALUES
(1, 'Hội Nhà Văn'),
(2, 'Trẻ'),
(3, 'Công Thương'),
(4, 'Thế Giới'),
(5, 'Lao Động'),
(6, 'Văn Học'),
(7, 'Dân Trí'),
(8, 'Phụ Nữ Việt Nam'),
(9, 'Thanh Niên'),
(10, 'Kim Đồng'),
(11, 'Hồng Đức'),
(12, 'Tổng hợp thành phố Hồ Chí Minh'),
(13, 'Văn Hóa - Văn Nghệ'),
(14, 'Hà Nội'),
(15, 'Hải Phòng');

-- --------------------------------------------------------

--
-- Table structure for table `phuongthucthanhtoan`
--

CREATE TABLE `phuongthucthanhtoan` (
  `maphuongthuc` int(8) NOT NULL,
  `tenphuongthuc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `phuongthucthanhtoan`
--

INSERT INTO `phuongthucthanhtoan` (`maphuongthuc`, `tenphuongthuc`) VALUES
(1, 'Thanh toán tiền mặt (COD)'),
(2, 'Ví điện tử Momo');

-- --------------------------------------------------------

--
-- Table structure for table `sach`
--

CREATE TABLE `sach` (
  `masach` int(8) NOT NULL,
  `tensach` varchar(100) NOT NULL,
  `mota` varchar(700) NOT NULL,
  `giasach` decimal(18,0) NOT NULL,
  `anhbia` varchar(50) NOT NULL,
  `soluongton` int(5) NOT NULL,
  `ngaycapnhat` datetime NOT NULL,
  `machude` int(8) NOT NULL,
  `matacgia` int(8) NOT NULL,
  `manhaxuatban` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`masach`, `tensach`, `mota`, `giasach`, `anhbia`, `soluongton`, `ngaycapnhat`, `machude`, `matacgia`, `manhaxuatban`) VALUES
(1, 'Nhà Giả Kim', 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.', 48000, 'sach1.jpg', 19, '2024-11-24 15:37:16', 1, 1, 1),
(2, 'Chuyện Cổ Tích Của Vườn', '“Ngày xửa ngày xưa, vào năm một ngàn chín trăm xưa lắm lận, có một bà Tiên sống ẩn dật trong một khu vườn nhỏ ở miền Đông Nam Bộ của nước Việt Nam. Chỉ với một cây đũa thần mầu nhiệm, bà Tiên đã giúp cho muôn loài muôn vật trong khu vườn nhỏ biết hát ca tiếng Người. Nhờ vậy mà rất nhiều câu Chuyện cổ tích của vườn (phần Một, 1993) được kể ra và được các độc giả nhí yêu quý đón nhận.\r\nTrong cuốn sách này, chuyện cổ tích của vườn sẽ được kể tại miền Đông Nam (nhưng không phải ở miền Đông Nam Bộ của nước Việt Nam) của nước Mỹ. Nhưng dù được kể tại một nơi cách xa Việt Nam đến nửa vòng trái đất, chuyện cổ tích muôn đời vẫn là chuyện cổ tích.”', 85000, 'sach2.jpg', 10, '2024-11-24 15:37:16', 2, 2, 2),
(3, 'Visual Marketing', 'Hơn 1 tỉ giờ đồng hồ video được xem mỗi ngày trên YouTube, và bạn bắt đầu đánh giá cao việc video đã ăn sâu vào cuộc sống hằng ngày của chúng ta như thế nào. Và mặc dù việc dựng và đăng video từ lâu đã trở thành một đề xuất tốn kém cho hầu hết các doanh nghiệp, giờ đây, chúng ta mang theo máy quay có độ phân giải cao ngay trong túi mình cùng với nhiều dịch vụ lưu trữ video miễn phí dành cho doanh nghiệp. Cơ hội ngay trước mắt bạn bây giờ chính là tận dụng sức mạnh của video trong doanh nghiệp của mình để thu hút nhiều khách hàng tiềm năng hơn, chiếm được lòng tin của họ và đem lại trải nghiệm đặc biệt cho khách hàng, doanh nghiệp hay người tiêu dùng.', 195000, 'sach3.jpg', 18, '2024-11-24 12:34:27', 3, 3, 3),
(4, '7 Nguyên Tắc Phát Triển Bản Thân Của Người Thông Minh', 'Trong cung cách đối đãi giữa người với người, chúng ta vẫn thường đặt ra các nguyên tắc ứng xử và áp dụng chúng. Tuy nhiên, khi đối đãi với bản thân, chúng ta lại thường bỏ qua bộ nguyên tắc để áp dụng với chính mình. “7 nguyên tắc phát triển bản thân của người thông minh” là cẩm nang quan trọng giúp định hình xu hướng phát triển, nhằm tối ưu hoá năng lực nội tại và phát huy triệt để thế mạnh bản thân, từ đó phá vỡ vỏ kén kiên cố để thoát khỏi vùng an toàn.', 109000, 'sach4.jpg', 19, '2024-11-24 12:35:08', 4, 4, 4),
(5, 'Chuyến Tàu Ánh Sáng', 'Trên một chuyến tàu, với ai đó, hôm nay là một ngày vô cùng quý giá: với học sinh tiểu học đang lo lắng về bài vở và chuyện tình cảm, với người bà đã mất chồng, với đôi vợ chồng người Ba Lan đến thăm Nhật Bản, với nghệ sĩ kể chuyện hài nổi tiếng, với giám đốc chi nhánh của công ty bảo hiểm nhân thọ đang trên đường về quê, hay với người hâm mộ cuồng nhiệt của đội bóng chày Hanshin Tigers,...', 149000, 'sach5.jpg', 13, '2024-11-24 17:13:58', 1, 5, 5),
(6, 'Về Nhà Ăn Bát Cháo Hành\r\n', '“Tuần nào về nhà, mẹ cũng gói ghém rau, cá, thịt thà cho mình mang ra nấu ăn. Mẹ để dành phần ngon nhất đợi khi nào mình về thì nấu những món mình thích. Đều đặn mỗi tuần ba sẽ kiểm tra lốp xe có mềm không rồi bơm hơi cho mình. Ba sẽ nhắc chừng chuyện áo mưa, treo cho ráo rồi dặn mẹ xếp lại để nhắc mình bỏ cốp xe kẻo quên.', 105000, 'sach6.jpg', 40, '2024-11-15 09:54:46', 1, 6, 6),
(7, 'Cánh Chim Bị Thương', 'Cuốn sách kể về hành trình của Vy – một người phụ nữ bình thường đang sống những ngày tháng tươi đẹp tại Paris cùng chồng và con gái, được chẩn đoán mắc bệnh ung thư vú khi vừa bước qua tuổi 40. Cuộc sống tưởng chừng được lập trình một cách tuần tự của cô cứ thế mà chao đảo, ngả nghiêng và dường như chìm sâu vào vùng tăm tối. Vy buộc phải đứng trước những thách thức về danh tính, mặc cảm về sự “không toàn vẹn” khi một phần thuộc về cơ thể của cô – giờ đây đã không còn.', 119000, 'sach7.jpg', 48, '2024-11-24 13:04:55', 1, 7, 7),
(8, 'Người Gác Hải Đăng', '\"Người Gác Hải Đăng\" của Cho Chang-in là hành trình của một tâm hồn sâu lắng, đầy cô đơn, được thắp sáng bởi ngọn đèn hải đăng giữa biển khơi mênh mông.', 145000, 'sach8.jpg', 30, '2024-11-15 10:08:32', 1, 8, 8),
(9, 'Vừa Vặn Hạnh Phúc, Vừa Vặn Bình Yên', 'Cố gắng để đạt đến những đỉnh cao thì thật ấn tượng, nhưng biết hài lòng với những thứ vừa vặn sức mình thì cũng là hạnh phúc.\r\nCàng trưởng thành, chúng ta càng nhận ra bài học khó khăn vốn dĩ không phải là kiếm thật nhiều tiền, có thật nhiều thành tích, mà là làm sao để kiếm tiền đủ cho mình mà không làm hại đến ai, không phải thấp thỏm bất an lo được lo mất;...', 99000, 'sach9.jpg', 50, '2024-11-15 10:10:14', 1, 9, 7),
(10, 'Những Cung Đường Dưới Bầu Trời Sao', 'Sau cái chết của người dì yêu quý và mẹ mình, cô bé Riley Mays chuyển đến vùng quê Wisconsin để sống cùng vợ chồng anh chị họ Alec - Sachi. Ban đầu, Riley thu mình và bị ám ảnh bởi cái chết của người thân yêu nhất trên đời. Mười năm sau, với những nỗ lực của vợ chồng chị Sachi, Riley dần tìm thấy khoảng bình yên trong tâm hồn khi được những phép màu của thiên nhiên xoa dịu.', 219000, 'sach10.jpg', 20, '2024-11-15 10:10:14', 1, 10, 9),
(11, 'Thiên Sứ Nhà Bên - Tập 8.5', '“Mình muốn tạo ra thật nhiều kỉ niệm.”\r\nTừ cuộc gặp gỡ tình cờ, Fujimiya Amane - một học sinh trung học đang sống tự lập và khá cẩu thả, đã bắt đầu kết thân cùng Shiina Mahiru - cô gái xinh đẹp nhất trường với biệt danh thiên sứ.\r\nKhông biết từ lúc nào, đôi bên dần bị thu hút và trở thành người không thể thay thế trong tim đối phương.', 95000, 'sach11.jpg', 20, '2024-11-15 10:16:48', 6, 11, 10),
(12, 'Chơi Mà Học - My Red', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach12.jpg', 50, '2024-11-15 10:16:48', 2, 12, 7),
(13, 'Ra Quyết Định Dựa Trên Phân Tích Dữ Liệu', 'Ra Quyết Định Dựa Trên Phân Tích Dữ Liệu cung cấp kiến thức về việc sử dụng phân tích chiến lược trong kinh doanh nhằm hỗ trợ ra quyết định, cải thiện hiệu suất và thúc đẩy sự phát triển bền vững. Cuốn sách giới thiệu các khái niệm cơ bản về phân tích dữ liệu và tầm quan trọng của phân tích trong kinh doanh hiện đại.', 139000, 'sach13.jpg', 44, '2024-11-15 10:23:51', 3, 13, 3),
(14, 'Tâm Thức Tài Chính', 'Từ xưa đến nay, “Tiền” là một chủ đề chẳng mấy dễ chịu để thảo luận hay chia sẻ. Trong các buổi họp mặt gia đình, họp mặt bạn bè hay các buổi hẹn hò, hầu hét mọi người thường có xu hướng lảng tránh những câu hỏi liên quan đến thu nhập, chi tiêu và giá cả của các món đồ mình có.', 229000, 'sach14.jpg', 30, '2024-11-15 10:23:51', 3, 14, 7),
(15, 'Tạo Kênh Bán Hàng Và Marketing', 'Tạo Kênh Bán Hàng Và Marketing – bộ công cụ thiết yếu giúp bạn lập chiến lược cho những đường dẫn đến thị trường mới và hiện có. Qua sách này, bạn đọc sẽ biết cách phân tích, lên kế hoạch và quản lý các kênh tạo lợi nhuận với khuôn khổ kinh tế hiện nay, đảm bảo tận dụng tối đa các đối tác kênh ở mọi giai đoạn trong quá trình tiếp cận thị trường.', 198000, 'sach15.jpg', 33, '2024-11-15 10:25:48', 3, 15, 11),
(16, 'Tâm Lý Học Tích Cực Trong Bán Hàng', 'Sợ hãi khiến hầu hết nhân viên bán hàng không thích nhấc điện thoại gọi cho khách hàng.\r\nSợ hãi là lý do chúng ta không đề nghị làm ăn nhiều hơn, không chào thêm các sản phẩm và dịch vụ khác, mặc dù khách hàng muốn mua của chúng ta.\r\n', 150000, 'sach16.jpg', 22, '2024-11-15 10:25:48', 3, 16, 2),
(17, 'Bản Thảo Tìm Thấy Tại Accra', 'Vào một đêm năm 1099, Jerusalem đang đứng trước cuộc vây hãm của quân Thập tự chinh, trong sự tuyệt vọng và hỗn loạn, những con người từ mọi lứa tuổi và đức tin đã quy tụ để lắng nghe lời thông thái từ một người đàn ông Hy Lạp được biết đến với cái tên, Copt.\r\nThay vì sợ hãi một tương lai khó tránh, với Copt, quan trọng là phải giữ cho tri thức không bị sụp đổ chung với bức tường thành. Nhưng tri thức là gì? Đó là nhận thức về Tình yêu, về Hiến dâng, về Tinh thần, về sự sống và cái chết, về cuộc phiêu lưu của phận người trên Trái đất này. ', 96000, 'sach17.jpg', 20, '2024-11-24 10:30:05', 1, 1, 1),
(18, 'Hippie Những Kẻ Lãng Du', 'Hippie – Những kẻ lãng du đưa ta đến với những con người hoàn toàn xa lạ, với những mục đích khác nhau nhưng cùng hướng đến vùng đất xa xôi Nepal trên con đường mòn hippie huyền thoại. Trong hành trình đó, chàng trai Brazil tên Paulo gầy gò có chòm râu dê và mái tóc dài bồng bềnh, mơ ước trở thành nhà văn đã gặp gỡ Karla, cô gái Hà Lan ở độ tuổi đôi mươi đang tìm kiếm bạn đồng hành cho chuyến đi.\r\nSau khi gặp nhau ở Amsterdam, cô thuyết phục Paulo cùng cô lên chiếc Xe buýt Diệu kỳ đi từ Amsterdam đến Istanbul và qua Trung Á đến Kathmandu.', 150000, 'sach18.jpg', 30, '2024-11-24 10:30:05', 1, 1, 1),
(19, 'Chơi Mà Học - My Pink', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach19.jpg', 30, '2024-11-24 10:35:10', 2, 12, 7),
(20, 'Chơi Mà Học - My Purple', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach20.jpg', 22, '2024-11-24 10:35:10', 2, 12, 7),
(21, 'Chơi Mà Học - My Yellow', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach21.jpg', 44, '2024-11-24 10:36:48', 2, 12, 7),
(22, 'Chơi Mà Học - My Blue', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach22.jpg', 11, '2024-11-24 10:36:48', 2, 12, 7),
(23, 'Lâu Đài Thần Bí', 'Lâu đài thần bí là một trong những tác phẩm xuất sắc nhất của tác giả Edith Nesbit. Câu chuyện kể về ba anh em Gerald, Kathleen và Jimmy. Để khiến kỳ nghỉ hè bớt nhàm chán, những đứa trẻ đã quyết định dạo chơi trong khu rừng gần nhà. Họ giả vờ như đang tham gia vào một cuộc phiêu lưu kỳ thú, háo hức chờ đợi những sự kiện lạ lùng ở phía trước.', 119000, 'sach23.jpg', 33, '2024-11-24 10:45:16', 1, 17, 6),
(24, 'Lũ Trẻ Đường Tàu', 'Lũ trẻ đường tàu là một trong những tác phẩm kinh điển cho những ai đã và đang là thiếu nhi. Cuốn sách kể về ba đứa trẻ tinh nghịch, trong trẻo, đầy màu sắc của ngôi nhà Ba Ống Khói cùng những tháng ngày sống gần bên đường tàu. Tuy thỉnh thoảng có cãi nhau như các chị em trong bao gia đình khác, nhưng cả ba đứa trẻ đều rất hiếu thảo, yêu thương và biết nghĩ cho nhau.\r\nTại vùng quê yên bình gần bên đường tàu, những đứa trẻ của ngôi nhà Ba Ống Khói đã có những “phi vụ” để đời, những hành động nhân văn, đầy dũng cảm và những tháng ngày vui sống rất đỗi bình dị đời thường. Song ẩn sâu trong sự bình dị ấy lại là một câu chuyện về lòng can đảm, không ngừng cố gắng vươn lên của con người.', 129000, 'sach24.jpg', 20, '2024-11-24 10:45:16', 1, 17, 10),
(25, 'Hà Nội Là Hà Nội', 'Cuốn sách này là cuốn thứ ba trong bộ ba sách về Hà Nội của tác giả Nguyễn Trương Quý. Cuốn đầu – Tự nhiên như người Hà Nội – là những quan sát và tìm hiểu về hình thái đô thị, làm rõ đặc trưng không gian rất đặc biệt của Hà Nội. Cuốn thứ hai – Ăn phở rất khó thấy ngon – là chân dung về con người trong thành phố ấy, đặc biệt tập trung vào lối sống của giới viên chức văn phòng, mang những nét hài hước.\r\nCuốn sách này, như tên gọi của nó, Hà Nội là Hà Nội, là cuộc tìm kiếm những giá trị văn hóa ở một thành phố tưởng như đã định hình nét văn hóa mà vẫn liên tục phải gọt giũa.', 95000, 'sach25.jpg', 15, '2024-11-24 10:49:09', 1, 18, 2),
(26, 'Tự Nhiên Như Người Hà Nội', '“Không ngơi nghỉ, không phút nào như phút nào, ngày hôm nay Hà Nội sống hối hả, như cuống quýt giành lại những năm tháng chậm chạp đã qua.\"\r\nCuốn sách này giới thiệu với bạn đọc những nét đặc trưng về Hà Nội với những nội dung như: Phố cổ, Hồ Gươm.. trong không gian Hà Nội; Hà Nội: Văn hoá công viên; Hà Nội: Chợ trong chợ; Hà Nội nhìn từ các đô thị vệ tinh vùng Bắc Bộ; Tự nhiên như người Hà Nội; Giới trẻ Hà Nội và vòng vây giải trí...', 85000, 'sach26.jpg', 10, '2024-11-24 10:50:50', 1, 18, 2),
(27, 'Ăn Phở Rất Khó Thấy Ngon', 'Ăn phở rất khó thấy ngon là tập tản văn của Nguyễn Trương Quý tác giả cuốn Tự nhiên như người Hà Nội đã xuất bản năm 2004… Mọi người vẫn nghĩ những người đi làm công sở là một khối người không có nhiều biến động, chừng ấy mong muốn, chừng ấy nhu cầu và chừng ấy hành động. Bề ngoài là như vậy, song với bản tính đa sự của mình, những dân văn phòng này lại phức tạp về chuyện nghĩ ngợi nhất trong xã hội. 26 bài viết của tập sách đề cập và xoay quanh các vấn đề cuộc sống văn phòng được thể hiện bằng giọng văn vừa thâm sâu vừa dí dỏm lột tả gần như hết sự thật ở cái nơi mà người ta chỉ dùng một từ dành cho nó “chán”.', 85000, 'sach27.jpg', 40, '2024-11-24 10:50:50', 1, 18, 2),
(28, 'Sức Hút Của Sự Tự Tin', '“Tôi bị làm sao ấy.”\r\n“Tôi sợ nếu bộc lộ con người thật của mình, họ sẽ không yêu thương tôi nữa.”\r\nChúng ta không tin tưởng vào khả năng ứng phó với cuộc sống của mình, vậy nên chúng ta luôn ở trong trạng thái sợ hãi và lo lắng. Hay chúng ta vẫn luôn sống theo chủ nghĩa hoàn hảo, để rồi rơi vào hoảng loạn mỗi khi chúng ta (hoặc người khác) mắc lỗi.\r\nChúng ta ôm đồm quá nhiều thứ chỉ vì không tin tưởng vào phán đoán của chính mình về việc nên làm những gì, hoặc chúng ta sợ nói “Không” sẽ làm mất lòng người khác.\r\nChúng ta không tin mình sẽ đưa ra lựa chọn đúng đắn, nên dù đã tiêu tốn rất nhiều thời gian và công sức để đưa ra quyết định, chúng ta vẫn hoài nghi về quyết định đó.', 109000, 'sach28.jpg', 20, '2024-11-24 11:07:22', 4, 19, 8),
(29, 'Sức Mạnh Của Lòng Kiên Nhẫn', 'Sức Mạnh Của Lòng Kiên Nhẫn của M. J. Ryan sẽ mang đến giải pháp cho những vấn đề trên. Là tác giả của những cuốn sách nổi tiếng như: The Happiness Makeover (Hạnh phúc không khó tìm), Random Acts of Kindness (Cách hành xử hào hiệp và vị tha) và Attitude of Gratitude (Thái độ biết ơn), Ryan nhận thấy rằng những đức tính cao đẹp muôn thuở luôn có sức mạnh đem lại ánh sáng và tình yêu cho cuộc đời chúng ta.\r\n', 88000, 'sach29.jpg', 15, '2024-11-24 11:07:22', 4, 19, 12),
(30, 'WOW! Những Sự Thật Đáng Kinh Ngạc Về Khủng Long', 'Bách khoa toàn thư: Vô vàn sự thật đáng kinh ngạc về khủng long!\r\nQuay về thời đại khủng long để khám phá các loài khủng long ăn thịt và ăn chay, từ Dreadnoughtus khổng lồ đến Compsognathus nhỏ nhắn. Cuốn sách sẽ mở ra hành trình tìm hiểu về thế giới cổ đại, khi khủng long ngự trị trên Trái Đất.', 59000, 'sach30.jpg', 20, '2024-11-25 16:25:01', 2, 20, 7),
(31, 'WOW! Những Sự Thật Đáng Kinh Ngạc Về Đại Dương', 'Bách khoa toàn thư: Những sự thật đáng kinh ngạc trong lòng đại dương\r\nHãy khám phá đại dương kỳ bí và tìm hiểu về các sinh vật như cá heo thích huýt sáo, cá voi xanh khổng lồ, và các loài cá mê lướt sóng. Cuốn sách mở ra thế giới biển sống động và dạy trẻ cách bảo vệ môi trường biển.\r\n', 59000, 'sach31.jpg', 22, '2024-11-25 16:25:01', 2, 20, 7),
(32, 'WOW! Những Sự Thật Đáng Kinh Ngạc Về Vũ Trụ', 'Bách khoa toàn thư: Những sự thật đáng kinh ngạc về vũ trụ\r\nVới những câu hỏi như làm sao để bay vào không gian hay vì sao các ngôi sao sáng rực, trẻ sẽ được dẫn dắt qua hệ Mặt Trời và những bí ẩn trong không gian. Cuốn sách giúp trẻ hiểu hơn về vũ trụ rộng lớn và những hành tinh xa xôi.\r\n', 59000, 'sach32.jpg', 50, '2024-11-25 16:26:48', 2, 20, 7),
(33, 'Wolfoo EQ - Vì Sao Tớ Không Nên Sợ Hãi?', 'Hãy cùng Wolfoo học hỏi và trau dồi các kỹ năng kiểm soát cảm xúc thông qua những bài học đơn giản, thiết thực và gần gũi với các bạn nhỏ bằng cách đi tìm câu trả lời cho những câu hỏi sau qua mỗi trang sách.\r\n- Nếu trẻ cáu giận thì cần làm gì?\r\n- Nếu trẻ ghen tị với em thì sao?\r\n- Nếu trẻ sợ đến bệnh viện thì thế nào?\r\n- Nếu trẻ ích kỷ với bạn bè thì ra sao?\r\n', 49000, 'sach33.jpg', 30, '2024-11-25 16:26:48', 2, 21, 7),
(34, 'Wolfoo Ehon - Người Bạn Thân Nhất Của Tớ', 'Hãy cùng Wolfoo học hỏi và trau dồi các kỹ năng sống để thông qua những bài học đơn giản, thiết thực và gần gũi với các bạn nhỏ bằng cách đi tìm câu trả lời cho những câu hỏi sau qua mỗi trang sách.\r\n- Nếu bị lạc thì trẻ cần làm gì?\r\n- Nếu tranh cãi với bạn bè thì trẻ có buồn không?\r\n- Các con có nên cùng nhau hợp sức để giải một câu đố?\r\n- Trung thực có khó không?\r\n- Trẻ cần làm gì để bảo vệ đôi mắt – cửa sổ tâm hồn của chúng mình?\r\n', 49000, 'sach34.jpg', 20, '2024-11-25 16:28:15', 2, 21, 7),
(35, 'Wolfoo Ehon - Ngoài Sân Chơi, Vui Mê Tơi', 'Wolfoo – một nhân vật quá quen thuộc với những bạn nhỏ Việt Nam qua các thước phim hoạt hình hấp dẫn hiện đã có phiên bản sách Ehon.\r\nNgoài sân chơi vui mê tơi: Trẻ sẽ học được những thói quen tốt liên quan đến mắt trong quá trình học hành và đọc sách. Ngoài ra, Wolfoo cùng các bạn sẽ cho thấy sự dũng cảm đối mặt và khả năng giải quyết vấn đề của trẻ khi đứng trước một câu hỏi hoặc tình huống khó.\r\n', 49000, 'sach35.jpg', 50, '2024-11-25 16:28:16', 2, 21, 7),
(36, 'Tranh Truyện Ehon Nhật Bản - Tiệm Súp Lừng Danh', 'Cuốn ehon hài hước khiến các bạn nhỏ bật cười khi gặp các bạn động vật háu ăn hệt như mình vậy. Những món súp ngon tuyệt thơm lừng hẳn ai cũng muốn thưởng thức nhưng bà Thằn Lằn đã dạy cho các bạn biết rằng phải \"có làm thì mới có ăn\".', 150000, 'sach36.jpg', 20, '2024-11-25 16:29:39', 2, 22, 10),
(37, 'Tranh Truyện Ehon Nhật Bản - Tiệm Mật Ong Lừng Danh', 'Bố Gấu đi thu thập mật ong xa nhà nhưng luôn nhớ viết thư và gửi các loại mật ong ngon tuyệt về cho ba mẹ con gấu ở nhà. Bức tranh gia đình ấm cúng còn dạy các bạn nhỏ biết giúp đỡ bố mẹ trong việc nhà giống như các bạn gấu khi tiệm mật ong của gia đình đông khách. Cuối truyện là món quà công thức làm bánh pancake mật ong đặc biệt của mẹ gấu dành tặng các gia đình mọt nhí.', 150000, 'sach37.jpg', 30, '2024-11-25 16:29:39', 2, 22, 10),
(38, 'Ehon Nhật Bản - Bull Và Kana', 'Chú chó Bull đến nhà cô bạn nhỏ Kana ở, nhưng làm thế nào để làm bạn được với Kana bây giờ? Bull bèn nghĩ ra cách “chạy tới liếm mặt, âu yếm Kana”, tuy nhiên, Kana giật mình òa khóc “oa..oa..oa”. Rồi Bull lại nghĩ cách khác để lấy lòng cô bé Kana như: “Hát cho Kana nghe”, “Giả vờ nằm ra sàn nhà giống gấu bông”… tuy nhiên, Kana đều òa khóc và bỏ chạy. Bull buồn lắm, lặng lẽ chui vào chuồng, bỏ ăn. Liệu rằng Bull và Kana có thể trở thành đôi bạn được không? Mời các em nhỏ cùng đón đọc Ehon Nhật Bản - Bull Và Kana nhé!', 29000, 'sach38.jpg', 20, '2024-11-25 16:30:50', 2, 22, 8),
(39, 'Sách Trò Chơi Bóc Dán Cảm Xúc - Nông Trại', 'Bộ sách Trò chơi bóc dán được thiết kế đặc biệt cho trẻ từ 3 đến 10 tuổi, giúp kích thích sự sáng tạo và khám phá trong bé năng động. Bộ sách gồm 5 cuốn với các chủ đề: Cảm xúc đại dương, cảm xúc khủng long, cảm xúc nông trại, cảm xúc rừng xanh, và cảm xúc côn trùng. Mỗi cuốn sách bao gồm 40+ stickers an toàn và siêu đáng yêu. Bộ sách sẽ là người bạn đồng hành tuyệt vời cho sự sáng tạo và trí tưởng tượng của các bé.', 36000, 'sach39.jpg', 22, '2024-11-25 16:30:50', 2, 23, 9),
(40, 'Sách Trò Chơi Bóc Dán Cảm Xúc - Côn Trùng', 'Bộ sách \"Trò Chơi Bóc Dán\" là một cuốn sách tương tác giúp bé vừa đọc vừa chơi thông qua việc bóc và dán sticker trên những trang sách. Không chỉ đơn giản là đọc chữ, xem tranh như những cuốn sách truyền thống, sách tương tác đã trở thành món \"đồ chơi tri thức\" vô cùng sáng tạo và thú vị đối với các độc giả nhỏ tuổi. Chưa bao giờ \"dụ\" bé đọc sách lại dễ dàng đến vậy!', 36000, 'sach40.jpg', 44, '2024-11-25 16:32:12', 2, 23, 9),
(41, 'Sách Thời Trang Công Chúa Daisy', 'Bộ sách Thời trang công chúa trọn bộ gồm 4 cuốn, mỗi cuốn là 32 hình công chúa, giúp các bé trở thành một nhà thiết kế thời trang hoàn hảo, bé có thể thỏa sức sáng tạo cùng với hơn 90 sticker gồm quần áo, váy vóc, phụ kiện đi kèm để làm công chúa trở nên xinh đẹp và lộng lẫy hơn theo nhiều phong cách khác nhau.', 48000, 'sach41.jpg', 50, '2024-11-25 16:32:12', 2, 23, 9),
(42, 'Hook Point - Điểm Níu Chân Khách Hàng Trong Thế Giới 3 Giây Hối Hả', '\"Hook Point - Điểm níu chân khách hàng trong thế giới 3 giây hối hả\", của nhà tư tưởng đột phá Brendan Kane, trình bày các chiến lược hiệu quả nhất để tạo ra cơ hội mới, đổi mới và mở rộng quy mô kinh doanh của bạn, đồng thời tạo ra một thương hiệu hấp dẫn trên cả trực tuyến và ngoại tuyến, để bạn có thể phát triển trong thế giới khan hiếm sự chú ý mà chúng ta đang sống.', 199000, 'sach42.jpg', 20, '2024-11-25 16:33:33', 3, 24, 3),
(43, 'Cách Để Đạt 1 Triệu Follow Chỉ Trong 30 Ngày', '\"BẠN CÓ MUỐN NẮM TRONG TAY QUYỀN LỰC KHÔNG?\r\nNếu có thì đây chính là cuốn sách cho bạn đấy. One Million Followers là cuốn sách hướng dẫn cách tận dụng những nền tảng truyền thông xã hội như Facebook, Instagram, Youtube…để tạo ra ảnh hưởng, trở thành người của công chúng và nắm trong tay quyền lực. Những bí quyết mà tác giả Brendan Kane chia sẻ trong cuốn sách này tuy nhỏ mà có võ, đọc cái hiểu ngay nhưng nhiều khi ta không nhận ra.\r\n', 166000, 'sach43.jpg', 20, '2024-11-25 16:33:33', 3, 24, 11),
(44, 'Ngân Hàng Biết Tìm Khách Hàng Ở Đâu?', 'NGÂN HÀNG BIẾT TÌM KHÁCH HÀNG Ở ĐÂU? thảo luận về các nguồn khách hàng tiềm năng, chia sẻ về các phương pháp khai thác với nhiều kinh nghiệm thực tế thành công. Một số chương trong cuốn sách có sử dụng minh hoạ là các icon nhằm giúp bạn đọc dễ nắm bắt nội dung. Điều đặc biệt, cuốn sách có nhiều câu chuyện điển hình để làm rõ một ý quan trọng: nếu quyết tâm làm thì trong điều kiện nào cũng có giải pháp.', 159000, 'sach44.jpg', 50, '2024-11-25 16:35:02', 3, 25, 11),
(45, 'Chọn Ngân Hàng Hay Chọn Giám Đốc', 'Chọn Ngân Hàng Hay Chọn Giám Đốc\r\n“Chọn giám đốc hay chọn ngân hàng” không chỉ dành riêng cho banker nói riêng mà dành cho những ai muốn trải nghiệm và thử thách bản thân với nghề ngân hàng. Quyển sách là một “guideline” thiết thực dành cho những bạn trẻ mới ra trường và dấn thân vào công việc mà mình chọn lựa. Cho dù chọn bất kỳ công việc gì, ngành nghề nào thì công thức để bạn thành công chỉ có thể là sự kiên trì, không ngừng học hỏi. Sách có 8 chương mô tả cụ thể những vấn đề của người mới bắt đầu công việc.\r\n', 129000, 'sach45.jpg', 40, '2024-11-25 16:35:02', 3, 25, 12),
(46, 'Đầu Tư Chứng Khoán: Chơi Trò May Rủi Hay Tích Lũy Tài Chính?', 'Cuốn sách Đầu Tư Chứng Khoán: Chơi Trò May Rủi Hay Tích Lũy Tài Chính? giúp cho độc giả hiểu rõ những kiến thức cơ bản về đầu tư: cách tính tỷ suất lợi nhuận, những rủi ro trong đầu tư chứng khoán, các công cụ đầu tư, sự khác nhau giữa giá và giá trị, các chiến lược đầu tư, và đặc biệt là sự khác biệt giữa đầu tư may rủi và đầu tư có phương pháp để tích lũy tài chính.', 270000, 'sach46.jpg', 10, '2024-11-25 16:36:15', 3, 26, 8),
(47, 'Tình Yêu Cà Phê Việt - Bí Quyết Trở Thành Chuyên Gia Cà Phê', 'Các kỹ thuật từ chọn hạt trồng, chọn hạt chín khi thu hoạch đến rang xay, pha chế... làm sao tốt để những ai theo đuổi nghề liên quan đến cà phê biết tất cả các bí quyết làm cà phê Việt ngon lành, thì cuốn sách Tình Yêu Cà Phê Việt - Bí Quyết Trở Thành Chuyên Gia Cà Phê này đã thể hiện tình yêu cà phê Việt của tác giả sâu đậm như thế nào và không giấu giếm sự lo âu về những nguy cơ không bền vững của cà phê Việt.', 139000, 'sach47.jpg', 15, '2024-11-25 16:36:15', 3, 27, 13),
(48, '45 Giây Tạo Nên Thay Đổi - Thấu Hiểu Tiếp Thị Mạng Lưới', 'Don Failla - một người có rất nhiều kinh nghiệm trong lĩnh vực tiếp thị mạng lưới từ những năm 1970 đã viết cuốn sách này nhằm giúp người đọc hiểu được bản chất tiếp thị mạng lưới thực ra là gì và không phải là gì. Qua cuốn sách tác giả cũng hướng dẫn cách trình bày hiệu quả về tiếp thị mạng lưới để người khác hiểu, và quan trọng là cách xây dựng một sự nghiệp riêng xung quanh mô hình kinh doanh này.', 70000, 'sach48.jpg', 10, '2024-11-25 16:37:33', 3, 28, 2),
(49, 'Kinh Nghiệm Thành Công Của Ông Chủ Nhỏ', 'Kinh Nghiệm Thành Công Của Ông Chủ Nhỏ là một cuốn sách có nội dung khác biệt với những cuốn sách kinh doanh thông thường khác, có thể sẽ giúp ích được cho những bạn trẻ đã và đang dấn thân vào lĩnh vực kinh doanh. Trong cuốn sách này, trước tiên, tác giả nêu ra tình huống, sau đó đi sâu phân tích, đưa ra những luận điểm về những tình tiết quan trọng trong câu chuyện và đề cập tới những lĩnh vực có thể ứng dụng luận điểm đó.', 78000, 'sach49.jpg', 12, '2024-11-25 16:37:33', 3, 29, 8),
(50, 'Dạy Con Làm Giàu 1 - Để Không Có Tiền Vẫn Tạo Ra Tiền', 'Người giàu không làm việc vì tiền. Họ bắt tiền làm việc cho họ. Chấp nhận thất bại là bước đầu của thành công? Quyền lực của sự lựa chọn! Những bài học không có trong nhà trường. Hãy bắt đầu từ hôm nay “để không có tiền vẫn tạo ra tiền”…', 80000, 'sach50.jpg', 15, '2024-11-25 16:38:48', 3, 30, 2),
(51, 'Tại Sao Chúng Tôi Muốn Bạn Giàu?', 'Họ là những doanh nhân hàng đầu, có một không hai của thế giới, nổi tiếng và thành đạt. Họ khác nhau ở điểm xuất phát nhưng sẽ cùng nhau chỉ bạn điểm xuất phát cho sự giàu có bằng chính kinh nghiệm của họ. Từ quan niệm “cho người ta một con cá, và bạn nuôi sống anh ta một ngày. Dạy người ta câu cá, và bạn nuôi sống anh ta cả đời” hai nhà tỷ phú hàng đầu sẽ cho bạn thấy tại sao tiền bạc làm nên sự giàu có nhưng lại không giúp ta thoát khỏi sự nghèo khó.', 135000, 'sach51.jpg', 50, '2024-11-25 16:38:48', 3, 30, 2),
(52, 'Chạm Tay Hóa Vàng', 'Bạn đang suy nghĩ về việc bắt đầu một doanh nghiệp riêng ư? Hay bạn đã có một doanh nghiệp riêng và muốn phát triển nó? Nếu vậy, trước khi lãng phí thời gian và tiền bạc, bạn có một nghĩa vụ đặc biệt với bản thân, gia đình và thế giới – đó là hãy khám phá và nắm vững 5 điểm chính của cái chạm tay hóa vàng.', 125000, 'sach52.jpg', 44, '2024-11-25 16:40:01', 3, 30, 2),
(53, 'Người Bán Hàng Vĩ Đại Nhất Thế Giới', 'Người Bán Hàng Vĩ Đại Nhất Thế Giới của Og Mandino là một hành trình dài về câu chuyện của Hafid, một cậu bé chăn lạc đà nghèo, ở Jerusalem cổ đại. Người thanh niên đã học được từ một thương nhân giàu có và thành công về những bí quyết để trở thành một người bán hàng vĩ đại.', 148000, 'sach53.jpg', 30, '2024-11-25 16:40:01', 3, 31, 12),
(54, 'Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học', 'Mục đích của cuốn sách này là làm vơi đi một số khó khăn đó và giúp bạn trở thành một người tự học tận tụy, kiên quyết và nhanh nhẹn ở bất cứ môn học nào bạn đã chọn, sách sẽ dẫn dắt bạn từng bước tìm kiếm nguồn cảm hứng để học tập, hoạch định, phát triển những thói quen tốt và điều khiển việc học tập của chính mình. Hy vọng bạn có thể sử dụng những kỹ năng rút ra từ cuốn sách này và áp dụng cho bất cứ khóa học nào bạn quan tâm.', 89000, 'sach54.jpg', 33, '2024-11-25 16:41:05', 4, 32, 5),
(55, 'Khoa Học Kỹ Năng Cho Thời Đại Mới - Sống Kỷ Luật, Gặt Thành Công', 'Với Sống kỷ luật, gặt thành công, Peter Hollins cho chúng ta thấy để thành công, “chỉ việc nghiến răng lại, rồi cố gắng thì luôn luôn chưa đủ”, bạn còn cần “biết cách gia tăng mức khởi điểm của sự tự giác kỷ luật, cũng như làm sao để bố trí, sắp xếp cuộc đời mà không cần tới tự giác kỷ luật tại mỗi khúc quanh”.', 109000, 'sach55.jpg', 40, '2024-11-25 16:41:05', 4, 32, 5),
(56, '41 Thói Quen Kỷ Luật Tự Giác Của Người Thành Đạt', 'Thông qua cuốn sách “41 thói quen kỷ luật tự giác của người thành đạt”, tác giả cung cấp một hộp công cụ giúp bạn luôn chuyển động và hành động hướng tới mục tiêu của mình. Nó cung cấp các kỹ thuật trực tiếp để đảm bảo rằng hành động của bạn phù hợp với ý định của bạn – một nhiệm vụ không hề dễ dàng và cần kiên trì để vượt qua.', 138000, 'sach56.jpg', 33, '2024-11-25 16:42:03', 4, 32, 11),
(57, 'Trên Vai Người Khổng Lồ', 'Trong cuốn sách Trên vai người khổng lồ - Bài học từ những thiên tài vĩ đại nhất lịch sử để khác biệt và thành công, tác giả Peter Hollins sẽ cho bạn nhìn xuyên qua thời gian và không gian, chứng khiến các dấu mốc cuộc đời của nhiều nhà tư tưởng vĩ đại như Albert Einstein, Socrates, Charles Darwin, Abraham Lincoln,... Từ đó khám phá những đặc điểm đặc trưng và khác biệt trong tư duy khiến họ trở thành những thiên tài bậc nhất, khai thác các phương pháp và kĩ năng độc đáo mà chúng ta có thể tích lũy và học tập.', 99000, 'sach57.jpg', 15, '2024-11-25 16:42:03', 4, 32, 7),
(58, 'Đắc Nhân Tâm', 'Đắc Nhân Tâm của Dale Carnegie là tác phẩm nổi tiếng nhất, bán chạy nhất và có tầm ảnh hưởng nhất của mọi thời đại. Cuốn sách đã được chuyển ngữ sang hầu hết các thứ tiếng trên thế giới và có mặt ở hàng trăm quốc gia. Đây là cuốn sách liên tục đứng đầu danh mục sách bán chạy nhất (Best-selling Books) do thời báo New York Times bình chọn suốt 10 năm liền. Tác phẩm được đánh giá là cuốn sách đầu tiên và hay nhất trong thể loại này, có ảnh hưởng thay đổi cuộc đời đối với hàng triệu người trên thế giới.', 76000, 'sach58.jpg', 20, '2024-11-25 16:43:26', 4, 33, 12),
(59, 'Đắc Nhân Tâm Trong Thời Đại Số', 'Trong cuộc sống hiện đại, nơi mà sự giao tiếp giữa con người ngày càng phụ thuộc nhiều hơn vào công nghệ, những bài học của Carnegie chẳng những không hề lỗi thời mà càng tỏ ra hữu ích hơn bao giờ hết. Mặc dù chưa bao giờ dự đoán chính xác về tính phổ biến của công nghệ, Carnegie đã bộc lộ sự thông thái của mình trong ngữ cảnh của cuộc sống số. Cho dù có những thay đổi nào đang diễn ra trong phương thức giao tiếp và cho dù chúng ta giao tiếp với tốc độ nào, thì giá trị những lời khuyên của Carnegie về cách ứng xử, lãnh đạo và làm việc sao cho hiệu quả vẫn luôn tồn tại với thời gian.', 258000, 'sach59.jpg', 22, '2024-11-25 16:43:26', 4, 33, 12),
(60, 'Lập Trình Hạnh Phúc', 'Ai cũng có riêng cho mình một hành trình cuộc sống. Nhưng trên chặng đường này, lần cuối cùng bạn ngừng lại chỉ mười giây thôi để cảm nhận và hưởng thụ một vài khoảnh khắc tích cực luôn luôn hiện diện cả trong những ngày điên cuồng nhất là khi nào? Nếu bạn không nán lại tận hưởng một vài giây và sống với trải nghiệm này, nó sẽ lướt qua bạn như gió lùa qua cây, khoan khoái chốc lát nhưng không để lại chút giá trị gì.', 122000, 'sach60.jpg', 15, '2024-11-25 16:44:32', 4, 34, 8),
(61, 'Đời Ngắn Đừng Ngủ Dài', '“Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải theo cách của ta. Hãy kiên nhẫn. Tin tưởng. Hãy giống như người thợ cắt đá, đều đặn từng nhịp, ngày qua ngày. Cuối cùng, một nhát cắt duy nhất sẽ phá vỡ tảng đá và lộ ra viên kim cương. Người tràn đầy nhiệt huyết và tận tâm với việc mình làm không bao giờ bị chối bỏ. Sự thật là thế.”', 75000, 'sach61.jpg', 50, '2024-11-25 16:44:32', 4, 35, 2),
(62, 'Ai Sẽ Khóc Khi Bạn Lìa Xa', 'Ai Sẽ Khóc Khi Bạn Lìa Xa đã giúp hàng triệu người trên toàn cầu học lại cách tập trung vào những điều đáng giá và sống một cuộc sống giản đơn hơn với niềm vui, đam mê và mục đích. Cùng chứa đầy những cảm hứng và triết lý đã làm nên thành công trước đó của quyển The monk Who sold his Ferrari, cuốn cẩm nang này chia sẻ 101 ý tưởng mạnh mẽ để giúp bạn tạo nên thành công đích thực và ý nghĩa cuộc sống.', 60000, 'sach62.jpg', 20, '2024-11-25 16:45:41', 4, 35, 2),
(63, 'Điều Vĩ Đại Đời Thường', 'Hành trình trở nên vĩ đại khởi đầu từ những điều thật giản dị và gần gũi, cũng giống như hành trình vạn dặm khởi đầu từ một bước chân giản đơn. 101 câu chuyện và ý tưởng của tác giả trong quyển sách này chính là 101 bài học minh chứng cho triết lý đơn sơ ấy.\r\nKhông có cuộc sống nào là hoàn hảo, tất cả chúng ta phải đối mặt với nhiều thử thách, từ đơn giản đến nghiêm trọng… Nhưng chúng ta đều có quyền lựa chọn vượt lên mọi nghịch cảnh để vươn tới vị trí cao nhất và tốt nhất của cuộc sống.', 92000, 'sach63.jpg', 30, '2024-11-25 16:45:41', 4, 35, 2),
(64, 'Làm Chủ Bình Minh, Sống Đời Xuất Chúng', 'Làm chủ bình minh. Sống đời xuất chúng\" là câu chuyện lạ lùng - và đáng kinh ngạc - về hai con người bình thường mong muốn đạt được hiệu suất làm việc cao hơn, đạt được sự thịnh vượng và thanh thản trong thời đại và kỹ thuật số gây ra biết bao xao lãng, đầy những điều quá sức phức tạp. Hai con người này đã gặp một nhà tài phiệt quái dị và tuyệt vời.', 185000, 'sach64.jpg', 20, '2024-11-25 16:46:47', 4, 35, 2),
(65, 'Thuyết Phục Bằng Thấu Cảm - Khi Sự Thật Không Thể Lay Chuyển Lòng Người', 'Tất cả các thành công, dù trong cuộc sống riêng tư hay trong công việc, đều dựa trên kỹ năng thuyết phục. Nói đơn giản, bạn có thể có sản phẩm tốt nhất, kế hoạch tốt nhất, chính sách tốt nhất, nhưng nếu không thể kết nối câu chuyện của mình với người nghe thì những gì tốt nhất của bạn cũng chẳng nghĩa lý gì. Bạn sẽ không thuyết phục được mọi người chọn công ty hoặc đi theo sự lãnh đạo của bạn.', 127000, 'sach65.jpg', 30, '2024-11-25 16:46:47', 4, 36, 4),
(66, 'Astérix - Cuộc Đấu Của Những Thủ Lĩnh', 'Sau nhiều lần bị Astérix và Obélix làm bẽ mặt, quân La Mã nung nấu âm mưu lợi dụng Cuộc đấu giữa các thủ lĩnh nhằm hạ bệ thủ lĩnh Abraracourcix của làng Gaulois. Với mục tiêu này, chúng đã tìm đến Aplusbégalix của làng Sérum và lên kế hoạch phục kích pháp sư Panoramix để ngăn ông tiếp tục luyện chế thuốc thần.\r\nAstérix và Obélix đã kịp thời chặn đứng ý định của quân La Mã. Nhưng ôi không...! Pháp sư Panoramix lại bị mất trí nhớ!? Chàng anh hùng Astérix của chúng nên làm gì để hóa giải mối nguy tồi tệ này đây? Câu trả lời sẽ có trong Astérix - Cuộc Đấu Của Những Thủ Lĩnh!\r\n', 80000, 'sach66.jpg', 50, '2024-11-25 16:47:59', 5, 37, 10),
(67, 'Astérix - Astérix Và Người Normand', 'Thủ lĩnh Abraracourcix đã giao cho Astérix và Obélix một trọng trách cao cả: Trông nom cậu cháu trai Goudurix do người anh trai Oceanonix của ông gửi gắm, trong khoảng thời gian cậu nhóc sống tại làng Gaulois vào dịp nghỉ hè.\r\nCuộc sống của mọi người dân Gaulois trở nên gà bay chó sủa vì sự xuất hiện của Goudurix. Mọi thứ càng trở nên hỗn loạn hơn khi đoàn chiến binh Normand dũng cảm bất ngờ ghé thăm. Mục đích của họ khi tới Gaulois là gì? Astérix sẽ xử trí như thế nào để duy trì sự yên bình cho làng Gaulois?\r\nMời các bạn tìm đọc trong Astérix Và Người Normand\r\n', 80000, 'sach67.jpg', 40, '2024-11-25 16:47:59', 5, 37, 10),
(68, 'Astérix - Astérix Ở Chỗ Người Breton', 'Bretagne thường xuyên giúp đỡ xứ Gaule chiến đấu chống lại đội quân La Mã. Vì thế, Jules César quyết định tiến công Portus Itius. Sau một thời gian kháng chiến “sôi nổi”, người Breton cuối cùng cũng không cản nổi bước tiến của quân xâm lăng, xứ Bretagne bị chiếm đóng toàn bộ...\r\nAstérix và Obélix quyết định hộ tống Jolitorax cùng thùng nước thần về Bretagne. Liệu bộ đôi có hoàn thành được trọng trách cao cả này? Mời các bạn cùng tìm đọc trong Asterix Ở Chỗ Người Breton!\r\n', 80000, 'sach68.jpg', 20, '2024-11-25 16:49:30', 5, 37, 10),
(69, 'Solo Leveling - Tôi Thăng Cấp Một Mình - Tập 1', 'SUNG JIN WOO, THỢ SĂN HẠNG E YẾU ỚT BẬC NHẤT nghèo khổ, tài năng không có mà cũng chẳng được ai chống lưng. Trong một chuyến công phá để kiếm kế sinh nhai, cậu tình cờ tìm thấy HẦM NGỤC KÉP. Trên chiến trường tàn khốc, cậu đã lựa chọn con đường cô độc nhất…\r\nTừ kẻ yếu ớt trở thành Thợ săn mạnh nhất!!\r\n', 88000, 'sach69.jpg', 20, '2024-11-25 16:49:30', 5, 38, 10),
(70, 'Solo Leveling - Tôi Thăng Cấp Một Mình - Tập 13', 'Vậy là chiến dịch tiêu diệt kiến chúa được thực hiện bởi các Thợ săn hàng đầu Hàn Quốc đã nổ ra.\r\nToàn bộ kiến hộ vệ cực mạnh đã bị hạ, hiện chỉ còn một mục tiêu duy nhất!\r\nTiêu diệt được kiến chúa, xem như toàn bộ kiến trên đảo cũng sẽ bị diệt chủng!!\r\nTưởng như chiến thắng đã nằm trong tầm tay nhưng…\r\n“TRẬN CHIẾN BÂY GIỜ MỚI THỰC SỰ BẮT ĐẦU SAO?”\r\n', 88000, 'sach70.jpg', 33, '2024-11-25 16:50:44', 5, 38, 10),
(71, 'Spy X Family - Tập 7', 'Spy X Family - Tập 7.\r\nCuối cùng thì Twilight cũng tiếp xúc được với mục tiêu Desmond lần đầu tiên bằng cách xen vào cuộc gặp gỡ giữa hắn và cậu con trai thứ Damian!! Liệu thông qua cuộc trò chuyện, Twilight có tìm ra được bản chất của mục tiêu không thể dò xét tâm tư này hay không...!?\r\n', 25000, 'sach71.jpg', 15, '2024-11-25 16:50:44', 5, 39, 10),
(72, 'Spy X Family - Tập 1', 'Điệp viên tài ba “Twilight” vừa nhận lệnh phải xây dựng “gia đình” để trà trộn vào một học viện danh tiếng. Nhưng anh ta đã gặp phải một “cô con gái” có siêu năng lực đọc suy nghĩ! Còn “vợ” thì lại là một sát thủ!? Ai cũng có những bí mật cần che giấu trong cái gia đình tạm thời ấy, nhưng họ đã cùng nhau dự thi tuyển sinh và đứng lên chống lại thế giới đầy rẫy hiểm nguy trước mắt!! Một bộ truyện siêu cấp hài hước không thể bỏ qua!', 25000, 'sach72.jpg', 20, '2024-11-25 16:51:42', 5, 39, 10),
(73, 'Nàng Juliet Ở Trường Nội Trú - Tập 1', 'Tại học viện nội trú Dahlia - nơi học sinh của hai nước đối địch đang theo học, có một nam sinh lớp 10 đang quằn quại vì tình yêu không thể được đền đáp: thủ lĩnh kí túc xá đất nước Towa - Inuzuka Romio đang thầm thương trộm nhớ Juliet Persia - thủ lĩnh kí túc xá xứ West. Mọi chuyện bắt đầu từ lời tỏ tình của Inuzuka!!\r\nCâu chuyện tình yêu tuyệt đối không thể bại lộ KHAI MÀN!!!!!\r\n', 35000, 'sach73.jpg', 22, '2024-11-25 16:51:42', 5, 40, 10),
(74, 'Nàng Juliet Ở Trường Nội Trú - Tập 2', 'Inuzuka Romio và Juliet Persia đang hẹn hò, song vì xuất thân từ hai đất nước đối địch nên họ không thể công khai mối quan hệ dù học chung một trường. Nhưng tình hình đã có sự thay đổi nhờ Hasuki - người bạn thơ ấu đem lòng thương Inuzuka!\r\nCâu chuyện tình yêu tuyệt đối không thể bại lộ TĂNG TỐC!!!!\r\n', 35000, 'sach74.jpg', 44, '2024-11-25 16:52:57', 5, 40, 10),
(75, 'Frieren Pháp Sư Tiễn Táng - Tập 1', 'Sau khi đánh bại Quỷ vương, những người hùng đã sống ra sao? Là một yêu tinh nên cuộc sống của nàng pháp sư Frieren cũng khác so với 3 người bạn của mình, cô cảm nhận được điều gì trong thế giới ấy? Những người ở lại đã trải qua những gì trong chuyến đi để hoàn thành tâm nguyện của người đã khuất? Tất cả đều được bắt đầu từ “Hồi kết của cuộc phiêu lưu”, một câu chuyện hậu phiêu lưu về “lẽ sống” của những anh hùng!', 45000, 'sach75.jpg', 50, '2024-11-25 16:52:57', 5, 41, 10),
(76, 'Frieren Pháp Sư Tiễn Táng - Tập 12', 'Sau khi đánh bại Quỷ Vương, pháp sư yêu tinh Frieren của tổ đội anh hùng tiếp tục cuộc đời tưởng chừng như bất tận của mình. Vừa chạm tay vào bia đá Nữ thần, ý thức của cô đã ngược dòng thời gian về những ngày xưa cũ.\r\nHọ cũng rất trân trọng quá khứ, đồng thời gửi gắm nhiều kì vọng vào tương lai phải không? Mời các bạn đón đọc tác phẩm hậu phiêu lưu đưa chúng ta khám phá những “điều chưa biết” của các anh hùng!\r\n', 45000, 'sach76.jpg', 20, '2024-11-25 16:54:10', 5, 41, 10),
(77, 'Doraemon Truyện Dài - Tập 5: Nobita Và Chuyến Phiêu Lưu Vào Xứ Quỷ', 'Tập truyện “Nobita và chuyến phiêu lưu vào xứ quỷ” là nguyên tác của bộ phim hoạt hình cùng tên. Câu chuyện lấy bối cảnh là một thế giới phép thuật do Nobita tạo ra, thế giới này tồn tại song song với thế giới hiện thực. Tại đây, nhóm bạn Doraemon, Nobita đã chiến đấu anh dũng để cứu trái đất khỏi mối nguy hiểm cận kề. Chúng ta hãy bước vào thế giới phép thuật kì lạ này và phiêu lưu cùng nhóm bạn Doraemon nhé!', 22000, 'sach77.jpg', 40, '2024-11-25 16:54:10', 5, 42, 10),
(78, 'Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga - Tập 5', 'Sau lễ bế giảng, Masachika và Arya bắt đầu gọi nhau bằng tên. Trong lúc cả hai vẫn đang lúng túng và xấu hổ khi đối diện với nhau, chuyến tập huấn của Hội học sinh mà cả nhóm hằng mong đợi đã bắt đầu! Giờ đây, các thành viên Hội học sinh đang hết mình tận hưởng thanh xuân rực rỡ dưới pháo hoa của đêm hội mùa hè, bãi biển tư nhân và căn biệt thự sang trọng. Trước khung cảnh lãng mạn ở khu nghỉ dưỡng cùng cảm giác hưng phấn khác hẳn ngày thường, Arya nở nụ cười khiêu khích.', 95000, 'sach78.jpg', 20, '2024-11-25 16:55:17', 6, 43, 10),
(79, 'Thám Tử Đã Chết - Tập 1', 'Kimizuka Kimihiko, một học sinh bình thường, tuy vậy, bản thân lại mắc một thể chất đặc biệt luôn thu hút những rắc rối ập tới. Đi trên đường thì bị lôi kéo vào một đám đông phiền phức, đi vào trong hẻm thì bắt gặp cảnh giao dịch mờ ám, bản thân luôn vô tình tìm thấy hiện trường án mạng đầu tiên khiến cho cảnh sát gặp quen mặt phải nghi ngờ. Ngày hôm ấy, thể chất thu hút rắc rối kia tiếp tục hoành hành, khiến cậu không hiểu vì lý do gì lại ở trên một chuyến bay ra nước ngoài cùng một chiếc va ly khả nghi. Đấy cũng là thời điểm câu hỏi của người tiếp viên vang lên trong đầu cậu. Một tình huống nhạy cảm đã xảy ra trên chiếc máy bay này, khiến người tiếp viên cần cứu viện từ một thám tử...', 119000, 'sach79.jpg', 20, '2024-11-25 16:55:17', 6, 44, 14),
(80, 'Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 14.5', 'Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm. đã dành giải light novel hay nhất của bảng xếp hạng uy tín Kono light novel ga sugoi! trong 3 năm liên tiếp là 2014, 2015 và 2016. Bên cạnh đó, nam chính và nữ chính của series này là Hachiman và Yokin oshita cũng đoạt giải nam nữ chính được yêu thích nhất trong các năm đó. Họa sĩ minh họa Ponkan8 với những bức tranh minh họa đẹp và sinh động của mình cũng được bình chọn là họa sĩ minh họa được yêu thích nhất trong năm 2015.', 109000, 'sach80.jpg', 20, '2024-11-25 16:56:36', 6, 45, 14),
(81, 'Ma Pháp Thiếu Nữ - Tập 1', 'Một trò chơi trực tuyến với tên gọi “Dự án đào tạo ma pháp thiếu nữ” được tạo ra nhằm lựa chọn một số ít trong hàng chục người chơi để trở thành “ma pháp thiếu nữ”. Đó là những cô gái sở hữu khả năng phi thường về cả thể chất, ngoại hình cũng như sức mạnh ma thuật vô cùng đặc biệt. Endou Asari đã tạo ra một trận chiến hồi hộp và kỳ diệu, tác giả cũng là nhà văn giành được Giải thưởng lớn Kono Rano lần thứ hai và Giải thưởng Chiaki Kuriyama.', 159000, 'sach81.jpg', 15, '2024-11-25 16:56:36', 6, 46, 14),
(82, 'Hành Trình Của Elaina - Tập 15', 'Ngày xửa ngày xưa, có một cô phù thủy tên Elaina.\r\nCô đang viết nhật ký hành trình dọc theo chuyến du hành khắp thế giới bao la của mình.\r\nLần này, cô sẽ kể lại những câu chuyện mà cô từng ghi chép.\r\nTổng hợp 43 mẩu truyện, bao gồm các ngoại truyện chỉ có trong bản đặc biệt hoặc sự kiện theo mùa, cùng những câu chuyện được đăng tải online trên các trang mạng xã hội, đã được chỉnh lý và bổ sung thêm để tạo nên tuyển tập truyện ngắn hoàn chỉnh cho tập truyện đặc biệt này.\r\n', 125000, 'sach82.jpg', 20, '2024-11-25 16:57:50', 6, 47, 14),
(83, 'Phương Pháp \"Đào Tạo\" Nữ Chính Nhạt Nhòa – Tập 1', 'Câu chuyện “cảm động” này kể về hành trình cậu nam sinh otaku Aki Tomoya “đào tạo” một cô bạn nhạt nhòa thành nàng nữ chính chuẩn mực và lấy cô làm hình mẫu để sản xuất galgame. Trên hành trình ấy, Tomoya có sự giúp đỡ của hai “đồng nghiệp” cực kì có tiếng trong giới sáng tạo kiêm “nhị vị thánh nữ” (tưởng chừng) thập toàn thập mỹ của trường.', 110000, 'sach83.jpg', 30, '2024-11-25 16:57:50', 6, 48, 14),
(84, 'Date A Live - Tập 3', 'Ngày 5 tháng 6. Tai họa bất ngờ ập đến. \"Tôi là một Tinh Linh\", một cô gái chuyển đến lớp học mỉm cười và nói như vậy. Tinh Linh tồi tệ nhất giết người bằng chính đôi tay của mình - Kurumi. Ngoài ra, một cô gái tự nhận là em gái ruột của Shido đã xuất hiện!', 128000, 'sach84.jpg', 20, '2024-11-25 16:58:59', 6, 49, 15),
(85, 'Nữ Chính Sinh Tồn Mạnh Mẽ Trong Thế Giới Otome Game - Tập 1', 'Alicia là một cô bé mồ côi sống trong thế giới của kiếm và phép thuật – Ciel. Một ngày nọ, cô nhận ra bản thân mình chỉ là một “nữ chính trong Otome Game”. Ngay cả sự ra đi của cha mẹ cô cũng chỉ là một phần trong câu chuyện ấy.\r\nCho rằng sự thật này quá đỗi “nực cười”, Alicia đã dứt khoát chối bỏ vai trò nữ chính trong Otome Game của mình, tự xưng là nhà thám hiểm “Aria” và từng bước trưởng thành, hóa thân thành nàng “công chúa lọ lem tàn sát” thành thạo vô số loại vũ khí và tinh thông phép thuật!\r\n', 189000, 'sach85.jpg', 22, '2024-11-25 16:58:59', 6, 50, 4),
(86, 'Ngày Mai, Tôi Biến Mất, Cậu Sẽ Hồi Sinh - Tập 3', '“Ngày mai, tôi biến mất, cậu sẽ hồi sinh” là một câu chuyện tình lãng mạn được pha chế với những gia vị độc đáo, tạo nên cảm xúc thăng hoa và bất ngờ không giống với bất kỳ motif tiểu thuyết nào trước đấy. Người đọc có thể có được những phút giây thư giãn hài hước với những nội dung gần gũi, giản dị và tươi sáng nhưng cũng từ đấy mà những diễn biến éo le xảy ra ngay lập tức, khiến ta phải tự hỏi không biết liệu tác giả có đang đùa giỡn với mình không?', 109000, 'sach86.jpg', 15, '2024-11-25 17:00:07', 6, 51, 14),
(87, 'Dược Sư Tự Sự - Tập 2', 'Giữa những biến cố chồng chồng lớp lớp, Miêu Miêu phát hiện ra rằng mọi chuyện thực chất đều quy tụ về một mối. Sau tất cả ẩn chứa mưu đồ của một người. Rồi đúng vào thời điểm ấy, La Hán, tay võ quan lúc nào cũng bám nhằng nhẵng lấy Nhâm Thị bỗng nhiên xuất hiện. Gã đàn ông lập dị có tiếng này bắt đầu viện đủ lí do để kiếm chuyện với Nhâm Thị. Mục đích thật sự của La Hán rốt cuộc là gì?\r\nDƯỢC SƯ TỰ SỰ là series light-novel thể loại trinh thám vô cùng độc đáo lấy bối cảnh cung đình. Là một trong những bộ light-novel đình đám nhất trong những năm gần đây, series đã vượt mốc 13 triệu bản tại thị trường Nhật Bản và luôn thống trị bảng xếp hạng bán chạy mỗi khi ra tập mới!\r\n', 110000, 'sach87.jpg', 50, '2024-11-25 17:00:07', 6, 52, 10),
(88, 'Tinh Linh Huyễn Tưởng Ký - Tập 3', 'Sau cuộc chia tay ở ngôi đền của Dryas với người dân và những người bạn, người em tại ngôi làng tinh linh mà Rio vô cùng yêu mến, cậu chính thức lên đường đi tìm kiếm quê hương của cha mẹ mình. \r\nChỉ chưa đầy một tuần, Rio đã đặt chân đến vùng Yagumo. Tới nơi đây để cất mộ cho cha mẹ quá cố, nhưng Rio gần như chẳng có thông tin nào để xác định quê quán cụ thể của hai người.   \r\n', 148000, 'sach88.jpg', 10, '2024-11-25 17:01:20', 6, 53, 8),
(89, 'Vì Con Gái Tôi Có Thể Đánh Bại Cả Ma Vương - Tập 8', 'Và cuối cùng, ngày ấy đã đến. Vào một ngày trong xanh không một gợn mây tuyệt đẹp như thể được chọn lựa từ trước, Lều Cẩm miêu Vũ nghênh đón ngày mà họ mong đợi đã lâu.\r\nBên trong căn phòng dành cho khách được sắp xếp để làm phòng chờ cho cô dâu có đặt thêm một cái gương vốn bình thường không có. Đứng giữa tấm thảm mỏng Rita trải trên sàn là Latina trong bộ váy cưới cô đã đặt Chloe may cho.', 121000, 'sach89.jpg', 40, '2024-11-25 17:01:20', 6, 54, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tacgia`
--

CREATE TABLE `tacgia` (
  `matacgia` int(8) NOT NULL,
  `tentacgia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tacgia`
--

INSERT INTO `tacgia` (`matacgia`, `tentacgia`) VALUES
(1, 'Paulo Coelho'),
(2, 'Nguyễn Thị Bích Nga'),
(3, 'Marcus Sheridan'),
(4, 'Steve Pavlina'),
(5, 'Osamu Koshigaya'),
(6, 'Doãn Hằng'),
(7, 'Léa'),
(8, 'Cho Chang-In'),
(9, 'Mai Thanh Hạ'),
(10, 'Glendy Vanderah'),
(11, 'Saekisan'),
(12, 'Dolphin Press'),
(13, 'Harvard Business Review'),
(14, 'Maria Nemeth Ph.D'),
(15, 'Julian Dent'),
(16, 'Alex Goldfayn'),
(17, 'Edith Nesbit'),
(18, 'Nguyễn Trương Quý'),
(19, 'M. J. Ryan'),
(20, 'MacMillan Children\'s Books'),
(21, '1980 Edu'),
(22, 'Yumiko Fukuzawa'),
(23, 'Little Rainbow'),
(24, 'Brendan Kane'),
(25, 'Trịnh Minh Thảo'),
(26, 'Lâm Minh Chánh'),
(27, 'Trương Phú Thiện'),
(28, 'Don Failla'),
(29, 'Lão Mạc'),
(30, 'Robert T. Kiyosaki'),
(31, 'Og Mandino'),
(32, 'Peter Hollins'),
(33, 'Dale Carnegie'),
(34, 'Rick Hanson'),
(35, 'Robin Sharma'),
(36, 'Lee Hartley Carter'),
(37, 'Albert Uderzo'),
(38, 'Chugong'),
(39, 'Tatsuya Endo'),
(40, 'Yousuke Kaneda'),
(41, 'Kanehito Yamada'),
(42, 'Fujiko F Fujio'),
(43, 'Sunsunsun'),
(44, 'Nigozyu'),
(45, 'Wataru Watari'),
(46, 'Endou Asari'),
(47, 'Jougi Shiraishi'),
(48, 'Maruto Fumiaki'),
(49, 'Koushi Tachibana'),
(50, 'Harunohi Biyori'),
(51, 'Fujimaru'),
(52, 'Natsu Hyuuga'),
(53, 'Yuri Kitayama'),
(54, 'CHIROLU');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `mauser` int(8) NOT NULL,
  `tendangnhap` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `quyen` varchar(30) NOT NULL,
  `makhachhang` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`mauser`, `tendangnhap`, `password`, `quyen`, `makhachhang`) VALUES
(1, 'admin', 'admin', 'admin', 1),
(2, 'thanhphong', '111111', 'khachhang', 2),
(3, 'tulokho', '111111', 'khachhang', 3),
(4, 'binhbong123', '999999', 'khachhang', 4),
(5, 'thanhkhang', '123456', 'khachhang', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`machitiethoadon`),
  ADD KEY `masach` (`masach`),
  ADD KEY `mahoadon` (`mahoadon`);

--
-- Indexes for table `chude`
--
ALTER TABLE `chude`
  ADD PRIMARY KEY (`machude`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`mahoadon`),
  ADD KEY `makhachhang` (`makhachhang`),
  ADD KEY `maphuongthuc` (`maphuongthuc`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makhachhang`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manhanvien`),
  ADD KEY `mauser` (`mauser`);

--
-- Indexes for table `nhaxuatban`
--
ALTER TABLE `nhaxuatban`
  ADD PRIMARY KEY (`manhaxuatban`);

--
-- Indexes for table `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  ADD PRIMARY KEY (`maphuongthuc`);

--
-- Indexes for table `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`masach`),
  ADD KEY `FK_SACH_CHUDE` (`machude`),
  ADD KEY `matacgia` (`matacgia`),
  ADD KEY `manhaxuatban` (`manhaxuatban`);

--
-- Indexes for table `tacgia`
--
ALTER TABLE `tacgia`
  ADD PRIMARY KEY (`matacgia`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`mauser`),
  ADD KEY `FK_USER_KHACHHANG` (`makhachhang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `machitiethoadon` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `chude`
--
ALTER TABLE `chude`
  MODIFY `machude` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `mahoadon` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `makhachhang` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `manhanvien` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nhaxuatban`
--
ALTER TABLE `nhaxuatban`
  MODIFY `manhaxuatban` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  MODIFY `maphuongthuc` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sach`
--
ALTER TABLE `sach`
  MODIFY `masach` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `tacgia`
--
ALTER TABLE `tacgia`
  MODIFY `matacgia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `mauser` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`masach`) REFERENCES `sach` (`masach`),
  ADD CONSTRAINT `chitiethoadon_ibfk_3` FOREIGN KEY (`mahoadon`) REFERENCES `hoadon` (`mahoadon`);

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`maphuongthuc`) REFERENCES `phuongthucthanhtoan` (`maphuongthuc`);

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`mauser`) REFERENCES `user` (`mauser`);

--
-- Constraints for table `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `FK_SACH_CHUDE` FOREIGN KEY (`machude`) REFERENCES `chude` (`machude`),
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`matacgia`) REFERENCES `tacgia` (`matacgia`),
  ADD CONSTRAINT `sach_ibfk_2` FOREIGN KEY (`manhaxuatban`) REFERENCES `nhaxuatban` (`manhaxuatban`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_KHACHHANG` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
