-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-08-21 02:53:46
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ng_club`
--

INSERT INTO `ng_club` (`id`, `name`, `manager_user`, `status`, `signup`, `sort`, `email`, `create_time`, `update_time`) VALUES
(1, '微光网络工作室', 1, 1, 1, 999, 'i@flag.moe', '2017-08-20 18:08:16', '0000-00-00 00:00:00');

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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ng_question`
--

INSERT INTO `ng_question` (`id`, `club_id`, `type`, `msg`, `answer`, `required`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 1, 'input', '这是一个问答题', '', 1, 1, 1, '2017-08-20 18:37:44', '0000-00-00 00:00:00'),
(2, 1, 'radio', '请问你是那届的', '[\"2014\",\"2015\",\"2016\",\"2017\"]', 1, 2, 1, '2017-08-20 18:42:28', '0000-00-00 00:00:00'),
(3, 1, 'checkbox', '请选择你喜欢的方向', '[\"伪娘\",\"秀吉\",\"扶她\"]', 1, 3, 1, '2017-08-20 18:43:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ng_user`
--

CREATE TABLE `ng_user` (
  `id` int(11) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ng_question`
--
ALTER TABLE `ng_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ng_user`
--
ALTER TABLE `ng_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
