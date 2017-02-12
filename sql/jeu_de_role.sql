-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2017 at 01:46 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jeu_de_role`
--

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fk_stats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id`, `nom`, `fk_stats`) VALUES
(1, 'guerrier', 6),
(2, 'magicien', 7),
(3, 'archer', 8),
(4, 'palade', 9),
(5, 'crétin', 10);

-- --------------------------------------------------------

--
-- Table structure for table `personnage`
--

CREATE TABLE `personnage` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pa` int(11) NOT NULL,
  `fk_stats` int(11) DEFAULT NULL,
  `fk_race` int(11) DEFAULT NULL,
  `fk_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE `race` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fk_stats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `race`
--

INSERT INTO `race` (`id`, `nom`, `fk_stats`) VALUES
(1, 'humain', 1),
(2, 'elfe', 2),
(3, 'orc', 3),
(4, 'nain', 4),
(5, 'lapin', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `pv` int(11) NOT NULL,
  `mov` int(11) NOT NULL,
  `att` int(11) NOT NULL,
  `def` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`id`, `pv`, `mov`, `att`, `def`) VALUES
(1, 1000, 4, 100, 0.15),
(2, 750, 6, 120, 0.1),
(3, 1350, 3, 150, 0.25),
(4, 1150, 2, 135, 0.38),
(5, 550, 8, 50, -0.5),
(6, 200, -1, 25, 0.1),
(7, 300, 1, 50, -0.08),
(8, -248, 2, 20, -0.04),
(9, 2000, 5, 200, 0.3),
(10, 10000, 10, 300, -0.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8F87BF9696AA44DF` (`fk_stats`);

--
-- Indexes for table `personnage`
--
ALTER TABLE `personnage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6AEA486D96AA44DF` (`fk_stats`),
  ADD UNIQUE KEY `UNIQ_6AEA486D56516591` (`fk_race`),
  ADD UNIQUE KEY `UNIQ_6AEA486DAF29D706` (`fk_classe`);

--
-- Indexes for table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_DA6FBBAF96AA44DF` (`fk_stats`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `race`
--
ALTER TABLE `race`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_8F87BF9696AA44DF` FOREIGN KEY (`fk_stats`) REFERENCES `stats` (`id`);

--
-- Constraints for table `personnage`
--
ALTER TABLE `personnage`
  ADD CONSTRAINT `FK_6AEA486D56516591` FOREIGN KEY (`fk_race`) REFERENCES `race` (`id`),
  ADD CONSTRAINT `FK_6AEA486D96AA44DF` FOREIGN KEY (`fk_stats`) REFERENCES `stats` (`id`),
  ADD CONSTRAINT `FK_6AEA486DAF29D706` FOREIGN KEY (`fk_classe`) REFERENCES `classe` (`id`);

--
-- Constraints for table `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `FK_DA6FBBAF96AA44DF` FOREIGN KEY (`fk_stats`) REFERENCES `stats` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
