-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 08:14 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contract_client_manytomany`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `client_num` int(3) DEFAULT NULL,
  `client_fname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `client_lname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `client_initial` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `client_address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `client_contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `client_num`, `client_fname`, `client_lname`, `client_initial`, `client_address`, `client_contact`) VALUES
(1, 1, 'Fredric', 'Fernando', 'X.', '#8273 Rurivilla St. Brgy. Eccental, Taguig City', 8212436),
(2, 2, 'Cecilla', 'Miranda', 'S.', '#4435 Versailles St. Brgy. Revilla, Pasig City', 7760705);

-- --------------------------------------------------------

--
-- Table structure for table `client_has_contract`
--

CREATE TABLE `client_has_contract` (
  `id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client_has_contract`
--

INSERT INTO `client_has_contract` (`id`, `contract_id`, `client_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `con_signed` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `con_date` timestamp(6) NULL DEFAULT NULL,
  `con_expiration` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`id`, `con_signed`, `con_date`, `con_expiration`) VALUES
(1, '1', '2019-11-04 16:00:00.000000', '2020-04-08 16:00:00.000000'),
(2, '2', '2019-11-04 16:00:00.000000', '2020-06-08 16:00:00.000000');

-- --------------------------------------------------------

--
-- Stand-in structure for view `contract_client_v`
-- (See below for the actual view)
--
CREATE TABLE `contract_client_v` (
`client_table_id` int(11)
,`clienthas_table_id` int(11)
,`contract_table_id` int(11)
,`contract_id` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `contract_client_v`
--
DROP TABLE IF EXISTS `contract_client_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `contract_client_v`  AS  select `client`.`id` AS `client_table_id`,`client_has_contract`.`contract_id` AS `clienthas_table_id`,`contract`.`id` AS `contract_table_id`,`client_has_contract`.`contract_id` AS `contract_id` from ((`client` join `client_has_contract` on((`client`.`id` = `client_has_contract`.`client_id`))) join `contract` on((`contract`.`id` = `client_has_contract`.`contract_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_num_UNIQUE` (`client_num`);

--
-- Indexes for table `client_has_contract`
--
ALTER TABLE `client_has_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_client_has_contract_contract1_idx` (`contract_id`),
  ADD KEY `fk_client_has_contract_client1_idx` (`client_id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `con_signed_UNIQUE` (`con_signed`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_has_contract`
--
ALTER TABLE `client_has_contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_has_contract`
--
ALTER TABLE `client_has_contract`
  ADD CONSTRAINT `fk_client_has_contract_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_has_contract_contract1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
