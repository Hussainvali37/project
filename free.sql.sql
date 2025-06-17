-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2025 at 12:29 PM
-- Server version: 8.0.40-cll-lve
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ktdevmy_demo3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `balance` double(20,2) NOT NULL DEFAULT '0.00',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `balance`, `name`, `photo`, `email`, `email_verified_at`, `password`, `salary_date`, `type`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0.00, 'Md Admin', '/public/admin/assets/images/profile/1706650015HOx.png', 'admin@gmail.com', '2023-11-29 18:37:08', '$2y$10$CqxQ942rxtSM/rGoZh5UjuAZDBb3Lu7k8BFMGOv02bs/yvp6SuFTy', '2024-05-03', 'admin', '01600000000', 'sd', '$2y$10$CqxQ942rxtSM/rGoZh5UjuAZDBb3Lu7k8BFMGOv02bs/yvp6SuFTy', '2023-11-28 11:11:57', '2025-02-22 00:42:50');

-- --------------------------------------------------------

--
-- Table structure for table `admin_ledgers`
--

CREATE TABLE `admin_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perticulation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `status` enum('pending','approved','rejected','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint UNSIGNED NOT NULL,
  `bonus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter` int DEFAULT '0' COMMENT 'user get service count',
  `set_service_counter` int NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winner` int DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonus_ledgers`
--

CREATE TABLE `bonus_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `bonus_id` bigint UNSIGNED NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `bonus_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`id`, `user_id`, `date`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(3, 124, '2025-02-21 16:53:35', 0.00, 'active', '2025-02-21 21:53:35', '2025-02-21 21:53:35'),
(4, 125, '2025-02-21 19:13:25', 0.00, 'active', '2025-02-22 00:13:25', '2025-02-22 00:13:25'),
(5, 126, '2025-02-21 21:38:01', 0.00, 'active', '2025-02-22 02:38:01', '2025-02-22 02:38:01'),
(6, 127, '2025-02-22 11:02:26', 0.00, 'active', '2025-02-22 16:02:26', '2025-02-22 16:02:26'),
(7, 128, '2025-02-22 18:30:42', 0.00, 'active', '2025-02-22 23:30:42', '2025-02-22 23:30:42'),
(8, 129, '2025-02-26 03:24:42', 0.00, 'active', '2025-02-26 08:24:42', '2025-02-26 08:24:42'),
(9, 130, '2025-02-26 08:44:01', 0.00, 'active', '2025-02-26 13:44:01', '2025-02-26 13:44:01'),
(10, 131, '2025-02-26 09:12:11', 0.00, 'active', '2025-02-26 14:12:11', '2025-02-26 14:12:11'),
(11, 132, '2025-02-26 11:52:12', 0.00, 'active', '2025-02-26 16:52:12', '2025-02-26 16:52:12'),
(12, 133, '2025-02-26 12:11:30', 0.00, 'active', '2025-02-26 17:11:30', '2025-02-26 17:11:30'),
(13, 134, '2025-02-26 13:52:16', 0.00, 'active', '2025-02-26 18:52:16', '2025-02-26 18:52:16'),
(14, 135, '2025-02-26 15:30:15', 0.00, 'active', '2025-02-26 20:30:15', '2025-02-26 20:30:15'),
(15, 136, '2025-02-26 15:34:40', 0.00, 'active', '2025-02-26 20:34:40', '2025-02-26 20:34:40'),
(16, 137, '2025-02-26 15:38:19', 0.00, 'active', '2025-02-26 20:38:19', '2025-02-26 20:38:19'),
(17, 138, '2025-02-26 15:39:06', 0.00, 'active', '2025-02-26 20:39:06', '2025-02-26 20:39:06'),
(18, 139, '2025-02-26 15:40:43', 0.00, 'active', '2025-02-26 20:40:43', '2025-02-26 20:40:43'),
(19, 140, '2025-02-26 15:41:22', 0.00, 'active', '2025-02-26 20:41:22', '2025-02-26 20:41:22'),
(20, 141, '2025-03-07 04:49:13', 0.00, 'active', '2025-03-07 09:49:13', '2025-03-07 09:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `date` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(20,2) DEFAULT '0.00' COMMENT 'User Deposit Amount',
  `final_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double(20,2) NOT NULL DEFAULT '0.00' COMMENT 'percent',
  `validity` bigint NOT NULL,
  `minimum_invest` double(20,2) NOT NULL DEFAULT '0.00' COMMENT 'amount',
  `status` enum('upcoming','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `name`, `title`, `photo`, `commission`, `validity`, `minimum_invest`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fund 1', 'Fund oneFund oneFund oneFund one', '/public/upload/fund/1714067352YBp.jpg', 800.00, 5, 500.00, 'active', '2023-06-06 15:38:44', '2024-04-25 23:49:12'),
(18, 'Fund 2', 'Event', '/public/upload/fund/1714067554sbV.jpg', 2500.00, 2, 1500.00, 'active', '2024-03-24 11:28:12', '2024-05-01 07:27:28'),
(19, 'Fund 3', 'Event', '/public/upload/fund/1714067820Ksw.jpg', 3000.00, 1, 2000.00, 'active', '2024-03-24 11:29:44', '2024-05-01 07:25:27'),
(24, 'Fund 3', 'Vip4', '/public/upload/fund/171452681034u.jpg', 7500.00, 1, 5000.00, 'active', '2024-05-01 07:26:51', '2024-05-01 07:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `fund_invests`
--

CREATE TABLE `fund_invests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fund_id` bigint UNSIGNED NOT NULL,
  `validity_expired` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `return_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lucky_ledgers`
--

CREATE TABLE `lucky_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `draw_id` bigint DEFAULT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `current_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `validity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'count days',
  `commission_with_avg_amount` double NOT NULL DEFAULT '0' COMMENT 'user get average amount after validity',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` enum('hot','vip') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hot',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `photo`, `price`, `validity`, `commission_with_avg_amount`, `status`, `type`, `created_at`, `updated_at`) VALUES
(25, 'Invité 5 membres get vip 1', '/public/upload/package/1739307053ak3.webp', 5, '30', 15, 'active', 'vip', '2024-01-07 17:03:27', '2025-02-22 00:15:52'),
(26, 'Invité 15:membres get vip 2', '/public/upload/package/1739307162KT9.webp', 15, '30', 30, 'active', 'vip', '2024-01-07 17:07:38', '2025-02-22 00:17:20'),
(27, 'Invité 50 membres get vip 3', '/public/upload/package/1739307184J7S.webp', 50, '30', 120, 'active', 'vip', '2024-01-09 18:21:25', '2025-02-22 00:18:06'),
(44, 'Invité 100 membres get vip 4', '/public/upload/package/17393072073az.webp', 100, '30', 200, 'active', 'vip', '2024-07-11 00:42:36', '2025-02-22 00:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `channel` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum` double(20,4) NOT NULL DEFAULT '0.0000',
  `maximum` double(20,3) NOT NULL DEFAULT '0.000',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` enum('wallet','usdt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'wallet',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `channel`, `address`, `receiver`, `minimum`, `maximum`, `status`, `type`, `created_at`, `updated_at`) VALUES
(44, 'USDT (BEP20)', '0x2325fcc0f14bb1e5afb22b882bf43bffbb425a0c', 'USDT', 5.0000, 500000000.000, 'active', 'wallet', '2024-11-22 17:49:15', '2025-04-22 02:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `daily_income` double(20,2) NOT NULL DEFAULT '0.00',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `validity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rebates`
--

CREATE TABLE `rebates` (
  `id` bigint UNSIGNED NOT NULL,
  `team_commission1` double(20,2) NOT NULL DEFAULT '0.00',
  `team_commission2` double(20,2) NOT NULL DEFAULT '0.00',
  `team_commission3` double(20,2) NOT NULL DEFAULT '0.00',
  `interest_commission1` double NOT NULL,
  `interest_commission2` double NOT NULL,
  `interest_commission3` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rebates`
--

INSERT INTO `rebates` (`id`, `team_commission1`, `team_commission2`, `team_commission3`, `interest_commission1`, `interest_commission2`, `interest_commission3`, `created_at`, `updated_at`) VALUES
(1, 10.00, 5.00, 2.00, 30, 5, 2, NULL, '2025-02-02 04:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `withdraw_charge` int NOT NULL DEFAULT '0' COMMENT 'percent',
  `minimum_withdraw` double(20,2) NOT NULL DEFAULT '0.00',
  `maximum_withdraw` double(20,2) NOT NULL DEFAULT '0.00',
  `w_time_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `checkin` double(20,2) NOT NULL DEFAULT '0.00',
  `registration_bonus` double(20,2) NOT NULL DEFAULT '0.00',
  `total_member_register_reword` int NOT NULL DEFAULT '0',
  `total_member_register_reword_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `service` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `withdraw_charge`, `minimum_withdraw`, `maximum_withdraw`, `w_time_status`, `checkin`, `registration_bonus`, `total_member_register_reword`, `total_member_register_reword_amount`, `service`, `created_at`, `updated_at`) VALUES
(1, 2, 2.00, 25000.00, 'active', 0.00, 1.00, 0, 0.00, 'https://t.me/Kt_devloper', '2022-01-18 11:03:22', '2025-04-22 02:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `invest` double NOT NULL DEFAULT '0',
  `bonus` double NOT NULL DEFAULT '0',
  `team_size` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_requests`
--

CREATE TABLE `task_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `team_invest` double NOT NULL DEFAULT '0',
  `team_size` bigint NOT NULL DEFAULT '0',
  `bonus` double NOT NULL DEFAULT '0',
  `status` enum('pending','received','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `ref_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `investor` int NOT NULL DEFAULT '0',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT '0.00',
  `receive_able_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `rebate_balance` double(20,3) NOT NULL DEFAULT '0.000',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `ban_unban` enum('ban','unban') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unban',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active_member` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ref_by`, `ref_id`, `name`, `investor`, `phone`, `ip`, `username`, `email`, `email_verified_at`, `password`, `type`, `balance`, `receive_able_amount`, `rebate_balance`, `photo`, `gateway_method`, `gateway_number`, `withdraw_password`, `ifsc`, `remember_token`, `status`, `ban_unban`, `created_at`, `updated_at`, `active_member`) VALUES
(124, '826zo', 'iq633', 'User67', 0, '22222222222', '103.126.151.45', 'uname22222222222', '22222222222@gmail.com', NULL, '$2y$10$CqxQ942rxtSM/rGoZh5UjuAZDBb3Lu7k8BFMGOv02bs/yvp6SuFTy', NULL, 10.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-21 21:53:35', '2025-02-21 21:53:35', 0),
(125, 'dz123', 'pm599', 'User74', 0, '0664636195', '154.121.108.246', 'uname0664636195', '0664636195@gmail.com', NULL, '$2y$10$1Je/1/sXAy5rx5IOXjdQc.q2pCLVaAH5kshb3kx92iMSBzRJ8a2de', NULL, 10.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-22 00:13:25', '2025-02-22 00:13:25', 0),
(126, '844vt', '290no', 'User47', 0, '9207600305', '2401:4900:6141:4d38:b511:342a:bc86:489a', 'uname9207600305', '9207600305@gmail.com', NULL, '$2y$10$hEp9WZUg7Fi4n2gyGzY/kuUmCkQH5/G.MFr/rd3RY7oJlDzuIL8pe', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-22 02:38:01', '2025-02-22 02:38:01', 0),
(127, '8167b', '395wa', 'User89', 0, '09055352748', '197.211.59.129', 'uname09055352748', '09055352748@gmail.com', NULL, '$2y$10$cPbmiLBjXpYjiCOdrRmPw.O.IIyr9wm52IbaQr.cWSnzLZwnIV.Ye', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-22 16:02:26', '2025-02-22 16:02:26', 0),
(128, 'xb515', '353on', 'User75', 0, '01816519931', '202.134.9.135', 'uname01816519931', '01816519931@gmail.com', NULL, '$2y$10$vevaPXjTuu02OzwDX.jA7.oNGFJCbhbpHD/gDRoUWnQp6sPm8LAR2', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-22 23:30:42', '2025-02-22 23:30:42', 0),
(129, '433gq', 'y9677', 'User88', 0, '971522285540', '92.98.139.194', 'uname971522285540', '971522285540@gmail.com', NULL, '$2y$10$mhuVbRsaP2HlgWTXGLtNfOnxAmxW8oy/giie3lbivkN65cySVVJwC', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 08:24:42', '2025-02-26 08:24:42', 0),
(130, 'ni633', 'en158', 'Nasim', 0, '01302139355', '2404:1c40:94:9f3b:640c:1bff:fed4:1e4d', 'uname01302139355', '01302139355@gmail.com', NULL, '$2y$10$NvCEB59YW2UvzzhStNVj3.bV7tr.IggzkOWqOCmabiS4sky2X/o8e', NULL, 1.00, 0.00, 0.000, NULL, 'USDT (BEP20)', 'Thakurgaon', NULL, NULL, NULL, 'active', 'unban', '2025-02-26 13:44:01', '2025-02-26 13:48:08', 0),
(131, '419z7', 'fm697', 'User33', 0, '01777306379', '103.138.202.106', 'uname01777306379', '01777306379@gmail.com', NULL, '$2y$10$6bPcWsl5kRZxrlNxygj27.FO8IfHITdqKq26MhDlhnggk2zg68/WC', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 14:12:11', '2025-02-26 14:12:11', 0),
(132, '5w820', 'aa311', 'User96', 0, '01787278539', '103.124.251.110', 'uname01787278539', '01787278539@gmail.com', NULL, '$2y$10$msIMs1aoTWAEGtqiOG0OfO3.VK67cWTZrPLv1A5rdls.Nv35PKe.e', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 16:52:12', '2025-02-26 16:52:12', 0),
(133, '5w906', 'dd654', 'User78', 0, '09701995412', '180.194.83.11', 'uname09701995412', '09701995412@gmail.com', NULL, '$2y$10$cf/XumRfbQ1FtC13Fd1glOK4/GLPN0Gd.r.5B0XOtHyA/YoRxBQ6K', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 17:11:30', '2025-02-26 17:11:30', 0),
(134, '8010c', 'oq216', 'User58', 0, '0586213158', '2.50.28.177', 'uname0586213158', '0586213158@gmail.com', NULL, '$2y$10$NikR4xLQJzpJHtYwmpLE3u2crHtSXF6lbNYdlASHK95ibCIe.m.uS', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 18:52:16', '2025-02-26 18:52:16', 0),
(135, '799dz', '6504i', 'Sakib Hossen', 0, '01316850237', '2400:c600:531f:23aa:d9bf:7203:7531:2f00', 'uname01316850237', '01316850237@gmail.com', NULL, '$2y$10$x0RnNWi9FVaNlGXUViSBPuB20jDKtHIeQmSeKPl.tub2xudzSiMf.', NULL, 1.00, 0.00, 0.000, NULL, 'USDT (BEP20)', '0x085ba102c08b6a3596fc0bef98366e3a6e3866c6', NULL, NULL, NULL, 'active', 'unban', '2025-02-26 20:30:15', '2025-02-26 20:47:10', 0),
(136, '6504i', 'to476', 'User98', 0, '01400135020', '2400:c600:531f:23aa:d9bf:7203:7531:2f00', 'uname01400135020', '01400135020@gmail.com', NULL, '$2y$10$FUXRJjKMwvy21TvmYt1m4OXOkgSIZWZgxJiYAqo40kvSNpiNihtK6', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 20:34:40', '2025-02-26 20:34:40', 0),
(137, '6504i', '142ss', 'User48', 0, '01972263022', '2400:c600:531f:23aa:d9bf:7203:7531:2f00', 'uname01972263022', '01972263022@gmail.com', NULL, '$2y$10$QZvXLfDnr7o60.fnwtICl.PTFlZP5uA6H3CY8HTXc5Alw15swUL5i', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 20:38:19', '2025-02-26 20:38:19', 0),
(138, '6504i', '48mp', 'User66', 0, '01711263022', '2400:c600:531f:23aa:d9bf:7203:7531:2f00', 'uname01711263022', '01711263022@gmail.com', NULL, '$2y$10$LyeESWBXSf.VBj8ZRBzHmOqYvzDofpvW2Zi7CAG4tYwNsDXOYZ9TK', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 20:39:06', '2025-02-26 20:39:06', 0),
(139, '6504i', '988c8', 'User75', 0, '01733822732', '2400:c600:531f:23aa:d9bf:7203:7531:2f00', 'uname01733822732', '01733822732@gmail.com', NULL, '$2y$10$yLr9SZdmKhQqHU7pFyREkew1p6o6cgf9fqwy.pedv0EleXFo.xLl2', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 20:40:43', '2025-02-26 20:40:43', 0),
(140, '6504i', 'gi935', 'User26', 0, '01611263022', '2400:c600:531f:23aa:d9bf:7203:7531:2f00', 'uname01611263022', '01611263022@gmail.com', NULL, '$2y$10$YIz6YNsNrYgqWwjRHahMJeHosAofR/32FTI/XQDMyXTctgLWUgUAe', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-02-26 20:41:22', '2025-02-26 20:41:22', 0),
(141, '775qy', '319jg', 'User85', 0, '01300000000', '103.198.133.54', 'uname01300000000', '01300000000@gmail.com', NULL, '$2y$10$1lnm4l1tBkWrbs/sFCS3x.OyX5U9GloRH0if/pEp3Mn.xx8uWx/qO', NULL, 1.00, 0.00, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'unban', '2025-03-07 09:49:13', '2025-03-07 09:49:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_ledgers`
--

CREATE TABLE `user_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `get_balance_from_user_id` bigint DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perticulation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `status` enum('pending','approved','rejected','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_ledgers`
--

INSERT INTO `user_ledgers` (`id`, `user_id`, `get_balance_from_user_id`, `reason`, `perticulation`, `amount`, `debit`, `credit`, `status`, `date`, `step`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 15:39:27', NULL, '2025-01-29 15:39:27', '2025-01-29 15:39:27'),
(2, 2, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 15:41:58', NULL, '2025-01-29 15:41:58', '2025-01-29 15:41:58'),
(3, 3, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:15:21', NULL, '2025-01-29 16:15:21', '2025-01-29 16:15:21'),
(4, 4, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:42:18', NULL, '2025-01-29 16:42:18', '2025-01-29 16:42:18'),
(5, 5, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:49:11', NULL, '2025-01-29 16:49:11', '2025-01-29 16:49:11'),
(6, 6, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:51:35', NULL, '2025-01-29 16:51:35', '2025-01-29 16:51:35'),
(7, 7, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:52:31', NULL, '2025-01-29 16:52:31', '2025-01-29 16:52:31'),
(8, 8, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:53:08', NULL, '2025-01-29 16:53:08', '2025-01-29 16:53:08'),
(9, 9, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:55:17', NULL, '2025-01-29 16:55:17', '2025-01-29 16:55:17'),
(10, 10, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:56:57', NULL, '2025-01-29 16:56:57', '2025-01-29 16:56:57'),
(11, 11, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 16:58:48', NULL, '2025-01-29 16:58:48', '2025-01-29 16:58:48'),
(12, 12, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:07:05', NULL, '2025-01-29 17:07:05', '2025-01-29 17:07:05'),
(13, 13, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:07:25', NULL, '2025-01-29 17:07:25', '2025-01-29 17:07:25'),
(14, 14, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:23:43', NULL, '2025-01-29 17:23:43', '2025-01-29 17:23:43'),
(15, 15, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:26:59', NULL, '2025-01-29 17:26:59', '2025-01-29 17:26:59'),
(16, 16, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:28:59', NULL, '2025-01-29 17:28:59', '2025-01-29 17:28:59'),
(17, 17, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:31:30', NULL, '2025-01-29 17:31:30', '2025-01-29 17:31:30'),
(18, 18, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:33:06', NULL, '2025-01-29 17:33:06', '2025-01-29 17:33:06'),
(19, 19, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:33:16', NULL, '2025-01-29 17:33:16', '2025-01-29 17:33:16'),
(20, 20, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:37:06', NULL, '2025-01-29 17:37:06', '2025-01-29 17:37:06'),
(21, 21, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:39:07', NULL, '2025-01-29 17:39:07', '2025-01-29 17:39:07'),
(22, 22, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:39:40', NULL, '2025-01-29 17:39:40', '2025-01-29 17:39:40'),
(23, 23, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:41:37', NULL, '2025-01-29 17:41:37', '2025-01-29 17:41:37'),
(24, 24, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:50:37', NULL, '2025-01-29 17:50:37', '2025-01-29 17:50:37'),
(25, 25, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 17:52:44', NULL, '2025-01-29 17:52:44', '2025-01-29 17:52:44'),
(26, 26, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 18:32:00', NULL, '2025-01-29 18:32:00', '2025-01-29 18:32:00'),
(27, 27, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 18:35:49', NULL, '2025-01-29 18:35:49', '2025-01-29 18:35:49'),
(28, 28, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 18:45:20', NULL, '2025-01-29 18:45:20', '2025-01-29 18:45:20'),
(29, 29, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 18:47:58', NULL, '2025-01-29 18:47:58', '2025-01-29 18:47:58'),
(30, 30, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 18:56:07', NULL, '2025-01-29 18:56:07', '2025-01-29 18:56:07'),
(31, 31, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 18:56:14', NULL, '2025-01-29 18:56:14', '2025-01-29 18:56:14'),
(32, 32, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 19:08:40', NULL, '2025-01-29 19:08:40', '2025-01-29 19:08:40'),
(33, 16, 20, 'commission', 'level 1 product buy commission', 150, 150, 0, 'approved', '29-01-2025 19:12', 'first', '2025-01-29 19:12:56', '2025-01-29 19:12:56'),
(34, 11, 20, 'commission', 'level 2 product buy commission', 25, 25, 0, 'approved', '29-01-2025 19:12', 'second', '2025-01-29 19:12:57', '2025-01-29 19:12:57'),
(35, 8, 20, 'commission', 'level 3 product buy commission', 10, 10, 0, 'approved', '29-01-2025 19:12', 'third', '2025-01-29 19:12:57', '2025-01-29 19:12:57'),
(36, 33, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 19:14:36', NULL, '2025-01-29 19:14:36', '2025-01-29 19:14:36'),
(37, 34, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 19:14:41', NULL, '2025-01-29 19:14:41', '2025-01-29 19:14:41'),
(38, 35, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 19:20:14', NULL, '2025-01-29 19:20:14', '2025-01-29 19:20:14'),
(39, 36, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:01:42', NULL, '2025-01-29 20:01:42', '2025-01-29 20:01:42'),
(40, 37, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:02:59', NULL, '2025-01-29 20:02:59', '2025-01-29 20:02:59'),
(41, 38, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:26:55', NULL, '2025-01-29 20:26:55', '2025-01-29 20:26:55'),
(42, 39, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:28:11', NULL, '2025-01-29 20:28:11', '2025-01-29 20:28:11'),
(43, 40, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:34:17', NULL, '2025-01-29 20:34:17', '2025-01-29 20:34:17'),
(44, 41, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:34:32', NULL, '2025-01-29 20:34:32', '2025-01-29 20:34:32'),
(45, 42, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:35:07', NULL, '2025-01-29 20:35:07', '2025-01-29 20:35:07'),
(46, 43, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:37:48', NULL, '2025-01-29 20:37:48', '2025-01-29 20:37:48'),
(47, 44, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:41:33', NULL, '2025-01-29 20:41:33', '2025-01-29 20:41:33'),
(48, 45, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:42:09', NULL, '2025-01-29 20:42:09', '2025-01-29 20:42:09'),
(49, 46, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:43:37', NULL, '2025-01-29 20:43:37', '2025-01-29 20:43:37'),
(50, 47, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:44:04', NULL, '2025-01-29 20:44:04', '2025-01-29 20:44:04'),
(51, 48, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:46:08', NULL, '2025-01-29 20:46:08', '2025-01-29 20:46:08'),
(52, 49, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:47:57', NULL, '2025-01-29 20:47:57', '2025-01-29 20:47:57'),
(53, 50, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:50:47', NULL, '2025-01-29 20:50:47', '2025-01-29 20:50:47'),
(54, 51, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:52:20', NULL, '2025-01-29 20:52:20', '2025-01-29 20:52:20'),
(55, 52, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 20:55:18', NULL, '2025-01-29 20:55:18', '2025-01-29 20:55:18'),
(56, 53, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 21:15:21', NULL, '2025-01-29 21:15:21', '2025-01-29 21:15:21'),
(57, 54, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 21:20:52', NULL, '2025-01-29 21:20:52', '2025-01-29 21:20:52'),
(58, 55, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 21:26:06', NULL, '2025-01-29 21:26:06', '2025-01-29 21:26:06'),
(59, 56, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 21:26:35', NULL, '2025-01-29 21:26:35', '2025-01-29 21:26:35'),
(60, 57, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 21:27:34', NULL, '2025-01-29 21:27:34', '2025-01-29 21:27:34'),
(61, 58, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 21:49:04', NULL, '2025-01-29 21:49:04', '2025-01-29 21:49:04'),
(62, 59, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 22:10:44', NULL, '2025-01-29 22:10:44', '2025-01-29 22:10:44'),
(63, 60, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 22:23:33', NULL, '2025-01-29 22:23:33', '2025-01-29 22:23:33'),
(64, 61, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 22:24:30', NULL, '2025-01-29 22:24:30', '2025-01-29 22:24:30'),
(65, 62, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 22:28:47', NULL, '2025-01-29 22:28:47', '2025-01-29 22:28:47'),
(66, 63, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 22:59:47', NULL, '2025-01-29 22:59:47', '2025-01-29 22:59:47'),
(67, 64, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-29 23:05:40', NULL, '2025-01-29 23:05:40', '2025-01-29 23:05:40'),
(68, 65, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 00:14:53', NULL, '2025-01-30 00:14:53', '2025-01-30 00:14:53'),
(69, 66, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 01:38:27', NULL, '2025-01-30 01:38:27', '2025-01-30 01:38:27'),
(70, 67, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 01:42:27', NULL, '2025-01-30 01:42:27', '2025-01-30 01:42:27'),
(71, 68, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 08:04:01', NULL, '2025-01-30 08:04:01', '2025-01-30 08:04:01'),
(72, 69, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 08:06:34', NULL, '2025-01-30 08:06:34', '2025-01-30 08:06:34'),
(73, 70, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 08:41:07', NULL, '2025-01-30 08:41:07', '2025-01-30 08:41:07'),
(74, 71, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 09:11:00', NULL, '2025-01-30 09:11:00', '2025-01-30 09:11:00'),
(75, 38, 69, 'commission', 'level 1 product buy commission', 150, 150, 0, 'approved', '30-01-2025 09:12', 'first', '2025-01-30 09:12:45', '2025-01-30 09:12:45'),
(76, 72, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 09:25:12', NULL, '2025-01-30 09:25:12', '2025-01-30 09:25:12'),
(77, 73, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 11:08:02', NULL, '2025-01-30 11:08:02', '2025-01-30 11:08:02'),
(78, 74, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 11:17:57', NULL, '2025-01-30 11:17:57', '2025-01-30 11:17:57'),
(79, 75, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 11:43:48', NULL, '2025-01-30 11:43:48', '2025-01-30 11:43:48'),
(80, 76, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 11:45:34', NULL, '2025-01-30 11:45:34', '2025-01-30 11:45:34'),
(81, 77, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 11:45:39', NULL, '2025-01-30 11:45:39', '2025-01-30 11:45:39'),
(82, 78, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 12:18:34', NULL, '2025-01-30 12:18:34', '2025-01-30 12:18:34'),
(83, 79, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 12:50:37', NULL, '2025-01-30 12:50:37', '2025-01-30 12:50:37'),
(84, 80, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 14:40:21', NULL, '2025-01-30 14:40:21', '2025-01-30 14:40:21'),
(85, 81, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 14:50:57', NULL, '2025-01-30 14:50:57', '2025-01-30 14:50:57'),
(86, 82, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 15:09:38', NULL, '2025-01-30 15:09:38', '2025-01-30 15:09:38'),
(87, 83, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 15:17:25', NULL, '2025-01-30 15:17:25', '2025-01-30 15:17:25'),
(88, 84, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 15:37:24', NULL, '2025-01-30 15:37:24', '2025-01-30 15:37:24'),
(89, 85, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 15:41:56', NULL, '2025-01-30 15:41:56', '2025-01-30 15:41:56'),
(90, 86, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 15:47:46', NULL, '2025-01-30 15:47:46', '2025-01-30 15:47:46'),
(91, 87, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 16:06:25', NULL, '2025-01-30 16:06:25', '2025-01-30 16:06:25'),
(92, 88, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 16:21:50', NULL, '2025-01-30 16:21:50', '2025-01-30 16:21:50'),
(93, 89, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 16:43:55', NULL, '2025-01-30 16:43:55', '2025-01-30 16:43:55'),
(94, 90, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 17:17:55', NULL, '2025-01-30 17:17:55', '2025-01-30 17:17:55'),
(95, 91, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 17:29:40', NULL, '2025-01-30 17:29:40', '2025-01-30 17:29:40'),
(96, 92, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 17:31:56', NULL, '2025-01-30 17:31:56', '2025-01-30 17:31:56'),
(97, 93, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 17:44:39', NULL, '2025-01-30 17:44:39', '2025-01-30 17:44:39'),
(98, 94, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 17:46:54', NULL, '2025-01-30 17:46:54', '2025-01-30 17:46:54'),
(99, 95, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 17:57:06', NULL, '2025-01-30 17:57:06', '2025-01-30 17:57:06'),
(100, 96, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 18:17:22', NULL, '2025-01-30 18:17:22', '2025-01-30 18:17:22'),
(101, 97, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 19:01:58', NULL, '2025-01-30 19:01:58', '2025-01-30 19:01:58'),
(102, 98, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 19:10:33', NULL, '2025-01-30 19:10:33', '2025-01-30 19:10:33'),
(103, 20, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-01-30 19:15:16', NULL, '2025-01-30 19:15:16', '2025-01-30 19:15:16'),
(104, 99, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 20:36:39', NULL, '2025-01-30 20:36:39', '2025-01-30 20:36:39'),
(105, 100, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 21:41:51', NULL, '2025-01-30 21:41:51', '2025-01-30 21:41:51'),
(106, 101, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 21:44:55', NULL, '2025-01-30 21:44:55', '2025-01-30 21:44:55'),
(107, 54, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-01-30 22:00:24', NULL, '2025-01-30 22:00:24', '2025-01-30 22:00:24'),
(108, 102, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 22:40:31', NULL, '2025-01-30 22:40:31', '2025-01-30 22:40:31'),
(109, 103, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 23:08:28', NULL, '2025-01-30 23:08:28', '2025-01-30 23:08:28'),
(110, 104, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-30 23:38:32', NULL, '2025-01-30 23:38:32', '2025-01-30 23:38:32'),
(111, 105, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 00:45:38', NULL, '2025-01-31 00:45:38', '2025-01-31 00:45:38'),
(112, 106, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 01:03:47', NULL, '2025-01-31 01:03:47', '2025-01-31 01:03:47'),
(113, 107, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 07:55:52', NULL, '2025-01-31 07:55:52', '2025-01-31 07:55:52'),
(114, 69, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-01-31 09:15:18', NULL, '2025-01-31 09:15:18', '2025-01-31 09:15:18'),
(115, 108, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 11:22:58', NULL, '2025-01-31 11:22:58', '2025-01-31 11:22:58'),
(116, 109, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 12:40:25', NULL, '2025-01-31 12:40:25', '2025-01-31 12:40:25'),
(117, 110, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 15:36:26', NULL, '2025-01-31 15:36:26', '2025-01-31 15:36:26'),
(118, 20, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-01-31 19:15:17', NULL, '2025-01-31 19:15:17', '2025-01-31 19:15:17'),
(119, 38, 46, 'commission', 'level 1 product buy commission', 150, 150, 0, 'approved', '31-01-2025 20:10', 'first', '2025-01-31 20:10:31', '2025-01-31 20:10:31'),
(120, 111, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-01-31 22:04:47', NULL, '2025-01-31 22:04:47', '2025-01-31 22:04:47'),
(121, 112, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 03:10:37', NULL, '2025-02-01 03:10:37', '2025-02-01 03:10:37'),
(122, 69, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-02-01 09:15:23', NULL, '2025-02-01 09:15:23', '2025-02-01 09:15:23'),
(123, 113, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 11:08:17', NULL, '2025-02-01 11:08:17', '2025-02-01 11:08:17'),
(124, 114, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 11:20:03', NULL, '2025-02-01 11:20:03', '2025-02-01 11:20:03'),
(125, 115, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 13:20:58', NULL, '2025-02-01 13:20:58', '2025-02-01 13:20:58'),
(126, 116, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 13:23:10', NULL, '2025-02-01 13:23:10', '2025-02-01 13:23:10'),
(127, 117, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 13:48:58', NULL, '2025-02-01 13:48:58', '2025-02-01 13:48:58'),
(128, 118, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 14:20:38', NULL, '2025-02-01 14:20:38', '2025-02-01 14:20:38'),
(129, 20, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-02-01 19:15:18', NULL, '2025-02-01 19:15:18', '2025-02-01 19:15:18'),
(130, 46, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-02-01 20:15:17', NULL, '2025-02-01 20:15:17', '2025-02-01 20:15:17'),
(131, 119, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 20:52:13', NULL, '2025-02-01 20:52:13', '2025-02-01 20:52:13'),
(132, 120, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-01 23:11:40', NULL, '2025-02-01 23:11:40', '2025-02-01 23:11:40'),
(133, 69, NULL, 'daily_income', 'VIP2 IPO Package commission', 150, 0, 150, 'approved', '2025-02-02 09:20:17', NULL, '2025-02-02 09:20:17', '2025-02-02 09:20:17'),
(134, 121, NULL, 'Account create reward', 'Register reward', 50, 50, 0, 'approved', '2025-02-12 02:14:05', NULL, '2025-02-12 02:14:05', '2025-02-12 02:14:05'),
(135, 122, NULL, 'Account create reward', 'Register reward', 40, 40, 0, 'approved', '2025-02-15 21:55:47', NULL, '2025-02-15 15:55:47', '2025-02-15 15:55:47'),
(136, 123, NULL, 'Account create reward', 'Register reward', 10, 10, 0, 'approved', '2025-02-15 22:14:10', NULL, '2025-02-15 16:14:10', '2025-02-15 16:14:10'),
(137, 124, NULL, 'Account create reward', 'Register reward', 10, 10, 0, 'approved', '2025-02-21 16:53:35', NULL, '2025-02-21 21:53:35', '2025-02-21 21:53:35'),
(138, 125, NULL, 'Account create reward', 'Register reward', 10, 10, 0, 'approved', '2025-02-21 19:13:25', NULL, '2025-02-22 00:13:25', '2025-02-22 00:13:25'),
(139, 126, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-21 21:38:01', NULL, '2025-02-22 02:38:01', '2025-02-22 02:38:01'),
(140, 127, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-22 11:02:26', NULL, '2025-02-22 16:02:26', '2025-02-22 16:02:26'),
(141, 128, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-22 18:30:42', NULL, '2025-02-22 23:30:42', '2025-02-22 23:30:42'),
(142, 129, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 03:24:42', NULL, '2025-02-26 08:24:42', '2025-02-26 08:24:42'),
(143, 130, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 08:44:01', NULL, '2025-02-26 13:44:01', '2025-02-26 13:44:01'),
(144, 131, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 09:12:11', NULL, '2025-02-26 14:12:11', '2025-02-26 14:12:11'),
(145, 132, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 11:52:12', NULL, '2025-02-26 16:52:12', '2025-02-26 16:52:12'),
(146, 133, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 12:11:30', NULL, '2025-02-26 17:11:30', '2025-02-26 17:11:30'),
(147, 134, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 13:52:16', NULL, '2025-02-26 18:52:16', '2025-02-26 18:52:16'),
(148, 135, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 15:30:15', NULL, '2025-02-26 20:30:15', '2025-02-26 20:30:15'),
(149, 136, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 15:34:40', NULL, '2025-02-26 20:34:40', '2025-02-26 20:34:40'),
(150, 137, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 15:38:19', NULL, '2025-02-26 20:38:19', '2025-02-26 20:38:19'),
(151, 138, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 15:39:06', NULL, '2025-02-26 20:39:06', '2025-02-26 20:39:06'),
(152, 139, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 15:40:43', NULL, '2025-02-26 20:40:43', '2025-02-26 20:40:43'),
(153, 140, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-02-26 15:41:22', NULL, '2025-02-26 20:41:22', '2025-02-26 20:41:22'),
(154, 141, NULL, 'Account create reward', 'Register reward', 1, 1, 0, 'approved', '2025-03-07 04:49:13', NULL, '2025-03-07 09:49:13', '2025-03-07 09:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `vip_sliders`
--

CREATE TABLE `vip_sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `page_type` enum('home_page','vip_page') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home_page',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vip_sliders`
--

INSERT INTO `vip_sliders` (`id`, `photo`, `status`, `page_type`, `created_at`, `updated_at`) VALUES
(11, '/public/upload/slider/1739305334aJ8.webp', 'active', 'home_page', '2023-07-05 01:06:16', '2025-02-12 02:22:14'),
(12, '/public/upload/slider/1738141813dvl.jpeg', 'active', 'home_page', '2023-07-05 01:06:35', '2025-01-29 15:10:13'),
(13, '/public/upload/slider/1738141823aD1.jpeg', 'active', 'home_page', '2024-07-08 03:03:49', '2025-01-29 15:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(20,2) NOT NULL DEFAULT '0.00',
  `final_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','approved','rejected','processing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_ledgers`
--
ALTER TABLE `admin_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus_ledgers`
--
ALTER TABLE `bonus_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkins_user_id_foreign` (`user_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_invests`
--
ALTER TABLE `fund_invests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fund_invests_user_id_foreign` (`user_id`),
  ADD KEY `fund_invests_fund_id_foreign` (`fund_id`);

--
-- Indexes for table `lucky_ledgers`
--
ALTER TABLE `lucky_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lucky_ledgers_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`),
  ADD KEY `purchases_package_id_foreign` (`package_id`);

--
-- Indexes for table `rebates`
--
ALTER TABLE `rebates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_requests`
--
ALTER TABLE `task_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_ledgers`
--
ALTER TABLE `user_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_sliders`
--
ALTER TABLE `vip_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_ledgers`
--
ALTER TABLE `admin_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonus_ledgers`
--
ALTER TABLE `bonus_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fund_invests`
--
ALTER TABLE `fund_invests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lucky_ledgers`
--
ALTER TABLE `lucky_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rebates`
--
ALTER TABLE `rebates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `task_requests`
--
ALTER TABLE `task_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `user_ledgers`
--
ALTER TABLE `user_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `vip_sliders`
--
ALTER TABLE `vip_sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkins`
--
ALTER TABLE `checkins`
  ADD CONSTRAINT `checkins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lucky_ledgers`
--
ALTER TABLE `lucky_ledgers`
  ADD CONSTRAINT `lucky_ledgers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
