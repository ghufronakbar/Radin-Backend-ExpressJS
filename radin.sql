-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2024 at 12:02 AM
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
-- Database: `radin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id_admin`, `fullname`, `email`, `password`) VALUES
(1, 'Admin Satu', 'admin1@example.com', 'admin123'),
(2, 'Admin Dua', 'admin2@example.com', 'admin456');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id_cart` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id_cart`, `id_user`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id_cart_item` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `id_cart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id_cart_item`, `id_menu`, `amount`, `id_cart`) VALUES
(1, 1, 2, 1),
(2, 2, 1, 2),
(3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id_history` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_notes` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `admin_notes` text DEFAULT NULL,
  `ordered_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id_history`, `id_user`, `total`, `address`, `user_notes`, `status`, `admin_notes`, `ordered_at`, `finished_at`) VALUES
(1, 1, '144800.00', 'Jl. Sudirman No. 123', 'Extra hot', 6, 'Pesananmu sedang dalam proses pengiriman ke Jl. Sudirman No. 123, Silahkan ditunggu Kak Budi Santoso !', '2024-05-01 19:55:05', '2024-05-09 02:32:07'),
(2, 2, '167000.00', NULL, 'No sugar', 2, 'scam', '1900-01-04 19:55:10', '2024-05-09 04:47:38'),
(3, 3, '248600.00', 'Jl. Gatot Subroto No. 67', 'Extra foam', 1, 'Pesananmu sedang dalam proses pengiriman ke Jl. Gatot Subroto No. 67, Silahkan ditunggu Kak Joko Susanto !', '1900-01-04 19:52:10', '2024-05-09 00:00:00'),
(4, 1, '170100.00', 'Address 1', 'User notes 1', 1, 'Admin notes 1', '2023-06-01 00:00:00', '2023-12-04 03:42:38'),
(5, 2, '336150.00', 'Address 2', 'User notes 2', 2, 'Admin notes 2', '2023-07-01 00:00:00', '2024-05-21 08:09:08'),
(6, 3, '243000.00', 'Address 3', 'User notes 3', 2, 'Admin notes 3', '2024-05-01 00:00:00', '2025-04-01 07:34:55'),
(7, 1, '490050.00', 'Address 4', 'User notes 4', 5, 'Pesananmu sedang dalam proses pengiriman ke Address 4, Silahkan ditunggu Kak Budi Santoso !', '2023-08-01 00:00:00', '2024-07-05 03:41:37'),
(8, 2, '299700.00', 'Address 5', 'User notes 5', 4, 'Admin notes 5', '2023-09-01 00:00:00', '2024-07-18 01:34:42'),
(9, 3, '368550.00', 'Address 6', 'User notes 6', 2, 'penipu luh', '2024-06-01 00:00:00', '2024-05-09 04:48:40'),
(10, 1, '178200.00', 'Address 7', 'User notes 7', 6, 'Pesananmu sedang dalam proses pengiriman ke Address 7, Silahkan ditunggu Kak Budi Santoso !', '2023-10-01 00:00:00', '2024-05-09 04:48:53'),
(11, 2, '396900.00', 'Address 8', 'User notes 8', 5, 'Admin notes 8', '2023-11-01 00:00:00', '2024-01-05 02:10:10'),
(12, 3, '287550.00', 'Address 9', 'User notes 9', 6, 'Admin notes 9', '2024-07-01 00:00:00', '2025-03-10 08:17:39'),
(13, 1, '453600.00', 'Address 10', 'User notes 10', 6, 'Admin notes 10', '2023-12-01 00:00:00', '2024-05-09 04:51:20'),
(14, 2, '267300.00', 'Address 11', 'User notes 11', 6, 'Admin notes 11', '2024-01-01 00:00:00', '2024-07-17 10:58:06'),
(15, 3, '311850.00', 'Address 12', 'User notes 12', 6, 'Admin notes 12', '2024-08-01 00:00:00', '2025-07-10 14:28:18'),
(16, 1, '202500.00', 'Address 13', 'User notes 13', 6, 'Admin notes 13', '2024-02-01 00:00:00', '2024-03-01 08:25:08'),
(17, 2, '481950.00', 'Address 14', 'User notes 14', 6, 'Admin notes 14', '2024-03-01 00:00:00', '2024-09-27 13:03:27'),
(18, 3, '226800.00', 'Address 15', 'User notes 15', 6, 'Admin notes 15', '2024-09-01 00:00:00', '2025-04-23 21:48:18'),
(19, 1, '376650.00', 'Address 16', 'User notes 16', 6, 'Admin notes 16', '2024-04-01 00:00:00', '2024-09-25 21:51:11'),
(20, 2, '218700.00', 'Address 17', 'User notes 17', 6, 'Admin notes 17', '2024-10-01 00:00:00', '2025-04-03 19:51:03'),
(21, 3, '417150.00', 'Address 18', 'User notes 18', 6, 'Admin notes 18', '2024-05-01 00:00:00', '2024-05-26 09:41:45'),
(22, 1, '291600.00', 'Address 19', 'User notes 19', 6, 'Admin notes 19', '2024-11-01 00:00:00', '2025-08-30 12:55:34'),
(23, 2, '344250.00', 'Address 20', 'User notes 20', 6, 'Admin notes 20', '2024-06-01 00:00:00', '2025-05-08 11:32:40'),
(24, 3, '170100.00', 'Address 21', 'User notes 21', 6, 'Admin notes 21', '2025-01-01 00:00:00', '2025-03-11 18:56:37'),
(25, 1, '336150.00', 'Address 22', 'User notes 22', 6, 'Admin notes 22', '2024-12-01 00:00:00', '2025-01-24 12:05:08'),
(26, 2, '243000.00', 'Address 23', 'User notes 23', 6, 'Admin notes 23', '2024-07-01 00:00:00', '2024-09-02 03:35:50'),
(27, 3, '490050.00', 'Address 24', 'User notes 24', 6, 'Admin notes 24', '2025-02-01 00:00:00', '2025-07-03 05:43:48'),
(28, 1, '299700.00', 'Address 25', 'User notes 25', 6, 'Admin notes 25', '2025-03-01 00:00:00', '2025-09-23 17:51:31'),
(29, 2, '368550.00', 'Address 26', 'User notes 26', 6, 'Admin notes 26', '2025-08-01 00:00:00', '2026-03-01 00:06:11'),
(30, 3, '178200.00', 'Address 27', 'User notes 27', 6, 'Admin notes 27', '2025-04-01 00:00:00', '2025-06-14 18:56:23'),
(31, 1, '396900.00', 'Address 28', 'User notes 28', 6, 'Admin notes 28', '2025-09-01 00:00:00', '2025-12-12 22:23:24'),
(32, 2, '287550.00', 'Address 29', 'User notes 29', 6, 'Admin notes 29', '2025-05-01 00:00:00', '2026-02-15 07:07:53'),
(33, 3, '453600.00', 'Address 30', 'User notes 30', 6, 'Admin notes 30', '2025-10-01 00:00:00', '2025-11-17 16:29:15'),
(34, 1, '267300.00', 'Address 31', 'User notes 31', 6, 'Admin notes 31', '2025-06-01 00:00:00', '2025-09-06 13:02:35'),
(35, 2, '311850.00', 'Address 32', 'User notes 32', 6, 'Admin notes 32', '2025-11-01 00:00:00', '2026-10-11 15:45:14'),
(36, 3, '202500.00', 'Address 33', 'User notes 33', 6, 'Admin notes 33', '2026-01-01 00:00:00', '2026-12-02 15:38:24'),
(37, 1, '481950.00', 'Address 34', 'User notes 34', 6, 'Admin notes 34', '2025-07-01 00:00:00', '2026-04-06 06:56:22'),
(38, 2, '226800.00', 'Address 35', 'User notes 35', 6, 'Admin notes 35', '2025-12-01 00:00:00', '2025-12-25 11:46:38'),
(39, 3, '376650.00', 'Address 36', 'User notes 36', 6, 'Admin notes 36', '2026-02-01 00:00:00', '2026-02-15 14:04:08'),
(40, 1, '218700.00', 'Address 37', 'User notes 37', 6, 'Admin notes 37', '2026-03-01 00:00:00', '2027-02-28 11:00:46'),
(41, 2, '417150.00', 'Address 38', 'User notes 38', 6, 'Admin notes 38', '2026-08-01 00:00:00', '2027-06-15 12:51:25'),
(42, 3, '291600.00', 'Address 39', 'User notes 39', 6, 'Admin notes 39', '2026-04-01 00:00:00', '2026-08-13 07:14:52'),
(43, 1, '344250.00', 'Address 40', 'User notes 40', 6, 'Admin notes 40', '2026-09-01 00:00:00', '2026-11-20 21:40:03'),
(44, 2, '170100.00', 'Address 41', 'User notes 41', 6, 'Admin notes 41', '2026-05-01 00:00:00', '2026-05-02 14:35:43'),
(45, 3, '336150.00', 'Address 42', 'User notes 42', 6, 'Admin notes 42', '2026-10-01 00:00:00', '2027-02-08 07:58:28'),
(46, 1, '243000.00', 'Address 43', 'User notes 43', 6, 'Admin notes 43', '2026-06-01 00:00:00', '2027-03-09 20:05:12'),
(47, 2, '490050.00', 'Address 44', 'User notes 44', 6, 'Admin notes 44', '2026-11-01 00:00:00', '2027-08-16 04:30:35'),
(48, 3, '299700.00', 'Address 45', 'User notes 45', 6, 'Admin notes 45', '2027-01-01 00:00:00', '2027-08-19 10:17:24'),
(49, 1, '368550.00', 'Address 46', 'User notes 46', 6, 'Admin notes 46', '2026-07-01 00:00:00', '2027-04-14 13:55:14'),
(50, 2, '178200.00', 'Address 47', 'User notes 47', 6, 'Admin notes 47', '2026-12-01 00:00:00', '2026-12-17 14:44:00'),
(51, 3, '396900.00', 'Address 48', 'User notes 48', 6, 'Admin notes 48', '2027-02-01 00:00:00', '2027-12-13 07:54:21'),
(52, 1, '287550.00', 'Address 49', 'User notes 49', 6, 'Admin notes 49', '2027-03-01 00:00:00', '2027-05-06 23:43:19'),
(53, 2, '453600.00', 'Address 50', 'User notes 50', 6, 'Admin notes 50', '2027-04-01 00:00:00', '2027-07-28 08:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `item_histories`
--

CREATE TABLE `item_histories` (
  `id_item_history` int(11) NOT NULL,
  `id_history` int(11) DEFAULT NULL,
  `name_product` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_histories`
--

INSERT INTO `item_histories` (`id_item_history`, `id_history`, `name_product`, `type`, `price`, `amount`) VALUES
(1, 1, 'Espresso', 0, '25000.00', 2),
(2, 2, 'Latte', 0, '35000.00', 1),
(3, 3, 'Cappuccino', 0, '30000.00', 3),
(4, 1, 'Cappucino', 0, '10000.00', 10),
(5, 3, 'Cappucino', 0, '10000.00', 5),
(6, 1, 'Espresso', 0, '4.50', 2),
(7, 1, 'Latte', 0, '5.00', 1),
(8, 2, 'Cappuccino', 0, '4.75', 1),
(9, 2, 'Mocha', 0, '5.25', 3),
(10, 3, 'Americano', 0, '4.25', 2),
(11, 3, 'Macchiato', 0, '4.50', 1),
(12, 4, 'Espresso', 0, '5.00', 2),
(13, 4, 'Latte', 0, '4.75', 3),
(14, 5, 'Cappuccino', 0, '5.25', 2),
(15, 5, 'Mocha', 0, '4.50', 1),
(16, 6, 'Americano', 0, '5.00', 3),
(17, 6, 'Macchiato', 0, '5.25', 2),
(18, 7, 'Espresso', 0, '4.50', 1),
(19, 7, 'Latte', 0, '5.00', 2),
(20, 8, 'Cappuccino', 0, '4.75', 3),
(21, 8, 'Mocha', 0, '5.25', 1),
(22, 9, 'Americano', 0, '4.25', 2),
(23, 9, 'Macchiato', 0, '4.50', 1),
(24, 10, 'Espresso', 0, '5.00', 3),
(25, 10, 'Latte', 0, '4.75', 2),
(26, 11, 'Cappuccino', 0, '5.25', 1),
(27, 11, 'Mocha', 0, '4.50', 2),
(28, 12, 'Americano', 0, '5.00', 1),
(29, 12, 'Macchiato', 0, '5.25', 3),
(30, 13, 'Espresso', 0, '4.50', 2),
(31, 13, 'Latte', 0, '5.00', 1),
(32, 14, 'Cappuccino', 0, '4.75', 1),
(33, 14, 'Mocha', 0, '5.25', 3),
(34, 15, 'Americano', 0, '4.25', 2),
(35, 15, 'Macchiato', 0, '4.50', 1),
(36, 16, 'Espresso', 0, '5.00', 2),
(37, 16, 'Latte', 0, '4.75', 3),
(38, 17, 'Cappuccino', 0, '5.25', 2),
(39, 17, 'Mocha', 0, '4.50', 1),
(40, 18, 'Americano', 0, '5.00', 3),
(41, 18, 'Macchiato', 0, '5.25', 2),
(42, 19, 'Espresso', 0, '4.50', 1),
(43, 19, 'Latte', 0, '5.00', 2),
(44, 20, 'Cappuccino', 0, '4.75', 3),
(45, 20, 'Mocha', 0, '5.25', 1),
(46, 21, 'Americano', 0, '4.25', 2),
(47, 21, 'Macchiato', 0, '4.50', 1),
(48, 22, 'Espresso', 0, '5.00', 3),
(49, 22, 'Latte', 0, '4.75', 2),
(50, 23, 'Cappuccino', 0, '5.25', 1),
(51, 23, 'Mocha', 0, '4.50', 2),
(52, 24, 'Americano', 0, '5.00', 1),
(53, 24, 'Macchiato', 0, '5.25', 3),
(54, 25, 'Espresso', 0, '4.50', 2),
(55, 25, 'Latte', 0, '5.00', 1),
(56, 26, 'Cappuccino', 0, '4.75', 1),
(57, 26, 'Mocha', 0, '5.25', 3),
(58, 27, 'Americano', 0, '4.25', 2),
(59, 27, 'Macchiato', 0, '4.50', 1),
(60, 28, 'Espresso', 0, '5.00', 3),
(61, 28, 'Latte', 0, '4.75', 2),
(62, 29, 'Cappuccino', 0, '5.25', 1),
(63, 29, 'Mocha', 0, '4.50', 2),
(64, 30, 'Americano', 0, '5.00', 1),
(65, 30, 'Macchiato', 0, '5.25', 3),
(66, 31, 'Espresso', 0, '4.50', 2),
(67, 31, 'Latte', 0, '5.00', 1),
(68, 32, 'Cappuccino', 0, '4.75', 1),
(69, 32, 'Mocha', 0, '5.25', 3),
(70, 33, 'Americano', 0, '4.25', 2),
(71, 33, 'Macchiato', 0, '4.50', 1),
(72, 34, 'Espresso', 0, '5.00', 3),
(73, 34, 'Latte', 0, '4.75', 2),
(74, 35, 'Cappuccino', 0, '5.25', 1),
(75, 35, 'Mocha', 0, '4.50', 2),
(76, 36, 'Americano', 0, '5.00', 1),
(77, 36, 'Macchiato', 0, '5.25', 3),
(78, 37, 'Espresso', 0, '4.50', 2),
(79, 37, 'Latte', 0, '5.00', 1),
(80, 38, 'Cappuccino', 0, '4.75', 1),
(81, 38, 'Mocha', 0, '5.25', 3),
(82, 39, 'Americano', 0, '4.25', 2),
(83, 39, 'Macchiato', 0, '4.50', 1),
(84, 40, 'Espresso', 0, '5.00', 3),
(85, 40, 'Latte', 0, '4.75', 2),
(86, 41, 'Cappuccino', 0, '5.25', 1),
(87, 41, 'Mocha', 0, '4.50', 2),
(88, 42, 'Americano', 0, '5.00', 1),
(89, 42, 'Macchiato', 0, '5.25', 3),
(90, 43, 'Espresso', 0, '4.50', 2),
(91, 43, 'Latte', 0, '5.00', 1),
(92, 44, 'Cappuccino', 0, '4.75', 1),
(93, 44, 'Mocha', 0, '5.25', 3),
(94, 45, 'Americano', 0, '4.25', 2),
(95, 45, 'Macchiato', 0, '4.50', 1),
(96, 46, 'Espresso', 0, '5.00', 3),
(97, 46, 'Latte', 0, '4.75', 2),
(98, 47, 'Cappuccino', 0, '5.25', 1),
(99, 47, 'Mocha', 0, '4.50', 2),
(100, 48, 'Americano', 0, '5.00', 1),
(101, 48, 'Macchiato', 0, '5.25', 3),
(102, 49, 'Espresso', 0, '4.50', 2),
(103, 49, 'Latte', 0, '5.00', 1),
(104, 50, 'Cappuccino', 0, '4.75', 1),
(105, 50, 'Mocha', 0, '5.25', 3),
(106, 51, 'Americano', 0, '4.25', 2),
(107, 51, 'Macchiato', 0, '4.50', 1),
(108, 52, 'Espresso', 0, '5.00', 3),
(109, 52, 'Latte', 0, '4.75', 2),
(110, 53, 'Cappuccino', 0, '5.25', 1),
(111, 53, 'Mocha', 0, '4.50', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `type`, `information`, `picture`, `price`, `stock`) VALUES
(1, 'Espresso', 2, 'Single shot of espresso', 'jay_97aebf.jpg', '25000.00', 1004),
(2, 'Latte', 1, 'Espresso with steamed milk', 'Vanilla Sky - VVORKROOM_0652bc.jpeg', '35000.00', 10022),
(3, 'Cappuccino', 1, 'Espresso with equal parts steamed milk and foam', 'https://kurio-img.kurioapps.com/19/05/28/50de339f-7e20-4738-b9a4-a2ba49991add.jpg', '30000.00', 7),
(4, 'Americano', 1, 'Single shot of espresso', 'https://foto.kontan.co.id/Ohrz3SH23BdMi7J7XLG6JgDgO6w=/smart/filters:format(webp)/2023/01/26/1632610923p.jpg', '28000.00', 1),
(5, 'Latte', 1, 'Espresso with steamed milk', 'https://asset.kompas.com/crops/x-r7MkpXEb2WJZMuPCqZbtx3b3k=/174x21:974x555/750x500/data/photo/2022/04/14/62577f67e1dc1.jpg', '38000.00', 0),
(6, 'Cappuccino', 3, 'Espresso with equal parts steamed milk and foam', 'https://www.acouplecooks.com/wp-content/uploads/2021/08/Iced-Latte-003.jpg', '33000.00', 1),
(7, 'Americano', 3, 'Single shot of espresso', 'https://www.nescafe.com/id/sites/default/files/Kopi-Hitam-Americano-dan-Espresso%2C-Apa-Bedanya%2C-Ya.jpg', '25000.00', 1),
(8, 'Caramel Machiato', 3, 'Espresso with steamed milk', 'https://flash-coffee.com/id/wp-content/uploads/sites/13/2023/06/CARAMEL-MACCHIATO-2.jpg', '35000.00', 1),
(9, 'Caramel Machiato', 3, 'Espresso with equal parts steamed milk and foam', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_3VASLCsT4-d0-nuLMC-unSNe3x3HCYVNPmJexJxNsA&s', '30000.00', 1),
(28, 'test34', 2, 'test', 'OJK_Logo_4c7088.png', '1111.00', 100),
(29, 'test34', 1, 'test', 'OJK_Logo_139640.png', '1111.00', 0),
(31, '235253', 3, '235235', 'uty_728698.jpg', '32325.00', 0),
(32, '1', NULL, '1', 'jay_689066.jpg', '1.00', 0),
(33, 'Kawat Longterm', NULL, '1221', 'uty_5e20d7.jpg', '121.00', 0),
(34, 'Kawat Longterm', NULL, '111', 'jay_50aab1.jpg', '111.00', 0),
(35, '111', NULL, '111', 'jay_b97e05.jpg', '111.00', 0),
(36, '222', 3, '111', 'wpjay_338a07.jpg', '111.00', 0),
(37, '22', 1, '22', 'jay_15397b.jpg', '22.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `fullname`, `email`, `phone`, `password`) VALUES
(1, 'Budi Santoso', 'budi@example.com', '08123456789', 'password123'),
(2, 'Ani Rahayu', 'ani@example.com', '08567891234', 'password456'),
(3, 'Joko Susanto', 'joko@example.com', '08765432100', 'password789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `fk_user_id` (`id_user`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id_cart_item`),
  ADD KEY `fk_menu_id` (`id_menu`),
  ADD KEY `fk_cart_id` (`id_cart`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `fk_user_id_history` (`id_user`);

--
-- Indexes for table `item_histories`
--
ALTER TABLE `item_histories`
  ADD PRIMARY KEY (`id_item_history`),
  ADD KEY `fk_history_id` (`id_history`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id_cart_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `item_histories`
--
ALTER TABLE `item_histories`
  MODIFY `id_item_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id_cart`),
  ADD CONSTRAINT `fk_cart_id` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id_cart`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_id` FOREIGN KEY (`id_menu`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `fk_user_id_history` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `histories_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
