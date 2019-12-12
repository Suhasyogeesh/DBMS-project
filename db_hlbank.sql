-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2019 at 12:41 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hlbank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `statement` (IN `acc_no` BIGINT)  BEGIN
 SELECT * FROM tbl_transaction WHERE to_accno = acc_no 
		ORDER BY id DESC LIMIT 20;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `acc_no` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `balance` double NOT NULL DEFAULT '1000',
  `pin` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bdate` varchar(100) NOT NULL,
  `adm_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_accounts`
--

INSERT INTO `tbl_accounts` (`id`, `user_id`, `acc_no`, `type`, `balance`, `pin`, `status`, `bdate`, `adm_id`) VALUES
(1, 4, '1234556666', 'CA', 112.45, 12345, 'ACTIVE', '2015-01-03 00:53:05', 1),
(3, 6, '2133441212', 'SA', 400, 1234, 'INACTIVE', '2015-01-03 16:35:37', 1),
(4, 7, '1255050095', 'FDA', 87.55, 123456, 'ACTIVE', '2015-01-19 22:32:55', 1),
(5, 8, '1398976366', 'SA', 900, 1811, 'ACTIVE', '2019-11-19 14:09:57', 1),
(7, 10, '1240254823', 'SA', 1000, 1811, 'ACTIVE', '2019-11-19 15:29:04', 1),
(8, 11, '1361404084', 'SA', 2000, 1811, 'ACTIVE', '2019-11-19 15:50:16', 1),
(9, 12, '1239982045', 'SA', 1000, 1811, 'INACTIVE', '2019-11-21 10:26:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(40) NOT NULL,
  `zipcode` int(10) NOT NULL,
  `country` varchar(40) NOT NULL,
  `adm_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_address`
--

INSERT INTO `tbl_address` (`id`, `user_id`, `address`, `city`, `state`, `zipcode`, `country`, `adm_id`) VALUES
(1, 4, '290 shani peth', 'jalgaon', 'maha', 112233, 'USA', 1),
(2, 5, '23/1, Baker street', 'pune', 'MA', 2341, 'USA', 1),
(3, 6, 'scott homes, x-bay', 'huston', 'MA', 22341, 'USA', 1),
(4, 7, '290, shani peth', 'jalgaon', 'maharashtra', 212112, 'USA', 1),
(7, 10, '770', 'mysore', 'karnataka', 570019, 'USA', 1),
(8, 11, '770', 'mysore', 'karnataka', 570019, 'USA', 1),
(9, 12, '770', 'mysore', 'karnataka', 570019, 'USA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `Adm_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`Adm_id`, `user_id`, `name`, `dob`) VALUES
(1, 1, 'kiran', '1999-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `id` int(10) NOT NULL,
  `tx_no` varchar(20) NOT NULL,
  `tx_type` varchar(10) NOT NULL,
  `amount` double NOT NULL,
  `date` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `to_accno` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tdate` varchar(40) NOT NULL,
  `comments` varchar(200) NOT NULL,
  `do_verify` varchar(7) NOT NULL DEFAULT 'false',
  `user_id` int(11) NOT NULL,
  `adm_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `tx_no`, `tx_type`, `amount`, `date`, `description`, `to_accno`, `status`, `tdate`, `comments`, `do_verify`, `user_id`, `adm_id`) VALUES
(10, 'TX100000010', 'credit', 14, '2015-01-07 22:32:35', 'credit $14 from Account 12345566 on Jan-07-2015', '2133441212', 'SUCCESS', '', '', 'false', 0, 1),
(11, 'TX100000011', 'debit', 14, '2015-01-07 22:32:35', 'credit $14 to Account 2133441212 on Jan-07-2015', '1234556666', 'SUCCESS', '', '', 'false', 0, 1),
(12, 'TX100000012', 'credit', 10, '2015-01-08 22:35:38', 'Fund transfer of $10 from Account 1234556666 Reference# 0', '2133441212', 'SUCCESS', '', '', 'false', 0, 1),
(13, 'TX100000012', 'debit', 10, '2015-01-08 22:35:40', 'Fund transfer of $10 to Account 2133441212 Reference# 0', '1234556666', 'SUCCESS', '', '', 'false', 0, 1),
(14, 'TX100000013', 'credit', 200, '2015-01-09 22:20:26', 'Fund transfer of $200 to Account 2133441212 Reference# TX100000013', '2133441212', 'SUCCESS', '', '', 'false', 0, 1),
(15, 'TX100000014', 'credit', 22, '2015-01-10 15:18:30', 'Fund transfer of $22 to Account 1234556666 Reference# TX100000014', '1234556666', 'SUCCESS', '', '', 'false', 0, 1),
(16, 'TX100000015', 'debit', 2233, '2015-01-10 16:02:05', 'Fund transfer of $2233 to Account 1234556666 Reference# TX100000015', '1234556666', 'SUCCESS', '11-10-1981', 'hello', 'false', 0, 1),
(17, 'TX100000016', 'debit', 2000, '2015-01-10 16:08:41', 'Fund transfer of $2000 to Account 1234556666 Reference# TX100000016', '1234556666', 'SUCCESS', '11-10-1981', 'hello test..', 'false', 0, 1),
(18, 'TX100000017', 'credit', 25, '2015-01-19 22:43:54', 'Fund transfer of $25 from Account 1234556666 Reference# TX100000017', '1255050095', 'SUCCESS', '11-11-1981', 'college fees', 'false', 0, 1),
(19, 'TX100000017', 'debit', 25, '2015-01-19 22:43:54', 'Fund transfer of $25 to Account 1255050095 Reference# TX100000017', '1234556666', 'SUCCESS', '11-11-1981', 'college fees', 'false', 0, 1),
(20, 'TX100000018', 'credit', 20, '2015-01-22 21:45:57', 'Fund transfer of $20 from Account 1234556666 Reference# TX100000018', '1255050095', 'SUCCESS', '11-11-1981', 'float rx', 'false', 0, 1),
(21, 'TX100000018', 'debit', 20, '2015-01-22 21:45:57', 'Fund transfer of $20 to Account 1255050095 Reference# TX100000018', '1234556666', 'SUCCESS', '11-11-1981', 'float rx', 'false', 0, 1),
(22, 'TX100000019', 'credit', 20, '2015-01-22 21:47:19', 'Fund transfer of $20 from Account 1234556666 Reference# TX100000019', '1255050095', 'SUCCESS', '11-11-1981', 'hello', 'false', 0, 1),
(23, 'TX100000019', 'debit', 20, '2015-01-22 21:47:19', 'Fund transfer of $20 to Account 1255050095 Reference# TX100000019', '1234556666', 'SUCCESS', '11-11-1981', 'hello', 'false', 0, 1),
(24, 'TX100000020', 'credit', 22.1, '2015-01-22 22:01:49', 'Fund transfer of $22 from Account 1234556666 Reference# TX100000020', '1255050095', 'SUCCESS', '11-11-1981', 'sdsd', 'false', 0, 1),
(25, 'TX100000020', 'debit', 22.1, '2015-01-22 22:01:49', 'Fund transfer of $22 to Account 1255050095 Reference# TX100000020', '1234556666', 'SUCCESS', '11-11-1981', 'sdsd', 'false', 0, 1);

--
-- Triggers `tbl_transaction`
--
DELIMITER $$
CREATE TRIGGER `before_transaction_update` AFTER INSERT ON `tbl_transaction` FOR EACH ROW BEGIN
     IF  NEW.amount > 100000 THEN
		  update tbl_accounts set tbl_accounts.doVerify='true';
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `utype` varchar(10) NOT NULL,
  `pics` varchar(200) NOT NULL,
  `bdate` varchar(100) NOT NULL,
  `adm_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `fname`, `lname`, `pwd`, `email`, `phone`, `gender`, `is_active`, `utype`, `pics`, `bdate`, `adm_id`) VALUES
(4, 'tour', 'ready', '*1D72DAFB953E3606E84902DB8C521C98EC46266E', 'tourready@gmail.com', '(111) 111-1111', 'Male', 'TRUE', 'USER', 'ef4b35d6b8d1f77af51ac19bee353fe3.jpg', '2015-01-03 00:53:05', 1),
(6, 'Scott', 'Pettyjohn', '*1C1E6B5A51B9D84E47430BEB37AD123D1A22C000', 'scott@gmail.com', '(222) 222-1342', 'Male', 'FALSE', 'USER', '8725c768c4af943069ea10609890eaf4.jpg', '2015-01-03 16:35:37', 1),
(7, 'may', 'june', '*1D72DAFB953E3606E84902DB8C521C98EC46266E', 'mayjune@gmail.com', '(222) 212-1212', 'Male', 'TRUE', 'USER', 'c8893dabeaf3d6a9d52aa28063e1c5c5.jpg', '2015-01-19 22:32:55', 1),
(10, 'none', 'jose', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', 'suhasy1811@gmail.com', '76765-74844', 'Male', 'FALSE', 'USER', '74692fcd61d2400e3a81af7bc55d217c.jpg', '2019-11-19 15:29:04', 1),
(11, 'josa', 'mosa', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', 'suhasy1811@gmail.com', '76765-74844', 'Male', 'TRUE', 'USER', '21288a43150c6775364271d04eef3e7a.jpg', '2019-11-19 15:50:15', 1),
(12, 'suhas', 'Y', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', 'suhasy1811@gmail.com', '7676574844', 'Male', 'FALSE', 'USER', '461f8444f2ec2ed59b48934cf85bed42.png', '2019-11-21 10:26:05', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`Adm_id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adm_id` (`adm_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adm_id` (`adm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `Adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD CONSTRAINT `tbl_accounts_ibfk_1` FOREIGN KEY (`adm_id`) REFERENCES `tbl_admin` (`Adm_id`);

--
-- Constraints for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD CONSTRAINT `tbl_address_ibfk_1` FOREIGN KEY (`adm_id`) REFERENCES `tbl_admin` (`Adm_id`);

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `tbl_transaction_ibfk_1` FOREIGN KEY (`adm_id`) REFERENCES `tbl_admin` (`Adm_id`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`adm_id`) REFERENCES `tbl_admin` (`Adm_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
