-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2022 at 07:37 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` varchar(20) NOT NULL,
  `staffName` varchar(20) NOT NULL,
  `productLine` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffName`, `productLine`, `gender`) VALUES
('21', 'Fred', 'longterm', 'male'),
('22', 'Joshua', 'longterm', 'male'),
('23', 'Olga', 'longterm', 'female'),
('24', 'Leo', 'midterm', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` bigint(20) NOT NULL,
  `added_date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `added_date`, `email`, `password`, `name`) VALUES
(1, '0000-00-00 00:00:00', 'i5beverage@gmail.com', 'admin', 'i5beverage');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `id` bigint(20) NOT NULL,
  `discount_price` varchar(200) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` varchar(200) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `category` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `added_date` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `pin_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`id`, `address`, `added_date`, `email`, `gender`, `name`, `password`, `phone`, `pin_code`) VALUES
(1, 'Kikoni', '2022-08-08 21:11:01', 'dropix@gmail.com', 'Male', 'Dropper', 'drop', '0678465767', '3333'),
(2, 'KASUUBI', '2022-08-09 16:31:59', 'olga@gmail.com', 'Female', 'Olga', 'olga', '0784536476', '1880'),
(3, 'Muyenga', '2022-08-09 20:09:54', 'joshua@gmail.com', 'Male', 'Joshua', 'joshua', '0776043878', '7890'),
(4, 'Kamuli', '2022-08-09 20:13:13', 'muzuva@gmail.com', 'Male', 'Muzuva', 'muzuva', '0778967890', '8765'),
(5, 'bweyogerere', '2022-08-10 12:23:15', 'rujumbaleonard@gmail.com', 'Male', 'Rujumba', '1234', '0708707723', '4567');

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `id` int(11) NOT NULL,
  `order_no` int(11) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `mobile_number` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `address_type` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `product_name` varchar(400) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_price` varchar(100) DEFAULT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `payment_mode` varchar(100) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `category` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`id`, `order_no`, `customer_name`, `mobile_number`, `email_id`, `address`, `address_type`, `pincode`, `image`, `product_name`, `quantity`, `product_price`, `order_status`, `order_date`, `payment_mode`, `payment_id`, `category`) VALUES
(9, 1001, 'Joshua', '0776043878', 'joshua@gmail.com', 'Muyenga', 'Commercial', '7890', 'beer.jpg', 'Beer', 1, '3500', 'Deliver', '2022-08-10 11:18:45', 'Debit Card', 1, 'midterm'),
(10, 1002, 'Joshua', '0776043878', 'joshua@gmail.com', 'Muyenga', 'Commercial', '7890', 'wine.jpg', 'wine', 1, '3500', 'Deliver', '2022-08-10 11:18:45', 'Debit Card', 1, 'longterm'),
(11, 2003, 'Rujumba', '0708707723', 'rujumbaleonard@gmail.com', 'bweyogerere', 'Office', '4567', 'soda.jpg', 'soda', 1, '3500.0', 'Deliver', '2022-08-10 12:31:48', 'Credit Card', 2, 'midterm'),
(12, 2004, 'Rujumba', '0708707723', 'rujumbaleonard@gmail.com', 'bweyogerere', 'Office', '4567', 'water.jpg', 'Water', 2, '7000.0', 'Pending', '2022-08-10 12:31:48', 'Credit Card', 2, 'shortterm'),
(13, 2005, 'Rujumba', '0708707723', 'rujumbaleonard@gmail.com', 'bweyogerere', 'Office', '4567', 'water.jpg', 'Water', 2, '7000.0', 'Pending', '2022-08-10 12:31:49', 'Credit Card', 2, 'shortterm'),
(14, 3006, 'Joshua', '0776043878', 'joshua@gmail.com', 'Muyenga', 'Office', '7890', 'water.jpg', 'Water', 1, '3500', 'Pending', '2022-08-10 17:00:58', 'Debit Card', 3, 'shortterm');

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `id` bigint(20) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `product_category` varchar(100) DEFAULT NULL,
  `likestatus` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`id`, `code`, `create_date`, `image`, `name`, `price`, `product_category`, `likestatus`, `quantity`) VALUES
(1, 'XGZ', '2022-08-09 14:45:58', 'beer.jpg', 'Beer', '3500', 'midterm', 2, 60),
(3, 'W3I', '2022-08-09 14:45:58', 'soda.jpg', 'soda', '3500', 'midterm', 2, 60),
(4, 'TMJ', '2022-08-09 14:45:58', 'water.jpg', 'Water', '3500', 'shortterm', 3, 300),
(5, 'E3C', '2022-08-09 14:45:58', 'wine.jpg', 'wine', '3500', 'longterm', 3, 30),
(6, 'Z54', '2022-08-09 14:50:36', 'wine.jpg', 'wine', '1500', 'longterm', 0, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
