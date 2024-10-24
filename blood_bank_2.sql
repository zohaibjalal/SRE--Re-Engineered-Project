-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2018 at 10:12 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blood bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_details`
--

CREATE TABLE IF NOT EXISTS `blood_details` (
  `blood_id` int(11) DEFAULT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  KEY `blood_id` (`blood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_details`
--

INSERT INTO `blood_details` (`blood_id`, `blood_group`) VALUES
(201, 'O+'),
(202, 'O-'),
(203, 'AB+'),
(204, 'AB-'),
(205, 'A+'),
(206, 'A-'),
(207, 'B+'),
(208, 'B-');

-- --------------------------------------------------------

--
-- Table structure for table `blood_inventory`
--

CREATE TABLE IF NOT EXISTS `blood_inventory` (
  `hospital_id` int(11) DEFAULT NULL,
  `blood_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_inventory`
--

INSERT INTO `blood_inventory` (`hospital_id`, `blood_id`, `qty`) VALUES
(11, 201, 1),
(12, 204, 1),
(13, 202, 2),
(14, 203, 2);

-- --------------------------------------------------------

--
-- Table structure for table `donar_details`
--

CREATE TABLE IF NOT EXISTS `donar_details` (
  `donor_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `phn` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donar_details`
--

INSERT INTO `donar_details` (`donor_id`, `name`, `blood_group`, `age`, `phn`) VALUES
(1, 'Ali', 'O+', '25', 03118652222),
(2, 'Ahmed', 'B+', '28', 03118454943),
(3, 'Ahsan', 'AB+', '32', 03448768888),
(4, 'zohaib', 'A-', '20', 03557851234),
(5, 'tayyab', 'O-', '19', 03135678899);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_login`
--

CREATE TABLE IF NOT EXISTS `hospital_login` (
  `hospital_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_login`
--

INSERT INTO `hospital_login` (`hospital_id`, `user_name`, `password`, `donor_id`) VALUES
(11, 'zohaib', '1234', 4),
(12, 'tayyab', '1234', 5);

-- --------------------------------------------------------

--
-- Table structure for table `requestor`
--

CREATE TABLE IF NOT EXISTS `requestor` (
  `id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` bigint(11) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `blood_id` int(11) NOT NULL,
  PRIMARY KEY (`blood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requestor`
--

INSERT INTO `requestor` (`id`, `name`, `phone`, `sex`, `blood_id`) VALUES
('101', 'Nouman', 03118732323, 'M', 201),
('102', 'Kareem', 03442345654, 'M', 202),
('103', 'Ali', 03448885656, 'M', 203),
('104', 'Waseem', 03444567888, 'M', 204),
('105', 'Jubina', 03315578888, 'F', 205);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_details`
--
ALTER TABLE `blood_details`
  ADD CONSTRAINT `blood_details_ibfk_1` FOREIGN KEY (`blood_id`) REFERENCES `requestor` (`blood_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blood_inventory`
--
ALTER TABLE `blood_inventory`
  ADD CONSTRAINT `blood_inventory_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_login` (`hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
