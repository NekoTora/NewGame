-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-08-16 16:10:16
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newgame`
--

-- --------------------------------------------------------

--
-- 表的结构 `ng_apply`
--

CREATE TABLE `ng_apply` (
  `id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mark` varchar(300) NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `ng_apply_content`
--

CREATE TABLE `ng_apply_content` (
  `apply_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question` varchar(600) NOT NULL,
  `answer` text NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ng_club`
--

CREATE TABLE `ng_club` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `manager_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `signup` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `ng_question`
--

CREATE TABLE `ng_question` (
  `id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `msg` varchar(600) NOT NULL,
  `answer` text NOT NULL,
  `required` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `ng_user`
--

CREATE TABLE `ng_user` (
  `id` int(11) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ng_apply`
--
ALTER TABLE `ng_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ng_apply_content`
--
ALTER TABLE `ng_apply_content`
  ADD KEY `apply_id` (`apply_id`);

--
-- Indexes for table `ng_club`
--
ALTER TABLE `ng_club`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ng_question`
--
ALTER TABLE `ng_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ng_user`
--
ALTER TABLE `ng_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ng_apply`
--
ALTER TABLE `ng_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ng_club`
--
ALTER TABLE `ng_club`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ng_question`
--
ALTER TABLE `ng_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ng_user`
--
ALTER TABLE `ng_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
