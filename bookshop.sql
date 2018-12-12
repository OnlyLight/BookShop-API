-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 12, 2018 lúc 05:45 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `idgiohang` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idsach` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanxet`
--

CREATE TABLE `nhanxet` (
  `idnhanxet` int(11) NOT NULL,
  `hoten` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `tensach` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `nhanxet` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngayhientai` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhanxet`
--

INSERT INTO `nhanxet` (`idnhanxet`, `hoten`, `tensach`, `nhanxet`, `ngayhientai`) VALUES
(1, 'Quang Minh', 'Hóa Học 12', 'Sách môn Hóa học lớp 12 dành cho học sinh ban Nâng Cao.', '2018-11-12 23:45:22'),
(2, 'Quang Minh', 'Lịch Sử 12', 'Sách môn Lịch Sử lớp 12 dành cho học sinh ban Nâng Cao.', '2018-11-12 23:46:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'USER', '2018-12-08 15:42:54', '2018-12-08 15:42:54'),
(2, 'ADMIN', '2018-12-08 15:42:54', '2018-12-08 15:42:54'),
(3, 'PM', '2018-12-08 15:42:54', '2018-12-08 15:42:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `idsach` int(11) NOT NULL,
  `tensach` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `sotrang` int(11) DEFAULT NULL,
  `hinhanh` varchar(200) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `gia` int(11) DEFAULT NULL,
  `tennhacc` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `tacgia` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `nxb` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `namxuatban` int(11) DEFAULT NULL,
  `kichthuoc` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `hinhthuc` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ngonngu` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `tinhtrang` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `review` varchar(1000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `matheloai` int(11) DEFAULT NULL,
  `noibat` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`idsach`, `tensach`, `sotrang`, `hinhanh`, `gia`, `tennhacc`, `tacgia`, `nxb`, `namxuatban`, `kichthuoc`, `hinhthuc`, `ngonngu`, `tinhtrang`, `review`, `matheloai`, `noibat`) VALUES
(1, 'Hóa Học 12', 208, '../uploads/images/sachgiaokhoa/HH12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1'),
(2, 'Lịch Sử 12', 208, '../uploads/images/sachgiaokhoa/LS12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1'),
(3, 'Lịch Sử Nâng Cao 12', 208, '../uploads/images/sachgiaokhoa/LSNC12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1'),
(4, 'Ngữ Văn 12', 208, '../uploads/images/sachgiaokhoa/NV12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1'),
(5, 'Tiếng Anh 12', 208, '../uploads/images/sachgiaokhoa/TA12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1'),
(6, 'Giải Thích Ngữ Pháp Tiếng Anh', 540, '../uploads/images/sachhocngoaingu/giaithichnguphaptienganh.png', 87100, 'ZenBooks', '	Mai Lan Hương, Hà Thanh Uyên', 'NXB Đà Nẵng', 2018, '17 x 24', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung các chương được biên soạn dựa trên ngữ pháp tiiếng Anh hiện đại, giải thích cặn kẽ, rõ ràng các cách dùng và quy luật mà người học cần nắm vững: đồng thời chỉ ra những quy luật khác nhau giữa tiếng anh của người Anh (British English) và tiếng Anh của người Mỹ (American English).', 2, b'0'),
(7, 'Tập Viết Chữ Hàn', 540, '../uploads/images/sachhocngoaingu/tapvietchuhanthongdung.jpg', 87100, 'ZenBooks', '	Mai Lan Hương, Hà Thanh Uyên', 'NXB Đà Nẵng', 2018, '17 x 24', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Nội dung các chương được biên soạn dựa trên ngữ pháp tiiếng Hàn hiện đại', 2, b'0'),
(8, 'Tiếng Nhật Cho Mọi Người', 308, '../uploads/images/sachhocngoaingu/tiengnhatchomoinguoi.jpg', 120000, 'NXB Trẻ', 'Nhiều Tác Giả', 'NXB Trẻ', 2018, '19 x 26', 'Bìa Mềm', '	Sách tiếng Việt', 'còn hàng', 'Giáo trình dạy tiếng Nhật Minna no Nihongo bộ mới', 2, b'0'),
(9, 'Atlat Giải Phẩu Cơ Thể Người', 79, '../uploads/images/sachkhoahoc/atlasgiaiphaucothenguoi.jpg', 100000, '	Đinh Tị', '	Nhiều Tác Giả, Tuệ Văn', '	NXB Thế Giới', 2016, '	19 x 26.5', '	Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Thế Giới Những Điều Chưa Biết với những hình ảnh vẽ tay tinh tế đáng yêu sẽ mở ra cho bạn cả một thế giới kỳ diệu! Bộ sách với ngôn ngữ ngắn gọn mà súc tích sẽ cùng các bạn khám phá những điều còn ẩn giấu trong cơ thể con người, trên vũ trụ kỳ bí, dưới đại dương bao la, cả thế giới của thực vật, động vật cũng đều được hé mở trước mắt bạn; những bí ẩn của các công trình kiến trúc lừng danh thế giới, những vật dụng hằng ngày sẽ lần lượt được giải mã để từ đó giúp kích thích trí tưởng tượng, óc sáng tạo và khả năng làm khoa học của bạn.', 3, b'0'),
(10, 'Khi Loài Cá Biến Mất', 224, '../uploads/images/sachkhoahoc/khiloaicabienmat.jpg', 150000, 'AZ Việt Nam', '	Mark Kurlansky', 'NXB Thế Giới', 2016, '	16 X 24', '	Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'giới không còn cá thì sẽ như thế nào? Hầu hết những câu chuyện xoay quanh việc Trái Đất bị hủy diệt thường có nguyên nhân đến từ âm mưu độc ác của một kẻ phản diện nào đó, nhưng cuốn sách cực kì đáng đọc này lại kể một câu chuyện về “Trái Đất đang và sẽ bị phá hủy như thế nào bởi chính những con người lương thiện đang gặp thất bại trong việc giải quyết một vấn đề sống còn, chỉ đơn giản vì mọi tính toán của họ đều sai lầm.” Tất nhiên điều đó vẫn chưa xảy ra, nhưng nó cũng sẽ đến sớm, chỉ trong vòng 50 năm nữa, tất cả các loài cá sẽ bị tuyệt chủng nếu con người không thay đổi hành vi.', 3, b'0'),
(11, 'Lược Sử Vận Vật', 500, '../uploads/images/sachkhoahoc/luocsuvanvat.jpg', 250000, '	Alpha Books', '	Khương Duy', '	NXB Khoa Học Xã Hội', 2018, '	20.5 x 29', '	Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Lược sử vạn vật là cuốn sách phổ biến khoa học trình bày một cách ngắn gọn lịch sử nghiên cứu khoa học tự nhiên, những thành tựu khoa học trong các lĩnh vực khoa học tự nhiên chính: vật lý, hóa học, sinh học, địa chất, thiên văn... với nhiều tên tuổi, giai thoại và sự thật.', 3, b'0'),
(12, 'Lược Sử Thời Gian', 441, '../uploads/images/sachkhoahoc/luotsuthoigian.jpg', 150000, '	1980 Books', 'Richard Guare và Peg Dawson', '	NXB Lao Động', 2018, '	14 x 20.5', '	Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Bộ đôi tác giả Richard Guare và Peg Dawson tiếp tục khiến người đọc phải nhanh chóng lật giở từng trang sách để tìm ra những cách thức khoa học và dễ thực hiện nhất để thay đổi thói quen tư duy và hành động. Bằng cách thấu hiểu và rèn luyện kỹ năng điều hành – yếu tố nội lực có sẵn của mình, bạn không chỉ sắp xếp được tốt hơn thời gian biểu, cân bằng công việc với cuộc sống riêng tư mà còn cải thiện được trí nhớ một cách rõ rệt.', 3, b'0'),
(13, 'Câu Chuyện Bên Nồi Lẫu', 208, '../uploads/images/sachtiengviet/cauchuyenbennoilau.jpg', 63000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(14, 'Chúng Ta Đâu Chỉ Sống Cho Riêng Mình', 208, '../uploads/images/sachtiengviet/chungtadauchisongchoriengminh.jpg', 82000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(15, 'Cứ Bình Tĩnh', 208, '../uploads/images/sachtiengviet/cubinhtinh.jpg', 82000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(16, 'Đàn Ông +', 208, '../uploads/images/sachtiengviet/danong.jpg', 86000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(17, 'Lớn Lên Sẽ Khác', 208, '../uploads/images/sachtiengviet/lonlensekhac.jpg', 89000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(18, 'Mẹ - Em Bé Và Bố', 208, '../uploads/images/sachtiengviet/me-embevabo.jpg', 89000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(19, 'Nhà', 208, '../uploads/images/sachtiengviet/nha.jpg', 109000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(20, 'Nước Nhật Nhìn Từ Những Thứ Bình Thường', 208, '../uploads/images/sachtiengviet/nuocnhatnhintunhungthubinhthuong.jpg', 76000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0'),
(21, 'Yêu Sao Để Không Đau', 208, '../uploads/images/sachtiengviet/yeusaodekhongdau.jpg', 86000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'còn hàng', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloaisach`
--

CREATE TABLE `theloaisach` (
  `matheloai` int(11) NOT NULL,
  `tentheloai` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `theloaisach`
--

INSERT INTO `theloaisach` (`matheloai`, `tentheloai`) VALUES
(1, 'sách giáo khoa'),
(2, 'sách học ngoại ngữ'),
(3, 'sách khoa học'),
(4, 'sách kinh tế'),
(7, 'sách nuôi dạy con'),
(8, 'sách tham khảo'),
(9, 'sách thiếu nhi'),
(11, 'từ điển'),
(12, 'văn học'),
(13, 'Sách Tiếng Việt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `gender`, `createdAt`, `updatedAt`) VALUES
(1, 'Adam', 'adam123', 'adam123@gmail.com', '$2a$08$NTFJ67FwXzXq/oR77G37SuO21fUeOaAFtnGet1871T82C4jExppJi', 0, '2018-12-08 15:48:49', '2018-12-08 15:48:49'),
(2, 'Sunny', 'sunny123', 'sunny123@gmail.com', '$2a$08$gr.Yf3fjpVcrEm4Ly8drsOugq8LzRffi5xnLcbYjpVhVsgniZADdq', 1, '2018-12-09 13:33:58', '2018-12-09 13:33:58'),
(3, 'John', 'john123', 'john123@gmail.com', '$2a$08$YZe2smyUgfihXF0711JOYOtM4h.fvXtcZBwdxQ3yGEWz2VEmQt6sG', 0, '2018-12-09 13:36:04', '2018-12-09 13:36:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('2018-12-08 15:48:50', '2018-12-08 15:48:50', 1, 1),
('2018-12-09 13:36:04', '2018-12-09 13:36:04', 2, 3),
('2018-12-09 13:33:59', '2018-12-09 13:33:59', 3, 2),
('2018-12-09 13:36:04', '2018-12-09 13:36:04', 3, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`idgiohang`);

--
-- Chỉ mục cho bảng `nhanxet`
--
ALTER TABLE `nhanxet`
  ADD PRIMARY KEY (`idnhanxet`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`idsach`),
  ADD KEY `fk_sachnhanxet` (`tensach`);

--
-- Chỉ mục cho bảng `theloaisach`
--
ALTER TABLE `theloaisach`
  ADD PRIMARY KEY (`matheloai`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `idgiohang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanxet`
--
ALTER TABLE `nhanxet`
  MODIFY `idnhanxet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `idsach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `theloaisach`
--
ALTER TABLE `theloaisach`
  MODIFY `matheloai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
