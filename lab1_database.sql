-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 12:42 AM
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
-- Table structure for table `bilete`
--

CREATE TABLE `bilete` (
  `cod_bilet` int(11) NOT NULL,
  `cod_cursa` int(11) NOT NULL,
  `cod_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `cod_client` int(11) NOT NULL,
  `nume_client` varchar(255) NOT NULL,
  `adresa_client` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companie`
--

CREATE TABLE `companie` (
  `cod_companie` int(11) NOT NULL,
  `denumire_companie` varchar(255) NOT NULL,
  `Tara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companii_localitati`
--

CREATE TABLE `companii_localitati` (
  `cod_companie` int(11) NOT NULL,
  `cod_localitate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `localitati`
--

CREATE TABLE `localitati` (
  `cod_localitate` int(11) NOT NULL,
  `denumire_localitate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zboruri`
--

CREATE TABLE `zboruri` (
  `cod_zbor` int(11) NOT NULL,
  `cod_companie` int(11) NOT NULL,
  `cod_localitate_plecare` int(11) NOT NULL,
  `cod_localitate_sosire` int(11) NOT NULL,
  `minute_intarziere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bilete`
--
ALTER TABLE `bilete`
  ADD PRIMARY KEY (`cod_bilet`,`cod_cursa`,`cod_client`),
  ADD KEY `cod_client` (`cod_client`),
  ADD KEY `cod_cursa` (`cod_cursa`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cod_client`);

--
-- Indexes for table `companie`
--
ALTER TABLE `companie`
  ADD PRIMARY KEY (`cod_companie`);

--
-- Indexes for table `companii_localitati`
--
ALTER TABLE `companii_localitati`
  ADD PRIMARY KEY (`cod_companie`,`cod_localitate`),
  ADD KEY `cod_localitate` (`cod_localitate`);

--
-- Indexes for table `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD PRIMARY KEY (`cod_cursa`),
  ADD KEY `cod_zbor` (`cod_zbor`);

--
-- Indexes for table `localitati`
--
ALTER TABLE `localitati`
  ADD PRIMARY KEY (`cod_localitate`);

--
-- Indexes for table `zboruri`
--
ALTER TABLE `zboruri`
  ADD PRIMARY KEY (`cod_zbor`,`cod_companie`,`cod_localitate_plecare`,`cod_localitate_sosire`,`minute_intarziere`),
  ADD KEY `cod_companie` (`cod_companie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `cod_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilete`
--
ALTER TABLE `bilete`
  ADD CONSTRAINT `bilete_ibfk_1` FOREIGN KEY (`cod_client`) REFERENCES `client` (`cod_client`),
  ADD CONSTRAINT `bilete_ibfk_2` FOREIGN KEY (`cod_cursa`) REFERENCES `curse_aeriene` (`cod_cursa`);

--
-- Constraints for table `companii_localitati`
--
ALTER TABLE `companii_localitati`
  ADD CONSTRAINT `companii_localitati_ibfk_1` FOREIGN KEY (`cod_companie`) REFERENCES `companie` (`cod_companie`),
  ADD CONSTRAINT `companii_localitati_ibfk_2` FOREIGN KEY (`cod_localitate`) REFERENCES `localitati` (`cod_localitate`);

--
-- Constraints for table `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD CONSTRAINT `curse_aeriene_ibfk_1` FOREIGN KEY (`cod_zbor`) REFERENCES `zboruri` (`cod_zbor`);

--
-- Constraints for table `localitati`
--
ALTER TABLE `localitati`
  ADD CONSTRAINT `localitati_ibfk_1` FOREIGN KEY (`cod_localitate`) REFERENCES `companii_localitati` (`cod_localitate`);

--
-- Constraints for table `zboruri`
--
ALTER TABLE `zboruri`
  ADD CONSTRAINT `zboruri_ibfk_1` FOREIGN KEY (`cod_companie`) REFERENCES `companie` (`cod_companie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
