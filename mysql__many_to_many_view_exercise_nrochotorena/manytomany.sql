-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 07:47 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manytomany`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_num` int(11) DEFAULT NULL,
  `emp_fname` varchar(50) DEFAULT NULL,
  `emp_lname` varchar(50) DEFAULT NULL,
  `emp_initial` varchar(50) DEFAULT NULL,
  `emp_address` varchar(50) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_num`, `emp_fname`, `emp_lname`, `emp_initial`, `emp_address`, `emp_dob`) VALUES
(1, 2019000, 'Alex', 'Batara', 'A', 'Taguig City', '1988-04-25'),
(2, 2019001, 'Bianca', 'Yao', 'B', 'Pasay City', '1990-01-09'),
(3, 2019002, 'Christian', 'Go', 'C', 'Makati City', '1994-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `trai_num` int(3) DEFAULT NULL,
  `trai_location` varchar(50) DEFAULT NULL,
  `trai_num_employ` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `trai_num`, `trai_location`, `trai_num_employ`) VALUES
(1, 219000, 'Taguig City', 2019000),
(2, 219001, 'Pasay City', 2019001),
(3, 219002, 'Makati City', 2019002);

-- --------------------------------------------------------

--
-- Table structure for table `training_employee`
--

CREATE TABLE `training_employee` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `training_employee`
--

INSERT INTO `training_employee` (`id`, `employee_id`, `training_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `training_employee_view`
-- (See below for the actual view)
--
CREATE TABLE `training_employee_view` (
`employee_table_id` int(11)
,`employee_id` int(11)
,`training_table_id` int(11)
,`training_id` int(11)
,`training_employee_table_id` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `training_employee_view`
--
DROP TABLE IF EXISTS `training_employee_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `training_employee_view`  AS  select `employee`.`id` AS `employee_table_id`,`training_employee`.`employee_id` AS `employee_id`,`training`.`id` AS `training_table_id`,`training_employee`.`training_id` AS `training_id`,`training_employee`.`id` AS `training_employee_table_id` from ((`employee` join `training_employee` on(`employee`.`id` = `training_employee`.`employee_id`)) join `training` on(`training`.`id` = `training_employee`.`training_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_num_UNIQUE` (`emp_num`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trai_num_UNIQUE` (`trai_num`),
  ADD UNIQUE KEY `trai_num_employ_UNIQUE` (`trai_num_employ`);

--
-- Indexes for table `training_employee`
--
ALTER TABLE `training_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_training_employee_employee_idx` (`employee_id`),
  ADD KEY `fk_training_employee_training1_idx` (`training_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training_employee`
--
ALTER TABLE `training_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `training_employee`
--
ALTER TABLE `training_employee`
  ADD CONSTRAINT `fk_training_employee_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_training_employee_training1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
