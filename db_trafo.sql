-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2025 at 02:23 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_trafo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `username`, `password`) VALUES
(2, 'tjbalai', '$2y$10$VQlaKqnAskiewUJwT858d.achNZQZBcEavYgPqbWDQsasBHNadpBm');

-- --------------------------------------------------------

--
-- Table structure for table `tb_gardu`
--

CREATE TABLE `tb_gardu` (
  `id` int UNSIGNED NOT NULL,
  `no_gardu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_general_ci,
  `posko` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `penyulang` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `merk` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `daya_trafo` int UNSIGNED DEFAULT NULL,
  `nomor_seri` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tiang_trafo` enum('SINGLE POLE','DOUBLE POLE','TRIPLE POLE') COLLATE utf8mb4_general_ci DEFAULT 'SINGLE POLE',
  `koordinat` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_gardu`
--

INSERT INTO `tb_gardu` (`id`, `no_gardu`, `alamat`, `posko`, `penyulang`, `merk`, `daya_trafo`, `nomor_seri`, `tiang_trafo`, `koordinat`, `created_at`) VALUES
(1, 'TG04', 'MEDAN', 'CTH', 'CTH', 'CTH', 250, '', 'DOUBLE POLE', '2.958406, 99.797756', '2025-11-20 03:00:24'),
(2, 'TB044', 'JL. PASAR TRAKTOR', 'TANJUNG BALAI', 'TG.04', 'B & D', 100, '', 'SINGLE POLE', '2.931898, 99.784349', '2025-11-20 06:55:10'),
(3, 'TJB01', 'Jl. Mataram', 'TANJUNG BALAI', 'TG.04', 'Trafindo', 250, '', 'DOUBLE POLE', '2.952556, 99.796940', '2025-11-21 04:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengukuran`
--

CREATE TABLE `tb_pengukuran` (
  `id` int UNSIGNED NOT NULL,
  `gardu_id` int UNSIGNED NOT NULL,
  `petugas` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_ukur` date NOT NULL,
  `in_lwbp_r` float DEFAULT '0',
  `in_lwbp_s` float DEFAULT '0',
  `in_lwbp_t` float DEFAULT '0',
  `in_lwbp_n` float DEFAULT '0',
  `in_wbp_r` float DEFAULT '0',
  `in_wbp_s` float DEFAULT '0',
  `in_wbp_t` float DEFAULT '0',
  `in_wbp_n` float DEFAULT '0',
  `out_lwbp_r_j1` float DEFAULT '0',
  `out_lwbp_r_j2` float DEFAULT '0',
  `out_lwbp_r_j3` float DEFAULT '0',
  `out_lwbp_r_j4` float DEFAULT '0',
  `out_lwbp_r_total` float DEFAULT '0',
  `out_lwbp_s_j1` float DEFAULT '0',
  `out_lwbp_s_j2` float DEFAULT '0',
  `out_lwbp_s_j3` float DEFAULT '0',
  `out_lwbp_s_j4` float DEFAULT '0',
  `out_lwbp_s_total` float DEFAULT '0',
  `out_lwbp_t_j1` float DEFAULT '0',
  `out_lwbp_t_j2` float DEFAULT '0',
  `out_lwbp_t_j3` float DEFAULT '0',
  `out_lwbp_t_j4` float DEFAULT '0',
  `out_lwbp_t_total` float DEFAULT '0',
  `out_lwbp_n_total` float DEFAULT '0',
  `out_wbp_r_j1` float DEFAULT '0',
  `out_wbp_r_j2` float DEFAULT '0',
  `out_wbp_r_j3` float DEFAULT '0',
  `out_wbp_r_j4` float DEFAULT '0',
  `out_wbp_r_total` float DEFAULT '0',
  `out_wbp_s_j1` float DEFAULT '0',
  `out_wbp_s_j2` float DEFAULT '0',
  `out_wbp_s_j3` float DEFAULT '0',
  `out_wbp_s_j4` float DEFAULT '0',
  `out_wbp_s_total` float DEFAULT '0',
  `out_wbp_t_j1` float DEFAULT '0',
  `out_wbp_t_j2` float DEFAULT '0',
  `out_wbp_t_j3` float DEFAULT '0',
  `out_wbp_t_j4` float DEFAULT '0',
  `out_wbp_t_total` float DEFAULT '0',
  `out_wbp_n_total` float DEFAULT '0',
  `teg_r_n` float DEFAULT '0',
  `teg_s_n` float DEFAULT '0',
  `teg_t_n` float DEFAULT '0',
  `teg_r_s` float DEFAULT '0',
  `teg_s_t` float DEFAULT '0',
  `teg_r_t` float DEFAULT '0',
  `pent_body` enum('Ada','Tidak Ada') COLLATE utf8mb4_general_ci DEFAULT 'Tidak Ada',
  `nilai_pent_body` float DEFAULT NULL,
  `pent_phbtr` enum('Ada','Tidak Ada') COLLATE utf8mb4_general_ci DEFAULT 'Tidak Ada',
  `nilai_pent_phbtr` float DEFAULT NULL,
  `pent_arrester` enum('Ada','Tidak Ada') COLLATE utf8mb4_general_ci DEFAULT 'Tidak Ada',
  `nilai_pent_arrester` float DEFAULT NULL,
  `daya_terpakai_lwbp` float DEFAULT '0',
  `ket_lwbp` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'NORMAL',
  `daya_terpakai_wbp` float DEFAULT '0',
  `ket_wbp` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'NORMAL',
  `ketidakseimbangan_lwbp` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ketidakseimbangan_wbp` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengukuran`
--

INSERT INTO `tb_pengukuran` (`id`, `gardu_id`, `petugas`, `tanggal_ukur`, `in_lwbp_r`, `in_lwbp_s`, `in_lwbp_t`, `in_lwbp_n`, `in_wbp_r`, `in_wbp_s`, `in_wbp_t`, `in_wbp_n`, `out_lwbp_r_j1`, `out_lwbp_r_j2`, `out_lwbp_r_j3`, `out_lwbp_r_j4`, `out_lwbp_r_total`, `out_lwbp_s_j1`, `out_lwbp_s_j2`, `out_lwbp_s_j3`, `out_lwbp_s_j4`, `out_lwbp_s_total`, `out_lwbp_t_j1`, `out_lwbp_t_j2`, `out_lwbp_t_j3`, `out_lwbp_t_j4`, `out_lwbp_t_total`, `out_lwbp_n_total`, `out_wbp_r_j1`, `out_wbp_r_j2`, `out_wbp_r_j3`, `out_wbp_r_j4`, `out_wbp_r_total`, `out_wbp_s_j1`, `out_wbp_s_j2`, `out_wbp_s_j3`, `out_wbp_s_j4`, `out_wbp_s_total`, `out_wbp_t_j1`, `out_wbp_t_j2`, `out_wbp_t_j3`, `out_wbp_t_j4`, `out_wbp_t_total`, `out_wbp_n_total`, `teg_r_n`, `teg_s_n`, `teg_t_n`, `teg_r_s`, `teg_s_t`, `teg_r_t`, `pent_body`, `nilai_pent_body`, `pent_phbtr`, `nilai_pent_phbtr`, `pent_arrester`, `nilai_pent_arrester`, `daya_terpakai_lwbp`, `ket_lwbp`, `daya_terpakai_wbp`, `ket_wbp`, `ketidakseimbangan_lwbp`, `ketidakseimbangan_wbp`, `keterangan`, `created_at`) VALUES
(1, 2, 'Pengunjung', '2025-11-21', 50, 84, 51, 40, 101, 96, 97, 39, 47, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 233, 237, 403, 410, 409, 'Ada', 1, 'Ada', 1, 'Tidak Ada', 0, 37.37, 'NORMAL', 59.39, 'NORMAL', 'SEIMBANG', 'SEIMBANG', 'Bagus', '2025-11-21 04:36:16'),
(2, 1, 'Asep', '2025-11-21', 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 5, 5, 0, 0, 0, 5, 5, 0, 0, 0, 5, 5, 5, 0, 0, 0, 5, 5, 0, 0, 0, 5, 5, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 'Tidak Ada', 0, 'Tidak Ada', 0, 'Tidak Ada', 0, 0.01, 'UNDERLOAD', 0.01, 'UNDERLOAD', 'SEIMBANG', 'SEIMBANG', 'gud', '2025-11-21 04:58:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_gardu`
--
ALTER TABLE `tb_gardu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_gardu` (`no_gardu`);

--
-- Indexes for table `tb_pengukuran`
--
ALTER TABLE `tb_pengukuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gardu_ukur` (`gardu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_gardu`
--
ALTER TABLE `tb_gardu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pengukuran`
--
ALTER TABLE `tb_pengukuran`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pengukuran`
--
ALTER TABLE `tb_pengukuran`
  ADD CONSTRAINT `fk_gardu_ukur` FOREIGN KEY (`gardu_id`) REFERENCES `tb_gardu` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
