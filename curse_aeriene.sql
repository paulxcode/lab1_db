-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 12:38 AM
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
-- Database: `lab1_zboruri`
--

-- --------------------------------------------------------

--
-- Table structure for table `curse_aeriene`
--

CREATE TABLE `curse_aeriene` (
  `cod_cursa` int(11) NOT NULL,
  `cod_zbor` int(11) NOT NULL,
  `data` date NOT NULL,
  `pret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD PRIMARY KEY (`cod_cursa`),
  ADD KEY `cod_zbor` (`cod_zbor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD CONSTRAINT `curse_aeriene_ibfk_1` FOREIGN KEY (`cod_zbor`) REFERENCES `zboruri` (`cod_zbor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
