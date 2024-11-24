
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `reserv_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` text NOT NULL,
  `l_name` text NOT NULL,
  `num_guests` int(11) NOT NULL,
  `num_tables` int(11) NOT NULL,
  `rdate` date NOT NULL,
  `time_zone` text NOT NULL,
  `telephone` text NOT NULL,
  `comment` mediumtext NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_fk` int(11) NOT NULL,
  PRIMARY KEY (`reserv_id`),
  KEY `users_fk` (`user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reserv_id`, `f_name`, `l_name`, `num_guests`, `num_tables`, `rdate`, `time_zone`, `telephone`, `comment`, `reg_date`, `user_fk`) VALUES
(62, 'Bill', 'Fotos', 10, 4, '2024-02-30', '12:00 - 16:00', '21096321232', 'fsdfsd', '2024-02-04 23:38:47', 28),
(64, 'Bill', 'Foto', 6, 2, '2024-02-20', '12:00 - 16:00', '1321312', 'fdsfsd', '2024-02-04 23:43:58', 28),
(71, 'Bill', 'Fotos', 10, 4, '2024-02-14', '12:00 - 16:00', '2129632123', 'fsfsd', '2024-02-05 00:51:50', 28),
(72, 'Bill', 'Foto', 10, 4, '2024-02-15', '16:00 - 20:00', '2109632123', 'fsfsfsd', '2024-02-05 00:52:09', 28),
(73, 'Bill', 'dsadsadas', 30, 14, '2024-02-22', '12:00 - 16:00', '2109632123', 'dsadsadas', '2024-02-05 00:52:39', 28),
(74, 'Bill', 'Fotos', 6, 2, '2024-02-10', '12:00 - 16:00', '2129632123', '312312312', '2024-02-05 00:54:08', 28),
(75, 'Bill', 'Fotos', 6, 2, '2024-02-10', '16:00 - 20:00', '2109632123', '', '2024-02-05 00:54:40', 28),
(76, 'Bill', 'Fotos', 1, 1, '2024-02-24', '12:00 - 16:00', '2109632123', 'sfsdfsd', '2024-02-06 23:28:11', 28);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(5) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `open_time` time NOT NULL DEFAULT '12:00:00',
  `close_time` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `date`, `open_time`, `close_time`) VALUES
(6, '2024-02-15', '03:11:00', '11:11:00'),
(7, '2024-02-16', '01:00:00', '01:00:00'),
(8, '2024-02-18', '02:01:00', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `tables_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_date` date NOT NULL,
  `t_tables` int(11) NOT NULL,
  PRIMARY KEY (`tables_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`tables_id`, `t_date`, `t_tables`) VALUES
(6, '2024-02-17', 5),
(7, '2024-02-15', 10),
(8, '2024-02-10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `uidUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `uidUsers`, `emailUsers`, `pwdUsers`, `reg_date`, `role_id`) VALUES
(1, 'kappa', 'kapa@in.com', '$2y$10$AXUubKPLqRUX1DeorQ3AGOsBey7oaSNPF892EUR96unf..h25rsYq', '2024-01-01 19:51:07', 1),
(2, 'kappa1', 'ka11pa@in.com', '$2y$10$/VK5CmjZavvC4gdv3WFk5u.Th5luQTfpzigiYPSryoVdULSE57A.a', '2024-01-01 20:18:57', 1),
(3, 'kappa2', 'kappa2@hotmail.com', '$2y$10$jfiG7gFvyQo..Cx1ZwktaOcs.83Zhsn0fkvq.9CvQCRA4Ognb/cBK', '2024-01-01 20:46:20', 2),
(4, 'ddsa', 'kapa@in.comq', '$2y$10$sH8sr2sI//qD5bg/D/sGeuDYb3COyUEwvNCKTLBfWUitVi2s/Z0ZG', '2024-01-05 00:25:37', 1));

ALTER TABLE `reservation`
  ADD CONSTRAINT `idusers` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`);


ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE NO ACTION;
COMMIT;
