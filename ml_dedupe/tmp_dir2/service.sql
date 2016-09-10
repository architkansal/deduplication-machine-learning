-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 27, 2016 at 08:29 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `service`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('beecc56fb03c58f8e0539c33b2c8f68e', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 1471150237, ''),
('e78de2ca5b19a3cf640a67b52083d12c', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1472271107, '');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `cid` bigint(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hcdid` int(6) NOT NULL,
  `preftime` varchar(10) DEFAULT NULL,
  `room` varchar(6) NOT NULL,
  `hostel` varchar(20) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `tag_id` int(5) NOT NULL,
  `details` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`cid`, `user_id`, `date`, `hcdid`, `preftime`, `room`, `hostel`, `mobile`, `status`, `tag_id`, `details`) VALUES
(77, 10, '2016-02-06 17:58:28', 11, '23:11', '111111', '1111', 11111111111111, 1, 11003, '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111dflkjhs dljakgh ejlahg erlkq klerq erkl erqkygj '),
(78, 10, '2016-02-06 18:01:49', 22, '11:11', '111111', '11111', 1111111111111, 0, 22001, '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'),
(79, 10, '2016-02-08 16:20:45', 11, '07:09', 'tyej', 'jt', 89089, 1, 11002, 'tey'),
(80, 10, '2016-02-08 16:32:37', 11, '03:44', 'rjhw', 'htw', 89089, 1, 11002, 'ryj'),
(81, 10, '2016-02-08 16:32:58', 11, '16:45', 'weh', 'fj', 9908324532, 1, 11001, 'h tnwsssnveyk4weg '),
(82, 10, '2016-02-08 16:57:37', 22, '16:54', '111111', 'asdfgh', 9908324532, 0, 22001, 'dgubhuy '),
(83, 10, '2016-02-10 17:43:13', 11, '05:06', 'jh', 'jh', 9908324532, 2, 11002, 'rfkj'),
(84, 10, '2016-02-12 13:14:22', 44, '18:45', '8 3 1 ', '8th Block', 9908324532, 0, 44003, 'the glass is broken !!!!!!!! '),
(85, 10, '2016-02-15 12:27:55', 11, '16:05', '111111', '8th Block', 9908324532, 0, 11001, 'assssss d'),
(86, 10, '2016-04-01 17:08:51', 11, '19:08', 'jhyf', 'iug', 9876, 0, 11001, 'm,njbkghyj');

-- --------------------------------------------------------

--
-- Table structure for table `cupdates`
--

CREATE TABLE `cupdates` (
  `cid` bigint(10) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_details` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cupdates`
--

INSERT INTO `cupdates` (`cid`, `time_stamp`, `ts_details`) VALUES
(83, '2016-02-21 14:22:44', 'The complaint is updated as postponed'),
(83, '2016-02-21 14:22:44', 'The complaint is updated as postponed'),
(83, '2016-02-21 14:23:54', 'The complaint is updated as postponed'),
(83, '2016-02-21 14:23:54', 'The complaint is updated as postponed'),
(79, '2016-03-20 12:44:07', 'The complaint is updated as postponed'),
(79, '2016-03-20 12:44:07', 'The complaint is updated as postponed'),
(79, '2016-03-20 12:44:16', 'The complaint is updated as resolved'),
(79, '2016-03-20 12:44:16', 'The complaint is updated as resolved'),
(79, '2016-03-20 12:44:16', 'The complaint is updated as resolved'),
(81, '2016-04-01 17:03:55', 'The complaint is updated as false'),
(81, '2016-08-14 04:50:33', 'The complaint is updated as resolved'),
(81, '2016-08-14 04:50:33', 'The complaint is updated as resolved'),
(81, '2016-08-14 04:50:33', 'The complaint is updated as resolved');

-- --------------------------------------------------------

--
-- Table structure for table `grievances`
--

CREATE TABLE `grievances` (
  `gid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hostel` varchar(30) NOT NULL,
  `floor` varchar(50) NOT NULL,
  `tag` varchar(30) NOT NULL,
  `details` varchar(500) NOT NULL,
  `upvotes` int(10) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grievances`
--

INSERT INTO `grievances` (`gid`, `user_id`, `hostel`, `floor`, `tag`, `details`, `upvotes`, `status`, `name`, `path`) VALUES
(26, 10, 'Ultra mega', '0', 'Lift not working', 'mfgn suhf', 2, 0, NULL, NULL),
(27, 10, 'Ultra mega', '0', 'Lift not working', 'mfgn suhfbvmj drthrdsbh', 3, 0, 'images1.jpg', '/opt/lampp/htdocs/SAG-portal-nitw/uploads/images1.jpg'),
(28, 0, '4th block', '3', 'Mosquitoes', 'there are a kot of mosquitoes now a days and jjjhdsf kdsh dhf dsb gfsd kghe gkg khgf agmhgf 3246 546981 kr kfhfr hgfrkh gfgfjg ghg ggf hliyotu khgrb 86508570 gejhgit etmhetiwtn thh hjyrhrh rhtk trhe j', 2, 0, 'images2.jpg', '/opt/lampp/htdocs/SAG-portal-nitw/uploads/images2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hdepartment`
--

CREATE TABLE `hdepartment` (
  `hcdid` int(6) NOT NULL,
  `dname` varchar(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tag_info`
--

CREATE TABLE `tag_info` (
  `tag_id` int(5) NOT NULL,
  `tag_desc` varchar(30) NOT NULL,
  `tag_count` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upvote`
--

CREATE TABLE `upvote` (
  `gid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upvote`
--

INSERT INTO `upvote` (`gid`, `user_id`) VALUES
(26, 10),
(27, 10),
(28, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10),
(26, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `contact` varchar(15) COLLATE utf8_bin NOT NULL,
  `user_group_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`, `name`, `contact`, `user_group_id`) VALUES
(5, 'architkansal', '$P$BoeZeGt5i6ri/heFUfnq9cmPg5PpMt.', 'karchit@student.nitw.ac.in', 1, 0, NULL, NULL, NULL, NULL, 'ad116a1859d1bdac8db34b44bd030f5e', '127.0.0.1', '2016-08-14 06:50:13', '2016-01-22 16:02:32', '2016-08-14 04:50:13', '', '0', 1),
(10, 'prasad', '$P$BEnlRzZyrUNZATwNcT01/oeroq1jaf.', 'patilprasad263@gmail.com', 1, 0, NULL, NULL, NULL, NULL, '9e173f4aed7b6557c18e1641ff828cd3', '127.0.0.1', '2016-08-14 06:48:10', '2016-01-22 16:32:46', '2016-08-14 04:48:10', 'Prasad Patil', '0', 0),
(11, 'manju', '$P$B/PuvsfQ7gWZPO7pqHwPd2hvTM1vIa1', 'smanjunathg@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-24 10:32:20', '2016-01-24 09:32:20', '', '0', 0),
(22, '8142344', '$P$BnP77Wt8ik882b4hVo6j1nQ/rFXnnu/', 'arch@gamil.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-24 15:05:08', '2016-01-24 14:05:08', 'patil dsgn', '', 0),
(23, '984521', '$P$BZ3ASMFBCxMRPBOm8f8/Zx8/vBEmhO0', 'karchyit@student.nitw.ac.in', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-24 17:33:29', '2016-01-24 16:33:29', 'test', '5454544555', 0),
(24, '851401', '$P$BURpaLI.M4YnyQqoT3oke54voaTZ8K.', 'sanshraydewangan1@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-24 18:46:12', '2016-01-24 18:43:27', '2016-01-24 17:46:12', 'Sanshray Dewangan', '8143684606', 0),
(25, '811437', '$P$BBbeP.TFGID8JPRj8G91l/365BXsAL0', 'akashcoolahirwar@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-24 18:51:01', '2016-01-24 18:49:31', '2016-01-24 17:51:01', 'akash', '9866015990', 0),
(26, 'archit', '123456', 'archit@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-01-27 07:42:48', '', '', 2),
(27, 'archit11', '123456', 'archit11@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-01-27 07:43:34', '', '', 11),
(28, '147108', '$P$BSPGQZ77t10hQ9xF3uxdNi9UEugqbC.', 's@f.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-27 10:23:59', '2016-01-27 09:23:59', 'ldfdjahnj', '9865627415', 0),
(29, '147138', '$P$B.x/dofRq/jP1dUgOUbM4h5HStoinu1', 'p@p.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-27 10:28:11', '2016-01-27 09:28:11', 'patil prasad', '9874512365', 0),
(30, '147896', '$P$BNoUpn3yzLsb4XtvVZt3b2EnGMe.iG0', 'a@v.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-27 10:44:34', '2016-01-27 09:44:34', 'dsg', '9685326173', 0),
(31, '123444', '$P$Brwz7oWDLR/7zrD87npZ0crQPoPVAr0', 'fldh@kfg.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-27 11:07:29', '2016-01-27 10:07:29', 'rga', '1234567895', 0),
(33, 'archit33', '123456', 'archit33@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-01-30 08:38:35', '', '', 33),
(34, 'archit44', '123456', 'archit44@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-01-30 08:43:35', '', '', 44),
(36, 'archit22', '$P$BWJu4BmH65BSLIIrP9yZXWjDso3c4Y.', 'archit22@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2016-01-31 06:17:08', '2016-01-31 02:04:22', '2016-01-31 05:17:08', 'archit22', '65412', 33),
(37, '851415', '$P$BUXFqIKp0Sta42nbMnI84xWNKEzYWg1', 'saileshsatpathy123@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-01-31 07:58:36', '2016-01-31 06:58:36', 'Sailesh Satpathy', '8374649414', 0),
(38, '789456', '$P$BdWTKkX7sEpvhkxCFHkEv7xgSfifst0', '789@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-02-04 09:18:10', '2016-02-04 08:18:10', '789456', '789456', 0),
(39, '951438', '$P$B75EvCZPUMXkvDG0R9LujqKiCRdOCO0', 'sus@kk.cc', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2016-02-04 15:54:28', '2016-02-04 14:54:29', 'sushrut k', '9403039900', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_autologin`
--

CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `user_group_id` int(5) NOT NULL DEFAULT '0',
  `user_tag` varchar(20) NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `user_tag`) VALUES
(0, 'student'),
(1, 'chief_warden'),
(2, 'warden'),
(11, 'electrician'),
(22, 'plumber'),
(33, 'lan'),
(44, 'carpenter');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `country`, `website`) VALUES
(1, 11, NULL, NULL),
(2, 12, NULL, NULL),
(3, 13, NULL, NULL),
(4, 14, NULL, NULL),
(5, 15, NULL, NULL),
(6, 16, NULL, NULL),
(7, 17, NULL, NULL),
(8, 18, NULL, NULL),
(9, 19, NULL, NULL),
(10, 20, NULL, NULL),
(11, 21, NULL, NULL),
(12, 22, NULL, NULL),
(13, 23, NULL, NULL),
(14, 24, NULL, NULL),
(15, 25, NULL, NULL),
(16, 28, NULL, NULL),
(17, 29, NULL, NULL),
(18, 30, NULL, NULL),
(19, 31, NULL, NULL),
(20, 36, NULL, NULL),
(21, 37, NULL, NULL),
(22, 38, NULL, NULL),
(23, 39, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `grievances`
--
ALTER TABLE `grievances`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `hdepartment`
--
ALTER TABLE `hdepartment`
  ADD PRIMARY KEY (`hcdid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_group_id` (`user_group_id`);

--
-- Indexes for table `user_autologin`
--
ALTER TABLE `user_autologin`
  ADD PRIMARY KEY (`key_id`,`user_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_group_id` (`user_group_id`),
  ADD KEY `user_group_id_2` (`user_group_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `cid` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `grievances`
--
ALTER TABLE `grievances`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
