-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2021 at 11:44 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `encrypted_msg` VARBINARY(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

-- Function to encrypt messages
DELIMITER //
CREATE FUNCTION EncryptMessage(msg VARCHAR(1000), DeviLDont$ethef1reDame1t VARCHAR(255))
RETURNS VARBINARY(2000)
DETERMINISTIC
BEGIN
    RETURN AES_ENCRYPT(msg, DeviLDont$ethef1reDame1t);
END //
DELIMITER ;

-- Function to decrypt messages
DELIMITER //
CREATE FUNCTION DecryptMessage(encrypted_msg VARBINARY(2000), DeviLDont$ethef1reDame1t VARCHAR(255))
RETURNS VARCHAR(1000)
DETERMINISTIC
BEGIN
    RETURN AES_DECRYPT(encrypted_msg, DeviLDont$ethef1reDame1t);
END //
DELIMITER ;

-- Insert a new message with encryption
INSERT INTO `messages` (`incoming_msg_id`, `outgoing_msg_id`, `encrypted_msg`)
VALUES (1, 2, EncryptMessage('This is a secret message', 'DeviLDont$ethef1reDame1t'));

-- Retrieve and decrypt messages
SELECT incoming_msg_id, outgoing_msg_id, AES_DECRYPT(`encrypted_msg`, 'DeviLDont$ethef1reDame1t') AS decrypted_msg
FROM `messages`;
