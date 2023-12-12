-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2023 at 08:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_servis`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis`
--

CREATE TABLE `detail_servis` (
  `id` int(4) NOT NULL,
  `id_servis` varchar(5) DEFAULT NULL,
  `id_part` varchar(6) DEFAULT NULL,
  `nm_part` varchar(35) DEFAULT NULL,
  `harga` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_servis`
--

INSERT INTO `detail_servis` (`id`, `id_servis`, `id_part`, `nm_part`, `harga`) VALUES
(6, 'S0001', 'LCD001', 'LCD 14 Inch Slim 40 Pin', 750000),
(7, 'S0001', 'LCD002', 'LCD 14 Inch 30 Pin', 800000),
(8, 'S0001', 'LCD002', 'LCD 14 Inch 30 Pin', 800000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `no_faktur` varchar(5) NOT NULL,
  `tgl` date DEFAULT NULL,
  `id_supplier` varchar(4) DEFAULT NULL,
  `id_part` varchar(4) DEFAULT NULL,
  `harga_part` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_faktur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`no_faktur`, `tgl`, `id_supplier`, `id_part`, `harga_part`, `jumlah`, `total_faktur`) VALUES
('F0001', '2023-12-12', '1', 'B006', 215000, 100, 21500000),
('F0002', '2023-12-12', '1', 'B006', 225000, 100, 22500000);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(3) NOT NULL,
  `nm_karyawan` varchar(35) DEFAULT NULL,
  `noHp_karyawan` varchar(15) DEFAULT NULL,
  `jabatan` enum('Admin','Owner','Teknisi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nm_karyawan`, `noHp_karyawan`, `jabatan`) VALUES
('P01', 'Muhammad Naufal Saputra', '085712345678', 'Teknisi'),
('P02', 'Jodi Ramadhan', '085812345678', 'Admin'),
('P03', 'Wisnu Aji Pamungkas', '085889634432', 'Owner');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` varchar(5) NOT NULL,
  `tgl` date DEFAULT NULL,
  `no_nota` varchar(5) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `tgl`, `no_nota`, `total`) VALUES
('L0001', '2023-12-12', 'N0001', 2450000);

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

CREATE TABLE `part` (
  `id_part` varchar(6) NOT NULL,
  `nm_part` varchar(100) DEFAULT NULL,
  `harga_part` int(6) DEFAULT NULL,
  `stok` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`id_part`, `nm_part`, `harga_part`, `stok`) VALUES
('B006', 'SSD SATA III V-gen 128GB', 225000, 100),
('INS001', 'Install Software', 50000, 1000),
('INW001', 'Install Windows 7/8/10/11 32/64bit', 100000, 1000),
('LCD001', 'LCD 14 Inch Slim 40 Pin', 750000, 100),
('LCD002', 'LCD 14 Inch Slim 30 Pin', 800000, 100),
('LCD003', 'LCD 14 Inch Tebal 30 Pin', 550000, 100),
('LCD004', 'LCD 14 Inch Tebal 40 Pin', 600000, 100),
('LCD005', 'LCD FHD 14 Inch Slim 30 Pin', 120000, 100),
('RAM001', 'RAM DDR3/L 2GB', 100000, 100),
('RAM002', 'RAM DDR3/L 4GB', 150000, 100),
('RAM003', 'RAM DDR3/L 8GB', 250000, 100),
('RAM004', 'RAM DDR4 4GB', 250000, 100),
('RAM005', 'RAM DDR4 8GB', 450000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `nm_pelanggan` varchar(35) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `no_hp`) VALUES
('C0001', 'Dina Aulia Sabilla', '085889634432');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no_nota` varchar(5) NOT NULL,
  `nm_admin` varchar(35) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `id_servis` varchar(5) DEFAULT NULL,
  `nm_pelanggan` varchar(35) DEFAULT NULL,
  `tipe_laptop` varchar(50) DEFAULT NULL,
  `keluhan_awal` text DEFAULT NULL,
  `nm_teknisi` varchar(35) DEFAULT NULL,
  `total_harga` int(11) NOT NULL,
  `biaya_jasa` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`no_nota`, `nm_admin`, `tgl`, `id_servis`, `nm_pelanggan`, `tipe_laptop`, `keluhan_awal`, `nm_teknisi`, `total_harga`, `biaya_jasa`, `total`) VALUES
('N0001', 'Wisnu Aji Pamungkas', '2023-12-12', 'S0001', 'Dina Aulia Sabilla', 'Asus X453M', 'Mati', 'Zhelitaayu Nurul Liza', 2350000, 100000, 2450000);

-- --------------------------------------------------------

--
-- Table structure for table `servis`
--

CREATE TABLE `servis` (
  `id_servis` varchar(5) NOT NULL,
  `tgl` datetime DEFAULT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `nm_pelanggan` varchar(35) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `tipe_laptop` varchar(50) DEFAULT NULL,
  `keluhan_awal` text DEFAULT NULL,
  `nm_teknisi` varchar(35) DEFAULT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servis`
--

INSERT INTO `servis` (`id_servis`, `tgl`, `id_pelanggan`, `nm_pelanggan`, `no_hp`, `tipe_laptop`, `keluhan_awal`, `nm_teknisi`, `total_harga`) VALUES
('S0001', '2023-12-12 07:13:38', 'C0001', 'Dina Aulia Sabilla', '085889634432', 'Asus X453M', 'Mati', 'Zhelitaayu Nurul Liza', 2350000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(4) NOT NULL,
  `nm_supplier` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nm_supplier`) VALUES
(1, 'Intact Official Store'),
(2, 'Mega Perkasa Computer'),
(3, 'Centro Part'),
(4, 'Full Star Computer');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_karyawan` varchar(4) NOT NULL,
  `id_role` int(4) DEFAULT NULL,
  `nm_karyawan` varchar(35) DEFAULT NULL,
  `username` varchar(35) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status_akun` enum('Aktif','Nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_karyawan`, `id_role`, `nm_karyawan`, `username`, `password`, `image`, `status_akun`) VALUES
('P01', 2, 'Muhammad Naufal Saputra', 'owner1', '$2y$10$LonyBzE3xsxdNcnsFcTfO.H7pM56gX.41CLuhs9SV/RP0J0VX.dOi', 'default.svg', 'Aktif'),
('P02', 1, 'Jodi Ramadhan', 'admin123', '$2y$10$ZllKi4Mn9sWI/5yRNLMjwuAK9gZhsmif3Xnt/m5uRE5bqdRqsvfGa', 'default.svg', 'Aktif'),
('P03', 2, 'Wisnu Aji Pamungkas', 'owner123', '$2y$10$I0SYmzTJXlLms.As05DSAeMB/ZY4Oen7fwiJ/NOuEpdI4m7b.VLCu', 'default.svg', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id_access` int(4) NOT NULL,
  `id_role` int(4) DEFAULT NULL,
  `id_menu` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id_access`, `id_role`, `id_menu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int(11) NOT NULL,
  `title` varchar(35) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id_menu`, `title`, `url`, `icon`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-fw fa-tachometer-alt'),
(2, 'Servis', 'ManajemenData', 'fas fa-fw fa-tools'),
(3, 'Pembayaran', 'ManajemenData/pembayaran', 'fas fa-fw fa-file-invoice-dollar'),
(4, 'Laporan', 'ManajemenData/Laporan', 'fas fa-fw fa-file-alt'),
(5, 'Laporan', 'MonitoringData', 'fas fa-fw fa-file-alt'),
(6, 'Komponen & Part', 'MonitoringData/barang', 'fas fa-fw fa-box'),
(7, 'Pengguna', 'ManajemenKaryawan', 'fas fa-fw fa-user'),
(8, 'Karyawan', 'ManajemenKaryawan/karyawan', 'fas fa-fw fa-user-tie');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int(4) NOT NULL,
  `nm_role` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_role`, `nm_role`) VALUES
(1, 'Admin'),
(2, 'Owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_servis`
--
ALTER TABLE `detail_servis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `part`
--
ALTER TABLE `part`
  ADD PRIMARY KEY (`id_part`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no_nota`);

--
-- Indexes for table `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`id_servis`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id_access`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_servis`
--
ALTER TABLE `detail_servis`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id_access` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
