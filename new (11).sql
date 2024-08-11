-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2023 at 06:35 AM
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
-- Database: `new`
--
CREATE DATABASE IF NOT EXISTS `new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `u_id` varchar(10) NOT NULL,
  `pwd` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`u_id`, `pwd`) VALUES
('admin', 'admin'),
('Mihir', '123');

-- --------------------------------------------------------

--
-- Table structure for table `admin_det`
--

CREATE TABLE `admin_det` (
  `u_id` varchar(10) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `doa` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_det`
--

INSERT INTO `admin_det` (`u_id`, `fname`, `lname`, `phone`, `country`, `city`, `doa`) VALUES
('admin', 'admin', '', 2456675, 'india', 'Mumbai', '0000-00-00'),
('Mihir', 'Mihir', 'Makwana', 8460716859, 'india', 'Mumbai', '2023-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `reg_no` int(11) NOT NULL,
  `e_id` varchar(10) NOT NULL,
  `c_name` varchar(10) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`reg_no`, `e_id`, `c_name`, `addr1`, `country`, `city`) VALUES
(0, 'IIT', 'IIT', 'Ranchi', 'india', 'Delhi'),
(1003, 'aaa', 'abc', 'aaa', 'india', 'Mumbai'),
(1009, 'abcompany', 'a & b comp', '53-fre sector', 'india', 'Delhi'),
(123, 'mihir', 'Brilliance', 'Anand', 'india', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `msg` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `msg`) VALUES
('Mihir Makwana', 'mihirpmakwana786@gmail.com', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `emp_det`
--

CREATE TABLE `emp_det` (
  `e_id` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dor` date DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_det`
--

INSERT INTO `emp_det` (`e_id`, `email`, `fname`, `lname`, `phone`, `address`, `dor`) VALUES
('aaa', 'aaa@gmail.com', 'aaa', 'bbb', 123456, 'aaa', '0000-00-00'),
('abcompany', 'abcompany@yahoo.com', 'avinash', 'biswas', 2456744, 'edward street,42-malay nagar,Delhi', '0000-00-00'),
('IIT', 'rohiit@gmail.com', 'Rohit', 'Rakshit', 9709224984, 'Ranchi', '0000-00-00'),
('mihir', 'mihirpmakwana786@gmail.com', 'Mihir', 'Makwana', 8460716859, 'Anand', '2023-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `emp_inbox`
--

CREATE TABLE `emp_inbox` (
  `e_id` varchar(10) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `j_id` varchar(10) NOT NULL,
  `seek_email` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_inbox`
--

INSERT INTO `emp_inbox` (`e_id`, `f_name`, `email`, `j_id`, `seek_email`) VALUES
('aaa', 'aaa', 'aaa@gmail.com', 'kumar', 'ranjughosh@gmail.com'),
('abcompany', 'avinash', 'abcompany@yahoo.com', 'sn', 'sas@yahoo.com'),
('IIT', 'Rohit', 'rohiit@gmail.com', 'rohit', 'rohiit@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `emp_login`
--

CREATE TABLE `emp_login` (
  `e_id` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_login`
--

INSERT INTO `emp_login` (`e_id`, `password`) VALUES
('aaa', '777'),
('abcompany', 'avinash'),
('IIT', 'IIT'),
('rohit', 'rohit'),
('mihir', '123');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `j_id` varchar(10) NOT NULL,
  `job_cat` varchar(10) NOT NULL,
  `months` int(11) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `skills` varchar(20) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`j_id`, `job_cat`, `months`, `f_name`, `l_name`, `skills`, `city`, `country`, `email`) VALUES
('IIT', 'finance', 6300, 'ranju kumar', 'ghosh', 'tally', 'Kolkata', 'india', 'ranjughosh@gmail.com'),
('mail', 'IT', 8, 'mail', 'me', 'c,c++', 'Delhi', 'india', 'mail1lyme@yahoo.com'),
('rohit', 'IT', 75, 'Rohit', 'Rakshit', 'Pro', 'Delhi', 'india', 'rohiit@gmail.com'),
('Shri', 'IT', 0, 'rohit', 'rakshit', '', 'Delhi', 'india', 'rohiit@gmail.com'),
('sn', 'finance', 8, 'sn', 'gandhi', 'oracle', 'Mumbai', 'india', 'sas@yahoo.com'),
('mihir', 'IT', 24, 'Mihir', 'Makwana', 'Java, C++, PHP', 'Mumbai', 'india', 'mihirpmakwana786@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `jobs_applied`
--

CREATE TABLE `jobs_applied` (
  `Appl_id` int(5) NOT NULL,
  `job_id` varchar(5) NOT NULL,
  `j_id` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_applied`
--

INSERT INTO `jobs_applied` (`Appl_id`, `job_id`, `j_id`, `status`) VALUES
(1, '5', 'mihir', 'Selected');

-- --------------------------------------------------------

--
-- Table structure for table `resumes`
--

CREATE TABLE `resumes` (
  `j_id` varchar(15) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `filePath` varchar(2555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seek_det`
--

CREATE TABLE `seek_det` (
  `j_id` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `phone_no` bigint(11) NOT NULL,
  `q_id` varchar(10) NOT NULL,
  `skills` varchar(20) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `doreq` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seek_det`
--

INSERT INTO `seek_det` (`j_id`, `email`, `f_name`, `l_name`, `phone_no`, `q_id`, `skills`, `city`, `country`, `doreq`) VALUES
('IIT', 'rohiit@gmail.com', 'rohit', 'rakshit', 970922498, 'MCA', 'JAVA', 'Ranchi', 'india', '0000-00-00'),
('mail', 'mail1lyme@yahoo.com', 'mail', 'me', 2456677, 'B.C.A', 'c,c++', 'Delhi', 'india', '0000-00-00'),
('rohit', 'rohiit@gmail.com', 'Rohit', 'Rakshit', 2147483647, 'B.C.A', 'Pro', 'Delhi', 'india', '0000-00-00'),
('sn', 'sas@yahoo.com', 'sn', 'gandhi', 435666, 'B.A.', 'oracle', 'Mumbai', 'india', '0000-00-00'),
('mihir', 'mihirpmakwana786@gmail.com', 'Mihir', 'Makwana', 8460716859, 'B.C.A', 'Java, C++, PHP', 'Mumbai', 'india', '2023-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `seek_inbox`
--

CREATE TABLE `seek_inbox` (
  `j_id` varchar(10) NOT NULL,
  `f_name` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `e_id` varchar(10) NOT NULL,
  `emp_email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seek_inbox`
--

INSERT INTO `seek_inbox` (`j_id`, `f_name`, `email`, `e_id`, `emp_email`) VALUES
('rohit', 'rohit', 'rohiit@gmail.com', 'IIT', 'rohiit@gmail.com'),
('sn', 'sn', 'sas@yahoo.com', 'www', 'www@yahoo.com'),
('mihir', 'Mihir', 'mihirpmakwana786@gmail.com', 'mihir', 'mihirpmakwana786@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `seek_login`
--

CREATE TABLE `seek_login` (
  `j_id` varchar(10) NOT NULL,
  `pwd` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seek_login`
--

INSERT INTO `seek_login` (`j_id`, `pwd`) VALUES
('kumar', '2721947'),
('mail', '222'),
('rakshit', 'rakshi'),
('rohit', 'rohit'),
('sn', '666'),
('mihir', '123');

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `job_id` int(11) NOT NULL,
  `c_name` varchar(30) NOT NULL,
  `e_id` varchar(10) NOT NULL,
  `job_cat` varchar(10) NOT NULL,
  `no_vac` int(11) NOT NULL,
  `q_id` varchar(10) NOT NULL,
  `req` varchar(30) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `skills` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vacancy`
--

INSERT INTO `vacancy` (`job_id`, `c_name`, `e_id`, `job_cat`, `no_vac`, `q_id`, `req`, `addr1`, `city`, `country`, `skills`, `email`) VALUES
(1, 'aaa', 'aaa', 'finance', 2, 'Diploma', 'Within 1 month', 'ddffgg', 'Mumbai', 'india', 'c', 'aaa@gmail.com'),
(2, 'abcompany', 'abcompany', 'IT', 2, 'B.C.A', 'Within 3 months', '53-fre sector', 'Delhi', 'india', 'c,c++', 'abcompany@yahoo.com'),
(5, 'Brilliance', 'mihir', 'IT', 3, 'B.C.A', 'immediate', 'Anand', 'Mumbai', 'india', 'Java, C++, PHP', 'mihirpmakwana786@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `admin_det`
--
ALTER TABLE `admin_det`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`reg_no`);

--
-- Indexes for table `emp_det`
--
ALTER TABLE `emp_det`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `emp_inbox`
--
ALTER TABLE `emp_inbox`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `emp_login`
--
ALTER TABLE `emp_login`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `jobs_applied`
--
ALTER TABLE `jobs_applied`
  ADD PRIMARY KEY (`Appl_id`);

--
-- Indexes for table `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `seek_det`
--
ALTER TABLE `seek_det`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `seek_inbox`
--
ALTER TABLE `seek_inbox`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `seek_login`
--
ALTER TABLE `seek_login`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`job_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs_applied`
--
ALTER TABLE `jobs_applied`
  MODIFY `Appl_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vacancy`
--
ALTER TABLE `vacancy`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
