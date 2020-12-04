-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2020 at 06:22 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab_automation`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_Id` int(11) NOT NULL,
  `p_Name` varchar(50) NOT NULL,
  `p_Image` varchar(50) NOT NULL,
  `p_Details` varchar(100) NOT NULL,
  `c_Id_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_Id`, `p_Name`, `p_Image`, `p_Details`, `c_Id_FK`) VALUES
(5, 'Connector-B', 'conn.jpg', 'This is a b-type connector<br>', 4),
(6, 'Wire-B', 'conn.jpg', 'This is a  b-type wire.', 3),
(7, 'Circuit-V', 'conn.jpg', 'This is a  v-type circuit.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_catagory`
--

CREATE TABLE `products_catagory` (
  `cat_Id` int(11) NOT NULL,
  `cat_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_catagory`
--

INSERT INTO `products_catagory` (`cat_Id`, `cat_Name`) VALUES
(1, 'Electrical Box'),
(2, 'Circuit Breakers'),
(3, 'Electrical Wire'),
(4, 'Electrical Connectors'),
(5, 'Electrical Devices'),
(6, 'Regulators');

-- --------------------------------------------------------

--
-- Table structure for table `product_batch`
--

CREATE TABLE `product_batch` (
  `b_Id` int(11) NOT NULL,
  `b_name` varchar(50) NOT NULL,
  `prd_Id_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_batch`
--

INSERT INTO `product_batch` (`b_Id`, `b_name`, `prd_Id_FK`) VALUES
(1, 'CB101', 5),
(2, 'CB102', 5),
(3, 'CB103', 5),
(4, 'CB104', 5),
(5, 'CB105', 5),
(6, 'WB101', 6),
(7, 'WB102', 6),
(8, 'WB103', 6),
(9, 'WB104', 6),
(10, 'WB105', 6),
(11, 'CV101', 7),
(12, 'CV102', 7),
(13, 'CV103', 7),
(14, 'CV104', 7),
(15, 'CV105', 7);

-- --------------------------------------------------------

--
-- Table structure for table `testing_type`
--

CREATE TABLE `testing_type` (
  `testing_Id` int(11) NOT NULL,
  `testing_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testing_type`
--

INSERT INTO `testing_type` (`testing_Id`, `testing_type`) VALUES
(1, 'Portable Appliances Testing'),
(2, 'RCD Testing'),
(3, 'Wiring continuity test'),
(4, ' Insulation resistance test'),
(7, 'Performance Test');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_Id` int(11) NOT NULL,
  `p_id_FK` int(11) NOT NULL,
  `b_id_FK` int(11) NOT NULL,
  `testing_Id_FK` int(11) NOT NULL,
  `u_Id_FK` int(11) NOT NULL,
  `t_Date` date NOT NULL,
  `t_Result` varchar(30) NOT NULL,
  `t_attempt` int(11) NOT NULL,
  `Remarks` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_Id`, `p_id_FK`, `b_id_FK`, `testing_Id_FK`, `u_Id_FK`, `t_Date`, `t_Result`, `t_attempt`, `Remarks`) VALUES
(10, 5, 4, 1, 1, '2020-11-20', 'Pass', 1, 'Good'),
(17, 5, 2, 3, 1, '2020-10-12', 'Fail', 1, 'Bad'),
(18, 5, 2, 2, 1, '2019-12-29', 'Pass', 1, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_Id` int(11) NOT NULL,
  `u_Name` varchar(30) NOT NULL,
  `u_pass` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_Id`, `u_Name`, `u_pass`) VALUES
(1, 'admin', 'admin123'),
(2, 'tester', 'tester123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_Id`),
  ADD KEY `fk_cat` (`c_Id_FK`);

--
-- Indexes for table `products_catagory`
--
ALTER TABLE `products_catagory`
  ADD PRIMARY KEY (`cat_Id`);

--
-- Indexes for table `product_batch`
--
ALTER TABLE `product_batch`
  ADD PRIMARY KEY (`b_Id`),
  ADD KEY `cat_Id_FK` (`prd_Id_FK`);

--
-- Indexes for table `testing_type`
--
ALTER TABLE `testing_type`
  ADD PRIMARY KEY (`testing_Id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_Id`),
  ADD KEY `p_id_FK` (`p_id_FK`,`b_id_FK`,`testing_Id_FK`),
  ADD KEY `u_Id_FK` (`u_Id_FK`),
  ADD KEY `b_id_FK` (`b_id_FK`),
  ADD KEY `testing_Id_FK` (`testing_Id_FK`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products_catagory`
--
ALTER TABLE `products_catagory`
  MODIFY `cat_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_batch`
--
ALTER TABLE `product_batch`
  MODIFY `b_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `testing_type`
--
ALTER TABLE `testing_type`
  MODIFY `testing_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`p_id_FK`) REFERENCES `products` (`p_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_2` FOREIGN KEY (`b_id_FK`) REFERENCES `product_batch` (`b_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_3` FOREIGN KEY (`testing_Id_FK`) REFERENCES `testing_type` (`testing_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_4` FOREIGN KEY (`u_Id_FK`) REFERENCES `users` (`u_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
