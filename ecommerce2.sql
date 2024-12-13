-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2024 pada 12.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_dashboard`
--

CREATE TABLE `admin_dashboard` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `alamat`
--

CREATE TABLE `alamat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(100) NOT NULL,
  `kode_pos` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard`
--

CREATE TABLE `dashboard` (
  `product_id` int(11) NOT NULL,
  `teks_deskripsi` text DEFAULT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `gambar_produk` varchar(255) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dashboard`
--

INSERT INTO `dashboard` (`product_id`, `teks_deskripsi`, `nama_produk`, `gambar_produk`, `harga`, `kategori_id`, `stok`, `created_at`, `updated_at`) VALUES
(5, 'ip ilegal di indonesia', 'ip 16 ilegal', 'ip_16.jpg', 20000000.00, 1, 5, '2024-11-30 01:10:00', '2024-11-30 01:10:00'),
(6, 'belalang goreng', 'belalang', '59806366_123081338892354_618720903277074460_n.jpg', 5000.00, 3, 6, '2024-11-30 01:10:20', '2024-11-30 01:10:20'),
(7, 'pisau buat masak bukan begal', 'pisau begal', 'eefdd25e-66e4-4407-b4a3-5e5531dcbaf0.jpg', 10000.00, 4, 5, '2024-11-30 01:10:48', '2024-11-30 01:10:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Pakaian'),
(3, 'Makanan'),
(4, 'Perabotan Rumah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`id`, `room_name`, `sender_name`, `message`, `timestamp`, `created_at`) VALUES
(107, 'fiki', 'saiful', 'saiful', '2024-12-08 07:26:54', '2024-12-08 14:26:54'),
(108, 'fiki', 'saiful', 'cek', '2024-12-08 11:01:44', '2024-12-08 18:01:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(100) NOT NULL,
  `kode_pos` varchar(20) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `nama_lengkap`, `alamat`, `kota`, `kode_pos`, `no_telepon`, `total_harga`, `created_at`) VALUES
(1, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'Kota Madiun', '5232', '+62881023747121', 0.00, '2024-12-03 04:01:48'),
(2, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'Kota Madiun', '5232', '+62881023747121', 0.00, '2024-12-03 04:02:47'),
(3, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'md', '12345', '+62881023747121', 0.00, '2024-12-03 04:04:06'),
(4, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'fsdg', '123456', '+62881023747121', 20000.00, '2024-12-03 04:08:14'),
(5, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'fsdg', '123456', '+62881023747121', 20000.00, '2024-12-03 04:11:39'),
(6, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'fsdg', '123456', '+62881023747121', 20000.00, '2024-12-03 04:11:47'),
(7, 5, 'ffrte', 'sadfghjkl', 'dsgd', '123456', '8235346976543', 20000.00, '2024-12-03 04:15:43'),
(8, 5, 'ffrte', 'sadfghjkl', 'dsgd', '123456', '8235346976543', 20000.00, '2024-12-03 04:16:11'),
(9, 5, 'ffrte', 'sadfghjkl', 'dsgd', '123456', '8235346976543', 20000.00, '2024-12-03 04:17:21'),
(10, 5, 'ffrte', 'sadfghjkl', 'dsgd', '123456', '8235346976543', 20000.00, '2024-12-03 04:17:27'),
(11, 5, 'wqewq', 'qwefrghj', 'fhfh', '1231', '1324567890', 20000.00, '2024-12-03 04:17:42'),
(12, 5, 'dssdgsdg', 'adasfseg', 'dgsd', '1234', '123456789', 20000.00, '2024-12-03 04:18:00'),
(13, 5, 'dssdgsdg', 'adasfseg', 'dgsd', '1234', '123456789', 20000.00, '2024-12-03 04:19:59'),
(14, 5, 'asfkasof', 'sadasfsg', 'kota', '12344', '12345678900', 30000.00, '2024-12-03 04:20:30'),
(15, 5, 'fiki', 'asdfghjklqwerty', 'qwerty', '1234', '1234567890', 30000.00, '2024-12-03 04:29:04'),
(16, 5, 'fiki', 'qwertyuiopasdfgh', 'ertyui', '1234', '1234567890', 30000.00, '2024-12-03 04:30:50'),
(17, 5, 'fiki', 'qwertyuiop', 'qwert', '1234', '1234567890', 30000.00, '2024-12-03 04:32:26'),
(18, 5, 'fikkk', 'qwertyuiop', 'qwer', '12124', '12345678760', 30000.00, '2024-12-03 04:35:52'),
(19, 5, 'qwe', 'qwertyuiopasdfghjkl', 'kota', '12312', '123456789', 30000.00, '2024-12-03 04:45:04'),
(20, 5, 'qwe', 'qwsdaf', 'hdjd', '1231241', '123456789', 30000.00, '2024-12-03 04:45:42'),
(21, 5, 'qwe', 'qwsdaf', 'hdjd', '1231241', '123456789', 30000.00, '2024-12-03 04:45:50'),
(22, 5, 'weqwr', 'qwertyhjhu', 'sdgh', '1234', '123456789', 30000.00, '2024-12-03 04:46:04'),
(23, 5, 'weqwr', 'qwertyhjhu', 'sdgh', '1234', '123456789', 30000.00, '2024-12-03 04:46:16'),
(24, 5, 'frr', 'qeqw', 'fsdgsdh', '12424', '12465659', 15000.00, '2024-12-03 05:08:35'),
(25, 5, 'fse', 'gwew', 'wegw', 'wegw', 'weg', 15000.00, '2024-12-03 05:10:13'),
(26, 5, 'fse', 'gwew', 'wegw', 'wegw', 'weg', 15000.00, '2024-12-03 05:15:43'),
(27, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'sdsf', '1223124', '+62881023747121', 15000.00, '2024-12-03 05:22:48'),
(28, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'sds', '241', '+62881023747121', 15000.00, '2024-12-03 05:41:21'),
(29, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'sds', '241', '+62881023747121', 15000.00, '2024-12-03 05:44:13'),
(30, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:44:29'),
(31, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:44:42'),
(32, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:44:57'),
(33, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:45:18'),
(34, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:45:38'),
(35, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:45:47'),
(36, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:47:30'),
(37, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:50:39'),
(38, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 15000.00, '2024-12-03 05:51:56'),
(39, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'szfdxfgjh', '12114', '+62881023747121', 0.00, '2024-12-03 05:52:49'),
(40, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'dfgdf', '2434', '+62881023747121', 10000.00, '2024-12-03 05:53:14'),
(41, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'dfgdf', '2434', '+62881023747121', 0.00, '2024-12-03 05:53:39'),
(42, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'ssd', '3463', '+62881023747121', 20000.00, '2024-12-03 05:54:04'),
(43, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'ssd', '3463', '+62881023747121', 20000.00, '2024-12-03 05:54:49'),
(44, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'ssd', '3463', '+62881023747121', 20000.00, '2024-12-03 05:56:42'),
(45, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'shs', '24124', '+62881023747121', 10000.00, '2024-12-03 06:02:54'),
(46, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'fjf', '123456789', '+62881023747121', 5000.00, '2024-12-04 08:59:05'),
(47, 5, 'fiki', 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 'Kota Madiun', '1234', '+62881023747121', 5000.00, '2024-12-08 11:02:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `otp_verifications`
--

CREATE TABLE `otp_verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `otp_verifications`
--

INSERT INTO `otp_verifications` (`id`, `user_id`, `otp_code`, `expires_at`, `verified`) VALUES
(1, 1, '123456', '2024-11-23 07:00:00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`payment_id`, `user_id`, `alamat`, `total`, `order_number`, `jumlah`, `created_at`) VALUES
(1, 5, 'dsad', 40015000.00, 'ORD-1733132196', 4, '2024-12-02 09:36:36'),
(2, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733138355', 2, '2024-12-02 11:19:15'),
(3, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733138585', 2, '2024-12-02 11:23:05'),
(4, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733138880', 2, '2024-12-02 11:28:00'),
(5, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733138883', 2, '2024-12-02 11:28:03'),
(6, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139290', 2, '2024-12-02 11:34:50'),
(7, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139294', 2, '2024-12-02 11:34:54'),
(8, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139423', 2, '2024-12-02 11:37:03'),
(9, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139544', 2, '2024-12-02 11:39:04'),
(10, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139724', 2, '2024-12-02 11:42:04'),
(11, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139962', 2, '2024-12-02 11:46:02'),
(12, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733139965', 2, '2024-12-02 11:46:05'),
(13, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733140151', 2, '2024-12-02 11:49:11'),
(14, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733140221', 2, '2024-12-02 11:50:21'),
(15, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733140369', 2, '2024-12-02 11:52:49'),
(16, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733140628', 2, '2024-12-02 11:57:08'),
(17, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733140936', 2, '2024-12-02 12:02:16'),
(18, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733141034', 2, '2024-12-02 12:03:54'),
(19, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733141037', 2, '2024-12-02 12:03:57'),
(20, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733141684', 2, '2024-12-02 12:14:44'),
(21, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733141860', 2, '2024-12-02 12:17:40'),
(22, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733141975', 2, '2024-12-02 12:19:35'),
(23, 5, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', 15000.00, 'ORD-1733142473', 2, '2024-12-02 12:27:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reset_tokens`
--

CREATE TABLE `reset_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reset_tokens`
--

INSERT INTO `reset_tokens` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 1, 'a1525351a719eb661e8a489f3ac53586', '2024-11-22 05:53:28'),
(2, 1, 'd0b6f839415285b9aac61385a3ae968e', '2024-11-30 13:34:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Pembeli'),
(2, 'Penjual');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `members_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `members_count`) VALUES
(1, 'fiki', -108);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nomer_hp` varchar(20) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`, `google_id`, `alamat`, `nomer_hp`, `profile_pic`) VALUES
(1, 'saiful', 'saifulmindstorms@gmail.com', '$2b$12$pt/xiPeVZBKLleRiETJ5Wex.1Em9WD1vUwiZxHctD.ZS/M1NG2nnC', 2, NULL, NULL, NULL, 'd27c1023a7ab4744bebfff45f0bd730f_Green_Real_Estate_Logo.png'),
(2, 'pembeli', 'pembeli@pembeli.com', '$2b$12$e7YwQhGnkRofFHmU1AvBiOb6e/rjuzx1IOFT2F6RC4qoArnMdOfF6', 1, NULL, NULL, NULL, NULL),
(4, 'pembeli2', 'pembeli2@.com', '$2b$12$5.FrGvylNGVhBakZ9fjd3ezjOyy.1dzJ8dWNE7op4HJ0iEJC4VwaS', 1, NULL, 'jl.qwertyuiop', '1234567890', 'user_4_p.png'),
(5, 'fiki', 'fiki@.com', '$2b$12$ebm5POtPb26i67yd6F0gG./am95BcJ0cqGm9W65qrW4OpbJT0NcdO', 1, NULL, 'Jl. Jenderal Urip Sumoharjo, Manguharjo, Kec. Manguharjo, Kota Madiun, Jawa Timur, Indonesia', '+62881023747121', 'user_5_images.jpg'),
(6, 'rifamu', 'kiyoomi140503@gmail.com', '$2b$12$4Sg3XKXe5GtDFoycoZNf5uo9PKzP41DoBMBDkk1P7OGKiuutQqdua', 1, NULL, NULL, NULL, '1732974165_Genshin_Impact.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_dashboard`
--
ALTER TABLE `admin_dashboard`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_name` (`room_name`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `otp_verifications`
--
ALTER TABLE `otp_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `reset_tokens`
--
ALTER TABLE `reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_name` (`room_name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_dashboard`
--
ALTER TABLE `admin_dashboard`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `otp_verifications`
--
ALTER TABLE `otp_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `reset_tokens`
--
ALTER TABLE `reset_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin_dashboard`
--
ALTER TABLE `admin_dashboard`
  ADD CONSTRAINT `admin_dashboard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `dashboard` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  ADD CONSTRAINT `dashboard_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`room_name`) REFERENCES `rooms` (`room_name`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `otp_verifications`
--
ALTER TABLE `otp_verifications`
  ADD CONSTRAINT `otp_verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `reset_tokens`
--
ALTER TABLE `reset_tokens`
  ADD CONSTRAINT `reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
