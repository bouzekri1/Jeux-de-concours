-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 02:38 PM
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
-- Database: `jconcours_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `concours`
--

CREATE TABLE `concours` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rewords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `valeur` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `concours`
--

INSERT INTO `concours` (`id`, `name`, `description`, `rewords`, `is_active`, `valeur`) VALUES
(1, 'tombola', 'gagner TV', '14.5', 0, NULL),
(2, 'gagner TV', 'tv', '178', 0, NULL),
(3, 'gagner PC', 'HP', '1458', 0, NULL),
(6, 'Cheque', 'cheque', '15', 0, NULL),
(7, 'Noel', 'gagner un voyage', '10.12', 0, NULL),
(8, 'Noel', 'gagner un voyage', '10.12', 0, NULL),
(9, 'Noel', 'gagner un voyage', '10.12', 0, NULL),
(10, 'Concours Apple', 'Gagner Airpods3', '2', 0, NULL),
(11, 'Concours de Samsung', 'Galaxy J1', '2', 0, NULL),
(12, 'Voyage miracle', 'Gagnez un un voyage pour deux personnes', 'Billets aller-retour, hotêl', 0, 800),
(13, 'Voyage miracle', 'Gagnez un un voyage pour deux personnes', 'Billets aller-retour, hotêl', 0, 800),
(14, 'Concour Samsung', 'Gagnez le dérnier Samsung et d\'autres accessoires', 'Galaxy A41, Airbuds 360, Smartwatch', 0, 1500),
(15, NULL, NULL, NULL, 1, NULL);

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
('DoctrineMigrations\\Version20221226130029', '2022-12-26 14:00:34', 157),
('DoctrineMigrations\\Version20230416141857', '2023-04-18 20:06:44', 37);

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
(14, 'User3', 'User3', '06874563', 11, 12, 1),
(15, 'abde', 'bouze', '0755992832', 12, 14, 1),
(16, 'Abde', 'bouz', '0755992832', 12, 14, 0),
(17, 'Abde', 'Bouzekri', '0788349387', 13, 14, 1),
(18, 'Abde', 'Bouz', '075599384', 14, 14, 0),
(19, 'Saad', 'Lou', '0755992832', 14, 16, 0),
(20, 'rr', 'rrr', '3321', 14, 17, 0),
(21, 'A', 'E', '12', 14, 18, 0),
(22, NULL, NULL, NULL, 14, 19, 0),
(23, 'a', 'a', '1', 14, 20, 0);

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
(13, 'test223@gmail.com', '[]', '$2y$13$XwqYEU6bcJoDArWeHecxv.wxCtgBsecQvBwBOllY8TWyqsEpHoM6u'),
(14, 'bouzekri144@gmail.com', '[\"ROLE_USER\"]', '$2y$13$ORvTDnhjuzp0n01QlAi2eO9LMEPbk3mZbRtZCj.UJcEA1KrAXuFCG'),
(15, 'admin1@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$MIZKFisgm2myV6hXX1oo6eeG3TTk1KYW5vynivKRoDYJL1JzFeuDG'),
(16, 'user1@utilisateur.com', '[\"ROLE_USER\"]', '$2y$13$4aMWU/jXKSxbsFHW471/eeXvOwcXgoYPz6A1yZjfEamLw3Qvlh42q'),
(17, 'bouton@b.com', '[\"ROLE_USER\"]', '$2y$13$gEj/WukdRJEbTCZ2HEn1fu75DmdLqB0gny9tiDbVumkfmUoeanEW.'),
(18, 'rr', '[\"ROLE_USER\"]', '$2y$13$63wdakXsGhbOGOKcJbmTAuHJopDkRvaj4am7t6MvAmAhmm12gbE7G'),
(19, 'tes.com', '[\"ROLE_USER\"]', '$2y$13$CoqJGlkr7/Oa1BmSkYEg4OPftx8JT4G.BgZ.EXkr.CGv2RxiEm7va'),
(20, 'form.com', '[\"ROLE_USER\"]', '$2y$13$I5KOqfGswSjSFJ0DCfwpvewBYbvVGJDFQl8v477oj3HGjaigZf2EG'),
(21, 'ad.com', '[\"ROLE_ADMIN\"]', '$2y$13$oZSIMdSLNOcrQq1Sk3l2s.l065.45rHNP6v8o7DxbOKa4/5Bkdvn6'),
(22, 'testuseroo@gmail.com', '[]', '$2y$13$KkOANzUnK3KfNiT0.5vbk.SmrJxQE27hAHhJJhXZmw/sWNZMpFNVe');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
