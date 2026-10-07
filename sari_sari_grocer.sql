-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2026 at 09:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sari_sari_grocer`
--

-- --------------------------------------------------------

--
-- Table structure for table `archives`
--

CREATE TABLE `archives` (
  `archive_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archives`
--

INSERT INTO `archives` (`archive_id`, `reservation_id`, `reason`, `archived_at`) VALUES
(6, 3, 'Cancelled by customer', '2026-10-05 02:34:26'),
(7, 6, 'Cancelled by customer', '2026-10-05 03:47:17'),
(10, 10, 'Cancelled by customer', '2026-10-05 13:32:00'),
(11, 7, 'Cancelled by customer', '2026-10-05 13:34:52'),
(12, 2, 'Removed by seller', '2026-10-06 06:45:47'),
(13, 5, 'Removed by seller', '2026-10-06 06:48:14'),
(14, 4, 'Removed by seller', '2026-10-06 07:53:03'),
(16, 14, 'Removed by seller', '2026-10-07 07:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `description`, `status`, `created_at`) VALUES
(1, 'Lumpia wrapper', NULL, 'active', '2026-10-02 07:34:14'),
(2, 'Patatasan', NULL, 'active', '2026-10-02 07:34:14'),
(3, 'Tawgi', NULL, 'active', '2026-10-02 07:34:14'),
(4, 'Pakbit', NULL, 'active', '2026-10-02 07:34:14'),
(5, 'Sari Sari', NULL, 'active', '2026-10-02 07:34:14'),
(6, 'Pinansitan', NULL, 'active', '2026-10-02 07:34:14'),
(7, 'Carrots', NULL, 'active', '2026-10-04 07:13:37'),
(8, 'gabbage', NULL, 'active', '2026-10-07 04:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `item_variants`
--

CREATE TABLE `item_variants` (
  `variant_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `variant_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_variants`
--

INSERT INTO `item_variants` (`variant_id`, `item_id`, `variant_name`, `price`, `status`, `created_at`) VALUES
(1, 1, 'Small', 27.00, 'active', '2026-10-02 09:22:07'),
(2, 1, 'Large', 37.00, 'active', '2026-10-02 09:22:07'),
(3, 2, 'Regular', 40.00, 'active', '2026-10-02 09:22:07'),
(4, 3, 'Regular', 20.00, 'active', '2026-10-02 09:22:07'),
(5, 4, 'Regular', 30.00, 'active', '2026-10-02 09:22:07'),
(6, 5, 'Regular', 30.00, 'active', '2026-10-02 09:22:07'),
(7, 6, 'Regular', 25.00, 'active', '2026-10-02 09:22:07'),
(8, 7, 'Regular', 23.00, 'active', '2026-10-04 07:13:37'),
(9, 8, 'Regular', 23.00, 'active', '2026-10-07 04:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `payment_method` varchar(30) NOT NULL DEFAULT 'GCash',
  `reference_number` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(30) NOT NULL DEFAULT 'PENDING',
  `paid_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `reservation_id`, `payment_method`, `reference_number`, `amount`, `payment_status`, `paid_at`) VALUES
(1, 5, 'GCash', 'swef2939848432', 26.00, 'VERIFIED', '2026-10-04 14:35:53'),
(2, 8, 'GCash', 'weqw1221', 25.00, 'VERIFIED', '2026-10-06 07:52:45'),
(3, 9, 'GCash', 'asdqw222', 84.00, 'VERIFIED', '2026-10-07 04:44:01'),
(4, 10, 'GCash', '0sw1223', 71.50, 'PENDING', NULL),
(5, 11, 'GCash', 'qwqd121', 78.50, 'VERIFIED', '2026-10-05 13:27:33'),
(6, 12, 'GCash', 'dfger11111', 25.00, 'VERIFIED', '2026-10-07 06:43:07'),
(7, 13, 'GCash', 'sadsc234d', 23.00, 'PENDING', NULL),
(8, 14, 'GCash', 'ambot kong naa', 88.50, 'PENDING', NULL),
(9, 15, 'GCash', 'sdsefwe234', 67.00, 'VERIFIED', '2026-10-07 07:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `reservation_date` date NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'PAYMENT PENDING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `user_id`, `order_date`, `reservation_date`, `status`, `created_at`) VALUES
(2, 8, '2026-10-04', '2026-10-06', 'ARCHIVED', '2026-10-04 11:58:23'),
(3, 8, '2026-10-04', '2026-11-11', 'CANCELLED', '2026-10-04 13:06:09'),
(4, 8, '2026-10-04', '2026-12-12', 'ARCHIVED', '2026-10-04 13:18:35'),
(5, 8, '2026-10-04', '2026-10-14', 'ARCHIVED', '2026-10-04 14:15:50'),
(6, 8, '2026-10-05', '2026-10-14', 'CANCELLED', '2026-10-05 01:39:21'),
(7, 8, '2026-10-05', '2026-12-20', 'CANCELLED', '2026-10-05 01:45:31'),
(8, 8, '2026-10-05', '2026-11-04', 'CLAIMED', '2026-10-05 02:17:07'),
(9, 8, '2026-10-05', '2026-12-25', 'CLAIMED', '2026-10-05 04:49:03'),
(10, 8, '2026-10-05', '2026-11-01', 'CANCELLED', '2026-10-05 11:30:26'),
(11, 8, '2026-10-05', '2026-12-01', 'PAYMENT VERIFIED', '2026-10-05 11:43:51'),
(12, 8, '2026-10-06', '2026-10-23', 'PAYMENT VERIFIED', '2026-10-06 06:09:17'),
(13, 8, '2026-10-07', '2026-11-12', 'PAYMENT PENDING', '2026-10-07 06:29:30'),
(14, 10, '2026-10-07', '2027-04-11', 'ARCHIVED', '2026-10-07 06:35:05'),
(15, 12, '2026-10-07', '2026-12-12', 'CLAIMED', '2026-10-07 07:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_items`
--

CREATE TABLE `reservation_items` (
  `reservation_item_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_items`
--

INSERT INTO `reservation_items` (`reservation_item_id`, `reservation_id`, `variant_id`, `quantity`, `unit_price`, `subtotal`) VALUES
(1, 4, 4, 1, 20.00, 20.00),
(2, 4, 3, 1, 40.00, 40.00),
(3, 5, 7, 1, 25.00, 25.00),
(4, 5, 1, 1, 27.00, 27.00),
(5, 6, 8, 1, 23.00, 23.00),
(6, 7, 8, 2, 23.00, 46.00),
(7, 8, 1, 1, 27.00, 27.00),
(8, 8, 8, 1, 23.00, 23.00),
(9, 9, 4, 1, 20.00, 20.00),
(10, 9, 5, 1, 30.00, 30.00),
(11, 9, 7, 1, 25.00, 25.00),
(12, 9, 6, 1, 30.00, 30.00),
(13, 9, 8, 1, 23.00, 23.00),
(14, 9, 3, 1, 40.00, 40.00),
(15, 10, 8, 1, 23.00, 23.00),
(16, 10, 6, 1, 30.00, 30.00),
(17, 10, 6, 1, 30.00, 30.00),
(18, 10, 6, 1, 30.00, 30.00),
(19, 10, 6, 1, 30.00, 30.00),
(20, 11, 6, 1, 30.00, 30.00),
(21, 11, 5, 1, 30.00, 30.00),
(22, 11, 4, 1, 20.00, 20.00),
(23, 11, 2, 1, 37.00, 37.00),
(24, 11, 3, 1, 40.00, 40.00),
(25, 12, 7, 1, 25.00, 25.00),
(26, 12, 7, 1, 25.00, 25.00),
(27, 13, 8, 2, 23.00, 46.00),
(28, 14, 7, 1, 25.00, 25.00),
(29, 14, 5, 2, 30.00, 60.00),
(30, 14, 8, 4, 23.00, 92.00),
(31, 15, 1, 2, 27.00, 54.00),
(32, 15, 3, 2, 40.00, 80.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `contact`, `email`, `address`, `username`, `password`, `role`, `status`, `created_at`) VALUES
(8, 'chris adrian', 'gianan', '09105101210', 'chrisadriangianan@gmail.com', 'baikingon', 'Veil', '1234', 'USER', 'active', '2026-10-01 14:04:25'),
(10, 'Howard Dwaine', 'Cabugatan', '09972439948', 'cabugatanhoward', 'centro camaman-an', 'Khonshuu', '1234', 'USER', 'active', '2026-10-07 00:56:25'),
(12, 'Yanbel', 'Neri', '09191912812', 'YanbelNeri@gmail.com', 'iponan', 'Yanbel', '1234', 'USER', 'active', '2026-10-07 07:22:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archives`
--
ALTER TABLE `archives`
  ADD PRIMARY KEY (`archive_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_name` (`item_name`);

--
-- Indexes for table `item_variants`
--
ALTER TABLE `item_variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reservation_items`
--
ALTER TABLE `reservation_items`
  ADD PRIMARY KEY (`reservation_item_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archives`
--
ALTER TABLE `archives`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_variants`
--
ALTER TABLE `item_variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reservation_items`
--
ALTER TABLE `reservation_items`
  MODIFY `reservation_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archives`
--
ALTER TABLE `archives`
  ADD CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `item_variants`
--
ALTER TABLE `item_variants`
  ADD CONSTRAINT `item_variants_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reservation_items`
--
ALTER TABLE `reservation_items`
  ADD CONSTRAINT `reservation_items_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  ADD CONSTRAINT `reservation_items_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `item_variants` (`variant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
