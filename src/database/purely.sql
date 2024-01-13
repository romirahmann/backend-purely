-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2024 at 02:41 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `purely`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answer_id`, `question_id`, `description`, `status`) VALUES
(9, 1, 'Jawa Barat', 0),
(10, 1, 'Jawa Timur', 1),
(13, 1, 'Jawa Tengah', 0),
(14, 1, 'Bali', 0),
(15, 2, 'Aktif', 1),
(16, 2, 'Mati', 0),
(17, 2, 'Sedang Aktif', 0),
(18, 2, 'Tidak Aktif', 0),
(19, 3, '2.329 mdpl', 0),
(20, 3, '2.422 mdpl', 1),
(21, 3, '2.510 mdpl', 0),
(22, 3, '2.600 mdpl', 0),
(23, 3, '2.700 mdpl', 0),
(24, 4, '50.270 ha', 1),
(25, 4, '51.270 ha', 0),
(26, 3, '52.270 ha', 0),
(27, 4, '53.270 ha', 0),
(28, 4, '54.270 ha', 0),
(29, 5, 'Upacara Yadnya Kasada', 1),
(30, 5, 'Upacara Nyepi', 0),
(31, 5, 'Upacara Nyadran', 0),
(32, 5, 'Upacara Maulid Nabi', 0),
(33, 5, 'Upacara Idul Fitri', 0);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level_code` int(11) NOT NULL,
  `level_name` varchar(255) NOT NULL,
  `level_description` varchar(255) NOT NULL,
  `score_min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_code`, `level_name`, `level_description`, `score_min`) VALUES
(1, 1, 'Beginner', 'Pemula', 0),
(2, 2, 'Intermediate', 'Menengah', 50),
(3, 3, 'Advanced', 'Mahir', 150);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `level_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question`, `level_code`) VALUES
(1, 'Gunung Bromo terletak di wilayah?', 1),
(2, 'Gunung Bromo termasuk dalam kategori gunung api...', 2),
(3, 'Berapa ketinggian Gunung Bromo?', 3),
(4, 'Gunung Bromo terletak di Taman Nasional Bromo Tengger Semeru. Taman Nasional ini memiliki luas...', 3),
(5, 'Salah satu ritual keagamaan yang dialkukan di Gunung Bromo adalah...', 2);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `user_code` varchar(15) NOT NULL,
  `question_id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `update_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `user_code`, `question_id`, `score`, `created_at`, `update_at`) VALUES
(1, 'user268', 1, 50, '2024-01-12', '2024-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`score_id`, `question_id`, `score`) VALUES
(1, 1, 50),
(2, 2, 50),
(3, 3, 100),
(4, 4, 100),
(5, 5, 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_code` varchar(15) NOT NULL,
  `level_code` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `user_code`, `level_code`) VALUES
(1, 'admin', '$2b$10$vOdRGuo/iKsm5KWEj/t3aOaKTjM89IzPnGr1H7.e7FlQMquv9kQtS', 'admin123', 1),
(2, 'romirahman', '$2b$10$MRl0K2lKy4nIRvP5VRvKB.l7rYwNSPdQH2MtQACapa9w0q5t85.3G', 'romirahman0378', 1),
(3, 'user', '$2b$10$RgF7qzlyOXNGowEhS5Jc3eFY7O7Ki0N2OwDbeDf1wxO6h.u676Rx2', 'user268', 1),
(4, 'upi', '$2b$10$O6LiEVxNJb1fYZTfga7qyuRtq/Kg5nQ5R.WotEMcid1mwlbDiuki2', '', 1),
(6, 'abdul', '$2b$10$o8sn1I0k.jjge.hKfChQM.xLwSeHGjyMSWCvcCNpnj.aE9Dtvisem', 'abdul494', 1),
(7, 'alwahdi', '$2b$10$S1Vq36IATCktt0wqqNBNPOOVpz2QRyQosiVGDkRwRXZga.VHpMg3S', 'alwahdi443', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `answerToQuestion` (`question_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `code` (`level_code`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questionToLevel` (`level_code`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `scoreToUser` (`user_code`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `scoreToQuestion` (`question_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user` (`user_code`),
  ADD KEY `level_code` (`level_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answerToQuestion` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `questionToLevel` FOREIGN KEY (`level_code`) REFERENCES `level` (`level_code`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  ADD CONSTRAINT `scoreToUser` FOREIGN KEY (`user_code`) REFERENCES `user` (`user_code`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `scoreToQuestion` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `level_code` FOREIGN KEY (`level_code`) REFERENCES `level` (`level_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
