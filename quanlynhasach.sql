-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 11:31 AM
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
(2, 'Nguyễn Thanh Phong', 'phong147@gmail.com', 'Nha Trang, Khánh Hòa', '0384454821', '2003-09-27'),
(3, 'Ngô Nguyễn Anh Tú', 'tulokho@gmail.com', 'Nha Trang, Khánh Hòa', '0386112334', '2003-10-16'),
(4, 'Nguyễn Văn Bình', 'binhbinh12@gmail.com', 'Thành phố Hồ Chí Minh', '0905946933', '2004-06-15'),
(6, 'Nguyễn Thanh Khang', 'thanhkhang@gmail.com', 'Nha Trang, Khánh Hòa', '0345678910', '2004-03-03');

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
  `matacgia` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`masach`, `tensach`, `mota`, `giasach`, `anhbia`, `soluongton`, `ngaycapnhat`, `machude`, `matacgia`) VALUES
(1, 'Nhà Giả Kim', 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.', 48000, 'sach1.jpg', 19, '2024-11-24 15:37:16', 1, 1),
(2, 'Chuyện Cổ Tích Của Vườn', '“Ngày xửa ngày xưa, vào năm một ngàn chín trăm xưa lắm lận, có một bà Tiên sống ẩn dật trong một khu vườn nhỏ ở miền Đông Nam Bộ của nước Việt Nam. Chỉ với một cây đũa thần mầu nhiệm, bà Tiên đã giúp cho muôn loài muôn vật trong khu vườn nhỏ biết hát ca tiếng Người. Nhờ vậy mà rất nhiều câu Chuyện cổ tích của vườn (phần Một, 1993) được kể ra và được các độc giả nhí yêu quý đón nhận.\r\nTrong cuốn sách này, chuyện cổ tích của vườn sẽ được kể tại miền Đông Nam (nhưng không phải ở miền Đông Nam Bộ của nước Việt Nam) của nước Mỹ. Nhưng dù được kể tại một nơi cách xa Việt Nam đến nửa vòng trái đất, chuyện cổ tích muôn đời vẫn là chuyện cổ tích.”', 85000, 'sach2.jpg', 10, '2024-11-24 15:37:16', 2, 2),
(3, 'Visual Marketing', 'Hơn 1 tỉ giờ đồng hồ video được xem mỗi ngày trên YouTube, và bạn bắt đầu đánh giá cao việc video đã ăn sâu vào cuộc sống hằng ngày của chúng ta như thế nào. Và mặc dù việc dựng và đăng video từ lâu đã trở thành một đề xuất tốn kém cho hầu hết các doanh nghiệp, giờ đây, chúng ta mang theo máy quay có độ phân giải cao ngay trong túi mình cùng với nhiều dịch vụ lưu trữ video miễn phí dành cho doanh nghiệp. Cơ hội ngay trước mắt bạn bây giờ chính là tận dụng sức mạnh của video trong doanh nghiệp của mình để thu hút nhiều khách hàng tiềm năng hơn, chiếm được lòng tin của họ và đem lại trải nghiệm đặc biệt cho khách hàng, doanh nghiệp hay người tiêu dùng.', 195000, 'sach3.jpg', 18, '2024-11-24 12:34:27', 3, 3),
(4, '7 Nguyên Tắc Phát Triển Bản Thân Của Người Thông Minh', 'Trong cung cách đối đãi giữa người với người, chúng ta vẫn thường đặt ra các nguyên tắc ứng xử và áp dụng chúng. Tuy nhiên, khi đối đãi với bản thân, chúng ta lại thường bỏ qua bộ nguyên tắc để áp dụng với chính mình. “7 nguyên tắc phát triển bản thân của người thông minh” là cẩm nang quan trọng giúp định hình xu hướng phát triển, nhằm tối ưu hoá năng lực nội tại và phát huy triệt để thế mạnh bản thân, từ đó phá vỡ vỏ kén kiên cố để thoát khỏi vùng an toàn.', 109000, 'sach4.jpg', 19, '2024-11-24 12:35:08', 4, 4),
(5, 'Chuyến Tàu Ánh Sáng', 'Trên một chuyến tàu, với ai đó, hôm nay là một ngày vô cùng quý giá: với học sinh tiểu học đang lo lắng về bài vở và chuyện tình cảm, với người bà đã mất chồng, với đôi vợ chồng người Ba Lan đến thăm Nhật Bản, với nghệ sĩ kể chuyện hài nổi tiếng, với giám đốc chi nhánh của công ty bảo hiểm nhân thọ đang trên đường về quê, hay với người hâm mộ cuồng nhiệt của đội bóng chày Hanshin Tigers,...', 149000, 'sach5.jpg', 13, '2024-11-24 17:13:58', 1, 5),
(6, 'Về Nhà Ăn Bát Cháo Hành\r\n', '“Tuần nào về nhà, mẹ cũng gói ghém rau, cá, thịt thà cho mình mang ra nấu ăn. Mẹ để dành phần ngon nhất đợi khi nào mình về thì nấu những món mình thích. Đều đặn mỗi tuần ba sẽ kiểm tra lốp xe có mềm không rồi bơm hơi cho mình. Ba sẽ nhắc chừng chuyện áo mưa, treo cho ráo rồi dặn mẹ xếp lại để nhắc mình bỏ cốp xe kẻo quên.', 105000, 'sach6.jpg', 40, '2024-11-15 09:54:46', 1, 6),
(7, 'Cánh Chim Bị Thương', 'Cuốn sách kể về hành trình của Vy – một người phụ nữ bình thường đang sống những ngày tháng tươi đẹp tại Paris cùng chồng và con gái, được chẩn đoán mắc bệnh ung thư vú khi vừa bước qua tuổi 40. Cuộc sống tưởng chừng được lập trình một cách tuần tự của cô cứ thế mà chao đảo, ngả nghiêng và dường như chìm sâu vào vùng tăm tối. Vy buộc phải đứng trước những thách thức về danh tính, mặc cảm về sự “không toàn vẹn” khi một phần thuộc về cơ thể của cô – giờ đây đã không còn.', 119000, 'sach7.jpg', 48, '2024-11-24 13:04:55', 1, 7),
(8, 'Người Gác Hải Đăng', '\"Người Gác Hải Đăng\" của Cho Chang-in là hành trình của một tâm hồn sâu lắng, đầy cô đơn, được thắp sáng bởi ngọn đèn hải đăng giữa biển khơi mênh mông.', 145000, 'sach8.jpg', 30, '2024-11-15 10:08:32', 1, 8),
(9, 'Vừa Vặn Hạnh Phúc, Vừa Vặn Bình Yên', 'Cố gắng để đạt đến những đỉnh cao thì thật ấn tượng, nhưng biết hài lòng với những thứ vừa vặn sức mình thì cũng là hạnh phúc.\r\nCàng trưởng thành, chúng ta càng nhận ra bài học khó khăn vốn dĩ không phải là kiếm thật nhiều tiền, có thật nhiều thành tích, mà là làm sao để kiếm tiền đủ cho mình mà không làm hại đến ai, không phải thấp thỏm bất an lo được lo mất;...', 99000, 'sach9.jpg', 50, '2024-11-15 10:10:14', 1, 9),
(10, 'Những Cung Đường Dưới Bầu Trời Sao', 'Sau cái chết của người dì yêu quý và mẹ mình, cô bé Riley Mays chuyển đến vùng quê Wisconsin để sống cùng vợ chồng anh chị họ Alec - Sachi. Ban đầu, Riley thu mình và bị ám ảnh bởi cái chết của người thân yêu nhất trên đời. Mười năm sau, với những nỗ lực của vợ chồng chị Sachi, Riley dần tìm thấy khoảng bình yên trong tâm hồn khi được những phép màu của thiên nhiên xoa dịu.', 219000, 'sach10.jpg', 20, '2024-11-15 10:10:14', 1, 10),
(11, 'Thiên Sứ Nhà Bên - Tập 8.5', '“Mình muốn tạo ra thật nhiều kỉ niệm.”\r\nTừ cuộc gặp gỡ tình cờ, Fujimiya Amane - một học sinh trung học đang sống tự lập và khá cẩu thả, đã bắt đầu kết thân cùng Shiina Mahiru - cô gái xinh đẹp nhất trường với biệt danh thiên sứ.\r\nKhông biết từ lúc nào, đôi bên dần bị thu hút và trở thành người không thể thay thế trong tim đối phương.', 95000, 'sach11.jpg', 20, '2024-11-15 10:16:48', 6, 11),
(12, 'Chơi Mà Học - My Red', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach12.jpg', 50, '2024-11-15 10:16:48', 2, 12),
(13, 'Ra Quyết Định Dựa Trên Phân Tích Dữ Liệu', 'Ra Quyết Định Dựa Trên Phân Tích Dữ Liệu cung cấp kiến thức về việc sử dụng phân tích chiến lược trong kinh doanh nhằm hỗ trợ ra quyết định, cải thiện hiệu suất và thúc đẩy sự phát triển bền vững. Cuốn sách giới thiệu các khái niệm cơ bản về phân tích dữ liệu và tầm quan trọng của phân tích trong kinh doanh hiện đại.', 139000, 'sach13.jpg', 44, '2024-11-15 10:23:51', 3, 13),
(14, 'Tâm Thức Tài Chính', 'Từ xưa đến nay, “Tiền” là một chủ đề chẳng mấy dễ chịu để thảo luận hay chia sẻ. Trong các buổi họp mặt gia đình, họp mặt bạn bè hay các buổi hẹn hò, hầu hét mọi người thường có xu hướng lảng tránh những câu hỏi liên quan đến thu nhập, chi tiêu và giá cả của các món đồ mình có.', 229000, 'sach14.jpg', 30, '2024-11-15 10:23:51', 3, 14),
(15, 'Tạo Kênh Bán Hàng Và Marketing', 'Tạo Kênh Bán Hàng Và Marketing – bộ công cụ thiết yếu giúp bạn lập chiến lược cho những đường dẫn đến thị trường mới và hiện có. Qua sách này, bạn đọc sẽ biết cách phân tích, lên kế hoạch và quản lý các kênh tạo lợi nhuận với khuôn khổ kinh tế hiện nay, đảm bảo tận dụng tối đa các đối tác kênh ở mọi giai đoạn trong quá trình tiếp cận thị trường.', 198000, 'sach15.jpg', 33, '2024-11-15 10:25:48', 3, 15),
(16, 'Tâm Lý Học Tích Cực Trong Bán Hàng', 'Sợ hãi khiến hầu hết nhân viên bán hàng không thích nhấc điện thoại gọi cho khách hàng.\r\nSợ hãi là lý do chúng ta không đề nghị làm ăn nhiều hơn, không chào thêm các sản phẩm và dịch vụ khác, mặc dù khách hàng muốn mua của chúng ta.\r\n', 150000, 'sach16.jpg', 22, '2024-11-15 10:25:48', 3, 16),
(17, 'Bản Thảo Tìm Thấy Tại Accra', 'Vào một đêm năm 1099, Jerusalem đang đứng trước cuộc vây hãm của quân Thập tự chinh, trong sự tuyệt vọng và hỗn loạn, những con người từ mọi lứa tuổi và đức tin đã quy tụ để lắng nghe lời thông thái từ một người đàn ông Hy Lạp được biết đến với cái tên, Copt.\r\nThay vì sợ hãi một tương lai khó tránh, với Copt, quan trọng là phải giữ cho tri thức không bị sụp đổ chung với bức tường thành. Nhưng tri thức là gì? Đó là nhận thức về Tình yêu, về Hiến dâng, về Tinh thần, về sự sống và cái chết, về cuộc phiêu lưu của phận người trên Trái đất này. ', 96000, 'sach17.jpg', 20, '2024-11-24 10:30:05', 1, 1),
(18, 'Hippie Những Kẻ Lãng Du', 'Hippie – Những kẻ lãng du đưa ta đến với những con người hoàn toàn xa lạ, với những mục đích khác nhau nhưng cùng hướng đến vùng đất xa xôi Nepal trên con đường mòn hippie huyền thoại. Trong hành trình đó, chàng trai Brazil tên Paulo gầy gò có chòm râu dê và mái tóc dài bồng bềnh, mơ ước trở thành nhà văn đã gặp gỡ Karla, cô gái Hà Lan ở độ tuổi đôi mươi đang tìm kiếm bạn đồng hành cho chuyến đi.\r\nSau khi gặp nhau ở Amsterdam, cô thuyết phục Paulo cùng cô lên chiếc Xe buýt Diệu kỳ đi từ Amsterdam đến Istanbul và qua Trung Á đến Kathmandu.', 150000, 'sach18.jpg', 30, '2024-11-24 10:30:05', 1, 1),
(19, 'Chơi Mà Học - My Pink', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach19.jpg', 30, '2024-11-24 10:35:10', 2, 12),
(20, 'Chơi Mà Học - My Purple', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach20.jpg', 22, '2024-11-24 10:35:10', 2, 12),
(21, 'Chơi Mà Học - My Yellow', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach21.jpg', 44, '2024-11-24 10:36:48', 2, 12),
(22, 'Chơi Mà Học - My Blue', 'Với các bé trong độ tuổi từ  2 – 5 tuổi, trí tưởng tượng của bé rất phong phú. Trẻ trong độ tuổi này ham thích những trò chơi giàu hình ảnh, nhiều màu sắc. Nắm bắt tâm lý đó, đội ngũ biên tập bộ sách này đã tạo ra những sân chơi thú vị với 5 màu sắc sống động cho trẻ khám phá. Bao gồm: Đỏ, Vàng, Xanh, Hồng, Tím.\r\nTrong mỗi đầu sách đều tập hợp nhiều hoạt động thông qua các hình ảnh vui nhộn, sáng tạo để trẻ có thể tư duy như: nhìn hình - tìm bóng; so sánh nhỏ - lớn; nhận biết, phân biệt đặc trưng cơ bản của các vật thể xung quanh. Ví dụ, trẻ sẽ phải tìm ra động vật sống dưới nước, động vật sống trên cạn… rồi tô màu cho chúng.', 20000, 'sach22.jpg', 11, '2024-11-24 10:36:48', 2, 12),
(23, 'Lâu Đài Thần Bí', 'Lâu đài thần bí là một trong những tác phẩm xuất sắc nhất của tác giả Edith Nesbit. Câu chuyện kể về ba anh em Gerald, Kathleen và Jimmy. Để khiến kỳ nghỉ hè bớt nhàm chán, những đứa trẻ đã quyết định dạo chơi trong khu rừng gần nhà. Họ giả vờ như đang tham gia vào một cuộc phiêu lưu kỳ thú, háo hức chờ đợi những sự kiện lạ lùng ở phía trước.', 119000, 'sach23.jpg', 33, '2024-11-24 10:45:16', 1, 17),
(24, 'Lũ Trẻ Đường Tàu', 'Lũ trẻ đường tàu là một trong những tác phẩm kinh điển cho những ai đã và đang là thiếu nhi. Cuốn sách kể về ba đứa trẻ tinh nghịch, trong trẻo, đầy màu sắc của ngôi nhà Ba Ống Khói cùng những tháng ngày sống gần bên đường tàu. Tuy thỉnh thoảng có cãi nhau như các chị em trong bao gia đình khác, nhưng cả ba đứa trẻ đều rất hiếu thảo, yêu thương và biết nghĩ cho nhau.\r\nTại vùng quê yên bình gần bên đường tàu, những đứa trẻ của ngôi nhà Ba Ống Khói đã có những “phi vụ” để đời, những hành động nhân văn, đầy dũng cảm và những tháng ngày vui sống rất đỗi bình dị đời thường. Song ẩn sâu trong sự bình dị ấy lại là một câu chuyện về lòng can đảm, không ngừng cố gắng vươn lên của con người.', 129000, 'sach24.jpg', 20, '2024-11-24 10:45:16', 1, 17),
(25, 'Hà Nội Là Hà Nội', 'Cuốn sách này là cuốn thứ ba trong bộ ba sách về Hà Nội của tác giả Nguyễn Trương Quý. Cuốn đầu – Tự nhiên như người Hà Nội – là những quan sát và tìm hiểu về hình thái đô thị, làm rõ đặc trưng không gian rất đặc biệt của Hà Nội. Cuốn thứ hai – Ăn phở rất khó thấy ngon – là chân dung về con người trong thành phố ấy, đặc biệt tập trung vào lối sống của giới viên chức văn phòng, mang những nét hài hước.\r\nCuốn sách này, như tên gọi của nó, Hà Nội là Hà Nội, là cuộc tìm kiếm những giá trị văn hóa ở một thành phố tưởng như đã định hình nét văn hóa mà vẫn liên tục phải gọt giũa.', 95000, 'sach25.jpg', 15, '2024-11-24 10:49:09', 1, 18),
(26, 'Tự Nhiên Như Người Hà Nội', '“Không ngơi nghỉ, không phút nào như phút nào, ngày hôm nay Hà Nội sống hối hả, như cuống quýt giành lại những năm tháng chậm chạp đã qua.\"\r\nCuốn sách này giới thiệu với bạn đọc những nét đặc trưng về Hà Nội với những nội dung như: Phố cổ, Hồ Gươm.. trong không gian Hà Nội; Hà Nội: Văn hoá công viên; Hà Nội: Chợ trong chợ; Hà Nội nhìn từ các đô thị vệ tinh vùng Bắc Bộ; Tự nhiên như người Hà Nội; Giới trẻ Hà Nội và vòng vây giải trí...', 85000, 'sach26.jpg', 10, '2024-11-24 10:50:50', 1, 18),
(27, 'Ăn Phở Rất Khó Thấy Ngon', 'Ăn phở rất khó thấy ngon là tập tản văn của Nguyễn Trương Quý tác giả cuốn Tự nhiên như người Hà Nội đã xuất bản năm 2004… Mọi người vẫn nghĩ những người đi làm công sở là một khối người không có nhiều biến động, chừng ấy mong muốn, chừng ấy nhu cầu và chừng ấy hành động. Bề ngoài là như vậy, song với bản tính đa sự của mình, những dân văn phòng này lại phức tạp về chuyện nghĩ ngợi nhất trong xã hội. 26 bài viết của tập sách đề cập và xoay quanh các vấn đề cuộc sống văn phòng được thể hiện bằng giọng văn vừa thâm sâu vừa dí dỏm lột tả gần như hết sự thật ở cái nơi mà người ta chỉ dùng một từ dành cho nó “chán”.', 85000, 'sach27.jpg', 40, '2024-11-24 10:50:50', 1, 18),
(28, 'Sức Hút Của Sự Tự Tin', '“Tôi bị làm sao ấy.”\r\n“Tôi sợ nếu bộc lộ con người thật của mình, họ sẽ không yêu thương tôi nữa.”\r\nChúng ta không tin tưởng vào khả năng ứng phó với cuộc sống của mình, vậy nên chúng ta luôn ở trong trạng thái sợ hãi và lo lắng. Hay chúng ta vẫn luôn sống theo chủ nghĩa hoàn hảo, để rồi rơi vào hoảng loạn mỗi khi chúng ta (hoặc người khác) mắc lỗi.\r\nChúng ta ôm đồm quá nhiều thứ chỉ vì không tin tưởng vào phán đoán của chính mình về việc nên làm những gì, hoặc chúng ta sợ nói “Không” sẽ làm mất lòng người khác.\r\nChúng ta không tin mình sẽ đưa ra lựa chọn đúng đắn, nên dù đã tiêu tốn rất nhiều thời gian và công sức để đưa ra quyết định, chúng ta vẫn hoài nghi về quyết định đó.', 109000, 'sach28.jpg', 20, '2024-11-24 11:07:22', 4, 19),
(29, 'Sức Mạnh Của Lòng Kiên Nhẫn', 'Sức Mạnh Của Lòng Kiên Nhẫn của M. J. Ryan sẽ mang đến giải pháp cho những vấn đề trên. Là tác giả của những cuốn sách nổi tiếng như: The Happiness Makeover (Hạnh phúc không khó tìm), Random Acts of Kindness (Cách hành xử hào hiệp và vị tha) và Attitude of Gratitude (Thái độ biết ơn), Ryan nhận thấy rằng những đức tính cao đẹp muôn thuở luôn có sức mạnh đem lại ánh sáng và tình yêu cho cuộc đời chúng ta.\r\n', 88000, 'sach29.jpg', 15, '2024-11-24 11:07:22', 4, 19);

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
(19, 'M. J. Ryan');

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
(2, 'thanhphong', '123456', 'khachhang', 2),
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
  ADD KEY `matacgia` (`matacgia`);

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
-- AUTO_INCREMENT for table `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  MODIFY `maphuongthuc` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sach`
--
ALTER TABLE `sach`
  MODIFY `masach` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tacgia`
--
ALTER TABLE `tacgia`
  MODIFY `matacgia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- Constraints for table `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `FK_SACH_CHUDE` FOREIGN KEY (`machude`) REFERENCES `chude` (`machude`),
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`matacgia`) REFERENCES `tacgia` (`matacgia`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_KHACHHANG` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
