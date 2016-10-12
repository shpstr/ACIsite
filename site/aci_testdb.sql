-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2016 at 09:37 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aci`
--
CREATE DATABASE IF NOT EXISTS `aci` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aci`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET armscii8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generated_test`
--

CREATE TABLE `generated_test` (
  `hash_id` int(11) NOT NULL,
  `hash` varchar(8) NOT NULL,
  `candidate_username` varchar(225) NOT NULL,
  `assigned` tinyint(1) DEFAULT NULL,
  `q1_id` int(100) DEFAULT NULL,
  `q2_id` int(100) DEFAULT NULL,
  `q3_id` int(100) DEFAULT NULL,
  `q4_id` int(100) DEFAULT NULL,
  `q5_id` int(100) DEFAULT NULL,
  `q6_id` int(100) DEFAULT NULL,
  `q7_id` int(100) DEFAULT NULL,
  `q8_id` int(100) DEFAULT NULL,
  `q9_id` int(100) DEFAULT NULL,
  `q10_id` int(100) DEFAULT NULL,
  `q11_id` int(100) DEFAULT NULL,
  `q12_id` int(100) DEFAULT NULL,
  `q13_id` int(100) DEFAULT NULL,
  `q14_id` int(100) DEFAULT NULL,
  `q15_id` int(100) DEFAULT NULL,
  `q16_id` int(100) DEFAULT NULL,
  `q17_id` int(100) DEFAULT NULL,
  `q18_id` int(100) DEFAULT NULL,
  `q19_id` int(100) DEFAULT NULL,
  `q20_id` int(100) DEFAULT NULL,
  `q21_id` int(100) DEFAULT NULL,
  `q22_id` int(100) DEFAULT NULL,
  `q23_id` int(100) DEFAULT NULL,
  `q24_id` int(100) DEFAULT NULL,
  `q25_id` int(100) DEFAULT NULL,
  `q26_id` int(100) DEFAULT NULL,
  `q27_id` int(100) DEFAULT NULL,
  `q28_id` int(100) DEFAULT NULL,
  `q29_id` int(100) DEFAULT NULL,
  `q30_id` int(100) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `text` varchar(6000) CHARACTER SET ascii NOT NULL,
  `category_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `answer_type` set('multiple','text') CHARACTER SET ascii NOT NULL,
  `answer1` text,
  `rightness1` tinyint(1) DEFAULT NULL,
  `answer2` text,
  `rightness2` tinyint(1) DEFAULT NULL,
  `answer3` text,
  `rightness3` tinyint(1) DEFAULT NULL,
  `answer4` text,
  `rightness4` tinyint(1) DEFAULT NULL,
  `answer5` text,
  `rightness5` tinyint(1) DEFAULT NULL,
  `answer6` text,
  `rightness6` tinyint(1) DEFAULT NULL,
  `answer7` text,
  `rightness7` tinyint(1) DEFAULT NULL,
  `answer8` text,
  `rightness8` tinyint(1) DEFAULT NULL,
  `answer9` text,
  `rightness9` tinyint(1) DEFAULT NULL,
  `answer10` text,
  `rightness10` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_history`
--

CREATE TABLE `test_history` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `rightness` tinyint(1) DEFAULT NULL,
  `text_answer` varchar(6000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(512) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `mail` varchar(254) NOT NULL,
  `role_id` int(11) NOT NULL,
  `cv` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `mail`, `role_id`, `cv`) VALUES
(1, 'admin', 'dadada1', 'Administrator', 'Admin', 'da@da.com', 1, NULL),
(2, 'user1', 'da', 'Tibi', 'Lazar', '', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Manager'),
(3, 'Candidate');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `generated_test`
--
ALTER TABLE `generated_test`
  ADD UNIQUE KEY `hash_id` (`hash_id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `skill_id` (`skill_id`),
  ADD KEY `technology_id` (`category_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `technology_id` (`category_id`);

--
-- Indexes for table `test_history`
--
ALTER TABLE `test_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `generated_test`
--
ALTER TABLE `generated_test`
  MODIFY `hash_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `test_history`
--
ALTER TABLE `test_history`
  ADD CONSTRAINT `test_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `test_history_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);
--
-- Database: `aci_testdb`
--
CREATE DATABASE IF NOT EXISTS `aci_testdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aci_testdb`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
