-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2019 lúc 03:54 PM
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
  `id` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `idsach` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `pay` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `soluong`, `idsach`, `idUser`, `pay`) VALUES
(1, 3, 1, 1, b'0'),
(2, 2, 2, 1, b'0'),
(3, 1, 9, 1, b'0'),
(4, 1, 30, 4, b'1'),
(5, 2, 11, 4, b'1'),
(6, 5, 42, 8, b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanxet`
--

CREATE TABLE `nhanxet` (
  `idnhanxet` int(11) NOT NULL,
  `nhanxet` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngayhientai` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idSach` int(11) DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhanxet`
--

INSERT INTO `nhanxet` (`idnhanxet`, `nhanxet`, `ngayhientai`, `idSach`, `idUser`) VALUES
(2, 'Sách môn Lịch Sử lớp 12 dành cho học sinh ban Nâng Cao.', '2018-11-12 23:46:29', 2, 4),
(10, 'Good Book !!', '2018-12-25 22:18:32', 13, 3),
(11, 'Good Book !!', '2018-12-25 22:19:01', 14, 1),
(14, 'Awesome !!', '2018-12-28 00:04:46', 8, 4);

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
(2, 'ADMIN', '2018-12-08 15:42:54', '2018-12-08 15:42:54');

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
  `review` varchar(1000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `matheloai` int(11) DEFAULT NULL,
  `noibat` bit(1) DEFAULT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`idsach`, `tensach`, `sotrang`, `hinhanh`, `gia`, `tennhacc`, `tacgia`, `nxb`, `namxuatban`, `kichthuoc`, `hinhthuc`, `ngonngu`, `review`, `matheloai`, `noibat`, `soluong`) VALUES
(1, 'Hóa Học 12', 208, 'uploads/images/sachgiaokhoa/HH12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1', 100),
(2, 'Lịch Sử 12', 208, 'uploads/images/sachgiaokhoa/LS12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1', 100),
(3, 'Lịch Sử Nâng Cao 12', 208, 'uploads/images/sachgiaokhoa/LSNC12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1', 100),
(4, 'Ngữ Văn 12', 208, 'uploads/images/sachgiaokhoa/NV12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1', 100),
(5, 'Tiếng Anh 12', 208, 'uploads/images/sachgiaokhoa/TA12.clsbi', 600000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '	20.5 x 29', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 1, b'1', 100),
(6, 'Giải Thích Ngữ Pháp Tiếng Anh', 540, 'uploads/images/sachhocngoaingu/giaithichnguphaptienganh.png', 87100, 'ZenBooks', '	Mai Lan Hương, Hà Thanh Uyên', 'NXB Đà Nẵng', 2018, '17 x 24', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung các chương được biên soạn dựa trên ngữ pháp tiiếng Anh hiện đại, giải thích cặn kẽ, rõ ràng các cách dùng và quy luật mà người học cần nắm vững: đồng thời chỉ ra những quy luật khác nhau giữa tiếng anh của người Anh (British English) và tiếng Anh của người Mỹ (American English).', 2, b'0', 100),
(7, 'Tập Viết Chữ Hàn', 540, 'uploads/images/sachhocngoaingu/tapvietchuhanthongdung.jpg', 87100, 'ZenBooks', '	Mai Lan Hương, Hà Thanh Uyên', 'NXB Đà Nẵng', 2018, '17 x 24', 'Bìa Mềm', '	Sách tiếng Việt', 'Nội dung các chương được biên soạn dựa trên ngữ pháp tiiếng Hàn hiện đại', 2, b'0', 100),
(8, 'Tiếng Nhật Cho Mọi Người', 308, 'uploads/images/sachhocngoaingu/tiengnhatchomoinguoi.jpg', 120000, 'NXB Trẻ', 'Nhiều Tác Giả', 'NXB Trẻ', 2018, '19 x 26', 'Bìa Mềm', '	Sách tiếng Việt', 'Giáo trình dạy tiếng Nhật Minna no Nihongo bộ mới', 2, b'0', 100),
(9, 'Atlat Giải Phẩu Cơ Thể Người', 79, 'uploads/images/sachkhoahoc/atlasgiaiphaucothenguoi.jpg', 100000, '	Đinh Tị', '	Nhiều Tác Giả, Tuệ Văn', '	NXB Thế Giới', 2016, '	19 x 26.5', '	Bìa Mềm', 'Sách tiếng Việt', 'Thế Giới Những Điều Chưa Biết với những hình ảnh vẽ tay tinh tế đáng yêu sẽ mở ra cho bạn cả một thế giới kỳ diệu! Bộ sách với ngôn ngữ ngắn gọn mà súc tích sẽ cùng các bạn khám phá những điều còn ẩn giấu trong cơ thể con người, trên vũ trụ kỳ bí, dưới đại dương bao la, cả thế giới của thực vật, động vật cũng đều được hé mở trước mắt bạn; những bí ẩn của các công trình kiến trúc lừng danh thế giới, những vật dụng hằng ngày sẽ lần lượt được giải mã để từ đó giúp kích thích trí tưởng tượng, óc sáng tạo và khả năng làm khoa học của bạn.', 3, b'0', 100),
(10, 'Khi Loài Cá Biến Mất', 224, 'uploads/images/sachkhoahoc/khiloaicabienmat.jpg', 150000, 'AZ Việt Nam', '	Mark Kurlansky', 'NXB Thế Giới', 2016, '	16 X 24', '	Bìa Mềm', 'Sách tiếng Việt', 'giới không còn cá thì sẽ như thế nào? Hầu hết những câu chuyện xoay quanh việc Trái Đất bị hủy diệt thường có nguyên nhân đến từ âm mưu độc ác của một kẻ phản diện nào đó, nhưng cuốn sách cực kì đáng đọc này lại kể một câu chuyện về “Trái Đất đang và sẽ bị phá hủy như thế nào bởi chính những con người lương thiện đang gặp thất bại trong việc giải quyết một vấn đề sống còn, chỉ đơn giản vì mọi tính toán của họ đều sai lầm.” Tất nhiên điều đó vẫn chưa xảy ra, nhưng nó cũng sẽ đến sớm, chỉ trong vòng 50 năm nữa, tất cả các loài cá sẽ bị tuyệt chủng nếu con người không thay đổi hành vi.', 3, b'0', 100),
(11, 'Lược Sử Vận Vật', 500, 'uploads/images/sachkhoahoc/luocsuvanvat.jpg', 250000, '	Alpha Books', '	Khương Duy', '	NXB Khoa Học Xã Hội', 2018, '	20.5 x 29', '	Bìa Mềm', 'Sách tiếng Việt', 'Lược sử vạn vật là cuốn sách phổ biến khoa học trình bày một cách ngắn gọn lịch sử nghiên cứu khoa học tự nhiên, những thành tựu khoa học trong các lĩnh vực khoa học tự nhiên chính: vật lý, hóa học, sinh học, địa chất, thiên văn... với nhiều tên tuổi, giai thoại và sự thật.', 3, b'0', 100),
(12, 'Lược Sử Thời Gian', 441, 'uploads/images/sachkhoahoc/luotsuthoigian.jpg', 150000, '	1980 Books', 'Richard Guare và Peg Dawson', '	NXB Lao Động', 2018, '	14 x 20.5', '	Bìa Mềm', 'Sách tiếng Việt', 'Bộ đôi tác giả Richard Guare và Peg Dawson tiếp tục khiến người đọc phải nhanh chóng lật giở từng trang sách để tìm ra những cách thức khoa học và dễ thực hiện nhất để thay đổi thói quen tư duy và hành động. Bằng cách thấu hiểu và rèn luyện kỹ năng điều hành – yếu tố nội lực có sẵn của mình, bạn không chỉ sắp xếp được tốt hơn thời gian biểu, cân bằng công việc với cuộc sống riêng tư mà còn cải thiện được trí nhớ một cách rõ rệt.', 3, b'0', 100),
(13, 'Câu Chuyện Bên Nồi Lẫu', 208, 'uploads/images/sachtiengviet/cauchuyenbennoilau.jpg', 63000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(14, 'Chúng Ta Đâu Chỉ Sống Cho Riêng Mình', 208, 'uploads/images/sachtiengviet/chungtadauchisongchoriengminh.jpg', 82000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(15, 'Cứ Bình Tĩnh', 208, 'uploads/images/sachtiengviet/cubinhtinh.jpg', 82000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(16, 'Đàn Ông +', 208, 'uploads/images/sachtiengviet/danong.jpg', 86000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(17, 'Lớn Lên Sẽ Khác', 208, 'uploads/images/sachtiengviet/lonlensekhac.jpg', 89000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(18, 'Mẹ - Em Bé Và Bố', 208, 'uploads/images/sachtiengviet/me-embevabo.jpg', 89000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(19, 'Nhà', 208, 'uploads/images/sachtiengviet/nha.jpg', 109000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(20, 'Nước Nhật Nhìn Từ Những Thứ Bình Thường', 208, 'uploads/images/sachtiengviet/nuocnhatnhintunhungthubinhthuong.jpg', 76000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(21, 'Yêu Sao Để Không Đau', 208, 'uploads/images/sachtiengviet/yeusaodekhongdau.jpg', 86000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 13, b'0', 100),
(22, 'Để Con Được Ốm', 208, 'uploads/images/sachnuoidaycon/deconduocom.jpg', 76000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 7, b'0', 100),
(23, 'Vô Cùng Tàn Nhẫn Vô Cùng Yêu Thương', 208, 'uploads/images/sachnuoidaycon/vocungtannhanvocungyeuthuong.jpg', 82000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 7, b'0', 100),
(24, 'Người Mẹ Tốt Hơn Là Người Thầy Tốt', 208, 'uploads/images/sachnuoidaycon/nguoimetothonlanguoithaytot.jpg', 67000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 7, b'0', 100),
(25, 'Con Nghĩ Đi Mẹ Không Biết', 208, 'uploads/images/sachnuoidaycon/connghidimekhongbiet.jpg', 77000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 7, b'0', 100),
(30, 'Phân Tích Chứng Khoáng', 208, 'uploads/images/sachkinhte/phan-tich-chung-khoan-outline-26.jpg', 499000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 4, b'0', 100),
(31, 'Nhà Đầu Tư Thông Minh', 208, 'uploads/images/sachkinhte/nha_dau_tu_thong_minh_2.jpg', 155000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 4, b'0', 100),
(32, 'Chiến Lược Đầu Tư Chứng Khoáng', 208, 'uploads/images/sachkinhte/chienluocdautuchungkhoang.jpg', 149000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 4, b'0', 100),
(33, 'Bất Động Sản Căn Bản', 208, 'uploads/images/sachkinhte/batdongsancanban.jpg', 199000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 4, b'0', 100),
(34, 'Tuyển Chọn Đề Thi Vào Lớp 10', 208, 'uploads/images/sachthamkhao/tuyenchondethivaolop10.PNG', 136000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 8, b'0', 100),
(35, 'Bộ Đề Kiểm Tra Trắc Nghiệm Và Tự Luận Môn Lịch Sử', 208, 'uploads/images/sachthamkhao/bodekiemtratracnghiemvatuluanmonlichsu.jpg', 96000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 8, b'0', 100),
(36, 'Các Dạng Toán Cơ Bản', 208, 'uploads/images/sachthamkhao/cacdangtoandienhinh.jpg', 106000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 8, b'0', 100),
(37, 'Ôn Tập Và Kiểm Tra Môn Vật Lý', 208, 'uploads/images/sachthamkhao/ontapvakiemtramonvatly.jpg', 126000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 8, b'0', 100),
(38, 'Thám Tử Lừng Danh Conan Tập 94', 208, 'uploads/images/sachthieunhi/conan_tap_94.jpg', 20000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 9, b'0', 100),
(39, 'Dế Mèn Phiêu Lưu Ký', 208, 'uploads/images/sachthieunhi/de_men_phieu_luu_ki.jpg', 120000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 9, b'0', 100),
(40, 'Lớp Học Mật Ngữ Tập 1', 208, 'uploads/images/sachthieunhi/lop-hoc-mat-ngu-1.jpg', 20000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 9, b'0', 100),
(41, 'Lớp Học Mật Ngữ Tập 10', 208, 'uploads/images/sachthieunhi/lop-hoc-mat-ngu-10.jpg', 20000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 9, b'0', 100),
(42, 'Từ Điển Anh Anh Việt', 208, 'uploads/images/tudien/tudienanhanhviet.jpg', 273000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 11, b'0', 100),
(43, 'Từ Điển Bách Khoa Y Học Anh Việt', 208, 'uploads/images/tudien/tudienbachkhoayhocanh-viet.jpg', 370000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 11, b'0', 100),
(44, 'Từ Điển Mẫu Câu Tiếng Nhật', 208, 'uploads/images/tudien/tudienmaucautiengnhat.jpg', 230000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 11, b'0', 100),
(45, 'Từ Điển Thành Ngữ Và Tục Ngữ Việt Nam', 208, 'uploads/images/tudien/tudienthanhnguvatucnguvietnam.jpg', 650000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 11, b'0', 100),
(46, 'Bạn Đắt Giá Bao Nhiêu', 208, 'uploads/images/kinangsong/bia_bandatgiabaonhieu_full.jpg', 80000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 12, b'0', 100),
(47, 'Lối Sống Tối Giản Của Người Nhật', 208, 'uploads/images/kinangsong/loisongtoigiancuanguoinhat.jpg', 95000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 12, b'0', 100),
(48, 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', 208, 'uploads/images/kinangsong/kheoannoisecoduocthienha.jpg', 110000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 12, b'0', 100),
(49, 'Bạn Chỉ Cần Sống Tốt, Trời Xanh Tự An Bài', 208, 'uploads/images/kinangsong/banchicansongtottroixanhtuanbai.jpg', 89000, 'Cty Sách & Thiết Bị Giáo Dục Miền Nam', 'Nguyễn Xuân Trường - Phạm Văn Hoan - Từ Vọng Nghi - Đỗ Đình Rãng - Nguyễn Phú Tuấn', 'NXB Giáo Dục Việt Nam', 2016, '20.5 x 29', 'Bìa Mềm', 'Sách tiếng Việt', 'Nội dung bộ sách được biên soạn, biên dịch theo đúng cấu trúc, nội dung và chương trình của sách giáo khoa đang được NXBGDVN xuất bản, phát hành hiện nay và sẽ giúp các em từng bước làm quen với việc học toán bằng tiếng Anh: từ việc biết đọc từ toán, biết viết các phép tính đến việc tận dụng vốn kiến thức toán đã học vào việc học toán và các môn học khác; Do vậy bộ sách hoàn toàn phù hợp cho việc dạy và học trong nhà trường.', 12, b'0', 100),
(56, 'vvv', 123, 'uploads/images/sach-upload/41bd819572593376a10fce71716f66c0', 123, 'vfa', 'zxc', 'v', 2015, '12x2', 'juihyu', 'a', 'ygyg', 1, b'0', 123),
(57, 'vvv', 123, 'uploads/images/sach-upload/9dc81d262cd00e965f0c1df21a6bf75d', 123, 'vfa', '123', 'v', 123, '12x34', 'werfw', '123', 'ewrrt1', 2, b'0', 123);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `hinhanh` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `hinhanh`) VALUES
(1, 'uploads/images/slide/DAIGIA-1.jpg'),
(2, 'uploads/images/slide/MuaSam-2.png'),
(3, 'uploads/images/slide/Thu3-3.jpg'),
(4, 'uploads/images/slide/Cung-hoang-dao-4.jpg'),
(5, 'uploads/images/slide/NCC-BachViet-5.jpg'),
(6, 'uploads/images/slide/NCC-IPM-mua-mua-sam-dien-cuong-6.jpg'),
(7, 'uploads/images/slide/New-Arrivals-7.jpg'),
(8, 'uploads/images/slide/BTS-8.jpg'),
(9, 'uploads/images/slide-upload/36b280df7314f45ab5a988b01dc1e978');

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
(1, 'Sách Giáo Khoa'),
(2, 'Sách Học Ngoại Ngữ'),
(3, 'Sách Khoa Học'),
(4, 'Sách Kinh Tế'),
(7, 'Sách Nuôi Dạy Con'),
(8, 'Sách Tham Khảo'),
(9, 'Sách Thiếu Nhi'),
(11, 'Từ Điển'),
(12, 'Kỹ Năng Sống'),
(13, 'Sách Tiếng Việt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
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
(3, 'John', 'john123', 'john123@gmail.com', '$2a$08$YZe2smyUgfihXF0711JOYOtM4h.fvXtcZBwdxQ3yGEWz2VEmQt6sG', 0, '2018-12-09 13:36:04', '2018-12-09 13:36:04'),
(4, 'Tran Duy', 'duy123', 'duy123@gmail.com', '$2a$08$Zu7fg7vGsL3pEDAAe1c4Qu5jVjoXcnOKaQKjhHbqIvaEg9oHtK2a6', 0, '2018-12-21 16:55:46', '2018-12-21 16:55:46'),
(7, 'hoa123', 'hoa123', 'hoanguyen123@gmail.com', '$2a$08$aE63KMvB22PF0fcyezJoDeWzhmPr2Q4VhEPhoVv/oDqiDarA2uYsS', 0, '2018-12-29 04:47:39', '2018-12-29 04:47:39'),
(8, 'David', 'david123', 'david123@gmail.com', '$2a$08$.yByx5ERapHm6cGhiOTvD.9VoTZIRiiHlhZ5ys5NFOIGkVTHrBYNe', 0, '2019-01-05 14:28:52', '2019-01-05 14:28:52'),
(9, 'abc', 'abc', 'abc@gmail.com', '$2a$08$651c22enHclvUTeERYsu.OfASHrdDq2gV5HdMrXFv1NEK3fGUfg.2', 0, '2019-01-05 14:31:35', '2019-01-05 14:31:35'),
(10, 'a', 'a', 'a@gmail.com', '$2a$08$KbEEYMO.FMIgNO4XIb495OgMhiRlcByKEZqO/cYm5fcFrEY3ky5Em', 0, '2019-01-05 14:34:55', '2019-01-05 14:34:55'),
(11, 'b', 'b', 'b@gmail.com', '$2a$08$WjVwmidGogg8XXgg2l4V7.Z3Tb1l0BIpA4jmIjwUIguiwQZwSHySy', 0, '2019-01-05 14:38:26', '2019-01-05 14:38:26'),
(12, 'c', 'c', 'c@gmail.com', '$2a$08$gRA1VSJQnbC00R8GqgvOO.eDApLahBH.Zsv7w/1DLkqU2FbbYJE.m', 0, '2019-01-05 14:46:36', '2019-01-05 14:46:36'),
(13, 'd', 'd', 'd@gmail.com', '$2a$08$wmNZob6bj40abIhqfMESqexfc5tIUSSuxIDbffO6HE4ZAHk01zRJ.', 0, '2019-01-05 14:48:35', '2019-01-05 14:48:35');

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
('2018-12-21 16:55:46', '2018-12-21 16:55:46', 1, 4),
('2019-01-05 14:28:52', '2019-01-05 14:28:52', 1, 8),
('2019-01-05 14:31:35', '2019-01-05 14:31:35', 1, 9),
('2019-01-05 14:34:55', '2019-01-05 14:34:55', 1, 10),
('2019-01-05 14:38:26', '2019-01-05 14:38:26', 1, 11),
('2019-01-05 14:46:36', '2019-01-05 14:46:36', 1, 12),
('2019-01-05 14:48:35', '2019-01-05 14:48:35', 1, 13),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('2018-12-09 13:36:04', '2018-12-09 13:36:04', 2, 3),
('2018-12-29 04:47:39', '2018-12-29 04:47:39', 2, 7);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendor` (`idUser`);

--
-- Chỉ mục cho bảng `nhanxet`
--
ALTER TABLE `nhanxet`
  ADD PRIMARY KEY (`idnhanxet`),
  ADD KEY `FK_NX_USER` (`idUser`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`idsach`),
  ADD KEY `fk_sachnhanxet` (`tensach`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `theloaisach`
--
ALTER TABLE `theloaisach`
  ADD PRIMARY KEY (`matheloai`),
  ADD UNIQUE KEY `tentheloai` (`tentheloai`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhanxet`
--
ALTER TABLE `nhanxet`
  MODIFY `idnhanxet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `idsach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `theloaisach`
--
ALTER TABLE `theloaisach`
  MODIFY `matheloai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `fk_vendor` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

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
