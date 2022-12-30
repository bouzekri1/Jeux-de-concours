-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2022 at 05:50 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `concours_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `concours`
--

CREATE TABLE `concours` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rewords` double DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `concours`
--

INSERT INTO `concours` (`id`, `name`, `description`, `rewords`, `is_active`) VALUES
(1, 'tombola', 'gagner TV', 14.5, 0),
(2, 'gagner TV', 'tv', 178, 0),
(3, 'gagner PC', 'HP', 1458, 1),
(6, 'Cheque', 'cheque', 15, 0),
(7, 'Noel', 'gagner un voyage', 10.12, 0),
(8, 'Noel', 'gagner un voyage', 10.12, 0),
(9, 'Noel', 'gagner un voyage', 10.12, 1),
(10, 'Concours Apple', 'Gagner Airpods3', 2, 0),
(11, 'Concours de Samsung', 'Galaxy J1', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221224193255', '2022-12-24 20:33:30', 57),
('DoctrineMigrations\\Version20221224214902', '2022-12-24 22:49:21', 48),
('DoctrineMigrations\\Version20221225113721', '2022-12-25 12:37:39', 666),
('DoctrineMigrations\\Version20221225214529', '2022-12-25 22:45:57', 51),
('DoctrineMigrations\\Version20221226125934', '2022-12-26 13:59:59', 108),
('DoctrineMigrations\\Version20221226130029', '2022-12-26 14:00:34', 157);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_concours` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `is_gagnant` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `name`, `lastname`, `phonenumber`, `id_concours`, `id_user`, `is_gagnant`) VALUES
(1, 'ddd', 'dd', 'ddd', 1, 1, 1),
(2, 'ddd', 'dd', 'ddd', 1, 1, 1),
(3, 'ffff', 'fff', 'ffff', 2, 2, 0),
(4, 'ffff', 'fff', 'ffff', 2, 2, 1),
(5, 'ffff', 'fff', 'ffff', 2, 2, 1),
(6, 'ffff', 'fff', 'ffff', 2, 2, 1),
(7, 'ffff', 'fff', 'ffff', 2, 2, 0),
(8, 'dd', 'dddd', 'dffff', 1, 6, 1),
(9, 'sss', 'sokdd', '78798809', 2, 8, 0),
(10, 'rte&', 'fzf', '424242344', 8, 8, 1),
(11, 'Louis', 'Emerick', '0788996654', 10, 8, 1),
(12, 'user1', 'user1', '064587512', 2, 10, 1),
(13, 'user1', 'user1', '0658741256', 7, 10, 1),
(14, 'User3', 'User3', '06874563', 11, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'email@email.com', '[]', '$2y$13$GLB9Bds6V7uG3svu1kvuwuUiwqgtOEp.1vV3HMEVXyXOPTIn6ahCq'),
(2, 'ff@gmail.com', '[]', '$2y$13$G87rb4PFGITVD1A1lfiLgeIRCkUl4x0BMVuDTpZAnV5odQjThD2i6'),
(5, 'email1@jkj.com', '[]', '$2y$13$pMyHdOEsjVNUCcNfCov4EeW/LMmJOHLyZD0JLmZHWQilg.bSfTup2'),
(6, 'adminn@admin.com', '[]', '$2y$13$.b91eFlV53soQwYvb3mCVOaDhpbhc5cMvL6hU40JtVSRcidt6O2bK'),
(7, 'admin@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$dZcfgs9Kd.feWFNhY1bp6elG7lowSZ4figsra2iASM9foYuK4Y6Hy'),
(8, 'user@user.com', '[\"ROLE_USER\"]', '$2y$13$iw0HD3hu3a6wvNG4xrjaBufrxePWYtD/71Mad6RizSFj73ghlbTka'),
(10, 'user1@user.com', '[\"ROLE_USER\"]', '$2y$13$kKtciCX.LKosSOVioNsz9.5rSp0iyk5Z0ReNrtqJ0rHqLHwbl599S'),
(11, 'test22@gmail.com', '[]', '$2y$13$c.agxZ9mWIFhu1SvJeKANuvkTvjk8oDvAHt.0zx.81SBg.c8gETCW'),
(12, 'user3@user.com', '[\"ROLE_USER\"]', '$2y$13$Acf.azwdhKrHGRbwxBwCx.6HiMnDA2xOc2o7Tsuz9D2fjzeLDn9wW'),
(13, 'test223@gmail.com', '[]', '$2y$13$XwqYEU6bcJoDArWeHecxv.wxCtgBsecQvBwBOllY8TWyqsEpHoM6u');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `concours`
--
ALTER TABLE `concours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `concours`
--
ALTER TABLE `concours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
