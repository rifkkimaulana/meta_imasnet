-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2023 at 10:28 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kredit_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_appsetting`
--

CREATE TABLE `tb_appsetting` (
  `id` int(11) NOT NULL,
  `nama_aplikasi` varchar(20) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat1` varchar(200) NOT NULL,
  `alamat2` varchar(200) NOT NULL,
  `kode_pos` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `logo` text NOT NULL,
  `bank1` varchar(50) NOT NULL,
  `bank2` varchar(50) NOT NULL,
  `bank3` varchar(50) NOT NULL,
  `atas_nama1` varchar(50) NOT NULL,
  `atas_nama2` varchar(50) NOT NULL,
  `atas_nama3` varchar(50) NOT NULL,
  `no_rekening1` varchar(50) NOT NULL,
  `no_rekening2` varchar(50) NOT NULL,
  `no_rekening3` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `slug` text NOT NULL,
  `wablasapi_id` int(11) NOT NULL,
  `googleapi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_appsetting`
--

INSERT INTO `tb_appsetting` (`id`, `nama_aplikasi`, `nama_perusahaan`, `alamat1`, `alamat2`, `kode_pos`, `email`, `telpon`, `logo`, `bank1`, `bank2`, `bank3`, `atas_nama1`, `atas_nama2`, `atas_nama3`, `no_rekening1`, `no_rekening2`, `no_rekening3`, `keterangan`, `slug`, `wablasapi_id`, `googleapi_id`) VALUES
(1, 'KREDIT APP', 'CV. MITRA MANDIRI SKM', 'Darmaraja', 'Sumedang', '45372', 'rifkkimaulana@gmail.com', '083130649979', '1693495288_f60c98d12ef86f8e8c24.png', 'Bank Mandiri', 'Bank Mandiri', 'LINK AJA', 'RIFKI MAULANA', 'RUKMANA', 'RIFKI MAULANA', '1310016635064', '1310016161319', '083130649979', 'Aplikasi Kredit Barang', 'ka-dashboard', 1, 1),
(2, 'IMASNET MANAGEMENT', 'IMASNET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'im-dashboard', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_google_api_login`
--

CREATE TABLE `tb_google_api_login` (
  `id` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_google_api_login`
--

INSERT INTO `tb_google_api_login` (`id`, `client_id`, `client_secret`) VALUES
(1, '864273206547-ai0t5ucousroe6gguhc6a99sq3vag8c2.apps.googleusercontent.com', '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');

-- --------------------------------------------------------

--
-- Table structure for table `tb_identitas`
--

CREATE TABLE `tb_identitas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `nomor_identitas` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `alamat` text,
  `agama` varchar(50) DEFAULT NULL,
  `status_pernikahan` enum('Belum Menikah','Menikah','Cerai') DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `foto_identitas` varchar(255) DEFAULT NULL,
  `foto_selvi_ktp` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nomor_alternatif_1` varchar(20) DEFAULT NULL,
  `nama_alternatif_1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_identitas`
--

INSERT INTO `tb_identitas` (`id`, `user_id`, `nama_lengkap`, `nomor_identitas`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `agama`, `status_pernikahan`, `pekerjaan`, `foto_identitas`, `foto_selvi_ktp`, `status`, `created_at`, `updated_at`, `nomor_alternatif_1`, `nama_alternatif_1`) VALUES
(8, 16, 'Dian Witura', '3211030313210032', 'Sumedang', '1997-02-09', 'Laki-laki', 'Sumedang', 'Islam', 'Cerai', 'Wiraswasta', 'ktp_1694089038_d8e94dff168c31aa4d80.jpg', 'selvi_1694089038_6023125f53c02bf7c30c.jpg', 'Disetujui', '2023-09-07 12:16:30', '2023-09-07 12:17:41', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ims_customer`
--

CREATE TABLE `tb_ims_customer` (
  `id` int(11) NOT NULL,
  `id_pelanggan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat` text,
  `telpon` varchar(20) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ims_customer`
--

INSERT INTO `tb_ims_customer` (`id`, `id_pelanggan`, `nama_pelanggan`, `alamat`, `telpon`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(2, '123455qasdf', 'kiki', 'sumednag', '081231234124', '2134234', '34235345', 1, '2023-09-09 18:33:01', '2023-09-10 05:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_assets`
--

CREATE TABLE `tb_im_assets` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `nama_assets` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `penanggung_jawab` varchar(255) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `harga_satuan` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_assets_kategori`
--

CREATE TABLE `tb_im_assets_kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_assets_kategori`
--

INSERT INTO `tb_im_assets_kategori` (`id`, `nama_kategori`, `keterangan`) VALUES
(3, 'ROUTER TP LINK', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inventori`
--

CREATE TABLE `tb_im_inventori` (
  `id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `suppliers_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `harga_satuan` varchar(200) DEFAULT NULL,
  `keterangan` text,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_inventori`
--

INSERT INTO `tb_im_inventori` (`id`, `location_id`, `suppliers_id`, `customer_id`, `categories_id`, `nama_barang`, `stok`, `satuan`, `harga_satuan`, `keterangan`, `foto`, `created_at`, `updated_at`) VALUES
(4, 2, NULL, NULL, 4, 'asdf', 3, 'bh', '33333.00', '', '1694258420_3c8780f7299a92acd4fc.jpg', '2023-09-09 11:20:20', '2023-09-09 11:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inv_categories`
--

CREATE TABLE `tb_im_inv_categories` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_inv_categories`
--

INSERT INTO `tb_im_inv_categories` (`id`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`) VALUES
(4, 'as', 'dff435', '2023-09-09 09:59:49', '2023-09-09 10:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inv_customers`
--

CREATE TABLE `tb_im_inv_customers` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `alamat` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_inv_customers`
--

INSERT INTO `tb_im_inv_customers` (`id`, `nama_lengkap`, `telpon`, `alamat`, `created_at`, `updated_at`) VALUES
(5, 'Rifki Maulana', '081231234124', '123', '2023-09-09 10:09:51', '2023-09-09 10:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inv_history`
--

CREATE TABLE `tb_im_inv_history` (
  `id` int(11) NOT NULL,
  `keterangan` text,
  `jenis` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inv_location`
--

CREATE TABLE `tb_im_inv_location` (
  `id` int(11) NOT NULL,
  `nama_lokasi` varchar(255) DEFAULT NULL,
  `penanggung_jawab` varchar(255) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `alamat` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_inv_location`
--

INSERT INTO `tb_im_inv_location` (`id`, `nama_lokasi`, `penanggung_jawab`, `telpon`, `alamat`, `created_at`, `updated_at`) VALUES
(2, 'avdfvadfv', 'vsd', '234234', 'sumednag', '2023-09-09 10:16:07', '2023-09-14 06:20:44');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inv_suppliers`
--

CREATE TABLE `tb_im_inv_suppliers` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `no_rek` varchar(20) DEFAULT NULL,
  `nama_no_rek` varchar(255) DEFAULT NULL,
  `nama_toko` varchar(255) DEFAULT NULL,
  `alamat` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_inv_suppliers`
--

INSERT INTO `tb_im_inv_suppliers` (`id`, `nama_lengkap`, `telpon`, `no_rek`, `nama_no_rek`, `nama_toko`, `alamat`, `created_at`, `updated_at`) VALUES
(2, 'Ikbal', '081231234124', '131241324', 'asfdasdf', '32adsf325sadf', '  sumednagdsssfasdf', '2023-09-09 10:19:02', '2023-09-09 10:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_inv_transaction`
--

CREATE TABLE `tb_im_inv_transaction` (
  `id` int(11) NOT NULL,
  `keterangan` text,
  `supliers_id` int(11) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `biaya` varchar(100) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_inv_transaction`
--

INSERT INTO `tb_im_inv_transaction` (`id`, `keterangan`, `supliers_id`, `customers_id`, `inventory_id`, `biaya`, `jumlah`, `created_at`, `updated_at`) VALUES
(2, 'Pembelian', 2, 5, 4, '30000', 3, '2023-09-09 10:37:01', '2023-09-09 11:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_keuangan`
--

CREATE TABLE `tb_im_keuangan` (
  `id` int(11) NOT NULL,
  `jenis_id` int(11) DEFAULT NULL,
  `pengelola_id` int(11) DEFAULT NULL,
  `pemasukan` decimal(10,2) DEFAULT NULL,
  `pengeluaran` decimal(10,2) DEFAULT NULL,
  `keterangan` text,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_referensi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_keu_jenis`
--

CREATE TABLE `tb_im_keu_jenis` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_jenis` varchar(255) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_keu_jenis`
--

INSERT INTO `tb_im_keu_jenis` (`id`, `kategori_id`, `nama_jenis`, `keterangan`) VALUES
(3, 2, 'Operasional', 'Keuangan Teknisi Wifi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_keu_kategori`
--

CREATE TABLE `tb_im_keu_kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_keu_kategori`
--

INSERT INTO `tb_im_keu_kategori` (`id`, `nama_kategori`, `keterangan`) VALUES
(2, 'CV. MITRA MANDIRI SKM', 'Keuangan Perusahaan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_keu_pengelola`
--

CREATE TABLE `tb_im_keu_pengelola` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_keu_pengelola`
--

INSERT INTO `tb_im_keu_pengelola` (`id`, `user_id`, `saldo`, `created_at`, `updated_at`) VALUES
(2, 23, '0.00', '2023-09-18 07:43:49', '2023-09-18 07:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_keu_riwayat`
--

CREATE TABLE `tb_im_keu_riwayat` (
  `id` int(11) NOT NULL,
  `keuangan_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `jenis_id` int(11) DEFAULT NULL,
  `pengelola_id` int(11) DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_log`
--

CREATE TABLE `tb_im_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `ip_address` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_server`
--

CREATE TABLE `tb_im_server` (
  `id` int(11) NOT NULL,
  `kode_server` varchar(255) DEFAULT NULL,
  `nama_server` varchar(255) DEFAULT NULL,
  `alamat_server` varchar(255) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `pengelola_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_server`
--

INSERT INTO `tb_im_server` (`id`, `kode_server`, `nama_server`, `alamat_server`, `latitude`, `longitude`, `pengelola_id`, `created_at`, `updated_at`) VALUES
(1, '796732', 'CIKIHIANG', 'sumednag', '-', '-', 2, '2023-09-11 19:23:39', '2023-09-11 19:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_srv_pengelola`
--

CREATE TABLE `tb_im_srv_pengelola` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_srv_pengelola`
--

INSERT INTO `tb_im_srv_pengelola` (`id`, `nama_lengkap`, `alamat`, `telpon`, `created_at`, `updated_at`) VALUES
(2, 'Rifki Maulana', 'sumednag', '081231234124', '2023-09-09 17:55:30', '2023-09-09 17:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_vc_paket`
--

CREATE TABLE `tb_im_vc_paket` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga_beli` decimal(10,2) DEFAULT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_vc_paket`
--

INSERT INTO `tb_im_vc_paket` (`id`, `nama_paket`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(2, 'VOUCHER HARIAN 4JAM', '75000.00', '70000.00', '2023-09-11 18:12:57', '2023-09-12 09:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_vc_pengirim`
--

CREATE TABLE `tb_im_vc_pengirim` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telpon` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_vc_pengirim`
--

INSERT INTO `tb_im_vc_pengirim` (`id`, `nama_lengkap`, `alamat`, `telpon`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Rifki Maulana', 'sumednag', '081231234124', 1, '2023-09-13 19:34:34', '2023-09-13 19:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_vc_reseller`
--

CREATE TABLE `tb_im_vc_reseller` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telpon` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_vc_reseller`
--

INSERT INTO `tb_im_vc_reseller` (`id`, `nama_lengkap`, `alamat`, `telpon`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(2, 'ayu', '123', '081231234124', '99.99999999', '0.00000000', 1, '2023-09-11 18:30:18', '2023-09-13 19:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_vc_transaksi`
--

CREATE TABLE `tb_im_vc_transaksi` (
  `id` int(11) NOT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `reseller_id` int(11) DEFAULT NULL,
  `pengirim_id` int(11) DEFAULT NULL,
  `server_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_vc_transaksi`
--

INSERT INTO `tb_im_vc_transaksi` (`id`, `paket_id`, `reseller_id`, `pengirim_id`, `server_id`, `created_at`, `updated_at`) VALUES
(6, 2, 2, 3, 1, '2023-09-13 19:41:30', '2023-09-13 19:41:30');

-- --------------------------------------------------------

--
-- Table structure for table `tb_im_voucher`
--

CREATE TABLE `tb_im_voucher` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `komentar` varchar(100) NOT NULL,
  `paket_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_im_voucher`
--

INSERT INTO `tb_im_voucher` (`id`, `code`, `komentar`, `paket_id`, `created_at`, `updated_at`) VALUES
(15251, '4974b984dae2d80e', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15252, 'e24838e9abc2c8f4', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15253, '5bbc09d69b4cff71', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15254, '5d54fc0feca5ee60', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15255, '1b5b1a69ebe13b97', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15256, 'ca8b5090df7f1aab', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15257, '53195c9ccd468354', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15258, 'bf6798e7aad263b6', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15259, '4137db7bbe0ff013', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15260, '25cb05ce369d0cdc', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15261, '084325846f547d4d', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15262, '55e727235dccf4d9', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15263, '7f5d25f2631ed54f', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15264, 'b8927293186d0ed5', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15265, '54212b87be99f02c', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15266, 'de460d094adcd66b', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15267, '747671a06e34b82d', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15268, 'a64b6c7b41e2b947', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15269, '553c9b02ab41f36a', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15270, '5106e19aa178875e', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15271, '24022d5780693e87', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15272, '46c7d2c21952d72e', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15273, '6face675bb06d788', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15274, '79ab3436d5186188', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15275, 'c0617adb324df5a6', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15276, '871665ef99ede93d', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15277, '29892043c3646b70', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15278, 'f21c8b65f37fcf30', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15279, 'b4157bb29a9f31cc', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15280, '8fafa2b12ac76ef2', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15281, '580a53072b9a411b', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15282, '8e3883f5bf16a288', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15283, '17388a209931a0e8', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15284, '3bf37dbb0ae9b769', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15285, 'f6ce8f55762ccbb1', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15286, '44c4f720942748ca', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15287, '5ee019b3682b24f9', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15288, '6f8b8fad7af8d525', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15289, 'b463466831d66309', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15290, '152557af847dfa69', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15291, 'e9fff00d4362e7e2', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15292, '49ee06608362361a', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15293, '0d6425b6cdabe57d', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15294, 'ba98da2197e5a094', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15295, '6feb5438de5db525', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15296, '0ddb02d4f12ecce2', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15297, '9d51714680cc7158', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15298, 'd7013ea2494cf0ec', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15299, '36404c650b255d71', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00'),
(15300, '7bebde27325ad2df', 'im_code_b8c1a3de', 2, '2023-09-12 09:51:00', '2023-09-12 09:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategoriproduk`
--

CREATE TABLE `tb_kategoriproduk` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `deskripsi` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_keranjang`
--

CREATE TABLE `tb_keranjang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kredit`
--

CREATE TABLE `tb_kredit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `no_kontrak` varchar(50) DEFAULT NULL,
  `jangka_waktu` int(11) DEFAULT NULL,
  `total_kredit` varchar(100) DEFAULT NULL,
  `tanggal_cetak` int(11) DEFAULT NULL,
  `jatuh_tempo` int(11) DEFAULT NULL,
  `file_kontrak` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `no_transaksi` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_log_aktifitas`
--

CREATE TABLE `tb_log_aktifitas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `ip_address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jenis_pembayaran` varchar(10) DEFAULT NULL,
  `kredit_id` int(11) DEFAULT NULL,
  `bukti_transfer` varchar(100) DEFAULT NULL,
  `no_kontrak` varchar(50) DEFAULT NULL,
  `jumlah_pembayaran` varchar(50) DEFAULT NULL,
  `no_referensi` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id` int(11) NOT NULL,
  `no_transaksi` varchar(20) NOT NULL,
  `tanggal_penjualan` text,
  `id_users` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` decimal(10,2) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `no_referensi` varchar(20) NOT NULL,
  `no_kontrak` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `deskripsi` text,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_foto` varchar(100) DEFAULT NULL,
  `user_level` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_wa` varchar(20) NOT NULL,
  `reset_token` varchar(100) NOT NULL,
  `reset_id` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `app_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `aplication_name` varchar(100) NOT NULL,
  `facebook` varchar(50) NOT NULL,
  `tweeter` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `user_nama`, `user_username`, `user_password`, `user_foto`, `user_level`, `email`, `no_wa`, `reset_token`, `reset_id`, `keterangan`, `app_id`, `country`, `aplication_name`, `facebook`, `tweeter`, `instagram`) VALUES
(4, 'Rifki Maulana', 'admin', '$2y$10$guzfxMCl3tZSo/Qgfo7OnO05iMmzN7Pfos/xF8TumqhI/qh.zJUma', '1695013663_ae2b0352f1219d540cb0.webp', 'administrator', 'rifkkimaulana@gmail.com', '083130649979', '', 'ecdaa0e0-3e87-4368-be77-92ddd3a57081', '-', 1, 'Indonesia', '', '', '', ''),
(16, 'Dian Witura', 'dian', '$2y$10$MTHn9EWgER0HkqQpxifyYOkMmOYTh7FzE0kgrUNvo6.o7/xp8LsF.', NULL, 'member', '64f9be690a6ac_contoh@emailkamu.com', '082118844992', '', '', '', 1, '', '', '', '', ''),
(22, 'asdf', 'asdf', '$2y$10$A65zEHluWBgjDCyAVNGwVu2p95b3VkIkKDBSf8rrCPNcnQj5Mxnni', '1694684707_a9a902d749cb2e29f782.png', 'im_member', 'asdf', '6283130649979', '', '', '', 0, '', 'imasnet', '', '', ''),
(23, 'Risna', 'risna', '$2y$10$83hotipV6rblGmZOZe3W8OpoVQdu5NY1wOIY3rZ.lVw4yLXQPOO8i', '1695022954_aedcf76437cddbe702ab.jpg', 'im_member', 'risna@gmail.com', '083130473847', '', '', '', 0, '', 'imasnet', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_wablas`
--

CREATE TABLE `tb_wablas` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `token_api` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_wablas`
--

INSERT INTO `tb_wablas` (`id`, `domain`, `token_api`) VALUES
(1, 'https://kudus.wablas.com/api/send-message', 'yb2BtD05MDyIadY9u0FJjztE37yJqmPcZnATxbQxES6st523xa85S0t1wvdWFnFT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_appsetting`
--
ALTER TABLE `tb_appsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_google_api_login`
--
ALTER TABLE `tb_google_api_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_identitas`
--
ALTER TABLE `tb_identitas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_identitas` (`nomor_identitas`);

--
-- Indexes for table `tb_ims_customer`
--
ALTER TABLE `tb_ims_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_assets`
--
ALTER TABLE `tb_im_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `tb_im_assets_kategori`
--
ALTER TABLE `tb_im_assets_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_inventori`
--
ALTER TABLE `tb_im_inventori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `suppliers_id` (`suppliers_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `tb_im_inv_categories`
--
ALTER TABLE `tb_im_inv_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_inv_customers`
--
ALTER TABLE `tb_im_inv_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_inv_history`
--
ALTER TABLE `tb_im_inv_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_inv_location`
--
ALTER TABLE `tb_im_inv_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_inv_suppliers`
--
ALTER TABLE `tb_im_inv_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_inv_transaction`
--
ALTER TABLE `tb_im_inv_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supliers_id` (`supliers_id`),
  ADD KEY `customers_id` (`customers_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `tb_im_keuangan`
--
ALTER TABLE `tb_im_keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `pengelola_id` (`pengelola_id`);

--
-- Indexes for table `tb_im_keu_jenis`
--
ALTER TABLE `tb_im_keu_jenis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_keu_jenis_kategori` (`kategori_id`);

--
-- Indexes for table `tb_im_keu_kategori`
--
ALTER TABLE `tb_im_keu_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_keu_pengelola`
--
ALTER TABLE `tb_im_keu_pengelola`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_keu_riwayat`
--
ALTER TABLE `tb_im_keu_riwayat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keuangan_id` (`keuangan_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `pengelola_id` (`pengelola_id`);

--
-- Indexes for table `tb_im_log`
--
ALTER TABLE `tb_im_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_server`
--
ALTER TABLE `tb_im_server`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_im_server_pengelola` (`pengelola_id`);

--
-- Indexes for table `tb_im_srv_pengelola`
--
ALTER TABLE `tb_im_srv_pengelola`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_vc_paket`
--
ALTER TABLE `tb_im_vc_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_vc_pengirim`
--
ALTER TABLE `tb_im_vc_pengirim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_vc_reseller`
--
ALTER TABLE `tb_im_vc_reseller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_vc_transaksi`
--
ALTER TABLE `tb_im_vc_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_im_voucher`
--
ALTER TABLE `tb_im_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategoriproduk`
--
ALTER TABLE `tb_kategoriproduk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `tb_kredit`
--
ALTER TABLE `tb_kredit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kontrak` (`no_kontrak`);

--
-- Indexes for table `tb_log_aktifitas`
--
ALTER TABLE `tb_log_aktifitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`user_username`),
  ADD UNIQUE KEY `email & whatsapp` (`email`,`no_wa`);

--
-- Indexes for table `tb_wablas`
--
ALTER TABLE `tb_wablas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_appsetting`
--
ALTER TABLE `tb_appsetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_google_api_login`
--
ALTER TABLE `tb_google_api_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_identitas`
--
ALTER TABLE `tb_identitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_ims_customer`
--
ALTER TABLE `tb_ims_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_assets`
--
ALTER TABLE `tb_im_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_im_assets_kategori`
--
ALTER TABLE `tb_im_assets_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_im_inventori`
--
ALTER TABLE `tb_im_inventori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_im_inv_categories`
--
ALTER TABLE `tb_im_inv_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_im_inv_customers`
--
ALTER TABLE `tb_im_inv_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_im_inv_history`
--
ALTER TABLE `tb_im_inv_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_inv_location`
--
ALTER TABLE `tb_im_inv_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_inv_suppliers`
--
ALTER TABLE `tb_im_inv_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_inv_transaction`
--
ALTER TABLE `tb_im_inv_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_keuangan`
--
ALTER TABLE `tb_im_keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_im_keu_jenis`
--
ALTER TABLE `tb_im_keu_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_im_keu_kategori`
--
ALTER TABLE `tb_im_keu_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_keu_pengelola`
--
ALTER TABLE `tb_im_keu_pengelola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_keu_riwayat`
--
ALTER TABLE `tb_im_keu_riwayat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_im_log`
--
ALTER TABLE `tb_im_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_im_server`
--
ALTER TABLE `tb_im_server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_im_srv_pengelola`
--
ALTER TABLE `tb_im_srv_pengelola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_vc_paket`
--
ALTER TABLE `tb_im_vc_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_vc_pengirim`
--
ALTER TABLE `tb_im_vc_pengirim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_im_vc_reseller`
--
ALTER TABLE `tb_im_vc_reseller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_im_vc_transaksi`
--
ALTER TABLE `tb_im_vc_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_im_voucher`
--
ALTER TABLE `tb_im_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15303;

--
-- AUTO_INCREMENT for table `tb_kategoriproduk`
--
ALTER TABLE `tb_kategoriproduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_kredit`
--
ALTER TABLE `tb_kredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_log_aktifitas`
--
ALTER TABLE `tb_log_aktifitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_wablas`
--
ALTER TABLE `tb_wablas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_im_assets`
--
ALTER TABLE `tb_im_assets`
  ADD CONSTRAINT `tb_im_assets_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `tb_im_assets_kategori` (`id`);

--
-- Constraints for table `tb_im_inventori`
--
ALTER TABLE `tb_im_inventori`
  ADD CONSTRAINT `tb_im_inventori_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `tb_im_inv_location` (`id`),
  ADD CONSTRAINT `tb_im_inventori_ibfk_2` FOREIGN KEY (`suppliers_id`) REFERENCES `tb_im_inv_suppliers` (`id`),
  ADD CONSTRAINT `tb_im_inventori_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `tb_im_inv_customers` (`id`);

--
-- Constraints for table `tb_im_inv_transaction`
--
ALTER TABLE `tb_im_inv_transaction`
  ADD CONSTRAINT `tb_im_inv_transaction_ibfk_1` FOREIGN KEY (`supliers_id`) REFERENCES `tb_im_inv_suppliers` (`id`),
  ADD CONSTRAINT `tb_im_inv_transaction_ibfk_2` FOREIGN KEY (`customers_id`) REFERENCES `tb_im_inv_customers` (`id`),
  ADD CONSTRAINT `tb_im_inv_transaction_ibfk_3` FOREIGN KEY (`supliers_id`) REFERENCES `tb_im_inv_suppliers` (`id`),
  ADD CONSTRAINT `tb_im_inv_transaction_ibfk_4` FOREIGN KEY (`customers_id`) REFERENCES `tb_im_inv_customers` (`id`),
  ADD CONSTRAINT `tb_im_inv_transaction_ibfk_5` FOREIGN KEY (`inventory_id`) REFERENCES `tb_im_inventori` (`id`);

--
-- Constraints for table `tb_im_keuangan`
--
ALTER TABLE `tb_im_keuangan`
  ADD CONSTRAINT `tb_im_keuangan_ibfk_2` FOREIGN KEY (`jenis_id`) REFERENCES `tb_im_keu_jenis` (`id`),
  ADD CONSTRAINT `tb_im_keuangan_ibfk_3` FOREIGN KEY (`pengelola_id`) REFERENCES `tb_im_keu_pengelola` (`id`);

--
-- Constraints for table `tb_im_keu_jenis`
--
ALTER TABLE `tb_im_keu_jenis`
  ADD CONSTRAINT `fk_keu_jenis_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `tb_im_keu_kategori` (`id`);

--
-- Constraints for table `tb_im_keu_riwayat`
--
ALTER TABLE `tb_im_keu_riwayat`
  ADD CONSTRAINT `tb_im_keu_riwayat_ibfk_1` FOREIGN KEY (`keuangan_id`) REFERENCES `tb_im_keuangan` (`id`),
  ADD CONSTRAINT `tb_im_keu_riwayat_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `tb_im_keu_kategori` (`id`),
  ADD CONSTRAINT `tb_im_keu_riwayat_ibfk_3` FOREIGN KEY (`jenis_id`) REFERENCES `tb_im_keu_jenis` (`id`),
  ADD CONSTRAINT `tb_im_keu_riwayat_ibfk_4` FOREIGN KEY (`pengelola_id`) REFERENCES `tb_im_keu_pengelola` (`id`);

--
-- Constraints for table `tb_im_server`
--
ALTER TABLE `tb_im_server`
  ADD CONSTRAINT `fk_tb_im_server_pengelola` FOREIGN KEY (`pengelola_id`) REFERENCES `tb_im_srv_pengelola` (`id`);

--
-- Constraints for table `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD CONSTRAINT `tb_keranjang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`user_id`),
  ADD CONSTRAINT `tb_keranjang_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `tb_produk` (`id`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `tb_users` (`user_id`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id`);

--
-- Constraints for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD CONSTRAINT `tb_produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `tb_kategoriproduk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
