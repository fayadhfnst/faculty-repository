-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2023 at 05:04 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `repo_fasilkom`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_bimbingan_doping` (`nip_dosen` CHAR(20)) RETURNS INT(11)  BEGIN
DECLARE num_counter INT(11);
SELECT (SELECT COUNT(judul) FROM tugas_akhir WHERE nip_dosen_pembimbing1 = nip_dosen) + (SELECT COUNT(judul) FROM tugas_akhir WHERE nip_dosen_pembimbing2 = nip_dosen) INTO num_counter FROM dosen_pembimbing WHERE nip = nip_dosen;
RETURN num_counter;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_judul_kategori_repo` (`id_k_r` INT) RETURNS INT(11)  BEGIN
DECLARE num_counter INT(11);
SELECT COUNT(id_kategori_repo) INTO num_counter FROM tugas_akhir WHERE id_kategori_repo = id_k_r;
RETURN num_counter;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_judul_keyword` (`id_k` INT) RETURNS INT(11)  BEGIN
DECLARE num_counter INT(11);
SELECT COUNT(id_keyword) INTO num_counter FROM tugas_akhir WHERE id_keyword = id_k;
RETURN num_counter;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_judul_penelitian` (`id_k_r` INT) RETURNS INT(11)  BEGIN
DECLARE num_counter INT(11);
SELECT COUNT(id_kategori_repo) INTO num_counter FROM penelitian_dosen WHERE id_kategori_repo = id_k_r;
RETURN num_counter;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_judul_prodi` (`id_p` INT) RETURNS INT(11)  BEGIN
DECLARE num_counter INT(11);
SELECT (SELECT COUNT(judul) FROM tugas_akhir WHERE id_prodi = id_p) + (SELECT COUNT(judul) FROM penelitian_dosen WHERE id_prodi = id_p) INTO num_counter FROM prodi WHERE id = id_p;
RETURN num_counter;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_status_surat` (`id_j_s` INT, `jenis_status` VARCHAR(10)) RETURNS INT(11)  BEGIN
DECLARE sum_count INT(11);
SELECT COUNT(*) INTO sum_count FROM surat WHERE status = jenis_status and id_jenis_surat = id_j_s;
RETURN sum_count;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlh_total_surat` (`id_j_s` INT) RETURNS INT(11) DETERMINISTIC BEGIN
DECLARE jlh_surat INT(11);
SELECT COUNT(judul) INTO jlh_surat FROM surat WHERE id_jenis_surat = id_j_s;
RETURN jlh_surat;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `email` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kode_otp` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`email`, `nama_lengkap`, `password`, `kode_otp`) VALUES
('adalynwood@usu.ac.id', 'Adalyn Wood', '6eea9476f97e4075546f4d4366a26cfc', NULL),
('amarioliver@students.usu.ac.id', 'Amari Oliver', '1754ec73bb79b2d39b0e84d098aab94c', NULL),
('amiyawilliamson@usu.ac.id', 'Amiya Williamson', '92643c0cb1a9fe7f4592425741a3e96e', NULL),
('andersonmax@students.usu.ac.id', 'Anderson Maxwell', '1a91e315472f531973a19212db3f5e92', NULL),
('averyaguilar@usu.ac.id', 'Avery Aguilar', '233bc6f70068bf5437f82906fe247360', NULL),
('bliu@usu.ac.id', 'Braeden Liu', '454eeb0f28267c3bd3ef2466ce18fe5f', NULL),
('cayleejensen@usu.ac.id', 'Caylee Jensen', '63fd26ac2c52c549b724c0059b5dc6bd', NULL),
('cheslye@students.usu.ac.id', 'Chesley Atkinson', 'bc2d1a36c2cc1a3ec20f2d79c8d4683e', NULL),
('corbinleon@usu.ac.id', 'Corbin Leon', '4e02086d5c1829d0fdcc4b62a6840bff', NULL),
('daltonguzman@usu.ac.id', 'Dalton Guzman', '9a00e6db2716889f33ae3a3e1439ded0', NULL),
('delgado@students.usu.ac.id', 'Sterling Delgado', '3d2f6c812a2de662dbc3ff761b272809', NULL),
('demawil@usu.ac.id', 'Demarion Wilkinson', '8d213da6b6c3833ab0731e6e718fedec', NULL),
('edbert1xie@gmail.com', 'Edbert', '81dc9bdb52d04dc20036dbd8313ed055', 0),
('felixmoore@usu.ac.id', 'Felix Moore', 'bb5496d5b9961665a64f21000cc786d5', NULL),
('fkaiser@students.usu.ac.id', 'Fiona Kaiser', '39cd309567b3d61e3de229ee0f8e211b', NULL),
('gabrielarosario@students.usu.ac.id', 'Gabriela Rosario', '6bb9179c4a5a229cda585c0c9ee48f00', NULL),
('hanncalhoun@students.usu.ac.id', 'Hannah Calhoun', '0b478c1b737cf7e4685dcfba7835edec', NULL),
('harmonyvaughn@students.usu.ac.id', 'Harmony Vaughn', '62c463ef45041f274f8f3617d8c250da', NULL),
('howarderickson@usu.ac.id', 'Howard Erickson', 'a8d5dcba60f16a89dfee2902cb61bcdd', NULL),
('isabel@students.usu.ac.id', 'Isabel Fletcher', '560cbbb65c30d77b511843ec7faf4196', NULL),
('jadynh@usu.ac.id', 'Jadyn Huff', '4320fbbd7fe3e26a56553f3949f934b8', NULL),
('jaedenesparza@students.usu.ac.id', 'Jaeden Esparza', '6928bec332a31c3e6bc3ad2a5cb47aab', NULL),
('jettparks@usu.ac.id', 'Jett Parks', 'e5740ff91c7b791aaacb31f4bd4746ba', NULL),
('johnsell@students.usu.ac.id', 'Johnnie Sellers', '1fce2debf1e3a0b828070be16e20ddd8', NULL),
('jonnielong@students.usu.ac.id', 'Jonnie Long', 'f293d155489f8d157e249daf16c12604', NULL),
('judsonmay@students.usu.ac.id', 'Judson May', '91809e4e1f5a57c81628dd3ecdccec5d', NULL),
('justinriley@students.usu.ac.id', 'Justin Riley', '8ff6012a1e91c798f047e6bd2d6f9506', NULL),
('kathgibbs@students.usu.ac.id', 'Katherine Gibbs', 'f77e582c181088aabcbcd0a1c74ffb5a', NULL),
('kelsiemccall@students.usu.ac.id', 'Kelsie Mccall', '3124458f5633e13dca31f92b6398e783', NULL),
('kennzimm@students.usu.ac.id', 'Kenneth Zimmerman', '28aad8707046ea3f4ae03c1f3cc651dd', NULL),
('kocabrera@usu.ac.id', 'Koen Cabrera', '02de79eb6fa13788ad30f873c205e491', NULL),
('kristinparsons@usu.ac.id', 'Kristin Parsons', 'f470ae6a7712fbef0d486c4b8c9d4a7e', NULL),
('kyrasantos@usu.ac.id', 'Kyra Santos', 'f4ec3d2831a89f1251a0a9f397aca093', NULL),
('leandroroberson@usu.ac.id', 'Leandro Roberson', '81dc9bdb52d04dc20036dbd8313ed055', NULL),
('liliancooley@students.usu.ac.id', 'Lilian Cooley', '62bcd1a5d60c0436265a1278c08a9cfd', NULL),
('lmurray@students.usu.ac.id', 'Lilah Murray', '17f034c305d32284e762cf5fc348b1aa', NULL),
('loranberger@students.usu.ac.id', 'Loran Berger', 'cb7ca79f8322b56cd0b1b029103dacbb', NULL),
('magdalenavghn@students.usu.ac.id', 'Magdalena Vaughan', '41c951fd271fc1665921aaa197dc9c45', NULL),
('maxhodges@students.usu.ac.id', 'Maximillian Hodges', 'e28339ba70163a8820137d0628ecafef', NULL),
('mayranoble@students.usu.ac.id', 'Mayra Noble', '53862fb1d93fea7762690ff841ca30c3', NULL),
('micahsolomonn@students.usu.ac.id', 'Micah Solomon', '55fb127b464cd94eff6a87f62b40eb75', NULL),
('mylie@usu.ac.id', 'Mylie Hendricks', '7fd27560d2fdbbd28c19b763ef9c6e21', NULL),
('nicolassimpson@usu.ac.id', 'Nicolas Simpson', 'd633bd576e3a6b3d0e1d630506f4a50d', NULL),
('paisleypham@students.usu.ac.id', 'Paisley Pham', '917d5b781d5320801fdc0107962e4877', NULL),
('palmer@students.usu.ac.id', 'Palmer Henderson', 'e98f0328e790c15bf7540851574e4eb4', NULL),
('paxtonsaunders@usu.ac.id', 'Paxton Saunders', '44edff252d1d2398c552e21c20be1dae', NULL),
('rafaelcowan@students.usu.ac.id', 'Rafael Cowan', 'f267afb20bb968ef04e77eeb460ede5c', NULL),
('roninroach@usu.ac.id', 'Ronin Roach', '02f3cef46dcf1dfc32229a243e0e5a75', NULL),
('sagerasmussen@usu.ac.id', 'Sage Rasmussen', '2310702d53172b40c1528b522db77f2c', NULL),
('serenity@students.usu.ac.id', 'Serenity Brock', '123f6d6a1446824b2fd88ac44a234839', NULL),
('shaneoconnell@students.usu.ac.id', 'Shane Oconnell', '2f7e5b5474f021afd985c3f0f2233059', NULL),
('shaunnixon@usu.ac.id', 'Shaun Nixon', '5a489d1f3be4473c51a32722176e39cf', NULL),
('sienameyer@students.usu.ac.id', 'Siena Meyer', 'd613e1ecbdfb1f3c712e1c27646dc5e0', NULL),
('talanglenn@usu.ac.id', 'Talan Glenn', 'cfa313e06af7dfa606855a993a61cd6b', NULL),
('taniyah@students.usu.ac.id', 'Taniyah Fitzgerald', '530ad10b5197d188302c37fd934ee505', NULL),
('tomasbailey@students.usu.ac.id', 'Tomas Bailey', '9b124cf52f52f00ff2d2ae1b6829df7c', NULL),
('ykline@usu.ac.id', 'Yamilet Kline', '5c4a31d80201f15adf614d16021ec2fa', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `balasan_surat`
--

CREATE TABLE `balasan_surat` (
  `id_surat` int(3) NOT NULL,
  `pengurus_surat` varchar(50) NOT NULL,
  `file_surat` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `balasan_surat`
--

INSERT INTO `balasan_surat` (`id_surat`, `pengurus_surat`, `file_surat`) VALUES
(6, 'amarioliver@students.usu.ac.id', 'akun.txt'),
(12, 'amarioliver@students.usu.ac.id', 'MSBD_Kelompok 3.pptx'),
(13, 'amarioliver@students.usu.ac.id', 'ERD MSBD.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `dosen_pembimbing`
--

CREATE TABLE `dosen_pembimbing` (
  `nip` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen_pembimbing`
--

INSERT INTO `dosen_pembimbing` (`nip`, `nama_lengkap`) VALUES
('196407232001121001', 'Felix Moore'),
('196509122003111004', 'Nicolas Blake'),
('196705192000122001', 'Adalyn Wood'),
('196712202000121001', 'Yamilet Kline'),
('196908102003111002', 'Shaun Nixon'),
('196909202000111001', 'Jett Parks'),
('197002212000211002', 'Amiya Williamson'),
('197004212000221001', 'Corbin Leon'),
('197201252000131001', 'Sage Rasmussen'),
('197205121000212002', 'Mylie Hendricks'),
('197303032003121003', 'Braeden Liu'),
('197306101003221002', 'Avery Aguilar'),
('197307212001122001', 'Howard Erickson'),
('197404092000131002', 'Talan Glenn'),
('197806182001221002', 'Paxton Saunders'),
('197811201000211002', 'Demarion Wilkinson'),
('197906211000131002', 'Caylee Jensen'),
('198210222003212004', 'Koen Cabrera'),
('198212112003111004', 'Jadyn Huff');

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `id` int(4) NOT NULL,
  `judul` longtext NOT NULL,
  `penulis` char(40) NOT NULL,
  `tgl_terbit` date NOT NULL,
  `tgl_upload` date NOT NULL,
  `abstract` longtext NOT NULL,
  `file_url` longtext DEFAULT NULL,
  `uploaded_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`id`, `judul`, `penulis`, `tgl_terbit`, `tgl_upload`, `abstract`, `file_url`, `uploaded_by`) VALUES
(1, 'DASAR-DASAR KECERDASAN BUATAN DENGAN MENGGUNAKAN\r\n', 'Nadya', '2010-09-15', '2022-12-05', 'Ini abstract  judul tersebut', 'subnetting.ppt', 'Adalyn Wood'),
(2, 'DASAR-DASAR JARINGAN KOMPUTE\r\n', 'Raihan Syahfitri', '2012-02-22', '2022-12-05', 'Ini abstract tentang judul tersebut', '002-Ebook.pdf', 'Felix Moore'),
(3, 'APLIKASI KOMPUTER \"MENGENAL SOFTWARE MATEMATIKA\"\n', 'Nela Rini', '2009-09-09', '2022-12-05', 'Ini abstract tentang judul tersebut', '003-Ebook.pdf', 'Talan Glenn'),
(4, 'KOMPUTER DAN DASAR PEMROGRAMAN\n', 'Ilhamuddin', '2020-07-19', '2022-12-05', 'Ini abstract tentang judul tersebut', '004-Ebook.pdf', 'Corbin Leon'),
(5, 'MYSQL 5 DARI PEMULA HINGGA MAHIR\n', 'Azhari', '2005-05-01', '2022-12-05', 'Ini abstract tentang judul tersebut', '005-Ebook.pdf', 'Shaun Nixon'),
(6, 'BELAJAR HTML & CSS \"TUTORIAL FUNDAMENTAL DALAM MEMPELAJARI HTML & CSS\"\n', 'Jamilah', '2003-04-22', '2022-12-05', 'Ini abstract tentang judul tersebut', '006-Ebook.pdf', 'Talan Glenn'),
(7, 'DASAR-DASAR KOMPUTER\n', 'Edbert', '2014-06-17', '2022-12-05', 'Ini abstract tentang judul tersebut', '007-Ebook.pdf', 'Shaun Nixon'),
(8, 'BUKU PANDUAN MERAKIT KOMPUTER\n', 'Ferdi Budianto', '2012-12-12', '2022-12-05', 'Ini abstract tentang judul tersebut', '008-Ebook.pdf', 'Felix Moore'),
(9, 'BUKU JARINGAN KOMPUTER 1\n', 'Hafizah Ulfa', '2018-08-28', '2022-12-05', 'Ini abstract tentang judul tersebut', '009-Ebook.pdf', 'Demarion Wilkinson'),
(10, 'PERANCANGAN DATABASE SISTEM INFORMASI MANAJEMEN PENDIDIKAN\n', 'Yumna Alifah', '2015-07-24', '2022-12-05', 'Ini abstract tentang judul tersebut', '010-Ebook.pdf', 'Howard Erickson'),
(11, 'MODUL PRAKTIKUM PEMROGRAMAN BERORIENTASI OBJEK DENGAN JAVA\n', 'Alwi Syahputra', '2012-03-01', '2022-12-05', 'Ini abstract tentang judul tersebut', '011-Ebook.pdf', 'Demarion Wilkinson'),
(12, 'DESAIN DAN PEMROGRAMAN MULTIMEDIA PEMBELAJARAN INTERAKTIF\n', 'Ahmad Annabani', '2009-01-30', '2022-12-05', 'Ini abstract tentang judul tersebut', '012-Ebook.pdf', 'Avery Aguilar'),
(13, 'KAMPUS HIJAU\n', 'Aji Gemastiar', '2012-02-04', '2022-12-05', 'Ini abstract tentang judul tersebut', '013-Ebook.pdf', 'Felix Moore'),
(14, 'INTEGRATED MODEL OF PRODUCT DESIGN METHODS\n', 'Arif Nabiil', '2007-05-11', '2022-12-05', 'Ini abstract tentang judul tersebut', '014-Ebook.pdf', 'Avery Aguilar'),
(15, 'PEMIKIRAN GURU BESAR USU TENTANG PETA JALAN PENDIDIKAN INDONESIA\n', 'Endrik Aziz', '2004-07-02', '2022-12-05', 'Ini abstract tentang judul tersebut', '015-Ebook.pdf', 'Howard Erickson'),
(16, 'PEMIKIRAN GURU BESAR UNTUK MEWUJUDKAN INTERNASIONALISASI UNIVERSITAS SUMATERA UTARA MENUJU TOP 500 WORLD CLASS UNIVERSITY\n', 'Ridwan Khanif', '2001-09-02', '2022-12-05', 'Ini abstract tentang judul tersebut', '016-Ebook.pdf', 'Corbin Leon'),
(17, 'STRATEGI KEUNGGULAN BERSAIN UNTUK MENINGKATKAN KINERJA UMKM BERBASISKAN INTELLECTUAL CAPITAL\n', 'Wildan Setiawan', '2008-05-12', '2022-12-05', 'Ini abstract tentang judul tersebut', '017-Ebook.pdf', 'Corbin Leon'),
(18, 'KESEHATAN MASYARAKAT TEORI DAN APLIKASI\n', 'Rizki Ramli', '2012-02-12', '2022-12-05', 'Ini abstract tentang judul tersebut', '018-Ebook.pdf', 'Paxton Saunders'),
(19, 'KEPEMIMPINAN & KETERIKATAN PEGAWAI DI PERGURUAN TINGGI\n', 'Dea Amelia', '2011-09-09', '2022-12-05', 'Ini abstract tentang judul tersebut', '019-Ebook.pdf', 'Paxton Saunders'),
(20, 'READING AND COMPREHENSION\n', 'Dinda Wardani', '2006-09-12', '2022-12-05', 'Ini abstract tentang judul tersebut', '020-Ebook.pdf', 'Talan Glenn');

--
-- Triggers `ebook`
--
DELIMITER $$
CREATE TRIGGER `log_ebook_delete` AFTER DELETE ON `ebook` FOR EACH ROW BEGIN
    INSERT INTO log_ebook (
        id_ebook,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        OLD.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "penulis", OLD.penulis,
            "abstract", OLD.abstract
        ),
        null,
        'DELETE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_ebook_insert` AFTER INSERT ON `ebook` FOR EACH ROW BEGIN
    INSERT INTO log_ebook (
        id_ebook,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        null,
        JSON_OBJECT(
            "judul", NEW.judul,
            "penulis", NEW.penulis,
            "abstract", NEW.abstract
        ),
        'INSERT',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_ebook_update` AFTER UPDATE ON `ebook` FOR EACH ROW BEGIN
    INSERT INTO log_ebook (
        id_ebook,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "penulis", OLD.penulis,
            "abstract", OLD.abstract
        ),
        JSON_OBJECT(
            "judul", NEW.judul,
            "penulis", NEW.penulis,
            "abstract", NEW.abstract
        ),
        'UPDATE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `id` int(3) NOT NULL,
  `nama_jenis` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_surat`
--

INSERT INTO `jenis_surat` (`id`, `nama_jenis`) VALUES
(1, 'Izin Tidak Mengikuti Perkuliahan'),
(2, 'Permohonan Magang'),
(3, 'Permohonan Bukti Penyerahan Tugas Akhir'),
(4, 'Keterangan Nilai'),
(5, 'Permohonan Kehilangan'),
(6, 'Permohonan Keterangan Aktif Mahasiswa'),
(7, 'Permohonan Mengundurkan Diri'),
(8, 'Permohonan Rekomendasi Beasiswa'),
(9, 'Permohonan Keterlambatan SPP');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_repo`
--

CREATE TABLE `kategori_repo` (
  `id` int(2) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `id_prodi` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_repo`
--

INSERT INTO `kategori_repo` (`id`, `nama_kategori`, `id_prodi`) VALUES
(1, 'Skripsi', 1),
(2, 'Thesis', 4),
(3, 'Disertasi', 5),
(4, 'Penelitian', 1),
(5, 'Skripsi', 2),
(6, 'Thesis', 3),
(7, 'Disertasi', 3),
(8, 'Penelitian', 2);

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE `keyword` (
  `id` int(3) NOT NULL,
  `nama_keyword` varchar(50) NOT NULL,
  `id_prodi` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`id`, `nama_keyword`, `id_prodi`) VALUES
(1, 'Virtual Reality', 2),
(2, 'Augmented Reality', 2),
(3, 'Machine Learning', 2),
(4, 'Artificial Intelligence', 1),
(5, 'Network Programming', 2),
(6, 'Network Security', 2),
(7, 'Network Management', 1),
(8, 'Interactive Multimedia', 2),
(9, 'Information Retrieval System', 1),
(10, 'Natural Language Processing', 1),
(11, 'Pemodelan Geometris 3D', 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_ebook`
--

CREATE TABLE `log_ebook` (
  `id_ebook` bigint(20) NOT NULL,
  `old_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_row_data`)),
  `new_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_row_data`)),
  `dml_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `dml_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_ebook`
--

INSERT INTO `log_ebook` (`id_ebook`, `old_row_data`, `new_row_data`, `dml_type`, `dml_timestamp`) VALUES
(21, NULL, '{\"judul\": \"HALO\", \"penulis\": \"nad\", \"abstract\": \"IYA? HALO?\"}', 'INSERT', '2022-12-29 23:33:18'),
(21, '{\"judul\": \"HALO\", \"penulis\": \"nad\", \"abstract\": \"IYA? HALO?\"}', '{\"judul\": \"HALO APA KABAR\", \"penulis\": \"nad\", \"abstract\": \"IYA? HALO?\"}', 'UPDATE', '2022-12-29 23:34:45'),
(21, '{\"judul\": \"HALO APA KABAR\", \"penulis\": \"nad\", \"abstract\": \"IYA? HALO?\"}', NULL, 'DELETE', '2022-12-29 23:35:10');

--
-- Triggers `log_ebook`
--
DELIMITER $$
CREATE TRIGGER `jgn_delete_log_ebook` BEFORE DELETE ON `log_ebook` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh dihapus';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jgn_update_log_ebook` BEFORE UPDATE ON `log_ebook` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh diupdate';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_penelitian_dosen`
--

CREATE TABLE `log_penelitian_dosen` (
  `id_penelitian` bigint(20) NOT NULL,
  `old_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_row_data`)),
  `new_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_row_data`)),
  `dml_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `dml_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_penelitian_dosen`
--

INSERT INTO `log_penelitian_dosen` (`id_penelitian`, `old_row_data`, `new_row_data`, `dml_type`, `dml_timestamp`) VALUES
(19, NULL, '{\"judul\": \"TES PENELITIAN\", \"abstract\": \"TESTESTES\", \"anggota\": \"Nadya, Reihan\", \"prodi\": \"Ilmu Komputer\"}', 'INSERT', '2022-12-30 00:05:08'),
(19, '{\"judul\": \"TES PENELITIAN\", \"abstract\": \"TESTESTES\", \"anggota\": \"Nadya, Reihan\", \"prodi\": \"Ilmu Komputer\"}', '{\"judul\": \"INI PENELITIAN\", \"abstract\": \"TESTESTES\", \"anggota\": \"Nadya, Reihan\", \"prodi\": \"Ilmu Komputer\"}', 'UPDATE', '2022-12-30 00:05:31'),
(19, '{\"judul\": \"INI PENELITIAN\", \"abstract\": \"TESTESTES\", \"anggota\": \"Nadya, Reihan\", \"prodi\": \"Ilmu Komputer\"}', NULL, 'DELETE', '2022-12-30 00:05:55');

--
-- Triggers `log_penelitian_dosen`
--
DELIMITER $$
CREATE TRIGGER `jgn_delete_log_penelitian_dosen` BEFORE DELETE ON `log_penelitian_dosen` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh dihapus';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jgn_update_log_penelitian_dosen` BEFORE UPDATE ON `log_penelitian_dosen` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh diupdate';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_surat`
--

CREATE TABLE `log_surat` (
  `id_surat` bigint(20) NOT NULL,
  `old_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_row_data`)),
  `new_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_row_data`)),
  `dml_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `dml_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_surat`
--

INSERT INTO `log_surat` (`id_surat`, `old_row_data`, `new_row_data`, `dml_type`, `dml_timestamp`) VALUES
(1, '{\"judul\": \"Surat Izin Tidak Dapat Mengikuti Perkuliahan\", \"keterangan\": \"Mengikuti Perlombaan\", \"tgl_diperlukan\": \"2022-12-08\", \"nama_pengaju\": \"Shane Oconnell\"}', '{\"judul\": \"Surat Izin Tidak Dapat Mengikuti Perkuliahan\", \"keterangan\": \"Mengikuti Perlombaan\", \"tgl_diperlukan\": \"2022-12-08\", \"nama_pengaju\": \"Shane Oconnell\"}', 'UPDATE', '2023-01-05 09:38:38'),
(1, '{\"judul\": \"Surat Izin Tidak Dapat Mengikuti Perkuliahan\", \"keterangan\": \"Mengikuti Perlombaan\", \"tgl_diperlukan\": \"2022-12-08\", \"nama_pengaju\": \"Shane Oconnell\"}', '{\"judul\": \"Surat Izin Tidak Dapat Mengikuti \", \"keterangan\": \"Mengikuti Perlombaan\", \"tgl_diperlukan\": \"2022-12-08\", \"nama_pengaju\": \"Shane Oconnell\"}', 'UPDATE', '2023-01-05 09:39:28'),
(21, NULL, '{\"judul\": \"Izin Sakit\", \"keterangan\": \"Sakit demam\", \"tgl_diperlukan\": \"2022-12-31\", \"nama_pengaju\": \"Paisley Pham\"}', 'INSERT', '2022-12-30 00:24:44'),
(21, '{\"judul\": \"Izin Sakit Demam\", \"keterangan\": \"Sakit demam\", \"tgl_diperlukan\": \"2022-12-31\", \"nama_pengaju\": \"Paisley Pham\"}', '{\"judul\": \"Permohonan Izin Sakit\", \"keterangan\": \"Sakit demam\", \"tgl_diperlukan\": \"2022-12-31\", \"nama_pengaju\": \"Paisley Pham\"}', 'UPDATE', '2022-12-30 00:28:34'),
(21, '{\"judul\": \"Permohonan Izin Sakit\", \"keterangan\": \"Sakit demam\", \"tgl_diperlukan\": \"2022-12-31\", \"nama_pengaju\": \"Paisley Pham\"}', NULL, 'DELETE', '2022-12-30 00:29:31');

--
-- Triggers `log_surat`
--
DELIMITER $$
CREATE TRIGGER `jgn_delete_log_surat` BEFORE DELETE ON `log_surat` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh dihapus';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jgn_update_log_surat` BEFORE UPDATE ON `log_surat` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh diupdate';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_tugas_akhir`
--

CREATE TABLE `log_tugas_akhir` (
  `id_tugas_akhir` bigint(20) NOT NULL,
  `old_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_row_data`)),
  `new_row_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_row_data`)),
  `dml_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `dml_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_tugas_akhir`
--

INSERT INTO `log_tugas_akhir` (`id_tugas_akhir`, `old_row_data`, `new_row_data`, `dml_type`, `dml_timestamp`) VALUES
(13, '{\"judul\": \"PENERAPAN METODE EXTREME LEARNING\\nMACHINE UNTUK PREDIKSI TINGKAT\\nRISIKO WABAH DEMAM BERDARAH\\nBERDASARKAN KEADAAN CUACA\\n(STUDI KASUS : WILAYAH DKI JAKARTA)\", \"abstract\": \"Perubahan iklim merupakan perubahan dalam distribusi kejadian\\ncuaca terhadap kondisi rata-ratanya. Perubahan iklim baik secara langsung\\nataupun tidak langusung membawa dampak negatif bagi mahluk hidup di\\nbumi. Salah satu diantaranya adalah penyakit yang disebabkan oleh vektor,\\nseperti Demam berdarah dengue. Demam Berdarah Dengue pertama kali\\nditemukan di Indonesia pada tahun 1986, dimana sebanyak 58 orang di kota\\nSurabaya terinfeksi DBD dan 24 diantaranya meninggal dunia dengan Angka\\nKematian (AK) mencapai 41,3%. Sejak saat itu, penyakit ini menyebar luas\\nke seluruh Indonesia. Hingga saat ini DBD masih menjadi salah satu masalah\\nkesehatan yang utama di Indoneisa. Penelitian ini akan memanfaatkan metode\\nextreme learning machine (ELM) untuk meramalkan keadaan cuaca. Hasil\\nperamalan tersebut selanjutnya digunakan sebagai prediktor untuk melakukan\\nprediksi tingkat resiko wabah demam berdarah dengue di suatu wilayah. ELM\\nmerupakan metode pembelajaran dari jaringan saraf tiruan yang memiliki\\nkeunggulan terutama pada kecepatannya karena tidak memerlukan proses\\niterasi. Hasilnya menunjukkan bahwa metode ELM memberikan performa\\nyang cukup menjanjikan. System yang dikembangkan dapat digunakan untuk\\nmelakukan prediksi tingkat resiko wabah demam berdarah beberapa bulan\\nkedepan.\", \"nim_mhs\": \"177038049\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', '{\"judul\": \"PENERAPAN METODE EXTREME LEARNING\\nMACHINE UNTUK PREDIKSI TINGKAT\\nRISIKO WABAH DEMAM BERDARAH\\nBERDASARKAN KEADAAN CUACA\\n(STUDI KASUS : WILAYAH DKI JAKARTA)\", \"abstract\": \"Perubahan iklim merupakan perubahan dalam distribusi kejadian\\ncuaca terhadap kondisi rata-ratanya. Perubahan iklim baik secara langsung\\nataupun tidak langusung membawa dampak negatif bagi mahluk hidup di\\nbumi. Salah satu diantaranya adalah penyakit yang disebabkan oleh vektor,\\nseperti Demam berdarah dengue. Demam Berdarah Dengue pertama kali\\nditemukan di Indonesia pada tahun 1986, dimana sebanyak 58 orang di kota\\nSurabaya terinfeksi DBD dan 24 diantaranya meninggal dunia dengan Angka\\nKematian (AK) mencapai 41,3%. Sejak saat itu, penyakit ini menyebar luas\\nke seluruh Indonesia. Hingga saat ini DBD masih menjadi salah satu masalah\\nkesehatan yang utama di Indoneisa. Penelitian ini akan memanfaatkan metode\\nextreme learning machine (ELM) untuk meramalkan keadaan cuaca. Hasil\\nperamalan tersebut selanjutnya digunakan sebagai prediktor untuk melakukan\\nprediksi tingkat resiko wabah demam berdarah dengue di suatu wilayah. ELM\\nmerupakan metode pembelajaran dari jaringan saraf tiruan yang memiliki\\nkeunggulan terutama pada kecepatannya karena tidak memerlukan proses\\niterasi. Hasilnya menunjukkan bahwa metode ELM memberikan performa\\nyang cukup menjanjikan. System yang dikembangkan dapat digunakan untuk\\nmelakukan prediksi tingkat resiko wabah demam berdarah beberapa bulan\\nkedepan.\", \"nim_mhs\": \"177038049\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', 'UPDATE', '2022-12-30 14:04:35'),
(14, '{\"judul\": \"EYE MOVEMENT GUIDANCE IN FAMILIAR VISUAL SCENES:\\nA ROLE FOR SCENE SPECIFIC LOCATION PRIORS IN SEARCH\", \"abstract\": \"Ecologically relevant search typically requires making rapid and strategic eye movements\\nin complex, cluttered environments. Attention allocation is known to be influenced by low\\nlevel image features, visual scene context, and top down task constraints. Scene specific\\ncontext develops when observers repeatedly search the same environment (e.g. one\'s\\nworkplace or home) and this often leads to faster search performance. How does prior\\nexperience influence the deployment of eye movements when searching a familiar scene?\\nOne challenge lies in distinguishing between the roles of scene specific experience and\\ngeneral scene knowledge. Chapter 1 investigates eye guidance in novel scenes by\\ncomparing how well several models of search guidance predict fixation locations, and\\nestablishes a benchmark for inter-observer fixation agreement. Chapters 2 and 3 explore\\nspatial and temporal characteristics of eye guidance from scene specific location priors.\\nChapter 2 describes comparative map analysis, a novel technique for analyzing spatial\\npatterns in eye movement data, and reveals that past history influences fixation selection in\\nthree search experiments. In Chapter 3, two experiments use a response-deadline approach\\nto investigate the time course of memory-based search guidance. Altogether, these results\\ndescribe how using long-term memory of scene specific representations can effectively\\nguide the eyes to informative regions when searching a familiar scene.\", \"nim_mhs\": \"187038050\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Teknik Informatika\"}', '{\"judul\": \"EYE MOVEMENT GUIDANCE IN FAMILIAR VISUAL SCENES:\\nA ROLE FOR SCENE SPECIFIC LOCATION PRIORS IN SEARCH\", \"abstract\": \"Ecologically relevant search typically requires making rapid and strategic eye movements\\nin complex, cluttered environments. Attention allocation is known to be influenced by low\\nlevel image features, visual scene context, and top down task constraints. Scene specific\\ncontext develops when observers repeatedly search the same environment (e.g. one\'s\\nworkplace or home) and this often leads to faster search performance. How does prior\\nexperience influence the deployment of eye movements when searching a familiar scene?\\nOne challenge lies in distinguishing between the roles of scene specific experience and\\ngeneral scene knowledge. Chapter 1 investigates eye guidance in novel scenes by\\ncomparing how well several models of search guidance predict fixation locations, and\\nestablishes a benchmark for inter-observer fixation agreement. Chapters 2 and 3 explore\\nspatial and temporal characteristics of eye guidance from scene specific location priors.\\nChapter 2 describes comparative map analysis, a novel technique for analyzing spatial\\npatterns in eye movement data, and reveals that past history influences fixation selection in\\nthree search experiments. In Chapter 3, two experiments use a response-deadline approach\\nto investigate the time course of memory-based search guidance. Altogether, these results\\ndescribe how using long-term memory of scene specific representations can effectively\\nguide the eyes to informative regions when searching a familiar scene.\", \"nim_mhs\": \"187038050\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Teknik Informatika\"}', 'UPDATE', '2022-12-30 14:04:44'),
(15, '{\"judul\": \"STUDY OF MICROSCOPIC STRUCTURE VIA NMR DIFFUSIVE SCATTERING\", \"abstract\": \"Scattering experiments can be carried out by gradient nuclear magnetic resonance(NMR) methods. Magnetic field gradient pulses are utilized to create linear phase ramps of the spin magnetization across the sample along arbitrary directions. The linear phase ramps are defined as dynamic spin magnetization gratings. The measurement of the grating after it undergoes dynamic processes characterized by the local struc­ture leads to the measurement of the average phase changes over the whole sample, ..., a quantity denoted as intermediate scattering function. NMR scattering are measured in spatial and temporal window to sub-microns to tens of micros and milliseconds to a few seconds. In a time scale when spin displacements are larger than the spatial scale of local structure, NMR experiments directly measure the elastic incoherent structure function (EISF) ... powder. The direct control of scattering vector q in NMR scattering enables easy per­formance of multiple scattering experiments. The double scattering experiments, as examples of multiple scattering, lead to the measurement of structure factors ... powder. The latter correlates local struc­tural characteristics along directions that are normal to each other. Anisotropic information in a glassy sample can be determined without the presumptive models which are required in one dimensional or traditional scattering techniques. This thesis work includes detailed derivation of the theory of NMR double scattering, an experiment that can only be performed by NMR. The eccentricity information can be extracted by the differences of scattering curves from double scattering along one axis and along two orthogonal axes. The experiments are carried out for abnormally long yeast cells. The experimental results show good agreement with calculations where the yeast cell shape was approximated as prolate ellipsoids.\", \"nim_mhs\": \"187038055\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', '{\"judul\": \"STUDY OF MICROSCOPIC STRUCTURE VIA NMR DIFFUSIVE SCATTERING\", \"abstract\": \"Scattering experiments can be carried out by gradient nuclear magnetic resonance(NMR) methods. Magnetic field gradient pulses are utilized to create linear phase ramps of the spin magnetization across the sample along arbitrary directions. The linear phase ramps are defined as dynamic spin magnetization gratings. The measurement of the grating after it undergoes dynamic processes characterized by the local struc­ture leads to the measurement of the average phase changes over the whole sample, ..., a quantity denoted as intermediate scattering function. NMR scattering are measured in spatial and temporal window to sub-microns to tens of micros and milliseconds to a few seconds. In a time scale when spin displacements are larger than the spatial scale of local structure, NMR experiments directly measure the elastic incoherent structure function (EISF) ... powder. The direct control of scattering vector q in NMR scattering enables easy per­formance of multiple scattering experiments. The double scattering experiments, as examples of multiple scattering, lead to the measurement of structure factors ... powder. The latter correlates local struc­tural characteristics along directions that are normal to each other. Anisotropic information in a glassy sample can be determined without the presumptive models which are required in one dimensional or traditional scattering techniques. This thesis work includes detailed derivation of the theory of NMR double scattering, an experiment that can only be performed by NMR. The eccentricity information can be extracted by the differences of scattering curves from double scattering along one axis and along two orthogonal axes. The experiments are carried out for abnormally long yeast cells. The experimental results show good agreement with calculations where the yeast cell shape was approximated as prolate ellipsoids.\", \"nim_mhs\": \"187038055\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', 'UPDATE', '2022-12-30 14:04:50'),
(16, '{\"judul\": \"VALUABLE BRIDGES: CABLE-STAYED BRIDGES AND VALUE ENGINEERING IN AMERICAN CIVIL ENGINEERING CULTURE, 1969-1979\", \"abstract\": \"A history and theory of cable-stayed bridges in the context of a cultural\\ndiscourse on civil construction projects\' value, this thesis studies the significance of\\ncable-stayed bridge designs to \'value engineering\' objectives for major highway bridge\\nprojects of the 1970s. This study of preliminary designs and feasibility studies for\\nhighway bridges presents the alternate bridge designs versus alternative bridge\\ntypologies selected during this period as one instance of American civil engineering\\nculture adapting to major bridge projects the economically measured but industrial\\napproach to choosing, reconfiguring and eliminating construction systems of value\\nengineering. Only as analytical mechanisms of bridge construction that figure as\\neconomically competitive in prevailing market conditions do the high-capital and\\ntechnologically innovative bridge designs of the Luling Bridge (LA, 1978) and the Pasco Kennewick Bridge (WA, 1977) develop into physical constructions built almost\\nexclusively with federal highway funds. This shift in cable-stayed bridge designs\' fate\\nfrom abandoned projects in the 1960s is discussed as the reflection of structural\\nengineers\' engaging in the post-capitalist practices of analytical and then physical\\nsystems building, decision analysis, speculation as well as the interdisciplinary cultures\\nfrom which these concepts stem. Critical studies of preliminary designs and construction\\nindustry data circa 1970 reveal cable-stayed bridge type selections to be at once the\\nlinchpin to politicization of VE in American highway bridge building by 1979 and the\\nAchilles heel of an American civil engineering culture that sought a renaissance in bridge\\nengineering not a redefinition of its principles through a new method of planning for\\nalternate futures.\", \"nim_mhs\": \"117038038\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', '{\"judul\": \"VALUABLE BRIDGES: CABLE-STAYED BRIDGES AND VALUE ENGINEERING IN AMERICAN CIVIL ENGINEERING CULTURE, 1969-1979\", \"abstract\": \"A history and theory of cable-stayed bridges in the context of a cultural\\ndiscourse on civil construction projects\' value, this thesis studies the significance of\\ncable-stayed bridge designs to \'value engineering\' objectives for major highway bridge\\nprojects of the 1970s. This study of preliminary designs and feasibility studies for\\nhighway bridges presents the alternate bridge designs versus alternative bridge\\ntypologies selected during this period as one instance of American civil engineering\\nculture adapting to major bridge projects the economically measured but industrial\\napproach to choosing, reconfiguring and eliminating construction systems of value\\nengineering. Only as analytical mechanisms of bridge construction that figure as\\neconomically competitive in prevailing market conditions do the high-capital and\\ntechnologically innovative bridge designs of the Luling Bridge (LA, 1978) and the Pasco Kennewick Bridge (WA, 1977) develop into physical constructions built almost\\nexclusively with federal highway funds. This shift in cable-stayed bridge designs\' fate\\nfrom abandoned projects in the 1960s is discussed as the reflection of structural\\nengineers\' engaging in the post-capitalist practices of analytical and then physical\\nsystems building, decision analysis, speculation as well as the interdisciplinary cultures\\nfrom which these concepts stem. Critical studies of preliminary designs and construction\\nindustry data circa 1970 reveal cable-stayed bridge type selections to be at once the\\nlinchpin to politicization of VE in American highway bridge building by 1979 and the\\nAchilles heel of an American civil engineering culture that sought a renaissance in bridge\\nengineering not a redefinition of its principles through a new method of planning for\\nalternate futures.\", \"nim_mhs\": \"117038038\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', 'UPDATE', '2022-12-30 14:05:00'),
(17, '{\"judul\": \"PENDEKATAN METABOLOMIK UNTUK MENGIDENTIFIKASI \\nSENYAWA BIOAKTIF ANTIKANKER PADA \\nTUMBUHAN OBAT INDONESIA\", \"abstract\": \"Senyawa antikanker dari produk herbal terus diteliti untuk meningkatkan potensi kekayaan alam Indonesia. Namun, sejauh ini pencarian senyawa aktif dengan metode bioassay-directed fractionation and isolation (BDFI) terkendala oleh proses yang panjang dan terkadang senyawa isolatnya memiliki aktivitas yang lebih rendah daripada ekstraknya. Pendekatan metabolomik menjadi metode alternatif karena waktu analisis yang relatif lebih singkat. Selama ini, penelitian hanya terbatas menduga keberadaan senyawa aktif pada suatu ekstrak tertentu (berdasarkan pustaka memiliki aktivitas antikanker) tanpa pembuktian aktivitas. Fokus penelitian ini adalah mengkaji penggunaan pendekatan metabolomik untuk menemukan senyawa aktif antikanker dari tumbuhan obat Indonesia dan mengevaluasi hasil prediksi senyawa tersebut. Penelitian ini dibagi dalam tiga tahap kegiatan, yaitu (1) pemilihan tumbuhan obat berpotensi antikanker, (2) pemprofilan metabolit dan identifikasi senyawa aktif antikanker dengan pendekatan metabolomik, dan (3) e\\naluasi senyawa target antikanker. Dalam tahap pemilihan senyawa target, aktivitas antikanker ekstrak daun sirsak (Annona muricata), sambung nyawa (Gynura procumbens), keladi tikus (Typhonium flagelliforme), dan tapak dara (Catharanthus roseus) diuji pada sel MCF7. Ekstrak daun sirsak menunjukkan potensi tertinggi dengan nilai IC50 24,45 µg/mL dan 32,44 µg/mL pada ekstrak etanol p.a. dan 80%, dilanjutkan dengan tapak dara (78,41 µg/mL), sambung nyawa (86 µg/mL), dan keladi tikus (616,79 µg/mL). Sementara untuk aktivitas antioksidan dengan metode DPPH, urutannya ialah daun sambung nyawa (144,68 µg/mL) yang lebih berpotensi, diikuti tapak dara (327,46 µg/mL), sirsak (474,63 µg/mL), dan keladi tikus (693,48 µg/mL). Berdasarkan hasil ini, analisis pada sampel daun sirsak dilanjutkan dengan pendekatan metabolomik karena berpotensi sebagai antikanker tertinggi dibandingkan tiga tumbuhan lainnya. Pada tahap berikutnya, komponen metabolit yang terdapat dalam ekstrak daun sirsak dengan berbagai pelarut dianalisis menggunakan kromatografi cair- spektrometri massa (LC-HRMS) dengan pendekatan metabolomik taktertarget. Tiga puluh lima metabolit telah berhasil diidentifikasi secara putatif dalam ekstrak, yang diketahui berasal dari golongan senyawa alkaloid, flavonoid, dan asetogenin. Aktivitas antikanker terhadap sel kanker payudara MCF7 dari ekstrak etanol p.a. menunjukkan aktivitas tertinggi dengan nilai IC50 22,86 µg/mL, diikuti oleh ekstrak etanol 50% (97,52 µg/mL), etanol 80% (154,92 µg/mL), air (363,41 µg/mL), dan etanol 30% (1713,47 µg/mL). Berdasarkan informasi aktivitas terhadap sel kanker tersebut dan metabolit dalam ekstrak, disiapkan model untuk mendapat informasi senyawa target antikanker. Senyawa aktif dicari dengan pendekatan metabolomik menggunakan informasi kandungan senyawa sebagai prediktor dan aktivitas antikanker sebagai respons. Teknik multivariat orthogonal partial least square discriminant analysis (OPLS-DA) memperlihatkan bahwa tiga metabolit, yaitu annoretikuin, skuadiolin C, dan xilopina, serta enam metabolit (golongan asetogenin) yang belum berhasil teridentifikasi, diduga sebagai senyawa bioaktif antikanker dari daun sirsak. Hasil ini membuktikan bahwa metabolomik yang taktertarget dapat mengidentifikasi senyawa antikanker pada daun sirsak. Penelitian tahap tiga difokuskan pada evaluasi senyawa target secara in silico dan in vitro. Evaluasi secara in silico membuktikan bahwa ada interaksi yang kuat antara struktur senyawa target dan makromolekul protein 3ERT dari sel kanker. Nilai afinitas pengikatan senyawa annoretikuin, skuadiolin C, dan xilopina mendekati doksorubisin, yakni obat antikanker komersial. Evaluasi lebih lanjut dilakukan dengan fraksionasi dari ekstrak daun sirsak dan analisis target senyawa aktif. Evaluasi secara in vitro terhadap enam fraksi menunjukkan peningkatan persentase penghambatan sel kanker (80─96%) lebih tinggi daripada hasil ekstrak etanol (73%). Hasil ini mempertegas bahwa senyawa dugaan dari pendekatan metabolomik dapat digunakan untuk mengidentifikasi senyawa aktif antikanker tumbuhan obat. Penelitian ini membuktikan pendekatan metabolomik dapat menjadi metode dalam penemuan senyawa aktif antikanker dari tumbuhan obat Indonesia dan dapat menjadi metode efektif dengan mengevaluasi senyawa aktif yang teruji. Untuk penelitian selanjutnya, disarankan pemurnian senyawa dugaan terhadap aktivitas antikanker dan pembuktian aktivitas terhadap sel kanker lainnya. Ke depannya, pendekatan metabolomik dapat dikembangkan untuk aktivitas hayati lainnya.\", \"nim_mhs\": \"188123010\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', '{\"judul\": \"PENDEKATAN METABOLOMIK UNTUK MENGIDENTIFIKASI \\nSENYAWA BIOAKTIF ANTIKANKER PADA \\nTUMBUHAN OBAT INDONESIA\", \"abstract\": \"Senyawa antikanker dari produk herbal terus diteliti untuk meningkatkan potensi kekayaan alam Indonesia. Namun, sejauh ini pencarian senyawa aktif dengan metode bioassay-directed fractionation and isolation (BDFI) terkendala oleh proses yang panjang dan terkadang senyawa isolatnya memiliki aktivitas yang lebih rendah daripada ekstraknya. Pendekatan metabolomik menjadi metode alternatif karena waktu analisis yang relatif lebih singkat. Selama ini, penelitian hanya terbatas menduga keberadaan senyawa aktif pada suatu ekstrak tertentu (berdasarkan pustaka memiliki aktivitas antikanker) tanpa pembuktian aktivitas. Fokus penelitian ini adalah mengkaji penggunaan pendekatan metabolomik untuk menemukan senyawa aktif antikanker dari tumbuhan obat Indonesia dan mengevaluasi hasil prediksi senyawa tersebut. Penelitian ini dibagi dalam tiga tahap kegiatan, yaitu (1) pemilihan tumbuhan obat berpotensi antikanker, (2) pemprofilan metabolit dan identifikasi senyawa aktif antikanker dengan pendekatan metabolomik, dan (3) e\\naluasi senyawa target antikanker. Dalam tahap pemilihan senyawa target, aktivitas antikanker ekstrak daun sirsak (Annona muricata), sambung nyawa (Gynura procumbens), keladi tikus (Typhonium flagelliforme), dan tapak dara (Catharanthus roseus) diuji pada sel MCF7. Ekstrak daun sirsak menunjukkan potensi tertinggi dengan nilai IC50 24,45 µg/mL dan 32,44 µg/mL pada ekstrak etanol p.a. dan 80%, dilanjutkan dengan tapak dara (78,41 µg/mL), sambung nyawa (86 µg/mL), dan keladi tikus (616,79 µg/mL). Sementara untuk aktivitas antioksidan dengan metode DPPH, urutannya ialah daun sambung nyawa (144,68 µg/mL) yang lebih berpotensi, diikuti tapak dara (327,46 µg/mL), sirsak (474,63 µg/mL), dan keladi tikus (693,48 µg/mL). Berdasarkan hasil ini, analisis pada sampel daun sirsak dilanjutkan dengan pendekatan metabolomik karena berpotensi sebagai antikanker tertinggi dibandingkan tiga tumbuhan lainnya. Pada tahap berikutnya, komponen metabolit yang terdapat dalam ekstrak daun sirsak dengan berbagai pelarut dianalisis menggunakan kromatografi cair- spektrometri massa (LC-HRMS) dengan pendekatan metabolomik taktertarget. Tiga puluh lima metabolit telah berhasil diidentifikasi secara putatif dalam ekstrak, yang diketahui berasal dari golongan senyawa alkaloid, flavonoid, dan asetogenin. Aktivitas antikanker terhadap sel kanker payudara MCF7 dari ekstrak etanol p.a. menunjukkan aktivitas tertinggi dengan nilai IC50 22,86 µg/mL, diikuti oleh ekstrak etanol 50% (97,52 µg/mL), etanol 80% (154,92 µg/mL), air (363,41 µg/mL), dan etanol 30% (1713,47 µg/mL). Berdasarkan informasi aktivitas terhadap sel kanker tersebut dan metabolit dalam ekstrak, disiapkan model untuk mendapat informasi senyawa target antikanker. Senyawa aktif dicari dengan pendekatan metabolomik menggunakan informasi kandungan senyawa sebagai prediktor dan aktivitas antikanker sebagai respons. Teknik multivariat orthogonal partial least square discriminant analysis (OPLS-DA) memperlihatkan bahwa tiga metabolit, yaitu annoretikuin, skuadiolin C, dan xilopina, serta enam metabolit (golongan asetogenin) yang belum berhasil teridentifikasi, diduga sebagai senyawa bioaktif antikanker dari daun sirsak. Hasil ini membuktikan bahwa metabolomik yang taktertarget dapat mengidentifikasi senyawa antikanker pada daun sirsak. Penelitian tahap tiga difokuskan pada evaluasi senyawa target secara in silico dan in vitro. Evaluasi secara in silico membuktikan bahwa ada interaksi yang kuat antara struktur senyawa target dan makromolekul protein 3ERT dari sel kanker. Nilai afinitas pengikatan senyawa annoretikuin, skuadiolin C, dan xilopina mendekati doksorubisin, yakni obat antikanker komersial. Evaluasi lebih lanjut dilakukan dengan fraksionasi dari ekstrak daun sirsak dan analisis target senyawa aktif. Evaluasi secara in vitro terhadap enam fraksi menunjukkan peningkatan persentase penghambatan sel kanker (80─96%) lebih tinggi daripada hasil ekstrak etanol (73%). Hasil ini mempertegas bahwa senyawa dugaan dari pendekatan metabolomik dapat digunakan untuk mengidentifikasi senyawa aktif antikanker tumbuhan obat. Penelitian ini membuktikan pendekatan metabolomik dapat menjadi metode dalam penemuan senyawa aktif antikanker dari tumbuhan obat Indonesia dan dapat menjadi metode efektif dengan mengevaluasi senyawa aktif yang teruji. Untuk penelitian selanjutnya, disarankan pemurnian senyawa dugaan terhadap aktivitas antikanker dan pembuktian aktivitas terhadap sel kanker lainnya. Ke depannya, pendekatan metabolomik dapat dikembangkan untuk aktivitas hayati lainnya.\", \"nim_mhs\": \"188123010\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', 'UPDATE', '2022-12-30 14:05:06'),
(18, '{\"judul\": \"ANALISIS SOCIAL CAPITAL, eWOM DAN MINAT PEMBELIAN\\nTERHADAP KEPUTUSAN PEMBELIAN ONLINE\", \"abstract\": \"Penetrasi dan minat pembelian online di Indonesia yang relatif rendah untuk produk pakaian\\nserta tingginya penggunaan jejaring sosial menunjukkan perlunya model yang menjelaskan\\nvariabel-variabel apa yang mempengaruhi keputusan pembelian online dalam jejaring sosial. \\nPenelitian ini bertujuan menawarkan sebuah model dengan meneliti pengaruh Social Capital, \\neWOM dan Minat Pembelian Online terhadap Keputusan Pembelian Online yang dilakukan \\npada pengguna Facebook di Indonesia. Hasil penelitian ini diharapkan dapat \\nmenggambarkan, menganalisis, dan menguji pengaruh dari variabel-variabel yang diteliti\\nterhadap Keputusan Pembelian Online. Metode penelitian yang digunakan adalah analisis \\ndeskriptif dan verifikatif. Pengumpulan data dilakukan dengan menyebarkan kuesioner \\npengguna Facebook di Indonesia yang pernah melakukan pembelian online dan mendapatkan \\neWOM. Sebanyak 220 sampel yang diperoleh menggunakan metode non probabilitas dengan \\nteknik purposive sampling diolah menggunakan teknik analisis Partially Least Square \\nStructural Equation Modeling. Hasil deskriptif menunjukkan bahwa tingkat Social Capital\\nberada pada posisi sedang, sementara tingkat eWOM, Minat Pembelian Online dan \\nKeputusan Pembelian Online berada pada posisi tinggi. Hasil pengujian verifikatif \\nmenunjukkan bahwa Social Capital memiliki pengaruh terhadap eWOM, dan Minat \\nPembelian Online, eWOM memiliki pengaruh terhadap Minat Pembelian Online dan Minat \\nPembelian Online memiliki pengaruh terhadap Keputusan Pembelian Online. Berdasarkan \\nmodel penelitian ini, pemasar online dapat memanfaatkan dimensi-dimensi yang ada pada\\nsocial capital melalui aktivitas mereka di jejaring sosial untuk meningkatkan pembelian \\nonline. Temuan lain adalah koefisien pengaruh langsung eWOM terhadap keputusan \\npembelian online yang rendah. Hal ini dipicu oleh banyaknya berita hoax yang sering beredar \\ndi jejaring sosial Indonesia akhir-akhir ini.\\n\", \"nim_mhs\": \"188123010\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', '{\"judul\": \"ANALISIS SOCIAL CAPITAL, eWOM DAN MINAT PEMBELIAN\\nTERHADAP KEPUTUSAN PEMBELIAN ONLINE\", \"abstract\": \"Penetrasi dan minat pembelian online di Indonesia yang relatif rendah untuk produk pakaian\\nserta tingginya penggunaan jejaring sosial menunjukkan perlunya model yang menjelaskan\\nvariabel-variabel apa yang mempengaruhi keputusan pembelian online dalam jejaring sosial. \\nPenelitian ini bertujuan menawarkan sebuah model dengan meneliti pengaruh Social Capital, \\neWOM dan Minat Pembelian Online terhadap Keputusan Pembelian Online yang dilakukan \\npada pengguna Facebook di Indonesia. Hasil penelitian ini diharapkan dapat \\nmenggambarkan, menganalisis, dan menguji pengaruh dari variabel-variabel yang diteliti\\nterhadap Keputusan Pembelian Online. Metode penelitian yang digunakan adalah analisis \\ndeskriptif dan verifikatif. Pengumpulan data dilakukan dengan menyebarkan kuesioner \\npengguna Facebook di Indonesia yang pernah melakukan pembelian online dan mendapatkan \\neWOM. Sebanyak 220 sampel yang diperoleh menggunakan metode non probabilitas dengan \\nteknik purposive sampling diolah menggunakan teknik analisis Partially Least Square \\nStructural Equation Modeling. Hasil deskriptif menunjukkan bahwa tingkat Social Capital\\nberada pada posisi sedang, sementara tingkat eWOM, Minat Pembelian Online dan \\nKeputusan Pembelian Online berada pada posisi tinggi. Hasil pengujian verifikatif \\nmenunjukkan bahwa Social Capital memiliki pengaruh terhadap eWOM, dan Minat \\nPembelian Online, eWOM memiliki pengaruh terhadap Minat Pembelian Online dan Minat \\nPembelian Online memiliki pengaruh terhadap Keputusan Pembelian Online. Berdasarkan \\nmodel penelitian ini, pemasar online dapat memanfaatkan dimensi-dimensi yang ada pada\\nsocial capital melalui aktivitas mereka di jejaring sosial untuk meningkatkan pembelian \\nonline. Temuan lain adalah koefisien pengaruh langsung eWOM terhadap keputusan \\npembelian online yang rendah. Hal ini dipicu oleh banyaknya berita hoax yang sering beredar \\ndi jejaring sosial Indonesia akhir-akhir ini.\\n\", \"nim_mhs\": \"188123010\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', 'UPDATE', '2022-12-30 14:05:12'),
(19, '{\"judul\": \"ETIKA BISNIS PERDAGANGAN MENURUT ALQURAN\", \"abstract\": \"Perdagangan bebas dan arus globalisasi yang tidak bisa dikendalikan lagi \\nmenimbulkan benturan-benturan kepentingan antara satu pebisnis perdagangan \\ndengan pebisnis perdagangan lainnya. Realitas ini timbul akibat para pelaku \\nbisnis perdagangan terlalu bernafsu untuk memperoleh keuntungan yang \\nsebanyak-banyaknya dengan tidak mengindahkan nilai-nilai moralitas. \\nKemunculan wacana pemikiran urgensitas etika bisnis perdagangan berbasis \\nAlquran didorong oleh doktrin bahwa Alquran merupakan kitab suci umat Islam \\nyang dapat menjadi pedoman bagi seluruh umat manusia.\\nDisertasi ini ingin menelaah bagaimana etika bisnis perdagangan menurut \\nAlquran. Tema kajian yang mengitarinya meliputi persoalan mengenai simpul simpul bisnis perdagangan menurut Alquran, aksioma-aksioma bisnis \\nperdagangan menurut Alquran dan etika bisnis perdagangan islami. Kajian \\ndisertasi ini menggunakan pendekatan tafsir maud}u’i dengan metode analisis \\ntematik, analisis isi, analisis komparatif dan analisis reflektif kritis.\\nHasil pembahasan mengungkapkan bahwa bisnis menurut bahasa Alquran \\ndisebut al-kasb, al-‘aml dan as-sa’yu. Dari antara ketiga terma ini, al-kasb \\nmerupakan terma yang paling dekat dengan bisnis. Karena terminologinya tidak \\nhanya sama dengan terminologi bisnis secara umum, sebagaimana dikemukakan \\npara pakar ekonomi, tetapi juga karena Alquran dan hadis secara gamblang \\nmengungkap dan menggunakan terma al-kasb untuk mengistilahkan usaha bisnis.\\nMaka muncullah simpul-simpul bisnis, yaitu: pertama, simpul bisnis ekstratif; \\nkedua, simpul bisnis agraris; ketiga simpul bisnis industri manufaktur; keempat \\nsimpul bisnis service; dan kelima simpul bisnis perdagangan. Keseriusan Alquran \\ndalam persoalan bisnis ditandai adanya aksioma-aksioma bisnis perdagangan, \\nyaitu bahwa Alquran menjelaskan bahwa hal yang bisa menggantikan praktik \\nriba adalah konsep bisnis perdagangan islami. Peranti-peranti yang digunakan \\nAlquran meliputi akad at-tija>rah, akad mudhārabah, akad musyārakah, akad \\nijārah, akad qard} al-h}asan, akad ar-rahn dan lain-lain. Realitas akad-akad ini \\nmemunculkan bisnis-bisnis islami yang harus diperhatikan umat\\nIslam. Tawaran Alquran tentang metode dan tata cara berbisnis perdagangan \\ndidasari oleh realitas doktrin, yaitu: doktrin al-i>ma>n (ketauhidan); doktrin al-‘adl \\n(Keadilan); doktrin al-khiya>r (bebas pilihan); doktrin al-mas’u>liyah (tanggung \\njawab); doktrin al-ih}sa>n (kebajikan) dan doktrin as}-s}idq (Kejujuran). Doktrin doktrin ini tentu berbeda dengan doktrin bisnis konvensional seperti otonomi, \\nkejujuran, keadilan, saling menguntungkan dan berintegritas moral, karena \\ndoktrin tersebut didasari oleh konsep pemikiran kapitalistik dan monopolistik.\\nPentingnya bisnis perdagangan islami disebabkan semakin mengguritanya \\nfenomena pelanggaran bisnis perdagangan baik domestik maupun internasional. \\nPelanggaran-pelanggaran yang terjadi mulai dari pemalsuan, fraud, drug \\ntrafficking, dumping, sweatshop, perburuhan anak dan bisnis perdagangan \\nmanusia. Alquran menawarkan konsep etika bisnis perdagangan domestik, yaitu \\npertama, perlunya penekanan internalisasi spritualitas Islam; kedua, harus \\nmenciptakan sistem dan mekanisme pencegahan tindakan al-ba>t}il mulai dari \\npersoalan pemalsuan, praktik penimbunan, praktik kecurangan dan praktik \\nribawi; ketiga menciptakan produk halal dengan salah satu indikator pelabelan \\nproduk; dan keempat pada setiap bisnis perdagangan harus menerapkan akuntansi \\nsyari’ah. Alquran juga menawarkan konsep etika bisnis perdagangan \\ninternasional. Selain konsep etika bisnis perdagangan domestik tersebut, konsep \\nlain menurut Alquran ialah pertama, perlunya mengoptimalkan religiusitas para \\npebisnis perdagangan internasional, karena begitu sangat jauh dan luasnya \\njangkauan bisnis perdagangannya; kedua, pebisnis perdagangan harus benar benar mencegah praktik al-ba>t}il seperti perilaku korupsi; pencegahan pendirian \\npabrik sweatshop yang merugikan para pekerja; dan mencegah tindakan buruh \\nanak; ketiga, labelisasi halal dalam kegiatan produk ekspor dan impor; dan \\nkeempat mencegah tindakan bisnis perdagangan manusia (Human Trafficking).\\n\", \"nim_mhs\": \"188123003\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', '{\"judul\": \"ETIKA BISNIS PERDAGANGAN MENURUT ALQURAN\", \"abstract\": \"Perdagangan bebas dan arus globalisasi yang tidak bisa dikendalikan lagi \\nmenimbulkan benturan-benturan kepentingan antara satu pebisnis perdagangan \\ndengan pebisnis perdagangan lainnya. Realitas ini timbul akibat para pelaku \\nbisnis perdagangan terlalu bernafsu untuk memperoleh keuntungan yang \\nsebanyak-banyaknya dengan tidak mengindahkan nilai-nilai moralitas. \\nKemunculan wacana pemikiran urgensitas etika bisnis perdagangan berbasis \\nAlquran didorong oleh doktrin bahwa Alquran merupakan kitab suci umat Islam \\nyang dapat menjadi pedoman bagi seluruh umat manusia.\\nDisertasi ini ingin menelaah bagaimana etika bisnis perdagangan menurut \\nAlquran. Tema kajian yang mengitarinya meliputi persoalan mengenai simpul simpul bisnis perdagangan menurut Alquran, aksioma-aksioma bisnis \\nperdagangan menurut Alquran dan etika bisnis perdagangan islami. Kajian \\ndisertasi ini menggunakan pendekatan tafsir maud}u’i dengan metode analisis \\ntematik, analisis isi, analisis komparatif dan analisis reflektif kritis.\\nHasil pembahasan mengungkapkan bahwa bisnis menurut bahasa Alquran \\ndisebut al-kasb, al-‘aml dan as-sa’yu. Dari antara ketiga terma ini, al-kasb \\nmerupakan terma yang paling dekat dengan bisnis. Karena terminologinya tidak \\nhanya sama dengan terminologi bisnis secara umum, sebagaimana dikemukakan \\npara pakar ekonomi, tetapi juga karena Alquran dan hadis secara gamblang \\nmengungkap dan menggunakan terma al-kasb untuk mengistilahkan usaha bisnis.\\nMaka muncullah simpul-simpul bisnis, yaitu: pertama, simpul bisnis ekstratif; \\nkedua, simpul bisnis agraris; ketiga simpul bisnis industri manufaktur; keempat \\nsimpul bisnis service; dan kelima simpul bisnis perdagangan. Keseriusan Alquran \\ndalam persoalan bisnis ditandai adanya aksioma-aksioma bisnis perdagangan, \\nyaitu bahwa Alquran menjelaskan bahwa hal yang bisa menggantikan praktik \\nriba adalah konsep bisnis perdagangan islami. Peranti-peranti yang digunakan \\nAlquran meliputi akad at-tija>rah, akad mudhārabah, akad musyārakah, akad \\nijārah, akad qard} al-h}asan, akad ar-rahn dan lain-lain. Realitas akad-akad ini \\nmemunculkan bisnis-bisnis islami yang harus diperhatikan umat\\nIslam. Tawaran Alquran tentang metode dan tata cara berbisnis perdagangan \\ndidasari oleh realitas doktrin, yaitu: doktrin al-i>ma>n (ketauhidan); doktrin al-‘adl \\n(Keadilan); doktrin al-khiya>r (bebas pilihan); doktrin al-mas’u>liyah (tanggung \\njawab); doktrin al-ih}sa>n (kebajikan) dan doktrin as}-s}idq (Kejujuran). Doktrin doktrin ini tentu berbeda dengan doktrin bisnis konvensional seperti otonomi, \\nkejujuran, keadilan, saling menguntungkan dan berintegritas moral, karena \\ndoktrin tersebut didasari oleh konsep pemikiran kapitalistik dan monopolistik.\\nPentingnya bisnis perdagangan islami disebabkan semakin mengguritanya \\nfenomena pelanggaran bisnis perdagangan baik domestik maupun internasional. \\nPelanggaran-pelanggaran yang terjadi mulai dari pemalsuan, fraud, drug \\ntrafficking, dumping, sweatshop, perburuhan anak dan bisnis perdagangan \\nmanusia. Alquran menawarkan konsep etika bisnis perdagangan domestik, yaitu \\npertama, perlunya penekanan internalisasi spritualitas Islam; kedua, harus \\nmenciptakan sistem dan mekanisme pencegahan tindakan al-ba>t}il mulai dari \\npersoalan pemalsuan, praktik penimbunan, praktik kecurangan dan praktik \\nribawi; ketiga menciptakan produk halal dengan salah satu indikator pelabelan \\nproduk; dan keempat pada setiap bisnis perdagangan harus menerapkan akuntansi \\nsyari’ah. Alquran juga menawarkan konsep etika bisnis perdagangan \\ninternasional. Selain konsep etika bisnis perdagangan domestik tersebut, konsep \\nlain menurut Alquran ialah pertama, perlunya mengoptimalkan religiusitas para \\npebisnis perdagangan internasional, karena begitu sangat jauh dan luasnya \\njangkauan bisnis perdagangannya; kedua, pebisnis perdagangan harus benar benar mencegah praktik al-ba>t}il seperti perilaku korupsi; pencegahan pendirian \\npabrik sweatshop yang merugikan para pekerja; dan mencegah tindakan buruh \\nanak; ketiga, labelisasi halal dalam kegiatan produk ekspor dan impor; dan \\nkeempat mencegah tindakan bisnis perdagangan manusia (Human Trafficking).\\n\", \"nim_mhs\": \"188123003\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', 'UPDATE', '2022-12-30 14:05:17'),
(20, '{\"judul\": \"PROGRAM PELATIHAN EXPERIENTIAL LEARNING UNTUK \\nPENGEMBANGAN KECERDASAN BUDAYA GURU BIMBINGAN DAN \\nKONSELING DI MAKASSAR\", \"abstract\": \"Proses konseling pada dasarnya merupakan pertemuan dua budaya atau lebih antara guru \\nBK dan siswa. Seorang guru BK perlu peka terhadap perbedaan budaya antara dirinya \\ndengan siswa agar siswa merasa diterima, didengarkan dan dihargai sesuai nilai-nilai \\nbudaya yang dibawa pada proses konseling. Tujuan penelitian ini adalah menghasilkan \\nprogram pelatihan experiential learning untuk mengembangkan kecerdasan budaya guru \\nBimbingan dan Konseling. Penelitian ini dilaksanakan dalam tiga tahap yaitu tahap \\npendahuluan, pengembangan program dan implementasi program. Pendekatan penelitian \\nyang digunakan adalah campuran kuantitatif-kualitatif dengan explanatory sequential \\nmixed methods. Pendekatan kuantitatif digunakan pada uji terbatas program pelatihan \\nexperiential learning melalui quasi-experiment one-group pretest-posttest design. \\nPendekatan kualitatif digunakan untuk mengeksplorasi pengalaman interaksi multibudaya \\nguru BK melalui pelatihan experiential learning. Konstruk kecerdasan budaya guru BK \\ndibuat berdasarkan uji validitas dan reliabilitas menggunakan skala kecerdasan budaya \\nyang disebar secara online dengan melibatkan partisipan sebanyak 659 guru BK dari \\nseluruh Indonesia. Untuk memperoleh gambaran kecerdasan budaya, skala yang telah \\nvalid dan reliabel tersebut disebarkan kepada 112 Guru BK di Makassar dan tahap uji \\ncoba melibatkan 6 guru Bimbingan dan Konseling. Data kuantitatif dikumpulkan \\nmenggunakan skala kecerdasan budaya guru BK dan dianalisis menggunakan Cohen \\nEffect Size dan Reliability Change Index (RCI) sedangkan data kualitatif dikumpulkan \\nmenggunakan pedoman observasi, pedoman wawancara dan rekaman video dan dianalisis \\nmenggunakan analisis deskriptif kualitatif. Hasil penelitian menunjukkan bahwa program \\npelatihan experiential learning fisibel untuk pengembangan kecerdasan budaya guru BK, \\nbaik secara total maupun keempat dimensinyanya. Nilai RCI secara total dan keempat \\ndimensinya menunjukkan nilai yang lebih besar dari 1,96. Dengan demikian \\nperkembangan kecerdasan budaya guru BK sebelum dan sesudah pelatihan experiential \\nlearning reliabilitas perubahannya dapat diandalkan. Hasil Penelitian ini \\ndirekomendasikan kepada P4TK bidang Pendidikan Jasmani dan Bimbingan dan \\nKonseling, Perguruan Tinggi khususnya Program Studi Bimbingan dan Konseling serta \\npeneliti selanjutnya.\", \"nim_mhs\": \"158123008\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', '{\"judul\": \"PROGRAM PELATIHAN EXPERIENTIAL LEARNING UNTUK \\nPENGEMBANGAN KECERDASAN BUDAYA GURU BIMBINGAN DAN \\nKONSELING DI MAKASSAR\", \"abstract\": \"Proses konseling pada dasarnya merupakan pertemuan dua budaya atau lebih antara guru \\nBK dan siswa. Seorang guru BK perlu peka terhadap perbedaan budaya antara dirinya \\ndengan siswa agar siswa merasa diterima, didengarkan dan dihargai sesuai nilai-nilai \\nbudaya yang dibawa pada proses konseling. Tujuan penelitian ini adalah menghasilkan \\nprogram pelatihan experiential learning untuk mengembangkan kecerdasan budaya guru \\nBimbingan dan Konseling. Penelitian ini dilaksanakan dalam tiga tahap yaitu tahap \\npendahuluan, pengembangan program dan implementasi program. Pendekatan penelitian \\nyang digunakan adalah campuran kuantitatif-kualitatif dengan explanatory sequential \\nmixed methods. Pendekatan kuantitatif digunakan pada uji terbatas program pelatihan \\nexperiential learning melalui quasi-experiment one-group pretest-posttest design. \\nPendekatan kualitatif digunakan untuk mengeksplorasi pengalaman interaksi multibudaya \\nguru BK melalui pelatihan experiential learning. Konstruk kecerdasan budaya guru BK \\ndibuat berdasarkan uji validitas dan reliabilitas menggunakan skala kecerdasan budaya \\nyang disebar secara online dengan melibatkan partisipan sebanyak 659 guru BK dari \\nseluruh Indonesia. Untuk memperoleh gambaran kecerdasan budaya, skala yang telah \\nvalid dan reliabel tersebut disebarkan kepada 112 Guru BK di Makassar dan tahap uji \\ncoba melibatkan 6 guru Bimbingan dan Konseling. Data kuantitatif dikumpulkan \\nmenggunakan skala kecerdasan budaya guru BK dan dianalisis menggunakan Cohen \\nEffect Size dan Reliability Change Index (RCI) sedangkan data kualitatif dikumpulkan \\nmenggunakan pedoman observasi, pedoman wawancara dan rekaman video dan dianalisis \\nmenggunakan analisis deskriptif kualitatif. Hasil penelitian menunjukkan bahwa program \\npelatihan experiential learning fisibel untuk pengembangan kecerdasan budaya guru BK, \\nbaik secara total maupun keempat dimensinyanya. Nilai RCI secara total dan keempat \\ndimensinya menunjukkan nilai yang lebih besar dari 1,96. Dengan demikian \\nperkembangan kecerdasan budaya guru BK sebelum dan sesudah pelatihan experiential \\nlearning reliabilitas perubahannya dapat diandalkan. Hasil Penelitian ini \\ndirekomendasikan kepada P4TK bidang Pendidikan Jasmani dan Bimbingan dan \\nKonseling, Perguruan Tinggi khususnya Program Studi Bimbingan dan Konseling serta \\npeneliti selanjutnya.\", \"nim_mhs\": \"158123008\", \"nama_kategori_repo\": \"Disertasi\", \"prodi\": \"S3 Ilmu Komputer\"}', 'UPDATE', '2022-12-30 14:05:23'),
(26, NULL, '{\"judul\": \"JUDULTA26\", \"abstract\": \"TESTESTES\", \"nim_mhs\": \"117038026\", \"nama_kategori_repo\": \"Skripsi\", \"prodi\": \"Ilmu Komputer\"}', 'INSERT', '2022-12-30 00:39:26'),
(26, '{\"judul\": \"JUDULTA26\", \"abstract\": \"TESTESTES\", \"nim_mhs\": \"117038026\", \"nama_kategori_repo\": \"Skripsi\", \"prodi\": \"Ilmu Komputer\"}', '{\"judul\": \"JUDUL\", \"abstract\": \"TESTESTES\", \"nim_mhs\": \"117038026\", \"nama_kategori_repo\": \"Skripsi\", \"prodi\": \"Ilmu Komputer\"}', 'UPDATE', '2022-12-30 00:39:50'),
(26, '{\"judul\": \"JUDUL\", \"abstract\": \"TESTESTES\", \"nim_mhs\": \"117038026\", \"nama_kategori_repo\": \"Skripsi\", \"prodi\": \"Ilmu Komputer\"}', NULL, 'DELETE', '2022-12-30 00:40:06'),
(31, '{\"judul\": \"Test judul\", \"abstract\": \"Halo semua \", \"nim_mhs\": \"117038038\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', '{\"judul\": \"Test judul\", \"abstract\": \"Halo semua \", \"nim_mhs\": \"117038038\", \"nama_kategori_repo\": \"Thesis\", \"prodi\": \"S2 Data Science and Artificial\"}', 'UPDATE', '2022-12-30 14:06:01');

--
-- Triggers `log_tugas_akhir`
--
DELIMITER $$
CREATE TRIGGER `jgn_delete_log_tugas_akhir` BEFORE DELETE ON `log_tugas_akhir` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh dihapus';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jgn_update_log_tugas_akhir` BEFORE UPDATE ON `log_tugas_akhir` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tabel log tidak boleh diupdate';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(9) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `email`) VALUES
('117038026', 'Kenneth Zimmerman', 'kennzimm@students.usu.ac.id'),
('117038038', 'Loran Berger', 'loranberger@students.usu.ac.id'),
('147038015', 'Jonnie Long', 'jonnielong@students.usu.ac.id'),
('158123008', 'Hannah Calhoun', 'hanncalhoun@students.usu.ac.id'),
('161401001', 'Harmony Vaughn', 'harmonyvaughn@students.usu.ac.id'),
('161402003', 'Fiona Kaiser', 'fkaiser@students.usu.ac.id'),
('171401109', 'Tomas Bailey', 'tomasbailey@students.usu.ac.id'),
('171401198', 'Kelsie Mccall', 'kelsiemccall@students.usu.ac.id'),
('171402094', 'Gabriela Rosario', 'gabrielarosario@students.usu.ac.id'),
('177038049', 'Chesley Atkinson', 'cheslye@students.usu.ac.id'),
('181401002', 'Rafael Cowan', 'rafaelcowan@students.usu.ac.id'),
('181401051', 'Isabel Fletcher', 'isabel@students.usu.ac.id'),
('181401087', 'Anderson Maxwell', 'andersonmax@students.usu.ac.id'),
('181401123', 'Paisley Pham', 'paisleypham@students.usu.ac.id'),
('181401152', 'Serenity Brock', 'serenity@students.usu.ac.id'),
('181402009', 'Mayra Noble', 'mayranoble@students.usu.ac.id'),
('181402019', 'Taniyah Fitzgerald', 'taniyah@students.usu.ac.id'),
('181402149', 'Siena Meyer', 'sienameyer@students.usu.ac.id'),
('187038050', 'Judson May', 'judsonmay@students.usu.ac.id'),
('187038055', 'Katherine Gibbs', 'kathgibbs@students.usu.ac.id'),
('188123003', 'Palmer Henderson', 'palmer@students.usu.ac.id'),
('188123009', 'Justin Riley', 'justinriley@students.usu.ac.id'),
('188123010', 'Johnnie Sellers', 'johnsell@students.usu.ac.id'),
('191401098', 'Sterling Delgado', 'delgado@students.usu.ac.id'),
('191402004', 'Lilah Murray', 'lmurray@students.usu.ac.id'),
('191402012', 'Maximillian Hodges', 'maxhodges@students.usu.ac.id'),
('197038012', 'Lilian Cooley', 'liliancooley@students.usu.ac.id'),
('201401100', 'Shane Oconnell', 'shaneoconnell@students.usu.ac.id'),
('201402076', 'Magdalena Vaughan', 'magdalenavghn@students.usu.ac.id'),
('201402088', 'Jaeden Esparza', 'jaedenesparza@students.usu.ac.id'),
('211402111', 'Micah Solomon', 'micahsolomonn@students.usu.ac.id');

-- --------------------------------------------------------

--
-- Table structure for table `penelitian_dosen`
--

CREATE TABLE `penelitian_dosen` (
  `id` int(4) NOT NULL,
  `judul` longtext NOT NULL,
  `nama_anggota` text NOT NULL,
  `tgl_upload` date NOT NULL,
  `id_kategori_repo` int(2) NOT NULL,
  `abstract` longtext NOT NULL,
  `file_url` longtext DEFAULT NULL,
  `id_prodi` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penelitian_dosen`
--

INSERT INTO `penelitian_dosen` (`id`, `judul`, `nama_anggota`, `tgl_upload`, `id_kategori_repo`, `abstract`, `file_url`, `id_prodi`) VALUES
(1, 'ELECTRICAL LOAD FORECASTING USING ADAPTIVE NEURO-FUZZY INFERENCE SYSTEM', 'Simon Siregar,Dandi Pulungan,Heru Sunandar', '2022-12-05', 8, 'Electrical load forecasting is well-known as one of the most \nimportant challenges in the management of electrical supply and \ndemand and has been studied extensively. Electrical load forecasting \nis conducted at different time scales from short-term, medium-term \nand long-term load forecasting. Adaptive neuro-fuzzy inference \nsystem is a model that combines fuzzy logic and adaptive neuro \nsystem and is implemented in time-series forecasting. First, ANFIS \nstructure is decided using subtractive categorization; next, ANFIS \npremise and consistent parameters are identified using hybrid \nalgorithm; finally, some factors affecting future daily electrical load \nsuch as weather and population become inputs of ANFIS to forecast \ndaily electrical load on the following day. The membership function \nused is Gbell membership function. The forecasting result shows \nthat the forecasting model is considered valid with an RMSE score \nof 0,0298.', '001-Penelitian.pdf', 2),
(2, 'RULE OPTIMIZATION OF FUZZY INFERENCE SYSTEM SUGENO USING EVOLUTION STRATEGY FOR ELECTRICITY CONSUMPTION FORECASTING', 'Hendri Danny,Adalyn Wood,Apriangga', '2022-12-05', 8, 'The need for accurate load forecasts will increase in the future because of the \ndramatic changes occurring in the electricity consumption. Sugeno fuzzy \ninference system (FIS) can be used for short-term load forecasting. However, \nchallenges in the electrical load forecasting are the data used the data trend. \nTherefore, it is difficult to develop appropriate fuzzy rules for Sugeno FIS. \nThis paper proposes Evolution Strategy method to determine appropriate \nrules for Sugeno FIS that have minimum forecasting error. Root Mean \nSquare Error (RMSE) is used to evaluate the goodness of the forecasting \nresult. The numerical experiments show the effectiveness of the proposed \noptimized Sugeno FIS for several test-case problems. The optimized Sugeno \nFIS produce lower RMSE comparable to those achieved by other well known method in the literature.', '002-Penelitian.pdf', 2),
(3, 'CLUSTERING NASABAH BANK BERDASARKAN TINGKAT LIKUIDITAS MENGGUNAKAN HYBRID PARTICLE SWARM OPTIMIZATION DENGAN K-MEANS', 'Zahra Zetira,Kasim Azhari,Fifia Zahra', '2022-12-05', 8, 'Setiap Bank memiliki layanan dalam meminjamkan modal kepada suatu perusahaan. Namun nominal \npinjaman modal tidaklah sedikit. Sehingga untuk mencegah pengembalian modal dapat dilakukan dengan lancar, \ndiperlukan clustering perusahaan berdasarkan analisa likuiditas. Pada penelitian ini, clustering dilakukan menggunakan \nhybrid Particle Swarm Optimization dengan K-Means (PSO-KMeans). Metode hybrid tersebut digunakan untuk \nmendapatkan hasil cluster yang tidak terjebak dalam solusi optimum lokal. Hasil yang diperoleh dari hybrid PSO K Means menunjukkan hasil yang lebih baik jika dibandingkan dengan menggunakan algoritma K-Means tanpa hybrid. Hal \nini dibuktikan dengan perolehan centroid terbaik yang ditunjukkan dengan nilai Silhouette Coefficient yang diperoleh \nhybrid PSO K-Means lebih baik dibandingkan K-Means.', '003-Penelitian.pdf', 2),
(4, 'LAND CLUSTERING FOR POTATO PLANTS USING HYBRID PARTICLE\nSWARM OPTIMIZATION AND K-MEANS IMPROVED BY RANDOM INJECTION\n', 'Indira Maya,Khaleed Khaasmiri,Eka Pratama', '2022-12-05', 8, 'This research was conducted in Batu city, by classifying land based\non land suitability for potato crops. Batu city is a hilly area with a high land\nslope so that there is a high potential for land degradation. Potato crop\nproduction is influenced by climate, suitability of planting land and treatment\nbefore harvest. Based on these problems, land mapping is needed so that it is\neasier for farmers to determine the optimal planting location for potato crops.\nThe land mapping process is carried out using clustering techniques. The\nclustering process is carried out using 11 land suitability criteria for potato crops\nincluding average temperature, first month rainfall, second and third month\nrainfall, fourth month rainfall, drainage, soil texture, soil depth, Ph H2O, C-\nOrganic, CEC and slope. The clustering results are 4 land suitability classes\nwhich are very suitable (S1), suitable (S2), quite suitable (S3) and not suitable\n(N). The clustering process is carried out using 5 different architectures namely\nK-Means, Particle swarm optimization (PSO), K-Means PSO, PSO K-Means,\nand Particle Swarm Optimization and K-Means (KCPSO) hybrids. The fitness\nvalue is calculated using the silhouette coefficient calculation. Architectural\ntesting is done to get an architecture that has the highest fitness value. In this\nstudy a new approach was used to improve the accuracy of clustering results in\nthe KCPSO architecture using the random injection method. Based on the test\nresults, the KCPSO architecture obtained the biggest fitness values compared to\nthe other fife clustering architectures. Testing the results of clustering is done by\ncomparing the results of the KCPSO method with expert calculations.\n', '004-Penelitian.pdf', 2),
(5, 'IMPACT OF CHANGE IN SOFTWARE DEVELOPMENT PROJECT\nMANAGEMENT METHOD ON HUMAN RESOURCE BEHAVIOUR : CASE STUDY IN PT. SVM\n', 'Sigit Andrian,Adrianto,Kayza Fitri', '2022-12-05', 8, 'System Development Life Cycle (SDLC) method\nchanges in an organization can occur due to the encouragement\nof various internal and external factors. These changes have\ncertain stages in accordance with the culture or habits of the\ncompany\'s HR. The purpose of this study was to know the stage\nof changes and the factors driving and inhibiting the changes of\nSDLC at PT SVM. So that, it could be analyzed the impact of the\nmethod changes for the project done. In this study, the authors\nused the Lewin’s Framework to analyze HR behavior on SDLC\nchanges from Waterfall method to Scrum method. Techniques for\nthe data collection or information were FGD and personal\ninterview with PT SVM. The results of this study indicated that\nthe stage of changes made by PT SVM were in accordance with\nthe Lewin’s Framework.\n', '005-Penelitian.pdf', 2),
(6, 'MAMMOGRAM CLASSIFICATION SCHEME USING 2D-DISCRETE WAVELET\nAND LOCAL BINARY PATTERN FOR DETECTION OF BREAST CANCER\n', 'Farhat Abbas,Ardit Ginting,Bintang Halim', '2022-12-05', 8, 'In this paper, we propose a new mammogram classification scheme to classify the\nbreast tissues as normal or abnormal. Feature matrix is generated using Local Binary Pattern to\nall the detailed coefficients from 2D-DWT of the region of interest (ROI) of a mammogram.\nFeature selection is done by selecting the relevant features that affect the classification. Feature\nselection is used to reduce the dimensionality of data and features that are not relevant, in this\npaper the F-test and Ttest will be performed to the results of the feature extraction dataset to\nreduce and select the relevant feature. The best features are used in a Neural Network classifier\nfor classification. In this research we use MIAS and DDSM database. In addition to the\nsuggested scheme, the competent schemes are also simulated for comparative analysis. It is\nobserved that the proposed scheme has a better say with respect to accuracy, specificity and\nsensitivity. Based on experiments, the performance of the proposed scheme\n', '006-Penelitian.pdf', 2),
(7, 'ANALISIS SOSIAL MEDIA PEMERINTAH DAERAH DI INDONESIA BERDASARKAN RESPONS WARGANET\n', 'Kusuma Wijaya,Jason Darui,Karin Nala', '2022-12-05', 8, 'Penggunaan electronic Government (e-Government) berupa media sosial oleh pemerintah daerah digunakan untuk meningkatkan interaksi antara pemerintah dengan masyarakat. Namun pada kenyataannya, layanan e-Government berupa media sosial ini masih belum mendapatkan respon dari masyarakat. Dengan demikian, diperlukan strategi variasi\nposting yang digunakan berupa video, gambar, atau teks untuk memperoleh respons dari masyarakat berupa like pada media sosial. Tujuan penelitian ini adalah menganalisis 39 media sosial pemerintah daerah yang paling aktif berdasarkan like dan analisis sentimen masyarakat. Metode pengumpulan data dengan teknik crawling menggunakan API Facebook.\nData terbagi menjadi tiga kategori di antaranya adalah gambar, video, dan teks. Temuan yang diperoleh dari penelitian ini adalah posting yang berupa video dalam media sosial lebih banyak memperoleh respon positif daripada posting yang berupa gambar dan teks. Selain itu, berdasarkan analisis sentimental masyarakat, tingkat sentimen pada halaman Facebook pemerintah daerah di Indonesia tergolong positif.\n', '007-Penelitian.pdf', 2),
(8, 'INDONESIA\'S PUBLIC APPLICATION PROGRAMMING INTERFACE (API)\n', 'Nayla Putri,Fitri Kyla,Kayla Azzahra', '2022-12-05', 8, 'Indonesia places the fifth position of the most internet users in the world. Consequently, data transaction through HTTP protocol saw an increase. An open API can facilitate Indonesia\'s users to access data and build application through HTTP protocol. In this paper, 38 open APIs were investigated and classified by using five criteria, namely technology, authentication, scope, source, and approval request. In general, the open APIs in Indonesia employ RESTful as a web service and JSON format as data format. In term of authentication, API key is a common method in most of open APIs.\n', '008-Penelitian.pdf', 2),
(9, 'EVALUASI PENERIMAAN END-USER TERHADAP APLIKASI UNIVERSITY CUSTOMER CARE CENTER (UC3) UNIVERSITAS JEMBER DENGAN MENGGUNAKAN PENDEKATAN UNIFIED THEORY OF ACCEPTANCE AND USE OF TECHNOLOGY (UTAUT)\n', 'Oktavia Indri,Kiki Korla,Andre Wang', '2022-12-05', 8, 'University Customer Care Center (UC3) is a complaint service system for active academic civitas of the University of Jember. Implementation of UC3 is expected to optimize complaints complaint related to performance evaluation at the University of Jember. One of the keys to the successful implementation of information technology, The purpose of the study is to know the factors that influence the acceptance of the academic civitas in using the UC3 application. This research will use the Unified Theory of Acceptance and Use of Technology (UTAUT) method by utilizing the Performance Expectancy (PE) variable, Effort Expectancy (EE), Social Influence (SI), and Facilitating Condition (FC) to see how it affects the intensity of application usage UC3 And the influence of moderator variables (Age and Experience) to the relationships of those variables. Based on the results of data analysis PLS-SEM known that the PE, EE, and SI variables have a positive and significant effect on the Behavioral Intention (BI) variables as well as the FC and BI variables significantly positive and significant to the Use Behavior (UB) variables. Age influences inter-variable relationships for ages 26-35 years, 36-45 years, and >45 years, while Experience influences the relationship between variables for usage intensity ≥3 times. Based on the results of the five hypotheses received can be interpreted that the UC3 application was accepted by the academic and the acceptance is still not fully.\n', '009-Penelitian.pdf', 2),
(10, 'DESIGN OF INFORMATION SYSTEM DEVELOPMENT STRATEGY\nBASED ON THE CONDITIONS OF THE ORGANIZATION\n', 'Edi Huang,Chintya Kila,Kelra Anggini', '2022-12-05', 8, 'Abstract— The growth of information technology\nsystems caused changes in the role of information technology\nsystems. Now, the role of information technology system is not\nonly for efficiency and effectiveness, but also for the strategy to\nwin the competition. Good design of information system planning\ndevelopment strategy will help The XYZ Credit Union to survive\nand to compete with competitors, both of the provinces in\nIndonesia as well as from Southeast Asia. A proposed design of\ninformation system planning development strategy that will be\ndiscussed in this research is using the BSC analysis\nmethod, with CSFs to analyze strategy objective and Critical\nFactors Influence Of Organizational Strategic Goals, along with\ngap analysis and Mc Farlan to measure the current information\nsystem and the new information system planning that proposed.\nResults of this research is design of information system planning\ndevelopment strategy to help The XYZ Credit Union business\nprocess forward.\n', '010-Penelitian.pdf', 2),
(11, 'Sentiment analysis system for movie review in Bahasa Indonesia using naive bayes classifier method\n', 'Bambang Tri,Fitria Azzura,Fikri Ahsan', '2022-12-05', 8, 'There are many ways of implementing the use of sentiments often found in\ndocuments; one of which is the sentiments found on the product or service reviews. It is so\nimportant to be able to process and extract textual data from the documents. Therefore, we\npropose a system that is able to classify sentiments from review documents into two classes:\npositive sentiment and negative sentiment. We use Naive Bayes Classifier method in this\ndocument classification system that we build. We choose Movienthusiast, a movie reviews\nin Bahasa Indonesia website as the source of our review documents. From there, we were\nable to collect 1201 movie reviews: 783 positive reviews and 418 negative reviews that we\nuse as the dataset for this machine learning classifier. The classifying accuracy yields an\naverage of 88.37% from five times of accuracy measuring attempts using aforementioned\nDataset.\n', '011-Penelitian.pdf', 2),
(12, 'Penerapan Metode Certainty Factor Untuk Sistem Pakar Diagnosis Hama Dan\n\nPenyakit Pada Tanaman Tembakau\n', 'Galih Ramadhan,Ramlah Cika,Polan Diki', '2022-12-05', 8, 'Proses budidaya tanaman tembakau dipengaruhi oleh berbagai faktor, salah satunya adalah faktor hama dan penyakit.\nUmumnya, masalah petani membedakan antara hama dan penyakit, hal ini karena sebagian besar petani kekurangan\ninformasi dan masih mengandalkan pengalaman petani lain untuk mengatasi masalah hama dan penyakit yang ada. Sering\nterjadi kesalahan dalam membedakan antara hama dan penyakit, seperti hama diberantas dengan obat untuk penyakit\n(fungisida), sebaliknya, penyakit diberantas dengan obat hama (insektisida). Sebagai hasil dari hama dan penyakit yang tidak\nterkontrol dan terus menyerang tanaman, sehingga merugikan banyak biaya dan usaha. Pada penanganan hama dan penyakit,\ndibutuhkan konsultan pertanian yang mampu mendiagnosa hama dan penyakit pada tanaman tembakau. Dalam penelitian\nini, sistem pakar diagnosis hama dan penyakit pada tanaman tembakau dibangun untuk membantu mendiagnosa jenis hama\natau penyakit yang menyerang tanaman tembakau, serta memberikan berbagai solusi untuk hama atau penyakit. Metode\nyang digunakan pada sistem pakar ini adalah metode Certainty Factor. Metode Certainty Factor dipilih karena metode ini\ncocok dalam proses penentuan identifikasi hama dan penyakit, dan hasil dari penerapan metode ini adalah persentase.\nPersentase sistem disini merupakan tingkat akurasi penentuan penyakit atau hama yang menjangkiti tanaman tembakau.\nPenentuan persentase dipengaruhi oleh nilai MB yang didapat dari sistem dan nilai MD yang didapat dari penilaian seorang\npakar. Berdasarkan penelitian yang dilakukan, penentuan hama atau penyakit yang menyerang tanaman tembakau\ndipengaruhi oleh pemilihan gejala. Persentase pada konsultasi sistem pakar diambil dari hasil tertinggi pertama dan kedua,\nsebagai alternatif hama lain atau penyakit yang menyerang tanaman tembakau.\n', '012-Penelitian.pdf', 2),
(13, 'Optimal computer network based on graph\ntopology model\n', 'Putri Indah,Niki Zera,Kara Nindy', '2022-12-05', 8, 'In large computer network design, it is desirable to have connections which\nachieve the most efficient and reliable communication. In such design, there are several\nfactors which should be considered. Two of the factors which seem to appear most\nfrequently are, (a) the number of connection which can be attached to a computer is limited,\nand (b) a short communication route between any two computers is required. Thus, it will\nend up with a large network subject to these constraints. The computer network can be\nmodelled as a graph, where each computer is represented by a vertex, and the connection\nbetween the two computers is represented by an edge. In this paper, we compare the\nefficiency and reliability of computer networks based on their graph topology model. The\nmethod used in this study is literature study, designing the new topology, and making\nsimulation and testing using a software simulator called Graphical Network Simulator 3\n(GNS3). The results of this study are the comparison of the application of prism and petersen\ngraph topologies in computer networks topology.\n', '013-Penelitian.pdf', 2),
(14, 'PERBANDINGAN ALGORITMA GENETIKA DENGAN ALGORITMA GREEDY UNTUK PENCARIAN RUTE TERPENDEK\n', 'Mike Wazowski,Julius Sullivan,Mustika Ratu', '2022-12-05', 8, 'In everyday life we often travel from place to place. So that we need to consider the time and cost efficient. Therefore, accuracy is needed to determine the shortest path as a consideration in decision to show the path to be taken. The results obtained also require speed and accuracy with the help of a computer. Using or functioning a computer there must be a distributed program in it. The programs contained in the computer vary widely and each program must use an algorithm. Algorithm is a collection of commands to solve a problem gradually from start to finish. There are various algorithms that can be used to find the shortest route such as Breadth First Search algorithm, Depth First Search, A *, Hill Climbing and others. For that required comparison algorithm which is able to find the shortest route accurately and efficiently. In this journal, the algorithm to be compared is the genetic algorithm and greedy algorithm to find the shortest route on a map. Some aspects to be compared are aspects of the accuracy, speed, and complexity of genetic algorithms and greedy algorithms for the shortest route search.\n', '014-Penelitian.pdf', 2),
(15, 'KLASIFIKASI BERITA POLITIK MENGGUNAKAN ALGORITMA K-NEARST NEIGHBOR\n', 'Samson Dwi,Sekar Ningsih,Fulan Egi', '2022-12-05', 8, 'Klasifikasi konten berita politik menggunakan algoritma K-Nearest Neighbor merupakan suatu proses untuk mengklasifikasikan berita politik ke dalam tiga subkategori yang lebih spesifik yaitu pilkada, UU ORMAS dan reshuffle kabinet. Algoritma yang digunakan dalam penelitian ini adalah algoritma K-Nearest Neighbor. Algoritma K-Nearest Neighbor merupakan suatu pendekatan klasifikasi yang mencari semua data training yang paling relatif mirip atau memiliki\njarak yang paling dekat dengan data testing. Algoritma ini dipilih karena K-Nearest Neighbor merupakan algoritma yang sederhana dengan mencari kategori mayoritas sebanyak nilai K yang telah ditentukan sebelumnya. nilai K yang digunakan pada penelitian ini adalah K=3, K=5, K=7 dan K=9. Mekanisme dari sistem klasifikasi konten berita ini dimulai dengan tahap preprocessing. Berita politik yang dimasukkan kedalam sistem akan melewati empat tahap preprocessing yaitu case folding, tokenizing, stopword dan stemming. Tahap selanjutnya yaitu tahap pembobotan term. Pembobotan atau term weighting merupakan proses mendapatkan nilai term yang berhasil diekstrak dari proses sebelumnya yaitu proses preprocessing. Algoritma yang digunakan untuk tahap pembobotan pada penelitian ini adalah algoritma TFIDF. Setelah didapatkan nilai dari bobot term, kemudian dicari nilai jarak antar dokumen menggunakan algoritma cosine similarity. Langkah berikutnya adalah melakukan pengurutan data dalam data training berdasarkan hasil perhitungan nilai jarak. Selanjutnya, dari hasil pengurutan tersebut diambil sejumlah K data yang memiliki nilai kedekatan. Tujuan dari penelitian ini adalah sistem mampu mengimplementasikan algoritma KNN pada dokumen yang memiliki similarity yang tinggi. Pada penelitian ini dilakukan 3 pengujian dengan tiga variasi dataset yang berbeda dengan empat nilai K. Hasil akurasi yang terbaik didapatkan ketika sistem menggunakan nilai K=9 yang menunjukkan nilai precision sebesar 100%, recall sebesar\n100% dan nilai f-measure sebesar 100%.\n', '015-Penelitian.pdf', 2),
(16, 'USABILITY TESTING ANALYSIS ON THE BANA GAME AS EDUCATION\nGAME DESIGN REFERENCES ON JUNIOR HIGH SCHOOL\n', 'Nanda Banu,Mona Yolanda,Chika Mika', '2022-12-05', 8, 'Learning media is one of the important elements in the learning process. Technological development support makes learning media more varied. The approach of using digital technology as a learning media has a bette and more effective impact than other approaches. In order to increase the students’ learning interest, it requires\nthe support of an interesting learning media. The use of gaming applications as learning media can improve learning outcomes. The benefits of using the maximum application cannot be separated from the determination of application design. The Bana game aims to increase the ability of critical thinking of the junior high school students. The usability-testing analysis on the Bana game application is used in order to get the design reference as an educational game development. The game is used as an object of the analysis because it has the same char-\nacteristics and goals with the game application to be developed. Usability Testing is a method used to measure the ease of use of an application by users. The Usability Testing consists of learnability, efficiency, memorability, errors, and satisfaction. The results of the analysis obtained will be used as a reference for educational game applications that will be developed.\n', '016-Penelitian.pdf', 2),
(17, 'OPTIMIZATION OF NON-UNIFORM RELATIONAL B-SPLINE SURFACE RECONSTRUCTION USING GROWING GRID- DIFFERENTIAL EVOLUTION\n', 'Minnie Winnie,Nadya Zahra,Raihan Jamilah', '2022-12-05', 8, 'Computer graphics is a fast growing field as it contributes significantly to the\nadvancement of modern technology aimed at empowering human and nation wealth\ncreation. Computer-Aided Design (CAD), Computer-Aided Manufacturing (CAM) and\nComputer-Aided Geometric Design (CAGD) are commonly used to reconstruct surfaces\nin order to obtain a set of limited and disorganized geometric sample values. The process\nof surface reconstruction consists of two main steps: parameterization and surface fitting.\nVarious solutions have been used in previous studies to reconstruct surfaces such as Non\nUniform Rational B-Spline (NURBS) and B-Spline. However, in recent years, Artificial\nIntelligence (AI) methods such as Advanced Neural Network and Evolutionary Algorithm\n(EA) have emerged and are extensively used to reconstruct and optimize complex\nsurfaces. This study aims to optimize NURBS surfaces from unstructured 3D data points\nwith feasible control points while preserving the shape of the objects by using Differential\nEvolution Algorithm (DEA). The Growing Grid Network (GGN) is implemented on a\nmap structure, while DEA is optimally fit on to the NURBS surfaces. In this study,\nundefined or unstructured data points from several 2D and 3D datasets were used to\nvalidate the performance of the proposed method. An error analysis was also conducted to\nreconfirm the efficacy of the proposed algorithm. This is done by comparing the generated\nsurface with the original surface using other EAs such as: Genetic Algorithm and Particle\nSwarm Optimization. Experimental results indicate that the proposed Growing Grid\nNetwork Differential Evolution (GGNDE) has successfully generated smoother surfaces\nwith lesser number of control points and produced minimum feasible errors while\npreserving the shape of the objects.\n', '017-Penelitian.pdf', 2),
(18, 'MINIMASI MAKESPAN PENJADWALAN FLOWSHOP MENGGUNAKAN\nMETODE ALGORITMA CAMPBELL DUDEK SMITH (CDS) DAN\nMETODE ALGORITMA NAWAZ ENSCORE HAM (NEH)\n\nDI PT KRAKATAU WAJATAMA\n', 'Remi Fadilah,Nenda Ona,Budi Pandu', '2022-12-05', 8, 'PT Krakatau Wajatama merupakan perusahaan yang menggunakan sistem flowshop dan menggunakan aturan First Come First Serve (FCFS). Pada penjadwalan FCFS ini order yang telah tiba lebih dahulu akan dilayani lebih dahulu. Apabila ada order yang tiba pada saat yang bersamaan maka mereka akan dikerjakan melalui antrian Metode FCFS memiliki beberapa kelemahan antara lain, memiliki besarnya makespan (waktu penyelesaian) dan dampak lain yang di akibatkan oleh hal tersebut adalah besarnya waktu idle dan besarnya work in process (WIP), jika makespan terlalu besar dikhawatirkan kalau sewaktu-waktu terjadi keadaan dimana waktu penyelesaian dari job yang dikerjakan melewati due date yang telah ditentukan. Adapun tujuan dari penelitian ini yaitu bagaimana meminimumkan makespan pada PT Krakatau Wajatama dan bagaimana mendapatkan urutan job yang terbaik yang digunakan oleh\nPT Krakatau Wajatama. Oleh karena itu untuk dapat menjawab tujuan dari penelitian tersebut perlu dilakukan penjadwalan metode Campbell, Dudek, Smith (CDS) dan metode Nawaz, Enscore, Ham (NEH).Metode Cambell, Dudek, Smith (CDS) ini merupakan proses penjadwalan atau penugasan kerja berdasarkan atas waktu kerja yang terkecil yang digunakan dalam melakukan produksi dan metode Nawaz, Enscore, Ham (NEH) adalah penjadwalan dengan pekerjaan total waktu proses semua mesin lebih besar, seharusnya diberi bobot yang lebih tinggi untuk dimasukkan terlebih dahulu ke dalam jadwal. Hasil dari metode CDS dengan makespan sebesar 75,879 jam dan urutan job 1-2-3 makespan ini memiliki selisih sebesar 9,054 jam dari metode FCFS yang memliki makespan sebesar 84,933 jam dan urutan job 1-3-2 dengan persentasi penurunan jarak 10,66 %, sedangkan untuk metode NEH didapatkan makespan sebesar 25,195 jam dan urutan job 3-2-1 makespan ini memiliki selisih sebesar 59,738 jam dari metode FCFS dengan persentasi penurunan jarak 70,33 %. Angka ini menunjukkan total makespan dan urutan job yang diperlukan untuk meminimasi waktu idle (menganggur).\n', '018-Penelitian.pdf', 2);

--
-- Triggers `penelitian_dosen`
--
DELIMITER $$
CREATE TRIGGER `log_penelitian_dosen_delete` AFTER DELETE ON `penelitian_dosen` FOR EACH ROW BEGIN
    DECLARE n_prodi VARCHAR(50);
    SELECT nama_prodi INTO n_prodi FROM prodi WHERE id = OLD.id_prodi;
    INSERT INTO log_penelitian_dosen (
        id_penelitian,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        OLD.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "abstract", OLD.abstract,
            "anggota", OLD.nama_anggota,
            "prodi", n_prodi
        ),
        null,
        'DELETE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_penelitian_dosen_insert` AFTER INSERT ON `penelitian_dosen` FOR EACH ROW BEGIN
    DECLARE n_prodi VARCHAR(50);
    SELECT nama_prodi INTO n_prodi FROM prodi WHERE id = NEW.id_prodi;
    INSERT INTO log_penelitian_dosen (
        id_penelitian,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        null,
        JSON_OBJECT(
            "judul", NEW.judul,
            "abstract", NEW.abstract,
            "anggota", NEW.nama_anggota,
            "prodi", n_prodi
        ),
        'INSERT',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_penelitian_dosen_update` AFTER UPDATE ON `penelitian_dosen` FOR EACH ROW BEGIN
    DECLARE n_prodi VARCHAR(50);
    SELECT nama_prodi INTO n_prodi FROM prodi WHERE id = NEW.id_prodi;
    INSERT INTO log_penelitian_dosen (
        id_penelitian,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "abstract", OLD.abstract,
            "anggota", OLD.nama_anggota,
            "prodi", n_prodi
        ),
        JSON_OBJECT(
            "judul", NEW.judul,
            "abstract", NEW.abstract,
            "anggota", NEW.nama_anggota,
            "prodi", n_prodi
        ),
        'UPDATE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_judul_penelitian` BEFORE INSERT ON `penelitian_dosen` FOR EACH ROW BEGIN
DECLARE num_count INT;
SELECT COUNT(*) INTO num_count FROM penelitian_dosen WHERE LOWER(judul) = LOWER(NEW.judul);
IF num_count > 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Judul sudah ada';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_judul_update_penelitian_dosen` BEFORE UPDATE ON `penelitian_dosen` FOR EACH ROW BEGIN 
DECLARE num_count INT;
IF OLD.judul != NEW.judul THEN
	SELECT COUNT(*) INTO num_count FROM penelitian_dosen WHERE LOWER(judul) = LOWER(NEW.judul);
    IF num_count > 0 THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Judul sudah ada';
        END IF;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` int(2) NOT NULL,
  `nama_prodi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `nama_prodi`) VALUES
(1, 'S1 Ilmu Komputer'),
(2, 'S1 Teknologi Informasi'),
(3, 'S2 Teknik Informatika'),
(4, 'S2 Data Science and Artificial'),
(5, 'S3 Ilmu Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `role_akun`
--

CREATE TABLE `role_akun` (
  `id` int(4) NOT NULL,
  `email_akun` varchar(50) NOT NULL,
  `tipe_akun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_akun`
--

INSERT INTO `role_akun` (`id`, `email_akun`, `tipe_akun`) VALUES
(1, 'leandroroberson@usu.ac.id', 'admin'),
(2, 'howarderickson@usu.ac.id', 'dosen'),
(3, 'corbinleon@usu.ac.id', 'dosen'),
(4, 'adalynwood@usu.ac.id', 'dosen'),
(5, 'sagerasmussen@usu.ac.id', 'dosen'),
(6, 'cayleejensen@usu.ac.id', 'dosen'),
(7, 'bliu@usu.ac.id', 'dosen'),
(8, 'jettparks@usu.ac.id', 'dosen'),
(9, 'averyaguilar@usu.ac.id', 'dosen'),
(10, 'jadynh@usu.ac.id', 'dosen'),
(11, 'demawil@usu.ac.id', 'dosen'),
(12, 'mylie@usu.ac.id', 'dosen'),
(13, 'shaunnixon@usu.ac.id', 'dosen'),
(14, 'paxtonsaunders@usu.ac.id', 'dosen'),
(15, 'felixmoore@usu.ac.id', 'dosen'),
(16, 'talanglenn@usu.ac.id', 'dosen'),
(17, 'nicolassimpson@usu.ac.id', 'dosen'),
(18, 'kyrasantos@usu.ac.id', 'dosen'),
(19, 'ykline@usu.ac.id', 'dosen'),
(20, 'amiyawilliamson@usu.ac.id', 'dosen'),
(21, 'kocabrera@usu.ac.id', 'dosen'),
(22, 'kristinparsons@usu.ac.id', 'staff'),
(23, 'roninroach@usu.ac.id', 'staff'),
(24, 'daltonguzman@usu.ac.id', 'staff'),
(25, 'amarioliver@students.usu.ac.id', 'staff'),
(26, 'harmonyvaughn@students.usu.ac.id', 'mahasiswa'),
(27, 'tomasbailey@students.usu.ac.id', 'mahasiswa'),
(28, 'kelsiemccall@students.usu.ac.id', 'mahasiswa'),
(29, 'rafaelcowan@students.usu.ac.id', 'mahasiswa'),
(30, 'isabel@students.usu.ac.id', 'mahasiswa'),
(31, 'andersonmax@students.usu.ac.id', 'mahasiswa'),
(32, 'paisleypham@students.usu.ac.id', 'mahasiswa'),
(33, 'serenity@students.usu.ac.id', 'mahasiswa'),
(34, 'delgado@students.usu.ac.id', 'mahasiswa'),
(35, 'shaneoconnell@students.usu.ac.id', 'mahasiswa'),
(36, 'fkaiser@students.usu.ac.id', 'mahasiswa'),
(37, 'gabrielarosario@students.usu.ac.id', 'mahasiswa'),
(38, 'mayranoble@students.usu.ac.id', 'mahasiswa'),
(39, 'taniyah@students.usu.ac.id', 'mahasiswa'),
(40, 'sienameyer@students.usu.ac.id', 'mahasiswa'),
(41, 'lmurray@students.usu.ac.id', 'mahasiswa'),
(42, 'maxhodges@students.usu.ac.id', 'mahasiswa'),
(43, 'magdalenavghn@students.usu.ac.id', 'mahasiswa'),
(44, 'jaedenesparza@students.usu.ac.id', 'mahasiswa'),
(45, 'micahsolomonn@students.usu.ac.id', 'mahasiswa'),
(46, 'cheslye@students.usu.ac.id', 'mahasiswa'),
(47, 'judsonmay@students.usu.ac.id', 'mahasiswa'),
(48, 'kathgibbs@students.usu.ac.id', 'mahasiswa'),
(49, 'liliancooley@students.usu.ac.id', 'mahasiswa'),
(50, 'loranberger@students.usu.ac.id', 'mahasiswa'),
(51, 'jonnielong@students.usu.ac.id', 'mahasiswa'),
(52, 'kennzimm@students.usu.ac.id', 'mahasiswa'),
(53, 'justinriley@students.usu.ac.id', 'mahasiswa'),
(54, 'johnsell@students.usu.ac.id', 'mahasiswa'),
(55, 'palmer@students.usu.ac.id', 'mahasiswa'),
(56, 'hanncalhoun@students.usu.ac.id', 'mahasiswa'),
(57, 'edbert1xie@gmail.com', 'mahasiswa'),
(58, 'edbert1xie@gmail.com', 'admin'),
(59, 'leandroroberson@usu.ac.id', 'dosen'),
(60, 'edbert1xie@gmail.com', 'test');

--
-- Triggers `role_akun`
--
DELIMITER $$
CREATE TRIGGER `validasi_role_delete` BEFORE DELETE ON `role_akun` FOR EACH ROW BEGIN 
DECLARE num_count INT;
SELECT COUNT(*) INTO num_count FROM role_akun WHERE email_akun = OLD.email_akun;
IF num_count <= 1 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tidak bisa dihapus karena 1 akun harus ada setidaknya 1 role';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_role_insert` BEFORE INSERT ON `role_akun` FOR EACH ROW BEGIN 
DECLARE num_count INT;
SELECT COUNT(*) INTO num_count FROM role_akun WHERE email_akun = NEW.email_akun AND tipe_akun = NEW.tipe_akun;
IF num_count > 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Role sudah ada pada akun tersebut. Insert gagal';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_role_update` BEFORE UPDATE ON `role_akun` FOR EACH ROW BEGIN 
DECLARE num_count INT;
SELECT COUNT(*) INTO num_count FROM role_akun WHERE email_akun = NEW.email_akun AND tipe_akun = NEW.tipe_akun;
IF num_count > 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Role sudah ada pada akun tersebut. Update gagal';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(4) NOT NULL,
  `judul` longtext NOT NULL,
  `id_jenis_surat` int(2) NOT NULL,
  `dokumen` longtext DEFAULT NULL,
  `keterangan` longtext NOT NULL,
  `tgl_diperlukan` date NOT NULL,
  `email_akun` varchar(50) NOT NULL,
  `status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `judul`, `id_jenis_surat`, `dokumen`, `keterangan`, `tgl_diperlukan`, `email_akun`, `status`) VALUES
(1, 'Surat Izin Tidak Dapat Mengikuti ', 1, 'EdbertEdbert-Pengenalan Packe-certificate (1).pdf', 'Mengikuti Perlombaan', '2022-12-08', 'shaneoconnell@students.usu.ac.id', 'approve'),
(2, 'Magang MBKM', 2, '', 'Permohonan untuk dapat magang', '2023-01-01', 'lmurray@students.usu.ac.id', 'approve'),
(3, 'Meminta Surat Keterangan Nilai', 4, '', 'Nilai Semester 1', '2022-12-01', 'paisleypham@students.usu.ac.id', 'denied'),
(5, 'Permohonan Bukti Tugas Akhir', 3, '', 'Bukti Tugas Akhir 171402094', '2023-01-03', 'gabrielarosario@students.usu.ac.id', 'pending'),
(6, 'Keterangan Aktif Sebagai Mahasiswa', 6, '', 'Untuk Memenuhi Persyaratan Mendaftar Organisasi', '2022-11-26', 'micahsolomonn@students.usu.ac.id', 'approve'),
(7, 'Memohon Pembuatan Keterangan Nilai', 4, '', 'Nilai Semester 2 dan 4', '2022-12-28', 'sienameyer@students.usu.ac.id', 'pending'),
(8, 'Tidak Ikut Kuliah', 1, '', 'Menghadiri Undangan Gubernur', '2022-12-25', 'micahsolomonn@students.usu.ac.id', 'pending'),
(10, 'Mengundurkan Diri', 7, '', 'Pengunduran Diri', '2022-12-22', 'tomasbailey@students.usu.ac.id', 'pending'),
(11, 'Permohonan Keterlambatan Pembayaran Uang Kuliah', 9, '', 'Tidak Cukupnya Uang', '2022-12-04', 'maxhodges@students.usu.ac.id', 'denied'),
(12, 'Magang', 2, '', 'Magang BRI', '2022-11-29', 'serenity@students.usu.ac.id', 'pending'),
(13, 'Surat Untuk Rekomendasi Beasisw', 8, '', 'Memenuhi Salah Satu Persyaratan Beasiswa', '2022-11-29', 'shaneoconnell@students.usu.ac.id', 'denied'),
(14, 'Permohonan untuk Magang', 2, '', 'Magang di KOMINFO', '2022-12-11', 'maxhodges@students.usu.ac.id', 'approve'),
(15, 'Tidak Kuliah Dikarenakan Menghadiri Acara Rektor', 1, '', 'Acara Bersama Rektor di Auditorium', '2023-02-12', 'jaedenesparza@students.usu.ac.id', 'pending'),
(16, 'Permohonan Surat Keterangan Nilai', 4, '', 'Semester 3', '2022-12-15', 'delgado@students.usu.ac.id', 'approve');

--
-- Triggers `surat`
--
DELIMITER $$
CREATE TRIGGER `log_surat_delete` AFTER DELETE ON `surat` FOR EACH ROW BEGIN
    DECLARE nama_pengaju VARCHAR(50);
    SELECT nama_lengkap INTO nama_pengaju FROM akun WHERE email = OLD.email_akun;
    INSERT INTO log_surat (
        id_surat,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        OLD.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "keterangan", OLD.keterangan,
            "tgl_diperlukan", OLD.tgl_diperlukan,
            "nama_pengaju", nama_pengaju
        ),
        null,
        'DELETE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_surat_insert` AFTER INSERT ON `surat` FOR EACH ROW BEGIN
    DECLARE nama_pengaju VARCHAR(50);
    SELECT nama_lengkap INTO nama_pengaju FROM akun WHERE email = NEW.email_akun;
    INSERT INTO log_surat (
        id_surat,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        null,
        JSON_OBJECT(
            "judul", NEW.judul,
            "keterangan", NEW.keterangan,
            "tgl_diperlukan", NEW.tgl_diperlukan,
            "nama_pengaju", nama_pengaju
        ),
        'INSERT',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_surat_update` AFTER UPDATE ON `surat` FOR EACH ROW BEGIN
    DECLARE nama_pengaju VARCHAR(50);
    SELECT nama_lengkap INTO nama_pengaju FROM akun WHERE email = NEW.email_akun;
    INSERT INTO log_surat (
        id_surat,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "keterangan", OLD.keterangan,
            "tgl_diperlukan", OLD.tgl_diperlukan,
            "nama_pengaju", nama_pengaju
        ),
        JSON_OBJECT(
            "judul", NEW.judul,
            "keterangan", NEW.keterangan,
            "tgl_diperlukan", NEW.tgl_diperlukan,
            "nama_pengaju", nama_pengaju
        ),
        'UPDATE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_akhir`
--

CREATE TABLE `tugas_akhir` (
  `id` int(4) NOT NULL,
  `judul` text NOT NULL,
  `nim_mhs` char(10) NOT NULL,
  `tgl_pengesahan` date NOT NULL,
  `tgl_upload` date NOT NULL,
  `nip_dosen_pembimbing1` varchar(20) NOT NULL,
  `nip_dosen_pembimbing2` varchar(20) NOT NULL,
  `nip_dosen_penguji1` varchar(20) NOT NULL,
  `nip_dosen_penguji2` varchar(20) NOT NULL,
  `id_kategori_repo` int(2) NOT NULL,
  `abstract` longtext NOT NULL,
  `id_keyword` int(3) NOT NULL,
  `file_link` longtext NOT NULL,
  `id_prodi` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tugas_akhir`
--

INSERT INTO `tugas_akhir` (`id`, `judul`, `nim_mhs`, `tgl_pengesahan`, `tgl_upload`, `nip_dosen_pembimbing1`, `nip_dosen_pembimbing2`, `nip_dosen_penguji1`, `nip_dosen_penguji2`, `id_kategori_repo`, `abstract`, `id_keyword`, `file_link`, `id_prodi`) VALUES
(3, 'PERANGKAT LUNAK SOSIAL MEDIA SEBAGAI SARANA\nKOMUNIKASI JURUSAN BERBASIS WEB MOBILE ', '171401198', '2020-12-09', '2022-12-05', '197303032003121003', '197906211000131002', '196705192000122001', '196712202000121001', 1, 'Penyampaian informasi dapat dilakukan melalui berbagai cara, baik secara\nlangsung maupun melalui suatu media. Sosial media sering digunakan untuk\nmenyampaikan suatu informasi. Selain penggunaan yang tidak memerlukan\nkeahlian khusus, kebanyakan orang juga menggunakan sosial media. Kurangnya\nkomunikasi secara langsung antar mahasiswa menyebabkan penyebaran informasi\nyang disampaikan secara langsung suatu jurusan masih kurang efektif dan efisien.\nSehingga, dibutuhkannya suatu sosial media yang diharapkan dapat membantu\npenyebaran informasi dan menjaga komunikasi antar mahasiswa tetap terjaga\ndengan baik.\nPerangkat lunak sosial media jurusan dibuat untuk membantu penyebaran\ninformasi agar lebih efektif karena dapat dibuka disegala platform. Penyebaran\ninformasi dapat dilakukan melalui update status yang tersedia, pengguna juga\ndapat memberikan komentar dan saran melalui kolom komentar. Perangkat lunak\nsosial media ini dapat dikembangkan lebih lanjut dengan menambahkan fitur\ngrup, live streaming untuk lebih memudahkan pengguna dalam berbagi saran dan\nberbagi informasi.\n', 7, '002-Skripsi.pdf', 1),
(4, 'JARINGAN SYARAF TIRUAN EXTREME LEARNING MACHINE (ELM) UNTUK MEMPREDIKSI KONDISI CUACA DI WILAYAH MALANG', '181401002', '2021-06-23', '2022-12-05', '197307212001122001', '197004212000221001', '196705192000122001', '196712202000121001', 1, 'Jaringan saraf tiruan adalah suatu metode pengelompokan dan pemisahan data yang merupakan representasi dari otak manusia. Elemen mendasar dari jaringan saraf tiruan ini adalah bagaimana memproses sistem dan beberapa struktur sehingga menjadi sebuah informasi. Jaringan saraf tiruan dibentuk untuk memecahkan suatu masalah tertentu seperti pengenalan pola atau klasifikasi suatu data. Proses dari jaringan saraf tiruan ini menggunakan SLFNs (single hidden layer feedforward) yang dilihat dari nilai error-nya.\nCuaca merupakan suatu keadaan rata-rata udara sehari-hari disuatu tempat tertentu dan meliputi wilayah yang sempit dalam jangka waktu yang singkat. Keadaan dari cuaca mudah berubah-ubah, karena disebabkan oleh tekanan udara. suhu, angina, dan kelembapan udara. Penelitian jaringan saraf tiruan yang diaplikasikan pada kondisi cuaca ini bertujuan untuk mendapatkan arsitektur yang optimal.\nPada penelitian ini didapatkan model optimal dari proses training jaringan saraf tiruan ELM (extreme learning machine) untuk prediksi cuaca di Malang. yang terdiri dari 4 unit input (kecepatan angin, suhu udara, kelembaban udara, dan tekanan udara), 4 unit hidden pada 1 hidden laver, dan I unit output (hujan atau tidak hujan). Sebagaimana hasil output jaringan saraf tiruan dengan menggunakan data testing menghasilkan 80% memenuhi kriteria data dan 20% tidak memenuhi kriteria data, dengan keterangan hujan (Maret 2014) dan tidak hujan (Agustus 2014). Sehingga pada prediksi data testing menggunakan model jaringan saraf tiruan menghasilkan galat 20%.\n', 9, '003-Skripsi.pdf', 1),
(5, 'PROSPEK NEW STRATEGIC ARMS REDUCTION TREATY DALAM\nKEPEMILIKAN SENJATA NUKLIR AMERIKA SERIKAT DAN RUSIA', '181401051', '2021-12-19', '2022-12-05', '197906211000131002', '197303032003121003', '196705192000122001', '196712202000121001', 1, 'Penelitian ini dilakukan dengan tujuan untuk mengetahui arti penting perjanjian New START\nbagi Amerika Serikat dan Rusia. Setelah mengetahui arti pentingnya, melalui penelitian ini\ndiharapkan akan diketahui peluang dan tantangan implementasi New START bagi Amerika\nSerikat dan Rusia di masa depan. Dari beberapa rumusan yang diambil maka penulisan dalam\npenelitian ini menggunakan metode prediktif analitik. Dalam penelitian ini, akan diberikan\ngambaran umum nuklir di Amerika Serikat dan Rusia sebelum akhinya prediksi bagaimana\npenerapan New START kepada keberadaan nuklir di Amerika Serikat dan Rusia. Teknik\npengumpulan data yang penulis gunakan dalam penelitian ini adalah telaah pustaka yaitu\ndengan cara mengumpulkan data dari literatur yang berhubungan dengan permasalahan yang\nakan dibahas, dan kemudian menganalisanya. Literatur ini berupa buku-buku, dokumen,\njurnal-jurnal, dan situs-situs internet ataupun laporan-laporan yang berkaitan dengan\npermasalahan yang akan diteliti. Teknik analisis data yang digunakan dalam penulisan ini\nadalah teknik analisis data kualitatif. Hasil penelitian ini menunjukkan bahwa penandatangan\nperjanjian New START adalah implementasi kebijakan luar negeri, terkait nuklir kedua\nnegara untuk bersama-sama mengurangi ancaman nuklir dari pihak-pihak non-pemerintah,\nseperti teroris. Perjanjian ini juga menjadi pintu bagi kedua negara untuk mempelajari\nkekuatan dan kelemahan nuklir masing-masing demi modernisasi pertahanan mereka.\nPerjanjian New START bukanlah perjanjian pertama yang membatasi dan mengurangi\npersenjataan kedua negara. Hal ini terkait jumlah senjata nuklir yang masif di kedua negara.\nJumlah nuklir yang melebihi kebutuhan memberikan dampak negatif dari segi ekonomi,\nkhususnya biaya perawatan dan efisiensi pertahanan suatu negara. Kondisi-kondisi inilah\nyang menjadi tantangan sekaligus peluang bagi perjanjian ini.', 4, '004-Skripsi.pdf', 1),
(6, 'PERANCANGAN DAN IMPLEMENTASI SISTEM SEKOLAH TERPADU BERBASIS CLIENT SERVER DI SMAN 9 MAKASSSAR', '181401087', '2021-10-16', '2022-12-05', '196909202000111001', '197811201000211002', '196705192000122001', '196712202000121001', 1, 'Sistem Sekolah Terpadu merupakan aplikasi yang diperuntukkan untuk mengolah data –\ndata yang berhubungan dengan sekolah.seperti pengolahan data registrasi ulang siswa, data\nabsensi siswa dan data pembayaran siswa. Belum optimalnya data – data ini menyebabkan\nsulitnya dalam mencari informasi tentang data siswa dan pembuatan laporan yang belum\nmemadai.Oleh karena itu diperlukan suatu aplikasi yang bias mendukung dan memecahkan\nmasalah tersebut. Aplikasi ini dibangun dengan menggunakan Apache web server sebagai web\nservernya, menggunakan PHP sebagai bahasa pemrograman, dan MySQL dalam pembangunan\ndatabase.\nPenelitian ini bertujuan untuk merancang Sistem Sekolah Terpadu pada SMAN 9\nMakassar berbasis client-server. Jenis penelitian yang digunakan yaitu penelitian kuantitatif,\nsementara dalam pengumpulan data menggunakan metode penelitian kepustakaan dan penelitian\nlapangan (observasi). Adapun metode pengujian menggunakan Black Box Testing yang berfokus\npada kebutuhan fungsional dari perangkat lunak.\nDengan adanya Sistem Sekolah Terpadu pada SMAN 9 Makassar Berbasis Client-Server\nini maka dapat membantu staf dan pegawai pada SMAN 9 Makassar dalam hal pengelolaan data- data yang berhubungan dengan sekolah tersebut. Contohnya dalam hal pengelolaan data\nAkademik, Keuangan, Perpustakaan, Kepegawaian, Info Guru, Info Siswa dan BK (Badan\nKonseling).\n', 10, '005-Skripsi.pdf', 1),
(7, 'STRATEGI VIRAL MARKETING PRODUK \nCHITATO INDOMIE DI INSTAGRAM DALAM \nMEMBANGUN BRAND AWARENESS', '181401123', '2020-01-06', '2022-12-05', '197307212001122001', '197306101003221002', '196705192000122001', '196712202000121001', 1, 'Kemajuan dunia digital komunikasi yang berasal dari bertambahnya jumlah \npengguna internet di Indonesia menyebabkan persaingan pasar semakin mengetat.\nDengan kondisi seperti itu, tentunya berbagai perusahaan yang ingin meluncurkan\nproduk baru perlu melakukan sebuah perencanaan. Perencanaan itu meliputi \nsebuah strategi yang dapat membuat produk itu menjadi lebih cepat dikenal dan \nmemiliki tingkat kesadaran merek (brand awareness) yang tinggi. Salah satu \nstrategi yang dapat dilakukan oleh perusahaan adalah strategi viral marketing. \nStrategi viral marketing ini telah dilakukan oleh Chitato Indomie setahun yang \nlalu yang dinaungi oleh branding agency Red Communication.\nDengan tujuan untuk menggambarkan strategi viral marketing produk Chitato \nIndomie dalam membangun brand awarenessnya, peneliti bermaksud untuk \nmenganalisa bagaimana proses viral itu dapat terjadi melalui pesan-pesan yang \ndisampaikan kepada masyarakat dengan strategi yang disusun menggunakan\nbeberapa tahapan. Tahapan itu adalah riset, perencanaan, eksekusi, pengukuran \ndan pelaporan. Penggambaran serta analisa strategi viral marketing ini dapat \nmemberikan kontribusi bagi industri lain tentang bagaimana caranya \nmemperkenalkan produk lewat strategi viral marketing.\nPeneliti menggunakan metode studi kasus dengan melihat bagaimana strategi \nviral marketing tersebut dijalankan dengan gambaran yang jelas dan eksplorasi \ntahapan-tahapan viral marketing Chitato Indomie sebagai suatu kasus penelitian \ndan objek yang menarik untuk diteliti. Untuk menggambarkan hal tersebut \npeneliti melibatkan tiga orang narasumber yang kompeten untuk menjabarkan \nstrategi perusahaan tersebut. Dari sana ditemukan sebuah hasil bahwa brand yang \nsudah menjadi top of mind, tidak begitu sulit dalam menjalankan strategi. Oleh \nkarena itu, alat yang digunakan oleh Chitato Indomie adalah media sosial\ninstagram dengan pendekatan word of mouth marketing yang hanya menggunakan \nbuzzer sebagai media penyampaian pesan tersebut.', 11, '006-Skripsi.pdf', 1),
(8, 'ANALISIS TINGKAT PENYAKIT KUKU PADA SAPI PERAH DI \nPT GREAT GIANT LIVESTOCK PADA BULAN \nAGUSTUS – SEPTEMBER 2021', '181401152', '2021-10-01', '2022-12-05', '197906211000131002', '197811201000211002', '196705192000122001', '196712202000121001', 1, 'Kepincangan pada sapi merupakan penyebab utama masalah kesejahteraan \ndan pengapkiran pada sapi. Tujuan penelitian ini untuk menganalisis penyebaran \ndan kejadian penyakit kuku pada sapi perah serta hubungan kepincangan terhadap \nBody condition score, laktasi, dan produksi susu di PT Great Giant Livestock pada \nbulan Agustus hingga September 2021. Data studi diambil dari tenaga kesehatan \nhewan dan laporan kejadian penyakit kuku PT Great Giant Livestock. Data \ndisajikan dalam bentuk gambar. Prevalensi kepincangan yang terjadi di PT Great \nGiant Livestock pada bulan Agustus dan Desember didapatkan sebesar 5% dan \n4% dan rataan 2 bulan sebesar 4%. Total kepincangan yang dilaporkan sebanyak\n28 kasus dari 314 ekor sapi perah produktif. Kasus kepincangan yang didapatkan \nadalah sole ulcer, thin sole, dan laminitis. Deteksi dini kepincangan bisa \ndilakukan dengan penilaian skor lokomosi pada sapi. Hubungan kepincangan\nterhadap rata – rata mingguan produksi susu pada sapi perah di PT Great Giant \nLivestock tidak memiliki pengaruh yang signifikan. Kepincangan dapat \ndipengaruhi oleh beberapa faktor seperti kebersihan dan sanitasi kandang, \nperubahan dan komposisi pakan, dan penggunaan alas pada kandang yang kurang\ntepat.\n', 11, '007-Skripsi.pdf', 1),
(9, 'APLIKASI SKRIPSI DIGITAL ONLINE BERBASIS WEB', '161402003', '2019-12-04', '2022-12-05', '197205121000212002', '196407232001121001', '196705192000122001', '196712202000121001', 5, 'Aplikasi Skripsi Digital Online ini bertujuan untuk menyimpan koleksi\nskripsi-skripsi yang ada di UPT Perpustakaan Kampus III Universitas Sanata\nDharma dalam bentuk file elektronik dan didistribusikan sehingga dapat diakses\ndan dibaca secara online oleh pengunjung namun tidak dapat dicopy / disave\nfilenya. Sistem ini memiliki fasilitas perekaman aktifitas user untuk mengetahui\nmengetahui statistik pengunjung, skripsi yang sering dibaca, statistik browser\nyang digunakan user dan halaman-halaman yang diakses user serta memiliki\nfasilitas pencarian cepat dan pencarian detail bagi user.\nDalam Tugas Akhir ini membahas tentang cara perancangan dan\nimplementasi Aplikasi Skripsi Digital Online yang mampu menangani\npenyimpanan file-file skripsi pada server dalam bentuk Portable Document\nFormat (PDF) yang dirubah ke dalam bentuk Shockwave Flash (SWF)\nmenggunakan bantuan sofware PDF2SWF sebagai tool didalam pendigitalan\ndokumen skripsi. Sistem ini dikembangkan menggunakan PHP5 dan MySql5\nHasil yang diperoleh adalah sebuah Aplikasi Skripsi Digital Online\nBerbasis Web yang dapat membantu pengelola perpustakaan didalam mengelola\nskripsi-skripsi digital, mengetahui halaman yang diakses pengunjung, skripsi yang\nsering dibaca, dan mengetahui statistik pengunjung. Serta dapat memberi\ninformasi mengenai skripsi digital yang ada dan membantu pengunjung\nperpustakaan didalam mencari dan membaca skripsi digital secara online. ', 1, '008-Skripsi.pdf', 2),
(10, 'PENGEMBANGAN DAN ANALISIS KUALITAS APLIKASI SISTEM\nPENDUKUNG KEPUTUSAN PEMILIHAN JURUSAN\nDI PERGURUAN TINGGI', '171402094', '2020-12-20', '2022-12-05', '196712202000121001', '197404092000131002', '196705192000122001', '196712202000121001', 5, 'Penelitian ini bertujuan untuk mengembangkan perangkat lunak Sistem\nPendukung Keputusan Pemilihan Jurusan di Perguruan Tinggi menggunakan\nbahasa pemograman Visual Basic dan database MySQL. Penelitian ini meliputi\nperancangan sistem serta pengujian unjuk kerja sistem perangkat lunak pada\nfaktor kualitas correctness, functionality, usability,danmaintainability. Perangkat\nlunak dari penelitian ini diharapkan dapat membantu mengarahkan siswa SMA\ndalam memilih jurusan kuliah yang tepat berdasarkan minat dan jenis kecerdasan\nyang dimiliki oleh masing-masing siswa.\nJenis penelitian ini adalah Research and Development. Metode\npengembangan perangkat lunak menggunakan Waterfall Model. Tahapan pertama\ndilakukan analisa kebutuhan serta melakukan kajian literatur pendukung\npenelitian. Tahapan kedua dilakukan dengan membuat desain perangkat lunak.\nTahapan ketiga yaitu implementasi atau pengkodean. Tahapan terakhiradalah\npengujian. Analisis faktor kualitascorrectness dilakukan dengan perhitungan\njumlah error / KLOC. Analisis faktor kualitas functionality dilakukan dengan\npengujian setiap fungsi aplikasi. Analisis faktor kualitas usability dilakukan\ndengan metode kuesioner yang dibagikan kepada mahasiswa dan siswa kelas XII\nSMA Negeri 2 Wates.Analisis faktor kualitas maintainability dilakukan dengan\nmelakukan pengujian pada tiga aspek maintainability yaitu instrumentation,\nconsistency dan simplicity.\nBerdasarkan hasil pengujian perangkat lunak yang dikembangkan\nmenunjukkan hasil: 1) perancangan aplikasi Sistem Pendukung Keputusan\nPemilihan Jurusan di Perguruan Tinggi telah melalui serangkaian proses rekayasa\nperangkat lunak dari analisis kebutuhan hingga pengujian; 2) hasil analisis\nkualitas dari aplikasi Sistem Pendukung Keputusan Pemilihan Jurusandi\nPerguruan Tinggi memenuhi standar faktor kualitas correctness, functionality,\nusability,dan maintainability.', 1, '009-Skripsi.pdf', 2),
(11, 'RANCANG BANGUN APLIKASI LAYANAN BERBASIS LOKASI\nDENGAN PENERAPAN AUGMENTED REALITY MENGGUNAKAN\nMETODE MARKERLESS BERBASIS ANDROID', '181402009', '2021-01-10', '2022-12-05', '196908102003111002', '197806182001221002', '196705192000122001', '196712202000121001', 5, 'Penelitian ini bertujuan untuk membangun suatu aplikasi yang dapat membantu\npengguna dalam mencari dan memberikan informasi mengenai perangkat daerah\nKota Bengkulu pada android dengan menerapkan augmented reality\nmenggunakan metode markerless. Pada penerapannya augmented reality bisa\ndiimplementasikan pada perangkat yang memiliki kamera, akselerometer, kompas\ndan GPS. Data koordinat dan data perangkat daerah Kota Bengkulu di download\ndari server. Aplikasi ini juga memanfaatkan peta dari google maps dalam\nmenunjukkan lokasi pengguna ke lokasi perangkat daerah Kota Bengkulu yang di\ncari. Aplikasi ini dibangun dengan menggunakan Wikitude dan bahasa\npemrograman Java for Android dengan IDE Eclipse 3.5.Metode pengembangan\nsistem yang digunakan untuk membangun aplikasi ini adalah model sekuensial\nlinierdan Unified Modeling Language (UML) sebagai perancangan sistem.\nPenelitian ini menghasilkan sebuah aplikasi layanan berbasis lokasi dengan\npenerapan augmented reality menggunakan metode markerless berbasis android\npada pencarian perangkat daerah Kota Bengkulu.', 3, '010-Skripsi.pdf', 2),
(12, 'KEPENTINGAN KERJASAMA ENERGI NUKLIR \nRUSIA DI TIMUR TENGAH PERIODE 2015-2017', '181402019', '2022-12-30', '2022-12-05', '198210222003212004', '197002212000211002', '196705192000122001', '196712202000121001', 5, 'Skripsi ini membahas tentang kepentingan kerjasama energi nuklir Rusia di \nTimur Tengah pada periode 2015-2017. Tujuan penelitian ini untuk mengetahui \napa sebenaranya kepentingan Rusia dalam kerjasama energi nuklir di Timur \nTengah pada periode 2015-2017. Penelitian ini dilakukan dengan metode kualitatif \ndan menggunakan teknik pengumpulan data melalui studi pustaka. Penelitian ini \nberfokus pada kepentingan politik yang dituju oleh Rusia dalam sektor energi nuklir \nmelalui berbagai kerjasama yang akhirnya dilakukan dari tahun 2015 hingga tahun \n2017 dengan negara-negara di Timur Tengah setelah sebelumnya Rusia mendapatkan \nsanksi ekonomi dari Amerika Serikat dan juga Eropa. Timur Tengah menjadi pasar \nbaru yang dituju Rusia dalam sektor energi nuklirnya. Skripsi ini dirumuskan melalui \ntahapan analisa yang dimulai dengan melihat sejarah kerjasama Rusia di kawasan \nTimur Tengah kemudian kerjasama-kerjasama yang terjalin antara Rusia dan negara negara di Timur Tengah yang mulai meningkat dari tahun 2015 hingga 2017 dan juga \nbentuk-bentuk kerjasama yang dilakukan Rusia dengan negara-negara di Timur \nTengah dengan analisis kepentingan Rusia dalam menawarkan metode build own and \noperate pada tahun 2015 hingga 2017. Kerangka pemikiran yang penulis gunakan \ndalam skripsi ini adalah kerangka teori realisme dengan konsep kebijakan luar negeri \ndan kepentingan nasional. Melalui penelitian yang dilakukan, dapat disimpulkan \nbahwa Rusia mencoba kembali melakukan kerjasama ke negara-negara Timur Tengah\nuntuk menguasai pasar energi nukir dan juga menguatkan pengaruhnya di kawasan \nTimur Tengah. Keinginan untuk menguatkan pengaruh di Timur Tengah juga \nmerupakan kebijakan yang tertuang pada konsep kebijakan luar negeri Rusia untuk \nmenguatkan pengaruh dan juga meningkatkan sektor ekonomi Rusia dalam bidang \nenergi; yang mana bidang energi Rusia merupakan komponen vital dari sektor \nekonomi Rusia. ', 8, '011-Skripsi.pdf', 2),
(13, 'PENERAPAN METODE EXTREME LEARNING\nMACHINE UNTUK PREDIKSI TINGKAT\nRISIKO WABAH DEMAM BERDARAH\nBERDASARKAN KEADAAN CUACA\n(STUDI KASUS : WILAYAH DKI JAKARTA)', '177038049', '2022-06-19', '2022-12-05', '197004212000221001', '198212112003111004', '196705192000122001', '196712202000121001', 2, 'Perubahan iklim merupakan perubahan dalam distribusi kejadian\ncuaca terhadap kondisi rata-ratanya. Perubahan iklim baik secara langsung\nataupun tidak langusung membawa dampak negatif bagi mahluk hidup di\nbumi. Salah satu diantaranya adalah penyakit yang disebabkan oleh vektor,\nseperti Demam berdarah dengue. Demam Berdarah Dengue pertama kali\nditemukan di Indonesia pada tahun 1986, dimana sebanyak 58 orang di kota\nSurabaya terinfeksi DBD dan 24 diantaranya meninggal dunia dengan Angka\nKematian (AK) mencapai 41,3%. Sejak saat itu, penyakit ini menyebar luas\nke seluruh Indonesia. Hingga saat ini DBD masih menjadi salah satu masalah\nkesehatan yang utama di Indoneisa. Penelitian ini akan memanfaatkan metode\nextreme learning machine (ELM) untuk meramalkan keadaan cuaca. Hasil\nperamalan tersebut selanjutnya digunakan sebagai prediktor untuk melakukan\nprediksi tingkat resiko wabah demam berdarah dengue di suatu wilayah. ELM\nmerupakan metode pembelajaran dari jaringan saraf tiruan yang memiliki\nkeunggulan terutama pada kecepatannya karena tidak memerlukan proses\niterasi. Hasilnya menunjukkan bahwa metode ELM memberikan performa\nyang cukup menjanjikan. System yang dikembangkan dapat digunakan untuk\nmelakukan prediksi tingkat resiko wabah demam berdarah beberapa bulan\nkedepan.', 11, '001-Thesis.pdf', 4),
(14, 'EYE MOVEMENT GUIDANCE IN FAMILIAR VISUAL SCENES:\nA ROLE FOR SCENE SPECIFIC LOCATION PRIORS IN SEARCH', '187038050', '2021-12-09', '2022-12-05', '196908102003111002', '196712202000121001', '196705192000122001', '196712202000121001', 6, 'Ecologically relevant search typically requires making rapid and strategic eye movements\nin complex, cluttered environments. Attention allocation is known to be influenced by low\nlevel image features, visual scene context, and top down task constraints. Scene specific\ncontext develops when observers repeatedly search the same environment (e.g. one\'s\nworkplace or home) and this often leads to faster search performance. How does prior\nexperience influence the deployment of eye movements when searching a familiar scene?\nOne challenge lies in distinguishing between the roles of scene specific experience and\ngeneral scene knowledge. Chapter 1 investigates eye guidance in novel scenes by\ncomparing how well several models of search guidance predict fixation locations, and\nestablishes a benchmark for inter-observer fixation agreement. Chapters 2 and 3 explore\nspatial and temporal characteristics of eye guidance from scene specific location priors.\nChapter 2 describes comparative map analysis, a novel technique for analyzing spatial\npatterns in eye movement data, and reveals that past history influences fixation selection in\nthree search experiments. In Chapter 3, two experiments use a response-deadline approach\nto investigate the time course of memory-based search guidance. Altogether, these results\ndescribe how using long-term memory of scene specific representations can effectively\nguide the eyes to informative regions when searching a familiar scene.', 3, '002-Thesis.pdf', 3),
(15, 'STUDY OF MICROSCOPIC STRUCTURE VIA NMR DIFFUSIVE SCATTERING', '187038055', '2022-12-10', '2022-12-05', '197307212001122001', '197303032003121003', '196705192000122001', '196712202000121001', 2, 'Scattering experiments can be carried out by gradient nuclear magnetic resonance(NMR) methods. Magnetic field gradient pulses are utilized to create linear phase ramps of the spin magnetization across the sample along arbitrary directions. The linear phase ramps are defined as dynamic spin magnetization gratings. The measurement of the grating after it undergoes dynamic processes characterized by the local struc­ture leads to the measurement of the average phase changes over the whole sample, ..., a quantity denoted as intermediate scattering function. NMR scattering are measured in spatial and temporal window to sub-microns to tens of micros and milliseconds to a few seconds. In a time scale when spin displacements are larger than the spatial scale of local structure, NMR experiments directly measure the elastic incoherent structure function (EISF) ... powder. The direct control of scattering vector q in NMR scattering enables easy per­formance of multiple scattering experiments. The double scattering experiments, as examples of multiple scattering, lead to the measurement of structure factors ... powder. The latter correlates local struc­tural characteristics along directions that are normal to each other. Anisotropic information in a glassy sample can be determined without the presumptive models which are required in one dimensional or traditional scattering techniques. This thesis work includes detailed derivation of the theory of NMR double scattering, an experiment that can only be performed by NMR. The eccentricity information can be extracted by the differences of scattering curves from double scattering along one axis and along two orthogonal axes. The experiments are carried out for abnormally long yeast cells. The experimental results show good agreement with calculations where the yeast cell shape was approximated as prolate ellipsoids.', 7, '003-Thesis.pdf', 4),
(16, 'VALUABLE BRIDGES: CABLE-STAYED BRIDGES AND VALUE ENGINEERING IN AMERICAN CIVIL ENGINEERING CULTURE, 1969-1979', '117038038', '2013-12-18', '2022-12-05', '197906211000131002', '197201252000131001', '196705192000122001', '196712202000121001', 2, 'A history and theory of cable-stayed bridges in the context of a cultural\ndiscourse on civil construction projects\' value, this thesis studies the significance of\ncable-stayed bridge designs to \'value engineering\' objectives for major highway bridge\nprojects of the 1970s. This study of preliminary designs and feasibility studies for\nhighway bridges presents the alternate bridge designs versus alternative bridge\ntypologies selected during this period as one instance of American civil engineering\nculture adapting to major bridge projects the economically measured but industrial\napproach to choosing, reconfiguring and eliminating construction systems of value\nengineering. Only as analytical mechanisms of bridge construction that figure as\neconomically competitive in prevailing market conditions do the high-capital and\ntechnologically innovative bridge designs of the Luling Bridge (LA, 1978) and the Pasco Kennewick Bridge (WA, 1977) develop into physical constructions built almost\nexclusively with federal highway funds. This shift in cable-stayed bridge designs\' fate\nfrom abandoned projects in the 1960s is discussed as the reflection of structural\nengineers\' engaging in the post-capitalist practices of analytical and then physical\nsystems building, decision analysis, speculation as well as the interdisciplinary cultures\nfrom which these concepts stem. Critical studies of preliminary designs and construction\nindustry data circa 1970 reveal cable-stayed bridge type selections to be at once the\nlinchpin to politicization of VE in American highway bridge building by 1979 and the\nAchilles heel of an American civil engineering culture that sought a renaissance in bridge\nengineering not a redefinition of its principles through a new method of planning for\nalternate futures.', 9, '004-Thesis.pdf', 4),
(17, 'PENDEKATAN METABOLOMIK UNTUK MENGIDENTIFIKASI \nSENYAWA BIOAKTIF ANTIKANKER PADA \nTUMBUHAN OBAT INDONESIA', '188123010', '2021-02-09', '2022-12-05', '198212112003111004', '197306101003221002', '196705192000122001', '196712202000121001', 3, 'Senyawa antikanker dari produk herbal terus diteliti untuk meningkatkan potensi kekayaan alam Indonesia. Namun, sejauh ini pencarian senyawa aktif dengan metode bioassay-directed fractionation and isolation (BDFI) terkendala oleh proses yang panjang dan terkadang senyawa isolatnya memiliki aktivitas yang lebih rendah daripada ekstraknya. Pendekatan metabolomik menjadi metode alternatif karena waktu analisis yang relatif lebih singkat. Selama ini, penelitian hanya terbatas menduga keberadaan senyawa aktif pada suatu ekstrak tertentu (berdasarkan pustaka memiliki aktivitas antikanker) tanpa pembuktian aktivitas. Fokus penelitian ini adalah mengkaji penggunaan pendekatan metabolomik untuk menemukan senyawa aktif antikanker dari tumbuhan obat Indonesia dan mengevaluasi hasil prediksi senyawa tersebut. Penelitian ini dibagi dalam tiga tahap kegiatan, yaitu (1) pemilihan tumbuhan obat berpotensi antikanker, (2) pemprofilan metabolit dan identifikasi senyawa aktif antikanker dengan pendekatan metabolomik, dan (3) e\naluasi senyawa target antikanker. Dalam tahap pemilihan senyawa target, aktivitas antikanker ekstrak daun sirsak (Annona muricata), sambung nyawa (Gynura procumbens), keladi tikus (Typhonium flagelliforme), dan tapak dara (Catharanthus roseus) diuji pada sel MCF7. Ekstrak daun sirsak menunjukkan potensi tertinggi dengan nilai IC50 24,45 µg/mL dan 32,44 µg/mL pada ekstrak etanol p.a. dan 80%, dilanjutkan dengan tapak dara (78,41 µg/mL), sambung nyawa (86 µg/mL), dan keladi tikus (616,79 µg/mL). Sementara untuk aktivitas antioksidan dengan metode DPPH, urutannya ialah daun sambung nyawa (144,68 µg/mL) yang lebih berpotensi, diikuti tapak dara (327,46 µg/mL), sirsak (474,63 µg/mL), dan keladi tikus (693,48 µg/mL). Berdasarkan hasil ini, analisis pada sampel daun sirsak dilanjutkan dengan pendekatan metabolomik karena berpotensi sebagai antikanker tertinggi dibandingkan tiga tumbuhan lainnya. Pada tahap berikutnya, komponen metabolit yang terdapat dalam ekstrak daun sirsak dengan berbagai pelarut dianalisis menggunakan kromatografi cair- spektrometri massa (LC-HRMS) dengan pendekatan metabolomik taktertarget. Tiga puluh lima metabolit telah berhasil diidentifikasi secara putatif dalam ekstrak, yang diketahui berasal dari golongan senyawa alkaloid, flavonoid, dan asetogenin. Aktivitas antikanker terhadap sel kanker payudara MCF7 dari ekstrak etanol p.a. menunjukkan aktivitas tertinggi dengan nilai IC50 22,86 µg/mL, diikuti oleh ekstrak etanol 50% (97,52 µg/mL), etanol 80% (154,92 µg/mL), air (363,41 µg/mL), dan etanol 30% (1713,47 µg/mL). Berdasarkan informasi aktivitas terhadap sel kanker tersebut dan metabolit dalam ekstrak, disiapkan model untuk mendapat informasi senyawa target antikanker. Senyawa aktif dicari dengan pendekatan metabolomik menggunakan informasi kandungan senyawa sebagai prediktor dan aktivitas antikanker sebagai respons. Teknik multivariat orthogonal partial least square discriminant analysis (OPLS-DA) memperlihatkan bahwa tiga metabolit, yaitu annoretikuin, skuadiolin C, dan xilopina, serta enam metabolit (golongan asetogenin) yang belum berhasil teridentifikasi, diduga sebagai senyawa bioaktif antikanker dari daun sirsak. Hasil ini membuktikan bahwa metabolomik yang taktertarget dapat mengidentifikasi senyawa antikanker pada daun sirsak. Penelitian tahap tiga difokuskan pada evaluasi senyawa target secara in silico dan in vitro. Evaluasi secara in silico membuktikan bahwa ada interaksi yang kuat antara struktur senyawa target dan makromolekul protein 3ERT dari sel kanker. Nilai afinitas pengikatan senyawa annoretikuin, skuadiolin C, dan xilopina mendekati doksorubisin, yakni obat antikanker komersial. Evaluasi lebih lanjut dilakukan dengan fraksionasi dari ekstrak daun sirsak dan analisis target senyawa aktif. Evaluasi secara in vitro terhadap enam fraksi menunjukkan peningkatan persentase penghambatan sel kanker (80─96%) lebih tinggi daripada hasil ekstrak etanol (73%). Hasil ini mempertegas bahwa senyawa dugaan dari pendekatan metabolomik dapat digunakan untuk mengidentifikasi senyawa aktif antikanker tumbuhan obat. Penelitian ini membuktikan pendekatan metabolomik dapat menjadi metode dalam penemuan senyawa aktif antikanker dari tumbuhan obat Indonesia dan dapat menjadi metode efektif dengan mengevaluasi senyawa aktif yang teruji. Untuk penelitian selanjutnya, disarankan pemurnian senyawa dugaan terhadap aktivitas antikanker dan pembuktian aktivitas terhadap sel kanker lainnya. Ke depannya, pendekatan metabolomik dapat dikembangkan untuk aktivitas hayati lainnya.', 9, '001-Disertasi.pdf', 5),
(18, 'ANALISIS SOCIAL CAPITAL, eWOM DAN MINAT PEMBELIAN\nTERHADAP KEPUTUSAN PEMBELIAN ONLINE', '188123010', '2020-10-14', '2022-12-05', '197004212000221001', '197201252000131001', '196705192000122001', '196712202000121001', 3, 'Penetrasi dan minat pembelian online di Indonesia yang relatif rendah untuk produk pakaian\nserta tingginya penggunaan jejaring sosial menunjukkan perlunya model yang menjelaskan\nvariabel-variabel apa yang mempengaruhi keputusan pembelian online dalam jejaring sosial. \nPenelitian ini bertujuan menawarkan sebuah model dengan meneliti pengaruh Social Capital, \neWOM dan Minat Pembelian Online terhadap Keputusan Pembelian Online yang dilakukan \npada pengguna Facebook di Indonesia. Hasil penelitian ini diharapkan dapat \nmenggambarkan, menganalisis, dan menguji pengaruh dari variabel-variabel yang diteliti\nterhadap Keputusan Pembelian Online. Metode penelitian yang digunakan adalah analisis \ndeskriptif dan verifikatif. Pengumpulan data dilakukan dengan menyebarkan kuesioner \npengguna Facebook di Indonesia yang pernah melakukan pembelian online dan mendapatkan \neWOM. Sebanyak 220 sampel yang diperoleh menggunakan metode non probabilitas dengan \nteknik purposive sampling diolah menggunakan teknik analisis Partially Least Square \nStructural Equation Modeling. Hasil deskriptif menunjukkan bahwa tingkat Social Capital\nberada pada posisi sedang, sementara tingkat eWOM, Minat Pembelian Online dan \nKeputusan Pembelian Online berada pada posisi tinggi. Hasil pengujian verifikatif \nmenunjukkan bahwa Social Capital memiliki pengaruh terhadap eWOM, dan Minat \nPembelian Online, eWOM memiliki pengaruh terhadap Minat Pembelian Online dan Minat \nPembelian Online memiliki pengaruh terhadap Keputusan Pembelian Online. Berdasarkan \nmodel penelitian ini, pemasar online dapat memanfaatkan dimensi-dimensi yang ada pada\nsocial capital melalui aktivitas mereka di jejaring sosial untuk meningkatkan pembelian \nonline. Temuan lain adalah koefisien pengaruh langsung eWOM terhadap keputusan \npembelian online yang rendah. Hal ini dipicu oleh banyaknya berita hoax yang sering beredar \ndi jejaring sosial Indonesia akhir-akhir ini.\n', 9, '002-Disertasi.pdf', 5),
(19, 'ETIKA BISNIS PERDAGANGAN MENURUT ALQURAN', '188123003', '2022-12-17', '2022-12-05', '198210222003212004', '197002212000211002', '196705192000122001', '196712202000121001', 3, 'Perdagangan bebas dan arus globalisasi yang tidak bisa dikendalikan lagi \nmenimbulkan benturan-benturan kepentingan antara satu pebisnis perdagangan \ndengan pebisnis perdagangan lainnya. Realitas ini timbul akibat para pelaku \nbisnis perdagangan terlalu bernafsu untuk memperoleh keuntungan yang \nsebanyak-banyaknya dengan tidak mengindahkan nilai-nilai moralitas. \nKemunculan wacana pemikiran urgensitas etika bisnis perdagangan berbasis \nAlquran didorong oleh doktrin bahwa Alquran merupakan kitab suci umat Islam \nyang dapat menjadi pedoman bagi seluruh umat manusia.\nDisertasi ini ingin menelaah bagaimana etika bisnis perdagangan menurut \nAlquran. Tema kajian yang mengitarinya meliputi persoalan mengenai simpul simpul bisnis perdagangan menurut Alquran, aksioma-aksioma bisnis \nperdagangan menurut Alquran dan etika bisnis perdagangan islami. Kajian \ndisertasi ini menggunakan pendekatan tafsir maud}u’i dengan metode analisis \ntematik, analisis isi, analisis komparatif dan analisis reflektif kritis.\nHasil pembahasan mengungkapkan bahwa bisnis menurut bahasa Alquran \ndisebut al-kasb, al-‘aml dan as-sa’yu. Dari antara ketiga terma ini, al-kasb \nmerupakan terma yang paling dekat dengan bisnis. Karena terminologinya tidak \nhanya sama dengan terminologi bisnis secara umum, sebagaimana dikemukakan \npara pakar ekonomi, tetapi juga karena Alquran dan hadis secara gamblang \nmengungkap dan menggunakan terma al-kasb untuk mengistilahkan usaha bisnis.\nMaka muncullah simpul-simpul bisnis, yaitu: pertama, simpul bisnis ekstratif; \nkedua, simpul bisnis agraris; ketiga simpul bisnis industri manufaktur; keempat \nsimpul bisnis service; dan kelima simpul bisnis perdagangan. Keseriusan Alquran \ndalam persoalan bisnis ditandai adanya aksioma-aksioma bisnis perdagangan, \nyaitu bahwa Alquran menjelaskan bahwa hal yang bisa menggantikan praktik \nriba adalah konsep bisnis perdagangan islami. Peranti-peranti yang digunakan \nAlquran meliputi akad at-tija>rah, akad mudhārabah, akad musyārakah, akad \nijārah, akad qard} al-h}asan, akad ar-rahn dan lain-lain. Realitas akad-akad ini \nmemunculkan bisnis-bisnis islami yang harus diperhatikan umat\nIslam. Tawaran Alquran tentang metode dan tata cara berbisnis perdagangan \ndidasari oleh realitas doktrin, yaitu: doktrin al-i>ma>n (ketauhidan); doktrin al-‘adl \n(Keadilan); doktrin al-khiya>r (bebas pilihan); doktrin al-mas’u>liyah (tanggung \njawab); doktrin al-ih}sa>n (kebajikan) dan doktrin as}-s}idq (Kejujuran). Doktrin doktrin ini tentu berbeda dengan doktrin bisnis konvensional seperti otonomi, \nkejujuran, keadilan, saling menguntungkan dan berintegritas moral, karena \ndoktrin tersebut didasari oleh konsep pemikiran kapitalistik dan monopolistik.\nPentingnya bisnis perdagangan islami disebabkan semakin mengguritanya \nfenomena pelanggaran bisnis perdagangan baik domestik maupun internasional. \nPelanggaran-pelanggaran yang terjadi mulai dari pemalsuan, fraud, drug \ntrafficking, dumping, sweatshop, perburuhan anak dan bisnis perdagangan \nmanusia. Alquran menawarkan konsep etika bisnis perdagangan domestik, yaitu \npertama, perlunya penekanan internalisasi spritualitas Islam; kedua, harus \nmenciptakan sistem dan mekanisme pencegahan tindakan al-ba>t}il mulai dari \npersoalan pemalsuan, praktik penimbunan, praktik kecurangan dan praktik \nribawi; ketiga menciptakan produk halal dengan salah satu indikator pelabelan \nproduk; dan keempat pada setiap bisnis perdagangan harus menerapkan akuntansi \nsyari’ah. Alquran juga menawarkan konsep etika bisnis perdagangan \ninternasional. Selain konsep etika bisnis perdagangan domestik tersebut, konsep \nlain menurut Alquran ialah pertama, perlunya mengoptimalkan religiusitas para \npebisnis perdagangan internasional, karena begitu sangat jauh dan luasnya \njangkauan bisnis perdagangannya; kedua, pebisnis perdagangan harus benar benar mencegah praktik al-ba>t}il seperti perilaku korupsi; pencegahan pendirian \npabrik sweatshop yang merugikan para pekerja; dan mencegah tindakan buruh \nanak; ketiga, labelisasi halal dalam kegiatan produk ekspor dan impor; dan \nkeempat mencegah tindakan bisnis perdagangan manusia (Human Trafficking).\n', 4, '003-Disertasi.pdf', 5),
(20, 'PROGRAM PELATIHAN EXPERIENTIAL LEARNING UNTUK \nPENGEMBANGAN KECERDASAN BUDAYA GURU BIMBINGAN DAN \nKONSELING DI MAKASSAR', '158123008', '2018-06-23', '2022-12-05', '197307212001122001', '198210222003212004', '196705192000122001', '196712202000121001', 3, 'Proses konseling pada dasarnya merupakan pertemuan dua budaya atau lebih antara guru \nBK dan siswa. Seorang guru BK perlu peka terhadap perbedaan budaya antara dirinya \ndengan siswa agar siswa merasa diterima, didengarkan dan dihargai sesuai nilai-nilai \nbudaya yang dibawa pada proses konseling. Tujuan penelitian ini adalah menghasilkan \nprogram pelatihan experiential learning untuk mengembangkan kecerdasan budaya guru \nBimbingan dan Konseling. Penelitian ini dilaksanakan dalam tiga tahap yaitu tahap \npendahuluan, pengembangan program dan implementasi program. Pendekatan penelitian \nyang digunakan adalah campuran kuantitatif-kualitatif dengan explanatory sequential \nmixed methods. Pendekatan kuantitatif digunakan pada uji terbatas program pelatihan \nexperiential learning melalui quasi-experiment one-group pretest-posttest design. \nPendekatan kualitatif digunakan untuk mengeksplorasi pengalaman interaksi multibudaya \nguru BK melalui pelatihan experiential learning. Konstruk kecerdasan budaya guru BK \ndibuat berdasarkan uji validitas dan reliabilitas menggunakan skala kecerdasan budaya \nyang disebar secara online dengan melibatkan partisipan sebanyak 659 guru BK dari \nseluruh Indonesia. Untuk memperoleh gambaran kecerdasan budaya, skala yang telah \nvalid dan reliabel tersebut disebarkan kepada 112 Guru BK di Makassar dan tahap uji \ncoba melibatkan 6 guru Bimbingan dan Konseling. Data kuantitatif dikumpulkan \nmenggunakan skala kecerdasan budaya guru BK dan dianalisis menggunakan Cohen \nEffect Size dan Reliability Change Index (RCI) sedangkan data kualitatif dikumpulkan \nmenggunakan pedoman observasi, pedoman wawancara dan rekaman video dan dianalisis \nmenggunakan analisis deskriptif kualitatif. Hasil penelitian menunjukkan bahwa program \npelatihan experiential learning fisibel untuk pengembangan kecerdasan budaya guru BK, \nbaik secara total maupun keempat dimensinyanya. Nilai RCI secara total dan keempat \ndimensinya menunjukkan nilai yang lebih besar dari 1,96. Dengan demikian \nperkembangan kecerdasan budaya guru BK sebelum dan sesudah pelatihan experiential \nlearning reliabilitas perubahannya dapat diandalkan. Hasil Penelitian ini \ndirekomendasikan kepada P4TK bidang Pendidikan Jasmani dan Bimbingan dan \nKonseling, Perguruan Tinggi khususnya Program Studi Bimbingan dan Konseling serta \npeneliti selanjutnya.', 11, '004-Disertasi.pdf', 5),
(25, 'Perancangan Perangkat Lunak Prediksi Pergerakan Harga Saham dengan Metode Relative Strength Index (RSI)', '161401001', '2021-02-10', '2022-12-13', '196509122003111004', '196407232001121001', '196705192000122001', '196712202000121001', 1, 'Nowadays investment is not only dominated by conventional ways such as bank’s deposit, etc. but it has started with investing stocks that brought more promising profits. That’s where the ideas of this thesis came from. The purpose of this study is to develop a software that had ability to calculate and give the prediction about stock’s price trend using one of the most popular indicator in stock’s technical analysis which called Relative Strength Index (RSI) method. The software was developed by PHP 5 programming language and MySQL 5 as it’s database server. The analysis and design of the software development process was based on object oriented methodology using UML (Unified Modelling Language) as it’s tools to build the blueprint of the system. The result of this thesis is a software that can help public or professional people to make a right decision in stock marketing so it can minimize loss that caused by knowledge limitation about stock’s price trend analysis.', 8, '013-Skripsi.pdf', 1),
(27, 'Test insert', '161401001', '2022-12-15', '2022-12-21', '196509122003111004', '196407232001121001', '196908102003111002', '197002212000211002', 5, 'Ini adalah Abstract ', 3, 'Laporan Tubes (2).docx', 2),
(28, 'sad', '117038026', '2022-12-07', '2022-12-26', '196509122003111004', '196407232001121001', '196908102003111002', '197002212000211002', 1, 'da', 4, '013-Skripsi (1).pdf', 1),
(31, 'Test judul', '117038038', '2022-12-22', '2022-12-30', '196407232001121001', '196705192000122001', '196908102003111002', '197002212000211002', 2, 'Halo semua ', 4, 'EdbertEdbert-Pengenalan Packe-certificate (3).pdf', 4);

--
-- Triggers `tugas_akhir`
--
DELIMITER $$
CREATE TRIGGER `log_tugas_akhir_delete` AFTER DELETE ON `tugas_akhir` FOR EACH ROW BEGIN
    DECLARE nama_kategori_repo VARCHAR(50);
    DECLARE n_prodi VARCHAR(50);
    SELECT nama_kategori INTO nama_kategori_repo FROM kategori_repo WHERE id = OLD.id_kategori_repo;
    SELECT nama_prodi INTO n_prodi FROM prodi WHERE id = OLD.id_prodi;
    INSERT INTO log_tugas_akhir (
        id_tugas_akhir,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        OLD.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "abstract", OLD.abstract,
            "nim_mhs", OLD.nim_mhs,
            "nama_kategori_repo", nama_kategori_repo,
            "prodi", n_prodi
        ),
        null,
        'DELETE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_tugas_akhir_insert` AFTER INSERT ON `tugas_akhir` FOR EACH ROW BEGIN
    DECLARE nama_kategori_repo VARCHAR(50);
    DECLARE n_prodi VARCHAR(50);
    SELECT nama_kategori INTO nama_kategori_repo FROM kategori_repo WHERE id = NEW.id_kategori_repo;
    SELECT nama_prodi INTO n_prodi FROM prodi WHERE id = NEW.id_prodi;
    INSERT INTO log_tugas_akhir (
        id_tugas_akhir,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        null,
        JSON_OBJECT(
            "judul", NEW.judul,
            "abstract", NEW.abstract,
            "nim_mhs", NEW.nim_mhs,
            "nama_kategori_repo", nama_kategori_repo,
            "prodi", n_prodi
        ),
        'INSERT',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_tugas_akhir_update` AFTER UPDATE ON `tugas_akhir` FOR EACH ROW BEGIN
    DECLARE nama_kategori_repo VARCHAR(50);
    DECLARE n_prodi VARCHAR(50);
    SELECT nama_kategori INTO nama_kategori_repo FROM kategori_repo WHERE id = NEW.id_kategori_repo;
    SELECT nama_prodi INTO n_prodi FROM prodi WHERE id = NEW.id_prodi;
    INSERT INTO log_tugas_akhir (
        id_tugas_akhir,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp
    )
    VALUES(
        NEW.id,
        JSON_OBJECT(
            "judul", OLD.judul,
            "abstract", OLD.abstract,
            "nim_mhs", OLD.nim_mhs,
            "nama_kategori_repo", nama_kategori_repo,
            "prodi", n_prodi
        ),
        JSON_OBJECT(
            "judul", NEW.judul,
            "abstract", NEW.abstract,
            "nim_mhs", NEW.nim_mhs,
            "nama_kategori_repo", nama_kategori_repo,
            "prodi", n_prodi
        ),
        'UPDATE',
        CURRENT_TIMESTAMP
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_judul_tugas_akhir` BEFORE INSERT ON `tugas_akhir` FOR EACH ROW BEGIN
DECLARE num_count INT;
SELECT COUNT(*) INTO num_count FROM tugas_akhir WHERE LOWER(judul) = LOWER(NEW.judul);
IF num_count > 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Judul sudah ada';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_judul_update_tugas_akhir` BEFORE UPDATE ON `tugas_akhir` FOR EACH ROW BEGIN
DECLARE num_count INT;
IF OLD.judul != NEW.judul THEN
	SELECT COUNT(*) INTO num_count FROM tugas_akhir WHERE LOWER(judul) = LOWER(NEW.judul);
    IF num_count > 0 THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Judul sudah ada';
        END IF;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_disertasi`
-- (See below for the actual view)
--
CREATE TABLE `view_disertasi` (
`Judul` text
,`Nama Mahasiswa` varchar(50)
,`Nama Dosen Pembimbing 1` varchar(50)
,`Nama Dosen Pembimbing 2` varchar(50)
,`Nama Prodi` varchar(30)
,`Tanggal Pengesahan` date
,`Tanggal Upload` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_ebook`
-- (See below for the actual view)
--
CREATE TABLE `view_ebook` (
`Judul` longtext
,`Nama Penulis` char(40)
,`Abstract` longtext
,`Tanggal Terbit` date
,`Tanggal Upload` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jlh_bimbingan_doping`
-- (See below for the actual view)
--
CREATE TABLE `view_jlh_bimbingan_doping` (
`NIP` varchar(20)
,`Nama Dosen` varchar(50)
,`Jumlah Bimbingan` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jlh_judul_kategori`
-- (See below for the actual view)
--
CREATE TABLE `view_jlh_judul_kategori` (
`ID` int(2)
,`Nama Kategori` varchar(50)
,`Nama Prodi` varchar(30)
,`Jumlah Judul` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jlh_judul_keyword`
-- (See below for the actual view)
--
CREATE TABLE `view_jlh_judul_keyword` (
`ID` int(3)
,`Nama Keyword` varchar(50)
,`Nama Prodi` varchar(30)
,`Jumlah Judul` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jlh_judul_prodi`
-- (See below for the actual view)
--
CREATE TABLE `view_jlh_judul_prodi` (
`ID` int(2)
,`Nama Program Studi` varchar(30)
,`Jumlah Judul` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jlh_surat`
-- (See below for the actual view)
--
CREATE TABLE `view_jlh_surat` (
`ID` int(3)
,`Nama Jenis` char(50)
,`Jumlah Surat` int(11)
,`Jumlah Approve` int(11)
,`Jumlah Denied` int(11)
,`Jumlah Pending` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_penelitian_dosen`
-- (See below for the actual view)
--
CREATE TABLE `view_penelitian_dosen` (
`Judul` longtext
,`Nama Anggota` text
,`Nama Prodi` varchar(30)
,`Abstract` longtext
,`Tanggal Upload` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_skripsi`
-- (See below for the actual view)
--
CREATE TABLE `view_skripsi` (
`Judul` text
,`Nama Mahasiswa` varchar(50)
,`Nama Dosen Pembimbing 1` varchar(50)
,`Nama Dosen Pembimbing 2` varchar(50)
,`Nama Prodi` varchar(30)
,`Tanggal Pengesahan` date
,`Tanggal Upload` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_surat`
-- (See below for the actual view)
--
CREATE TABLE `view_surat` (
`Judul` longtext
,`Jenis Surat` char(50)
,`Nama Mahasiswa` varchar(50)
,`Email Mahasiswa` varchar(50)
,`Keterangan` longtext
,`Tanggal Diperlukan` date
,`Status` char(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_thesis`
-- (See below for the actual view)
--
CREATE TABLE `view_thesis` (
`Judul` text
,`Nama Mahasiswa` varchar(50)
,`Nama Dosen Pembimbing 1` varchar(50)
,`Nama Dosen Pembimbing 2` varchar(50)
,`Nama Prodi` varchar(30)
,`Tanggal Pengesahan` date
,`Tanggal Upload` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tugas_akhir`
-- (See below for the actual view)
--
CREATE TABLE `view_tugas_akhir` (
`Judul` text
,`Nama Mahasiswa` varchar(50)
,`Nama Dosen Pembimbing 1` varchar(50)
,`Nama Dosen Pembimbing 2` varchar(50)
,`Nama Prodi` varchar(30)
,`Kategori` varchar(50)
,`Tanggal Pengesahan` date
,`Tanggal Upload` date
);

-- --------------------------------------------------------

--
-- Structure for view `view_disertasi`
--
DROP TABLE IF EXISTS `view_disertasi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_disertasi`  AS SELECT `ta`.`judul` AS `Judul`, `m`.`nama` AS `Nama Mahasiswa`, `dp1`.`nama_lengkap` AS `Nama Dosen Pembimbing 1`, `dp2`.`nama_lengkap` AS `Nama Dosen Pembimbing 2`, `p`.`nama_prodi` AS `Nama Prodi`, `ta`.`tgl_pengesahan` AS `Tanggal Pengesahan`, `ta`.`tgl_upload` AS `Tanggal Upload` FROM ((((`tugas_akhir` `ta` join `mahasiswa` `m` on(`ta`.`nim_mhs` = `m`.`nim`)) join `prodi` `p` on(`ta`.`id_prodi` = `p`.`id`)) join `dosen_pembimbing` `dp1` on(`ta`.`nip_dosen_pembimbing1` = `dp1`.`nip`)) join `dosen_pembimbing` `dp2` on(`ta`.`nip_dosen_pembimbing2` = `dp2`.`nip`)) WHERE `ta`.`id_kategori_repo` = 3 OR `ta`.`id_kategori_repo` = 7 ORDER BY `ta`.`tgl_upload` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_ebook`
--
DROP TABLE IF EXISTS `view_ebook`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ebook`  AS SELECT `ebook`.`judul` AS `Judul`, `ebook`.`penulis` AS `Nama Penulis`, `ebook`.`abstract` AS `Abstract`, `ebook`.`tgl_terbit` AS `Tanggal Terbit`, `ebook`.`tgl_upload` AS `Tanggal Upload` FROM `ebook` ORDER BY `ebook`.`tgl_upload` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_jlh_bimbingan_doping`
--
DROP TABLE IF EXISTS `view_jlh_bimbingan_doping`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jlh_bimbingan_doping`  AS SELECT `dosen_pembimbing`.`nip` AS `NIP`, `dosen_pembimbing`.`nama_lengkap` AS `Nama Dosen`, `jlh_bimbingan_doping`(`dosen_pembimbing`.`nip`) AS `Jumlah Bimbingan` FROM `dosen_pembimbing``dosen_pembimbing`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_jlh_judul_kategori`
--
DROP TABLE IF EXISTS `view_jlh_judul_kategori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jlh_judul_kategori`  AS SELECT `kategori_repo`.`id` AS `ID`, `kategori_repo`.`nama_kategori` AS `Nama Kategori`, (select `prodi`.`nama_prodi` from `prodi` where `prodi`.`id` = `kategori_repo`.`id_prodi`) AS `Nama Prodi`, `jlh_judul_kategori_repo`(`kategori_repo`.`id`) AS `Jumlah Judul` FROM `kategori_repo``kategori_repo`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_jlh_judul_keyword`
--
DROP TABLE IF EXISTS `view_jlh_judul_keyword`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jlh_judul_keyword`  AS SELECT `keyword`.`id` AS `ID`, `keyword`.`nama_keyword` AS `Nama Keyword`, (select `prodi`.`nama_prodi` from `prodi` where `prodi`.`id` = `keyword`.`id_prodi`) AS `Nama Prodi`, `jlh_judul_keyword`(`keyword`.`id`) AS `Jumlah Judul` FROM `keyword``keyword`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_jlh_judul_prodi`
--
DROP TABLE IF EXISTS `view_jlh_judul_prodi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jlh_judul_prodi`  AS SELECT `prodi`.`id` AS `ID`, `prodi`.`nama_prodi` AS `Nama Program Studi`, `jlh_judul_prodi`(`prodi`.`id`) AS `Jumlah Judul` FROM `prodi``prodi`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_jlh_surat`
--
DROP TABLE IF EXISTS `view_jlh_surat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jlh_surat`  AS SELECT `jenis_surat`.`id` AS `ID`, `jenis_surat`.`nama_jenis` AS `Nama Jenis`, `jlh_total_surat`(`jenis_surat`.`id`) AS `Jumlah Surat`, `jlh_status_surat`(`jenis_surat`.`id`,'approve') AS `Jumlah Approve`, `jlh_status_surat`(`jenis_surat`.`id`,'denied') AS `Jumlah Denied`, `jlh_status_surat`(`jenis_surat`.`id`,'pending') AS `Jumlah Pending` FROM `jenis_surat``jenis_surat`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_penelitian_dosen`
--
DROP TABLE IF EXISTS `view_penelitian_dosen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_penelitian_dosen`  AS SELECT `pd`.`judul` AS `Judul`, `pd`.`nama_anggota` AS `Nama Anggota`, `p`.`nama_prodi` AS `Nama Prodi`, `pd`.`abstract` AS `Abstract`, `pd`.`tgl_upload` AS `Tanggal Upload` FROM (`penelitian_dosen` `pd` join `prodi` `p` on(`pd`.`id_prodi` = `p`.`id`)) ORDER BY `pd`.`tgl_upload` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_skripsi`
--
DROP TABLE IF EXISTS `view_skripsi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_skripsi`  AS SELECT `ta`.`judul` AS `Judul`, `m`.`nama` AS `Nama Mahasiswa`, `dp1`.`nama_lengkap` AS `Nama Dosen Pembimbing 1`, `dp2`.`nama_lengkap` AS `Nama Dosen Pembimbing 2`, `p`.`nama_prodi` AS `Nama Prodi`, `ta`.`tgl_pengesahan` AS `Tanggal Pengesahan`, `ta`.`tgl_upload` AS `Tanggal Upload` FROM ((((`tugas_akhir` `ta` join `mahasiswa` `m` on(`ta`.`nim_mhs` = `m`.`nim`)) join `prodi` `p` on(`ta`.`id_prodi` = `p`.`id`)) join `dosen_pembimbing` `dp1` on(`ta`.`nip_dosen_pembimbing1` = `dp1`.`nip`)) join `dosen_pembimbing` `dp2` on(`ta`.`nip_dosen_pembimbing2` = `dp2`.`nip`)) WHERE `ta`.`id_kategori_repo` = 1 OR `ta`.`id_kategori_repo` = 5 ORDER BY `ta`.`tgl_upload` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_surat`
--
DROP TABLE IF EXISTS `view_surat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_surat`  AS SELECT `s`.`judul` AS `Judul`, `js`.`nama_jenis` AS `Jenis Surat`, `m`.`nama` AS `Nama Mahasiswa`, `s`.`email_akun` AS `Email Mahasiswa`, `s`.`keterangan` AS `Keterangan`, `s`.`tgl_diperlukan` AS `Tanggal Diperlukan`, `s`.`status` AS `Status` FROM ((`surat` `s` join `jenis_surat` `js` on(`s`.`id_jenis_surat` = `js`.`id`)) join `mahasiswa` `m` on(`s`.`email_akun` = `m`.`email`)) ORDER BY `s`.`tgl_diperlukan` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_thesis`
--
DROP TABLE IF EXISTS `view_thesis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_thesis`  AS SELECT `ta`.`judul` AS `Judul`, `m`.`nama` AS `Nama Mahasiswa`, `dp1`.`nama_lengkap` AS `Nama Dosen Pembimbing 1`, `dp2`.`nama_lengkap` AS `Nama Dosen Pembimbing 2`, `p`.`nama_prodi` AS `Nama Prodi`, `ta`.`tgl_pengesahan` AS `Tanggal Pengesahan`, `ta`.`tgl_upload` AS `Tanggal Upload` FROM ((((`tugas_akhir` `ta` join `mahasiswa` `m` on(`ta`.`nim_mhs` = `m`.`nim`)) join `prodi` `p` on(`ta`.`id_prodi` = `p`.`id`)) join `dosen_pembimbing` `dp1` on(`ta`.`nip_dosen_pembimbing1` = `dp1`.`nip`)) join `dosen_pembimbing` `dp2` on(`ta`.`nip_dosen_pembimbing2` = `dp2`.`nip`)) WHERE `ta`.`id_kategori_repo` = 2 OR `ta`.`id_kategori_repo` = 6 ORDER BY `ta`.`tgl_upload` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_tugas_akhir`
--
DROP TABLE IF EXISTS `view_tugas_akhir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tugas_akhir`  AS SELECT `ta`.`judul` AS `Judul`, `m`.`nama` AS `Nama Mahasiswa`, `dp1`.`nama_lengkap` AS `Nama Dosen Pembimbing 1`, `dp2`.`nama_lengkap` AS `Nama Dosen Pembimbing 2`, `p`.`nama_prodi` AS `Nama Prodi`, `kr`.`nama_kategori` AS `Kategori`, `ta`.`tgl_pengesahan` AS `Tanggal Pengesahan`, `ta`.`tgl_upload` AS `Tanggal Upload` FROM (((((`tugas_akhir` `ta` join `mahasiswa` `m` on(`ta`.`nim_mhs` = `m`.`nim`)) join `prodi` `p` on(`ta`.`id_prodi` = `p`.`id`)) join `dosen_pembimbing` `dp1` on(`ta`.`nip_dosen_pembimbing1` = `dp1`.`nip`)) join `dosen_pembimbing` `dp2` on(`ta`.`nip_dosen_pembimbing2` = `dp2`.`nip`)) join `kategori_repo` `kr` on(`ta`.`id_kategori_repo` = `kr`.`id`)) ORDER BY `ta`.`tgl_upload` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `balasan_surat`
--
ALTER TABLE `balasan_surat`
  ADD KEY `id_surat` (`id_surat`,`pengurus_surat`),
  ADD KEY `pengurus_surat` (`pengurus_surat`);

--
-- Indexes for table `dosen_pembimbing`
--
ALTER TABLE `dosen_pembimbing`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ebook` ADD FULLTEXT KEY `index_ebook` (`judul`,`abstract`);

--
-- Indexes for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_repo`
--
ALTER TABLE `kategori_repo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `log_ebook`
--
ALTER TABLE `log_ebook`
  ADD PRIMARY KEY (`id_ebook`,`dml_type`,`dml_timestamp`);

--
-- Indexes for table `log_penelitian_dosen`
--
ALTER TABLE `log_penelitian_dosen`
  ADD PRIMARY KEY (`id_penelitian`,`dml_type`,`dml_timestamp`);

--
-- Indexes for table `log_surat`
--
ALTER TABLE `log_surat`
  ADD PRIMARY KEY (`id_surat`,`dml_type`,`dml_timestamp`);

--
-- Indexes for table `log_tugas_akhir`
--
ALTER TABLE `log_tugas_akhir`
  ADD PRIMARY KEY (`id_tugas_akhir`,`dml_type`,`dml_timestamp`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `penelitian_dosen`
--
ALTER TABLE `penelitian_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_repo` (`id_kategori_repo`,`id_prodi`),
  ADD KEY `id_prodi` (`id_prodi`);
ALTER TABLE `penelitian_dosen` ADD FULLTEXT KEY `index_penelitiandosen` (`judul`,`abstract`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_akun`
--
ALTER TABLE `role_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_akun` (`email_akun`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jenis_surat` (`id_jenis_surat`,`email_akun`),
  ADD KEY `email_akun` (`email_akun`);

--
-- Indexes for table `tugas_akhir`
--
ALTER TABLE `tugas_akhir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip_dosen_pembimbing1` (`nip_dosen_pembimbing1`,`nip_dosen_pembimbing2`),
  ADD KEY `nip_dosen_pembimbing2` (`nip_dosen_pembimbing2`),
  ADD KEY `nim_mhs` (`nim_mhs`,`id_kategori_repo`,`id_keyword`,`id_prodi`),
  ADD KEY `id_prodi` (`id_prodi`),
  ADD KEY `id_keyword` (`id_keyword`),
  ADD KEY `id_kategori_repo` (`id_kategori_repo`),
  ADD KEY `nip_dosen_penguji1` (`nip_dosen_penguji1`,`nip_dosen_penguji2`),
  ADD KEY `nip_dosen_penguji2` (`nip_dosen_penguji2`);
ALTER TABLE `tugas_akhir` ADD FULLTEXT KEY `index_tugasakhir` (`judul`,`abstract`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kategori_repo`
--
ALTER TABLE `kategori_repo`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `penelitian_dosen`
--
ALTER TABLE `penelitian_dosen`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_akun`
--
ALTER TABLE `role_akun`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tugas_akhir`
--
ALTER TABLE `tugas_akhir`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balasan_surat`
--
ALTER TABLE `balasan_surat`
  ADD CONSTRAINT `balasan_surat_ibfk_2` FOREIGN KEY (`pengurus_surat`) REFERENCES `akun` (`email`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `balasan_surat_ibfk_3` FOREIGN KEY (`id_surat`) REFERENCES `surat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kategori_repo`
--
ALTER TABLE `kategori_repo`
  ADD CONSTRAINT `kategori_repo_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `penelitian_dosen`
--
ALTER TABLE `penelitian_dosen`
  ADD CONSTRAINT `penelitian_dosen_ibfk_1` FOREIGN KEY (`id_kategori_repo`) REFERENCES `kategori_repo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `penelitian_dosen_ibfk_2` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `role_akun`
--
ALTER TABLE `role_akun`
  ADD CONSTRAINT `role_akun_ibfk_1` FOREIGN KEY (`email_akun`) REFERENCES `akun` (`email`) ON UPDATE CASCADE;

--
-- Constraints for table `surat`
--
ALTER TABLE `surat`
  ADD CONSTRAINT `surat_ibfk_1` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `surat_ibfk_2` FOREIGN KEY (`email_akun`) REFERENCES `akun` (`email`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tugas_akhir`
--
ALTER TABLE `tugas_akhir`
  ADD CONSTRAINT `tugas_akhir_ibfk_1` FOREIGN KEY (`nip_dosen_pembimbing1`) REFERENCES `dosen_pembimbing` (`nip`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tugas_akhir_ibfk_2` FOREIGN KEY (`nip_dosen_pembimbing2`) REFERENCES `dosen_pembimbing` (`nip`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tugas_akhir_ibfk_3` FOREIGN KEY (`nim_mhs`) REFERENCES `mahasiswa` (`nim`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tugas_akhir_ibfk_4` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tugas_akhir_ibfk_5` FOREIGN KEY (`id_keyword`) REFERENCES `keyword` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tugas_akhir_ibfk_6` FOREIGN KEY (`id_kategori_repo`) REFERENCES `kategori_repo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tugas_akhir_ibfk_7` FOREIGN KEY (`nip_dosen_penguji1`) REFERENCES `dosen_pembimbing` (`nip`),
  ADD CONSTRAINT `tugas_akhir_ibfk_8` FOREIGN KEY (`nip_dosen_penguji2`) REFERENCES `dosen_pembimbing` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
