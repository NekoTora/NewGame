-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-09-13 21:44:49
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

--
-- 转存表中的数据 `ng_apply`
--

INSERT INTO `ng_apply` (`id`, `club_id`, `status`, `user_id`, `mark`, `create_time`, `update_time`) VALUES
(24, 1, 0, 0, '0', '2017-09-06 05:25:37', '2017-09-06 05:25:37'),
(23, 1, 0, 0, '0', '2017-09-06 05:24:13', '2017-09-06 05:24:13'),
(25, 1, 0, 0, '0', '2017-09-06 09:50:24', '2017-09-06 09:50:24');

-- --------------------------------------------------------

--
-- 表的结构 `ng_apply_content`
--

CREATE TABLE `ng_apply_content` (
  `id` int(11) NOT NULL,
  `apply_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `type` varchar(30) NOT NULL,
  `answer` varchar(3000) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ng_apply_content`
--

INSERT INTO `ng_apply_content` (`id`, `apply_id`, `question_id`, `question`, `type`, `answer`, `create_time`, `update_time`) VALUES
(1, 1, 118, '请问你是那届的', 'radio', '2014', '2017-09-05 17:39:16', '2017-09-05 17:39:16'),
(2, 1, 119, '请选择你喜欢的方向', 'checkbox', '伪娘 ; 秀吉', '2017-09-05 17:39:16', '2017-09-05 17:39:16'),
(3, 1, 120, '这是一个问答题', 'input', '会哒会哒', '2017-09-05 17:39:16', '2017-09-05 17:39:16'),
(4, 1, 121, '是大多数', 'input', '123', '2017-09-05 17:39:16', '2017-09-05 17:39:16'),
(5, 21, 117, '测试下拉框', 'select', '123', '2017-09-05 18:17:29', '2017-09-05 18:17:29'),
(6, 21, 118, '请问你是那届的', 'radio', '2015', '2017-09-05 18:17:29', '2017-09-05 18:17:29'),
(7, 21, 119, '请选择你喜欢的方向', 'checkbox', '伪娘 ; 秀吉', '2017-09-05 18:17:29', '2017-09-05 18:17:29'),
(8, 21, 120, '这是一个问答题', 'input', '123', '2017-09-05 18:17:29', '2017-09-05 18:17:29'),
(9, 21, 121, '是大多数', 'input', '123213', '2017-09-05 18:17:29', '2017-09-05 18:17:29'),
(10, 23, 122, '请输入你的学号', 'number', '15190110308', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(11, 23, 123, '请选择你的年级', 'radio', '2015', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(12, 23, 134, '你的名字是', 'input', '李鑫泽', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(13, 23, 135, '你的手机号是？请保证手机联系畅通，我们会与你联系', 'number', '15140512306', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(14, 23, 136, '你的QQ号是？', 'number', '782325821', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(15, 23, 124, '请选择你喜欢的方向', 'checkbox', '前端 ; 后端 ; 运维 ; 设计/产品', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(16, 23, 125, '请再更多的介绍你自己吧', 'input', '介绍自己', '2017-09-06 13:24:13', '2017-09-06 13:24:13'),
(17, 24, 122, '请输入你的学号', 'number', '15190110307', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(18, 24, 123, '请选择你的年级', 'radio', '2015', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(19, 24, 134, '你的名字是', 'input', '测试', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(20, 24, 135, '你的手机号是？请保证手机联系畅通，我们会与你联系', 'number', '132456768870', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(21, 24, 136, '你的QQ号是？', 'number', '123456879', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(22, 24, 124, '请选择你喜欢的方向', 'checkbox', '前端 ; 后端', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(23, 24, 125, '请再更多的介绍你自己吧', 'input', '这里是一个介绍', '2017-09-06 13:25:37', '2017-09-06 13:25:37'),
(24, 25, 122, '请输入你的学号', 'number', '15123', '2017-09-06 17:50:24', '2017-09-06 17:50:24'),
(25, 25, 123, '请选择你的年级', 'radio', '2014', '2017-09-06 17:50:24', '2017-09-06 17:50:24'),
(26, 25, 134, '你的名字是', 'input', '123', '2017-09-06 17:50:24', '2017-09-06 17:50:24'),
(27, 25, 135, '你的手机号是？请保证手机联系畅通，我们会与你联系', 'number', '123', '2017-09-06 17:50:24', '2017-09-06 17:50:24'),
(28, 25, 136, '你的QQ号是？', 'number', '123', '2017-09-06 17:50:24', '2017-09-06 17:50:24'),
(29, 25, 124, '请选择你喜欢的方向', 'checkbox', '后端', '2017-09-06 17:50:24', '2017-09-06 17:50:24'),
(30, 25, 125, '请再更多的介绍你自己吧', 'input', '123', '2017-09-06 17:50:24', '2017-09-06 17:50:24');

-- --------------------------------------------------------

--
-- 表的结构 `ng_club`
--

CREATE TABLE `ng_club` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `img_logo` varchar(255) DEFAULT NULL,
  `manager_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `signup` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ng_club`
--

INSERT INTO `ng_club` (`id`, `name`, `intro`, `img_logo`, `manager_user`, `status`, `signup`, `sort`, `email`, `create_time`, `update_time`) VALUES
(1, '微光网络工作室', '微光网络工作室是由党委宣传部/品牌宣传部与教学支持与实验中心共同指导，为打造学校官方网络平台而建立的WEB开发团队，致力于打造学校网络媒体品牌，团队主要负责学校网站项目的策划开发、运营和推广，互联网产品的研发、运营及推广。', '1.png', 1, 1, 1, 999, 'i@flag.moe', '2017-09-06 06:37:13', '2017-08-28 16:00:00'),
(2, '网络安全工作室', '网络安全工作室是一个社团，这里用来测试。', 'nss.jpg', 2, 1, 1, 999, 'i@flag.moe', '2017-09-06 05:50:39', '2017-08-28 16:00:00');

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
(135, 1, 'number', '你的手机号是？请保证手机联系畅通，我们会与你联系', '', 1, 4, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(136, 1, 'number', '你的QQ号是？', '', 1, 3, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(125, 1, 'input', '请再更多的介绍你自己吧', '', 1, 6, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(134, 1, 'input', '你的名字是', '', 1, 2, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(123, 1, 'radio', '请选择你的年级', '[\"2014\",\"2015\",\"2016\",\"2017\"]', 1, 0, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(124, 1, 'checkbox', '请选择你喜欢的方向', '[\"前端\",\"后端\",\"运维\",\"设计\\/产品\"]', 1, 5, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(122, 1, 'number', '请输入你的学号123', '', 1, 1, 1, '2017-09-11 09:49:38', '2017-09-11 09:49:38'),
(137, 2, 'input', '测试问题', '', 1, 0, 1, '2017-09-06 07:15:19', '2017-09-06 07:15:19');

-- --------------------------------------------------------

--
-- 表的结构 `ng_user`
--

CREATE TABLE `ng_user` (
  `id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `manager_club` varchar(100) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ng_user`
--

INSERT INTO `ng_user` (`id`, `username`, `nickname`, `password`, `manager_club`, `last_login`, `create_time`, `update_time`) VALUES
(1, 'shimmer', '微光网络工作室', '123456', '1', '2017-09-05 07:11:00', '2017-08-31 14:42:10', '2017-08-31 14:42:10'),
(2, 'nss', '网安', '123456', '2', '2017-09-05 07:11:00', '2017-08-31 14:42:10', '2017-08-31 14:42:10');

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
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `ng_apply_content`
--
ALTER TABLE `ng_apply_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `ng_club`
--
ALTER TABLE `ng_club`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ng_question`
--
ALTER TABLE `ng_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- 使用表AUTO_INCREMENT `ng_user`
--
ALTER TABLE `ng_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
