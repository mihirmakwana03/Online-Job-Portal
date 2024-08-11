-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 08, 2023 at 06:42 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new`
--
CREATE DATABASE IF NOT EXISTS `new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE new;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `u_id` varchar(10) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `access` varchar(5) NOT NULL,
  `delete` varchar(5) NOT NULL,
  `edit` varchar(5) NOT NULL,
  `send` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`u_id`, `pwd`, `access`, `delete`, `edit`, `send`) VALUES
('admin', 'pwd', 'Yes', 'Yes', 'Yes', 'Yes'),
('newadmin', '111', 'yes', '', '', ''),
('admin', 'pwd', 'Yes', 'Yes', 'Yes', 'Yes'),
('rohit', 'rohit', 'yes', 'yes', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `admin_det`
--

DROP TABLE IF EXISTS `admin_det`;
CREATE TABLE IF NOT EXISTS `admin_det` (
  `u_id` varchar(10) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `phone` int NOT NULL,
  `mobile` int NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `doa` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_det`
--

INSERT INTO `admin_det` (`u_id`, `fname`, `lname`, `phone`, `mobile`, `country`, `city`, `doa`) VALUES
('', '', '', 0, 0, 'india', 'Delhi', '0000-00-00'),
('newadmin', 'newadmin', 'mitra', 2456675, 996543244, 'india', 'Mumbai', '0000-00-00'),
('rohit', 'Rohit', 'Rakshit', 2147483647, 2147483647, 'india', 'Ranchi', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `reg_no` int NOT NULL,
  `e_id` varchar(10) NOT NULL,
  `c_name` varchar(10) NOT NULL,
  `c_type` varchar(10) NOT NULL,
  `req` varchar(20) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`reg_no`, `e_id`, `c_name`, `c_type`, `req`, `addr1`, `country`, `city`) VALUES
(0, '', '', 'company', 'immediate', '', 'india', 'Delhi'),
(1003, 'aaa', 'abc', 'company', 'within 1 month', 'ddffgg', 'india', 'Mumbai'),
(1004, 'www', 'xyz', 'placement ', 'within 1 month', 'werw', 'india', 'Chennai'),
(1009, 'abcompany', 'a & b comp', 'company', 'within 3 months', '53-fre sector', 'india', 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `emp_det`
--

DROP TABLE IF EXISTS `emp_det`;
CREATE TABLE IF NOT EXISTS `emp_det` (
  `e_id` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone` bigint NOT NULL,
  `mobile` bigint NOT NULL,
  `address` varchar(255) NOT NULL,
  `dor` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emp_det`
--

INSERT INTO `emp_det` (`e_id`, `email`, `fname`, `lname`, `phone`, `mobile`, `address`, `dor`) VALUES
('aaa', 'aaa@gmail.com', 'aaa', 'bbb', 123456, 34567, 'dfdfd', '0000-00-00'),
('abcompany', 'abcompany@yahoo.com', 'avinash', 'biswas', 2456744, 9987655677, 'edward street,42-malay nagar,Delhi', '0000-00-00'),
('IIT', 'rohiit@gmail.com', 'Rohit', 'Rakshit', 9709224984, 9835565760, 'Ranchi', '0000-00-00'),
('www', 'www@yahoo.com', 'www', 'zzz', 234556, 8987766, '1st street', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `emp_inbox`
--

DROP TABLE IF EXISTS `emp_inbox`;
CREATE TABLE IF NOT EXISTS `emp_inbox` (
  `e_id` varchar(10) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `j_id` varchar(10) NOT NULL,
  `seek_email` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emp_inbox`
--

INSERT INTO `emp_inbox` (`e_id`, `f_name`, `email`, `j_id`, `seek_email`) VALUES
('aaa', 'aaa', 'aaa@gmail.com', 'kumar', 'ranjughosh@gmail.com'),
('abcompany', 'avinash', 'abcompany@yahoo.com', 'sn', 'sas@yahoo.com'),
('IIT', 'Rohit', 'rohiit@gmail.com', 'rohit', 'rohiit@gmail.com'),
('www', 'www', 'www@yahoo.com', 'sn', 'sas@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `emp_login`
--

DROP TABLE IF EXISTS `emp_login`;
CREATE TABLE IF NOT EXISTS `emp_login` (
  `e_id` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emp_login`
--

INSERT INTO `emp_login` (`e_id`, `password`) VALUES
('aaa', '777'),
('abcompany', 'avinash'),
('IIT', 'IIT'),
('rohit', 'rohit'),
('www', '222');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE IF NOT EXISTS `experience` (
  `j_id` varchar(10) NOT NULL,
  `job_cat` varchar(10) NOT NULL,
  `j_type` varchar(10) NOT NULL,
  `months` int NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `skills` varchar(20) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`j_id`, `job_cat`, `j_type`, `months`, `f_name`, `l_name`, `skills`, `city`, `country`, `email`) VALUES
('kumar', 'finance', 'company', 6300, 'ranju kumar', 'ghosh', 'tally', 'Kolkata', 'india', 'ranjughosh@gmail.com'),
('mail', 'IT', 'company', 8, 'mail', 'me', 'c,c++', 'Delhi', 'india', 'mail1lyme@yahoo.com'),
('rohit', 'IT', 'placement ', 75, 'Rohit', 'Rakshit', 'Pro', 'Delhi', 'india', 'rohiit@gmail.com'),
('Shri', 'IT', 'company', 0, 'rohit', 'rakshit', '', 'Delhi', 'india', 'rohiit@gmail.com'),
('sn', 'finance', 'company', 8, 'sn', 'gandhi', 'oracle', 'Mumbai', 'india', 'sas@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `seek_det`
--

DROP TABLE IF EXISTS `seek_det`;
CREATE TABLE IF NOT EXISTS `seek_det` (
  `j_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `phone_no` int NOT NULL,
  `mobile_no` int NOT NULL,
  `q_id` varchar(10) NOT NULL,
  `skills` varchar(20) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `doreq` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seek_det`
--

INSERT INTO `seek_det` (`j_id`, `email`, `f_name`, `l_name`, `phone_no`, `mobile_no`, `q_id`, `skills`, `city`, `country`, `doreq`) VALUES
('IIT', 'rohiit@gmail.com', 'rohit', 'rakshit', 970922498, 983556576, 'MCA', 'JAVA', 'Ranchi', 'india', '0000-00-00'),
('kumar', 'ranjughosh@gmail.com', 'ranju kumar', 'ghosh', 2480074, 2147483647, 'Diploma', 'tally', 'Kolkata', 'india', '0000-00-00'),
('mail', 'mail1lyme@yahoo.com', 'mail', 'me', 2456677, 2147483647, 'B.C.A', 'c,c++', 'Delhi', 'india', '0000-00-00'),
('rohit', 'rohiit@gmail.com', 'Rohit', 'Rakshit', 2147483647, 2147483647, 'B.C.A', 'Pro', 'Delhi', 'india', '0000-00-00'),
('sn', 'sas@yahoo.com', 'sn', 'gandhi', 435666, 88768888, 'B.A.', 'oracle', 'Mumbai', 'india', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `seek_inbox`
--

DROP TABLE IF EXISTS `seek_inbox`;
CREATE TABLE IF NOT EXISTS `seek_inbox` (
  `j_id` varchar(10) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `e_id` varchar(10) NOT NULL,
  `emp_email` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seek_inbox`
--

INSERT INTO `seek_inbox` (`j_id`, `f_name`, `email`, `e_id`, `emp_email`) VALUES
('rohit', 'rohit', 'rohiit@gmail.com', 'IIT', 'rohiit@gmail.com'),
('sn', 'sn', 'sas@yahoo.com', 'www', 'www@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `seek_login`
--

DROP TABLE IF EXISTS `seek_login`;
CREATE TABLE IF NOT EXISTS `seek_login` (
  `j_id` varchar(10) NOT NULL,
  `pwd` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seek_login`
--

INSERT INTO `seek_login` (`j_id`, `pwd`) VALUES
('kumar', '2721947'),
('mail', '222'),
('rakshit', 'rakshi'),
('rohit', 'rohit'),
('sn', '666');

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

DROP TABLE IF EXISTS `vacancy`;
CREATE TABLE IF NOT EXISTS `vacancy` (
  `e_id` varchar(10) NOT NULL,
  `job_cat` varchar(10) NOT NULL,
  `no_vac` int NOT NULL,
  `q_id` varchar(10) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `skills` varchar(30) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vacancy`
--

INSERT INTO `vacancy` (`e_id`, `job_cat`, `no_vac`, `q_id`, `addr1`, `city`, `country`, `skills`, `email`) VALUES
('aaa', 'finance', 2, 'Diploma', 'ddffgg', 'Mumbai', 'india', 'c', 'aaa@gmail.com'),
('abcompany', 'IT', 2, 'B.C.A', '53-fre sector', 'Delhi', 'india', 'c,c++', 'abcompany@yahoo.com'),
('Compu', 'IT', 1, 'MCA', 'Ranchi', 'Delhi', 'india', 'JAVA', 'rohiit@gmail.com'),
('www', 'marketing', 2, 'C.A.', 'werw', 'Chennai', 'india', 'java', 'www@yahoo.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
