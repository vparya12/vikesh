-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2018 at 07:17 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anand`
--

-- --------------------------------------------------------

--
-- Table structure for table `dth`
--

CREATE TABLE `dth` (
  `DTHNUMBER` bigint(15) NOT NULL,
  `MOBILENUMBER` bigint(15) NOT NULL,
  `ALTNUMBER` bigint(15) DEFAULT NULL,
  `RECHARGEDATE` date NOT NULL,
  `NETWORK` varchar(10) NOT NULL,
  `PAYMENT` tinyint(1) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `VALADITY` int(3) NOT NULL,
  `AMOUNT` int(5) NOT NULL,
  `ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dth`
--

INSERT INTO `dth` (`DTHNUMBER`, `MOBILENUMBER`, `ALTNUMBER`, `RECHARGEDATE`, `NETWORK`, `PAYMENT`, `USERNAME`, `VALADITY`, `AMOUNT`, `ID`) VALUES
(1234567890123456, 1234567890, 0, '2018-06-01', 'JIO', 1, 'Ved', 12, 120, 1),
(1234567890123457, 1234567890, 1234567892, '2018-05-02', 'JIO', 1, 'Ved', 12, 120, 2),
(1234567890123456, 1234567890, 0, '2018-06-03', 'JIO', 1, 'Ved', 12, 1200, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE `mobile` (
  `MOBILENUMBER` bigint(15) NOT NULL,
  `ALTNUMBER` bigint(15) DEFAULT NULL,
  `NETWORK` varchar(10) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `RECHARGEDATE` date NOT NULL,
  `AMOUNT` int(5) NOT NULL,
  `PAYMENT` tinyint(1) NOT NULL,
  `VALADITY` int(3) NOT NULL,
  `ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile`
--

INSERT INTO `mobile` (`MOBILENUMBER`, `ALTNUMBER`, `NETWORK`, `USERNAME`, `RECHARGEDATE`, `AMOUNT`, `PAYMENT`, `VALADITY`, `ID`) VALUES
(1234567890, 0, 'Jio', 'Ved', '2018-06-01', 120, 1, 12, 1),
(1234567891, 1234569874, 'Aircel', 'Beautiful', '2018-07-12', 420, 1, 20, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dth`
--
ALTER TABLE `dth`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dth`
--
ALTER TABLE `dth`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mobile`
--
ALTER TABLE `mobile`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
