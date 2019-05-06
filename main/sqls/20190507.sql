-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 06, 2019 at 09:37 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Article`
--

CREATE TABLE `Article` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `author` int(11) NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8 NOT NULL,
  `publish_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Article`
--

INSERT INTO `Article` (`id`, `category_id`, `title`, `author`, `content`, `publish_time`, `update_time`) VALUES
(1, 7, 'a', 2, '<p>a</p>\r\n', '2019-04-25 13:54:33', '2019-04-25 13:54:33'),
(2, 7, '2', 2, '<p>2</p>\r\n', '2019-04-25 14:10:30', '2019-04-25 14:10:30'),
(3, 7, '3', 2, '<p>3</p>\r\n', '2019-04-25 14:10:41', '2019-04-25 14:10:41'),
(4, 7, '4', 2, '<p>4</p>\r\n', '2019-04-25 14:10:43', '2019-04-25 14:10:43'),
(5, 7, '5', 2, '<p>5</p>\r\n', '2019-04-25 14:10:44', '2019-04-25 14:10:44'),
(6, 7, '6', 2, '<p>6</p>\r\n', '2019-04-25 14:10:46', '2019-04-25 14:10:46'),
(7, 7, '7', 2, '<p>7</p>\r\n', '2019-04-25 14:10:49', '2019-04-25 14:10:49'),
(8, 7, '8', 2, '<p>8</p>\r\n', '2019-04-25 14:10:52', '2019-04-25 14:10:52'),
(9, 7, '9', 2, '<p>9</p>\r\n', '2019-04-25 14:10:54', '2019-04-25 14:10:54'),
(10, 7, '10', 2, '<p>10</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2019-04-25 14:11:00', '2019-04-25 14:11:00'),
(11, 7, '11', 2, '<p>11</p>\r\n', '2019-04-25 14:11:03', '2019-04-25 14:11:03'),
(12, 7, '12', 2, '<p>12</p>\r\n', '2019-04-25 14:11:05', '2019-04-25 14:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `BuyPredict`
--

CREATE TABLE `BuyPredict` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `predict_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BuyPredict`
--

INSERT INTO `BuyPredict` (`id`, `user_id`, `predict_id`) VALUES
(1, 1, 38),
(2, 1, 39),
(3, 1, 60);

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `description` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `name`, `description`, `class_id`) VALUES
(1, '公告', 'Announcement', 1),
(2, '生活閒聊', NULL, 1),
(3, '黑特', NULL, 1),
(4, '投票', NULL, 1),
(5, '炫燿', NULL, 1),
(6, '精華', NULL, 1),
(7, 'MLB', NULL, 2),
(8, '日本職棒', NULL, 2),
(9, '中華職棒', NULL, 2),
(10, '韓國職棒', NULL, 2),
(11, '墨西哥棒球', NULL, 2),
(12, '澳洲職棒', NULL, 2),
(13, 'NBA', NULL, 3),
(14, 'WNBA', NULL, 3),
(15, '韓國職籃', NULL, 3),
(16, '日本職籃', NULL, 3),
(17, '歐洲職籃', NULL, 3),
(18, '中國職籃', NULL, 3),
(19, '西甲職籃', NULL, 3),
(20, 'SBL', NULL, 3),
(21, '菲律賓籃球', NULL, 3),
(22, '百家樂', NULL, 4),
(23, '彩票', NULL, 5),
(24, '北京賽車', NULL, 6),
(25, '足球', NULL, 7),
(26, 'NHL冰球', NULL, 7),
(27, '俄羅斯冰球', NULL, 7),
(28, '賽馬', NULL, 7),
(29, '美式足球', NULL, 7),
(30, '網球', NULL, 7),
(31, '電競', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Class`
--

CREATE TABLE `Class` (
  `id` int(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `description` varchar(60) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Class`
--

INSERT INTO `Class` (`id`, `name`, `description`) VALUES
(1, '通用看板', NULL),
(2, '棒球', NULL),
(3, '籃球', NULL),
(4, '百家樂', NULL),
(5, '彩票', NULL),
(6, '北京賽車', NULL),
(7, '其他', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Comment`
--

CREATE TABLE `Comment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Follower`
--

CREATE TABLE `Follower` (
  `id` int(11) NOT NULL,
  `userA` varchar(30) DEFAULT NULL,
  `userB` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Game`
--

CREATE TABLE `Game` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `game_datetime` datetime NOT NULL,
  `h_name` varchar(20) NOT NULL,
  `a_name` varchar(20) NOT NULL,
  `game_flag` int(11) NOT NULL DEFAULT '0',
  `h_score` int(11) DEFAULT NULL,
  `a_score` int(11) DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Game`
--

INSERT INTO `Game` (`id`, `category_id`, `game_datetime`, `h_name`, `a_name`, `game_flag`, `h_score`, `a_score`, `details`) VALUES
(1, 7, '2019-04-08 01:10:00', '紐約大都會', '華盛頓國民', 1, 9, 12, '{\"handicap\":{\"a_spread\":1,\"tie_odds\":20,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":6,\"tie_odds\":-20,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.75,\"h_odds\":1.14},\"one_lose_two_win\":{\"a_spread\":1,\"a_odds\":1.23,\"h_odds\":0.62},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(2, 7, '2019-04-08 01:20:00', '亞特蘭大勇士', '邁阿密馬林魚', 1, 4, 3, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":-30,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":8,\"tie_odds\":-20,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.51,\"h_odds\":0.55},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.71,\"h_odds\":1.06},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(3, 7, '2019-04-08 01:35:00', '匹茲堡海盜', '辛辛那堤紅人', 1, 7, 5, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":-10,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":8,\"tie_odds\":80,\"over_odds\":0.92,\"under_odds\":0.96},\"single\":{\"a_odds\":1.41,\"h_odds\":0.6},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.63,\"h_odds\":1.18},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(4, 7, '2019-04-08 02:10:00', '密爾瓦基釀酒人', '芝加哥小熊', 1, 4, 2, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":95,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":9,\"tie_odds\":-30,\"over_odds\":0.93,\"under_odds\":0.95},\"single\":{\"a_odds\":0.93,\"h_odds\":0.91},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.45,\"h_odds\":1.74},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(5, 7, '2019-04-08 02:15:00', '聖路易紅雀', '聖地牙哥教士', 1, 4, 1, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":55,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":9,\"tie_odds\":10,\"over_odds\":0.92,\"under_odds\":0.96},\"single\":{\"a_odds\":1.04,\"h_odds\":0.83},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.5,\"h_odds\":1.43},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(6, 7, '2019-04-08 08:35:00', '科羅拉多落磯山', '洛杉磯道奇', 1, 6, 12, '{\"handicap\":{\"a_spread\":1,\"tie_odds\":-75,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":11,\"tie_odds\":-75,\"over_odds\":0.92,\"under_odds\":0.96},\"single\":{\"a_odds\":0.61,\"h_odds\":1.38},\"one_lose_two_win\":{\"a_spread\":1,\"a_odds\":0.95,\"h_odds\":0.86},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(7, 13, '2019-04-10 07:00:00', '華盛頓巫師', '波士頓塞爾蒂克', 1, 110, 116, '{\"handicap\":{\"h_spread\":5,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":226,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.86,\"h_odds\":0.45},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(8, 13, '2019-04-10 07:05:00', '底特律活塞', '曼斐斯灰熊', 1, 100, 93, '{\"handicap\":{\"h_spread\":10,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":210,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":3.58,\"h_odds\":0.19},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(9, 13, '2019-04-10 07:05:00', '克里夫蘭騎士', '夏洛特黃蜂', 1, 97, 124, '{\"handicap\":{\"a_spread\":8,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":221,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.29,\"h_odds\":2.72},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(10, 13, '2019-04-10 07:35:00', '邁阿密熱火', '費城76人', 1, 122, 99, '{\"handicap\":{\"h_spread\":3,\"tie_odds\":-100,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":219,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.5,\"h_odds\":0.58},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(11, 13, '2019-04-10 08:05:00', '明尼蘇達灰狼', '多倫多暴龍', 1, 100, 120, '{\"handicap\":{\"a_spread\":7,\"tie_odds\":25,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":229,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.36,\"h_odds\":2.24},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(12, 13, '2019-04-10 08:05:00', '紐奧良鵜鶘', '金州勇士', 1, 103, 112, '{\"handicap\":{\"a_spread\":7,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":235,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.33,\"h_odds\":2.39},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(13, 13, '2019-04-10 08:05:00', '芝加哥公牛', '紐約尼克', 1, 86, 96, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":-100,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":216,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.02,\"h_odds\":0.83},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(14, 13, '2019-04-10 08:35:00', '達拉斯獨行俠', '鳳凰城太陽', 1, 120, 109, '{\"handicap\":{\"h_spread\":7,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":220,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":2.39,\"h_odds\":0.33},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(15, 13, '2019-04-10 09:05:00', '猶他爵士', '丹佛金塊', 1, 118, 108, '{\"handicap\":{\"h_spread\":1,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":215,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.9,\"h_odds\":0.9},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(16, 13, '2019-04-10 09:30:00', '奧克拉荷馬雷霆', '休士頓火箭', 1, 112, 111, '{\"handicap\":{\"a_spread\":1,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":225,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.9,\"h_odds\":0.9},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(17, 13, '2019-04-10 10:35:00', '洛杉磯湖人', '波特蘭拓荒者', 1, 101, 104, '{\"handicap\":{\"a_spread\":9,\"tie_odds\":-75,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":224,\"tie_odds\":-25,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.19,\"h_odds\":3.9},\"odd_even\":{\"odd_odds\":0.93,\"even_odds\":0.95}}'),
(18, 7, '2019-04-10 06:40:00', '辛辛那堤紅人', '邁阿密馬林魚', 1, 14, 0, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":-50,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":8,\"tie_odds\":60,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.62,\"h_odds\":0.51},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.74,\"h_odds\":1.1},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(19, 7, '2019-04-10 07:05:00', '費城費城人', '華盛頓國民', 1, 6, 10, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":55,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":7,\"tie_odds\":-85,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.07,\"h_odds\":0.79},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.46,\"h_odds\":1.61},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(20, 7, '2019-04-10 07:45:00', '聖路易紅雀', '洛杉磯道奇', 1, 4, 0, '{\"handicap\":{\"a_spread\":1,\"tie_odds\":5,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":9,\"tie_odds\":90,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.72,\"h_odds\":1.17},\"one_lose_two_win\":{\"a_spread\":1,\"a_odds\":1.17,\"h_odds\":0.69},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(21, 7, '2019-04-10 08:40:00', '科羅拉多落磯山', '亞特蘭大勇士', 1, 1, 7, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":45,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":11,\"tie_odds\":55,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":1.09,\"h_odds\":0.78},\"one_lose_two_win\":{\"h_spread\":1,\"a_odds\":0.56,\"h_odds\":1.42},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(22, 7, '2019-04-10 09:45:00', '舊金山巨人', '聖地牙哥教士', 1, 7, 2, '{\"handicap\":{\"a_spread\":1,\"tie_odds\":60,\"a_odds\":0.95,\"h_odds\":0.95},\"total\":{\"point\":7,\"tie_odds\":-65,\"over_odds\":0.94,\"under_odds\":0.94},\"single\":{\"a_odds\":0.82,\"h_odds\":1.03},\"one_lose_two_win\":{\"a_spread\":1,\"a_odds\":1.38,\"h_odds\":0.56},\"odd_even\":{\"odd_odds\":0.63,\"even_odds\":1.27}}'),
(23, 27, '2019-04-09 23:00:00', '中央陸軍', '聖彼得堡陸軍', 1, 3, 1, '{\"handicap\":{\"h_spread\":0,\"a_odds\":1.63,\"h_odds\":0.51},\"total\":{\"point\":4,\"over_odds\":1.08,\"under_odds\":0.76},\"single\":{\"a_odds\":2.51,\"h_odds\":0.93},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(24, 27, '2019-04-10 01:15:00', '科隆鯊魚', '曼海姆海鷹', 1, 2, 4, '{\"handicap\":{\"a_spread\":1,\"a_odds\":1.09,\"h_odds\":0.77},\"total\":{\"point\":5,\"over_odds\":0.95,\"under_odds\":0.86},\"single\":{\"a_odds\":0.77,\"h_odds\":2.72},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(25, 27, '2019-04-10 02:00:00', '伯爾尼', '比爾', 1, 5, 1, '{\"handicap\":{\"h_spread\":1,\"a_odds\":0.81,\"h_odds\":0.94},\"total\":{\"point\":4,\"tie_odds\":-100,\"over_odds\":0.82,\"under_odds\":0.92},\"single\":{\"a_odds\":3.17,\"h_odds\":0.65},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(26, 27, '2019-04-10 01:00:00', '弗羅倫達', '呂勒奧HF', 1, 2, 0, '{\"handicap\":{\"h_spread\":0,\"tie_odds\":-100,\"a_odds\":0.77,\"h_odds\":1.08},\"total\":{\"point\":4,\"tie_odds\":-100,\"over_odds\":0.94,\"under_odds\":0.86},\"single\":{\"a_odds\":1.97,\"h_odds\":1.1},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(27, 27, '2019-04-09 23:30:00', '皮拉提霍穆托夫', '捷克布傑約維采', 1, 1, 0, '{\"handicap\":{\"h_spread\":0,\"tie_odds\":-100,\"a_odds\":1.08,\"h_odds\":0.78},\"total\":{\"point\":5,\"tie_odds\":-100,\"over_odds\":0.99,\"under_odds\":0.83},\"single\":{\"a_odds\":2.6,\"h_odds\":0.78},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(28, 27, '2019-04-10 00:00:00', '帕爾杜比採迪納摩', '克拉德諾騎士', 1, 1, 4, '{\"handicap\":{\"h_spread\":1,\"a_odds\":0.84,\"h_odds\":0.99},\"total\":{\"point\":5,\"over_odds\":0.78,\"under_odds\":1.05},\"single\":{\"a_odds\":2.78,\"h_odds\":0.74},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(29, 27, '2019-04-09 23:30:00', '塔帕拉', 'HPK', 1, 2, 2, '{\"handicap\":{\"h_spread\":0,\"a_odds\":1.35,\"h_odds\":0.62},\"total\":{\"point\":4,\"tie_odds\":-100,\"over_odds\":1.01,\"under_odds\":0.81},\"single\":{\"a_odds\":2.08,\"h_odds\":1.1},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(30, 27, '2019-04-10 01:15:00', '薩爾斯堡紅牛', '維也納首都', 1, 2, 2, '{\"handicap\":{\"h_spread\":0,\"a_odds\":1.07,\"h_odds\":0.79},\"total\":{\"point\":5,\"tie_odds\":-100,\"over_odds\":0.83,\"under_odds\":0.99},\"single\":{\"a_odds\":1.63,\"h_odds\":1.25},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(31, 27, '2019-04-10 01:00:00', '斯托哈馬爾龍', '阿斯克爾', 1, 0, 1, '{\"handicap\":{\"h_spread\":2,\"a_odds\":0.87,\"h_odds\":0.96},\"total\":{\"point\":5,\"tie_odds\":-100,\"over_odds\":1.1,\"under_odds\":0.75},\"single\":{\"a_odds\":5.25,\"h_odds\":0.34},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(32, 27, '2019-04-10 07:00:00', '赫希熊', '理海谷幻影', 1, 2, 2, '{\"handicap\":{\"a_spread\":0,\"a_odds\":0.88,\"h_odds\":0.88},\"total\":{\"point\":5,\"tie_odds\":-100,\"over_odds\":0.96,\"under_odds\":0.78},\"single\":{\"a_odds\":1.35,\"h_odds\":1.5},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(33, 27, '2019-04-10 08:00:00', '密爾瓦基海軍上將', '洛福特冰豬', 1, 3, 3, '{\"handicap\":{\"h_spread\":0,\"a_odds\":1.14,\"h_odds\":0.69},\"total\":{\"point\":5,\"tie_odds\":-100,\"over_odds\":0.81,\"under_odds\":0.93},\"single\":{\"a_odds\":1.69,\"h_odds\":1.15},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(34, 27, '2019-04-09 20:00:00', '南韓(女)', '波蘭(女)', 1, 4, 3, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":50,\"a_odds\":0.96,\"h_odds\":0.86},\"total\":{\"point\":5,\"tie_odds\":-100,\"over_odds\":0.89,\"under_odds\":0.89},\"single\":{\"a_odds\":0.92,\"h_odds\":0.92},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(35, 27, '2019-04-09 21:00:00', '美國(女)', '俄羅斯(女)', 1, 10, 0, '{\"handicap\":{\"h_spread\":5,\"tie_odds\":-100,\"a_odds\":0.95,\"h_odds\":0.88},\"total\":{\"point\":6,\"tie_odds\":-100,\"over_odds\":0.77,\"under_odds\":1.06},\"single\":{\"a_odds\":0.92,\"h_odds\":0.92},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(36, 27, '2019-04-09 23:00:00', '捷克(女)', '德國(女)', 1, 2, 0, '{\"handicap\":{\"h_spread\":2,\"a_odds\":0.86,\"h_odds\":0.97},\"total\":{\"point\":4,\"tie_odds\":-100,\"over_odds\":0.87,\"under_odds\":0.94},\"single\":{\"a_odds\":6.53,\"h_odds\":0.3},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(37, 27, '2019-04-10 00:30:00', '芬蘭(女)', '加拿大(女)', 1, 1, 6, '{\"handicap\":{\"a_spread\":2,\"tie_odds\":-50,\"a_odds\":1.02,\"h_odds\":0.8},\"total\":{\"point\":5,\"over_odds\":1.02,\"under_odds\":0.76},\"single\":{\"a_odds\":7.71,\"h_odds\":0.25},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(38, 27, '2019-04-09 22:30:00', '澳大利亞', '比利時', 1, 3, 3, '{\"handicap\":{\"h_spread\":1,\"tie_odds\":-100,\"a_odds\":1.18,\"h_odds\":0.64},\"total\":{\"point\":6,\"tie_odds\":-100,\"over_odds\":0.89,\"under_odds\":0.89},\"single\":{\"a_odds\":0.92,\"h_odds\":0.92},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(39, 27, '2019-04-10 02:30:00', '塞爾維亞', '克羅地亞', 1, 3, 1, '{\"handicap\":{\"a_spread\":0,\"tie_odds\":-100,\"a_odds\":0.83,\"h_odds\":0.99},\"total\":{\"point\":6,\"tie_odds\":-100,\"over_odds\":0.89,\"under_odds\":0.89},\"single\":{\"a_odds\":0.92,\"h_odds\":0.92},\"odd_even\":{\"odd_odds\":1.02,\"even_odds\":0.86}}'),
(40, 8, '2019-04-09 17:00:00', '西武獅', '東北樂天鷹', 0, NULL, NULL, 'null'),
(41, 8, '2019-04-09 17:00:00', '福岡軟銀鷹', '日本火腿', 0, NULL, NULL, 'null'),
(42, 8, '2019-04-09 17:15:00', '千葉羅德', '歐力士猛牛', 0, NULL, NULL, 'null'),
(43, 8, '2019-04-09 17:00:00', '中日龍', '讀賣巨人', 0, NULL, NULL, 'null'),
(44, 8, '2019-04-09 17:00:00', '阪神虎', '橫濱DeNA灣星', 0, NULL, NULL, 'null'),
(45, 8, '2019-04-09 17:00:00', '廣島鯉魚', '養樂多燕子', 0, NULL, NULL, 'null'),
(46, 8, '2019-04-09 17:00:00', '阪神虎-小', '阪神虎-大', 0, NULL, NULL, 'null'),
(47, 8, '2019-04-09 17:00:00', '福岡軟銀鷹-小', '福岡軟銀鷹-大', 0, NULL, NULL, 'null'),
(48, 8, '2019-04-09 17:00:00', '廣島鯉魚-小', '廣島鯉魚-大', 0, NULL, NULL, 'null'),
(49, 8, '2019-04-09 17:00:00', '西武獅-小', '西武獅-大', 0, NULL, NULL, 'null'),
(50, 8, '2019-04-09 17:00:00', '中日龍-小', '中日龍-大', 0, NULL, NULL, 'null'),
(51, 8, '2019-04-09 17:15:00', '千葉羅德-小', '千葉羅德-大', 0, NULL, NULL, 'null'),
(52, 9, '2019-04-09 18:35:00', 'Lamigo猿', '統一獅', 0, NULL, NULL, 'null'),
(53, 10, '2019-04-09 17:30:00', '樂天巨人', '鬥山熊', 0, NULL, NULL, 'null'),
(54, 10, '2019-04-09 17:30:00', '華老鷹', '飛龍', 0, NULL, NULL, 'null'),
(55, 10, '2019-04-09 17:30:00', '起亞老虎', '恐龍', 0, NULL, NULL, 'null'),
(56, 10, '2019-04-09 17:30:00', '雙子', '三星獅子', 0, NULL, NULL, 'null'),
(57, 10, '2019-04-09 17:30:00', '英雄', '巫師', 0, NULL, NULL, 'null'),
(58, 27, '2019-04-09 16:30:00', '中國(女)', '荷蘭(女)', 0, NULL, NULL, 'null'),
(59, 27, '2019-04-09 17:30:00', '瑞典(女)', '日本(女)', 0, NULL, NULL, 'null'),
(60, 27, '2019-04-09 19:00:00', '西班牙', '中國', 0, NULL, NULL, 'null'),
(61, 31, '2019-04-09 12:00:00', 'Taichi Gaming', 'Newbee Young', 0, NULL, NULL, 'null'),
(62, 31, '2019-04-09 13:00:00', 'Team QS', 'iG Vitality', 0, NULL, NULL, 'null'),
(63, 31, '2019-04-09 15:00:00', 'Team Aster', 'Geek Fam', 0, NULL, NULL, 'null'),
(64, 31, '2019-04-09 18:00:00', 'Invictus Gaming', 'Tigers', 0, NULL, NULL, 'null'),
(65, 31, '2019-04-09 17:00:00', 'Ghost Owl Gaming', 'SELECTED', 0, NULL, NULL, 'null'),
(66, 31, '2019-04-09 20:00:00', 'ESC 729', 'VSG', 0, NULL, NULL, 'null'),
(67, 31, '2019-04-09 18:00:00', 'MVP Space', 'GC Busan Wave', 0, NULL, NULL, 'null'),
(68, 31, '2019-04-09 20:00:00', 'Element Mystic', 'O2 Blast', 0, NULL, NULL, 'null'),
(69, 31, '2019-04-09 18:55:00', 'Windigo Gaming', 'Nordavind', 0, NULL, NULL, 'null'),
(70, 31, '2019-04-09 21:55:00', 'DreamEaters', 'AGO Esports', 0, NULL, NULL, 'null'),
(71, 31, '2019-04-10 00:55:00', 'Epsilon eSports', 'Team GamerLegion', 0, NULL, NULL, 'null'),
(72, 31, '2019-04-09 16:30:00', 'Avant Gaming', 'Genuine Gaming', 0, NULL, NULL, 'null'),
(73, 31, '2019-04-09 16:30:00', 'Ground Zero', 'Grayhound', 0, NULL, NULL, 'null'),
(74, 31, '2019-04-09 19:30:00', 'Ground Zero', 'Jade', 0, NULL, NULL, 'null'),
(75, 31, '2019-04-09 23:00:00', 'Alliance', 'The Pango', 0, NULL, NULL, 'null'),
(76, 31, '2019-04-10 02:00:00', 'Team Empire', 'Gambit Esports', 0, NULL, NULL, 'null'),
(77, 31, '2019-04-09 22:00:00', 'Movistar Riders', 'Syman Gaming', 0, NULL, NULL, 'null'),
(78, 31, '2019-04-09 22:00:00', 'Windigo Gaming', 'TRICKED eSport', 0, NULL, NULL, 'null'),
(79, 31, '2019-04-10 01:00:00', 'NoChance', 'OFFSET', 0, NULL, NULL, 'null'),
(80, 31, '2019-04-10 01:00:00', 'PACT', 'Unique Team', 0, NULL, NULL, 'null'),
(81, 31, '2019-04-10 00:30:00', 'ATMOS', 'x kom', 0, NULL, NULL, 'null'),
(82, 31, '2019-04-10 00:30:00', 'AVANGAR', 'Fierce', 0, NULL, NULL, 'null'),
(83, 31, '2019-04-10 00:30:00', 'Berzerk', 'pro100', 0, NULL, NULL, 'null'),
(84, 31, '2019-04-10 00:30:00', 'Copenhagen Flames', 'London Esports', 0, NULL, NULL, 'null'),
(85, 31, '2019-04-10 00:00:00', 'Misfits Premier', 'devils one', 0, NULL, NULL, 'null'),
(86, 31, '2019-04-10 00:00:00', 'SK Prime', 'NYYRIKKI', 0, NULL, NULL, 'null'),
(87, 31, '2019-04-10 02:00:00', 'devils one', 'MAD Lions', 0, NULL, NULL, 'null'),
(88, 31, '2019-04-10 03:00:00', 'Misfits Premier', 'SK Prime', 0, NULL, NULL, 'null'),
(89, 31, '2019-04-10 04:00:00', 'NYYRIKKI', 'Diabolus Esports', 0, NULL, NULL, 'null'),
(90, 31, '2019-04-10 00:00:00', 'compLexity Gaming', 'zxc666', 0, NULL, NULL, 'null'),
(91, 31, '2019-04-10 03:00:00', 'Team Xolotl', 'gg and gg', 0, NULL, NULL, 'null'),
(92, 31, '2019-04-10 11:00:00', 'Rogue Warriors Shark', 'Royal Club', 0, NULL, NULL, 'null');

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

CREATE TABLE `Message` (
  `id` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `sendTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(60) CHARACTER SET utf8 NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `readFlag` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Message`
--

INSERT INTO `Message` (`id`, `senderId`, `receiverId`, `sendTime`, `subject`, `message`, `readFlag`) VALUES
(1, 1, 2, '2019-02-01 16:40:30', '測試喔喔喔', '<p><span style=\"color:#1abc9c\">你好啊這是測試信</span></p>\r\n', 0),
(2, 1, 1, '2019-02-01 16:57:12', '測試~', '<p>132456789</p>\r\n', 1),
(6, 1, 1, '2019-02-02 00:04:39', '我再試試', '<p><span style=\"font-size:72px\"><span style=\"font-family:Comic Sans MS,cursive\"><tt>2019/02/02</tt></span></span></p>\r\n\r\n<p><span style=\"font-size:72px\"><span style=\"font-family:Comic Sans MS,cursive\"><tt>00:04</tt></span></span></p>\r\n', 0),
(7, 2, 1, '2019-02-02 03:30:48', '寄信給系統', '<p><strong><span style=\"color:#d35400\"><span style=\"font-size:16px\">安安你好啊</span></span></strong></p>\r\n', 1),
(8, 1, 1, '2019-03-09 00:20:59', 'HI', '<p><span style=\"color:#e74c3c\"><span style=\"font-size:20px\"><span style=\"font-family:Comic Sans MS,cursive\">2019/3/9 00:20</span></span></span></p>\r\n', 1),
(9, 1, 1, '2019-03-10 15:41:04', 'HIHIHI', '<p>djsakfjlkdsaf</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>dsfksaldjfklasdkfasdfjas</p>\r\n\r\n<p>asdjfklaskdf</p>\r\n\r\n<p>jakdfjasdf</p>\r\n\r\n<p>askjdfkajsf</p>\r\n\r\n<p><img alt=\"\" src=\"https://kids.nationalgeographic.com/content/dam/kids/photos/articles/Science/H-P/heart.adapt.945.1.jpg\" style=\"height:531px; width:945px\" /></p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `OnlineUser`
--

CREATE TABLE `OnlineUser` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Predict`
--

CREATE TABLE `Predict` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `predict` char(1) NOT NULL,
  `predict_flag` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Predict`
--

INSERT INTO `Predict` (`id`, `game_id`, `user_id`, `category_id`, `predict`, `predict_flag`, `price`) VALUES
(10, 1, 2, 27, 'A', 2, 99),
(11, 2, 2, 27, 'a', 1, 99),
(12, 3, 2, 27, 'A', 2, 99),
(13, 4, 2, 27, 'A', 2, 99),
(14, 5, 2, 27, 'A', 1, 99),
(15, 1, 3, 27, 'A', 1, 99),
(16, 2, 3, 27, 'A', 1, 99),
(17, 3, 3, 27, 'A', 1, 99),
(18, 4, 3, 27, 'A', 1, 99),
(19, 5, 3, 27, 'A', 2, 99),
(20, 1, 4, 27, 'A', 1, 99),
(21, 2, 4, 27, 'A', 1, 99),
(22, 3, 4, 27, 'A', 2, 99),
(23, 1, 5, 27, 'A', 1, 99),
(24, 2, 5, 27, 'A', 2, 99),
(25, 3, 5, 27, 'A', 2, 99),
(26, 1, 6, 27, 'A', 2, 99),
(27, 2, 6, 27, 'A', 1, 99),
(30, 3, 2, 27, 'B', 2, 99),
(31, 3, 2, 27, 'c', 1, 99),
(32, 3, 2, 27, 'D', 2, 99),
(33, 3, 2, 27, 'E', 1, 99),
(34, 2, 2, 27, 'B', 1, 99),
(35, 2, 2, 27, 'C', 2, 99),
(36, 2, 2, 27, 'd', 2, 99),
(37, 2, 2, 27, 'E', 2, 99),
(38, 33, 2, 27, 'a', 3, 99),
(39, 14, 2, 27, 'a', 2, 99),
(40, 14, 2, 27, 'b', 1, 99),
(41, 14, 2, 27, 'c', 2, 99),
(42, 14, 2, 27, 'D', 1, 99),
(43, 14, 2, 27, 'E', 2, 99),
(60, 1, 7, 27, 'a', 1, 99),
(62, 1, 7, 27, 'c', 1, 99),
(63, 1, 7, 27, 'D', 2, 99),
(64, 2, 7, 27, 'A', 1, 99),
(65, 2, 7, 27, 'd', 2, 99),
(91, 1, 1, 7, 'a', 1, 99),
(92, 1, 1, 7, 'B', 2, 99),
(93, 1, 1, 7, 'C', 2, 99),
(94, 1, 1, 7, 'D', 2, 99),
(95, 1, 1, 7, 'E', 2, 99),
(96, 2, 1, 7, 'A', 3, 99),
(97, 2, 1, 7, 'b', 2, 99),
(98, 2, 1, 7, 'c', 2, 99),
(99, 2, 1, 7, 'd', 2, 99),
(100, 2, 1, 7, 'E', 2, 99),
(101, 3, 1, 7, 'a', 2, 99),
(102, 3, 1, 7, 'B', 2, 99),
(103, 3, 1, 7, 'c', 2, 99),
(104, 3, 1, 7, 'D', 1, 99),
(105, 3, 1, 7, 'e', 2, 99),
(106, 4, 1, 7, 'a', 2, 99),
(107, 4, 1, 7, 'b', 2, 99),
(108, 4, 1, 7, 'c', 2, 99),
(109, 4, 1, 7, 'D', 1, 99),
(110, 4, 1, 7, 'E', 1, 99),
(111, 5, 1, 7, 'a', 2, 99),
(112, 5, 1, 7, 'b', 2, 99),
(113, 5, 1, 7, 'C', 1, 99),
(114, 5, 1, 7, 'd', 2, 99),
(115, 5, 1, 7, 'E', 2, 99),
(116, 6, 1, 7, 'A', 2, 99),
(117, 6, 1, 7, 'b', 1, 99),
(118, 6, 1, 7, 'C', 2, 99),
(119, 6, 1, 7, 'D', 2, 99),
(120, 6, 1, 7, 'E', 1, 99);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `moneyType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `name`, `gender`, `category_id`, `image_url`, `price`, `moneyType`) VALUES
(1, '男 頭髮1', 0, 1, 'images/product/manHair1.png', 100, 1),
(2, '男 鞋子2', 0, 3, 'images/product/manShoe2.png', 100, 1),
(3, '男 鞋子3', 0, 3, 'images/product/manShoe3.png', 100, 1),
(4, '男 套裝4', 0, 2, 'images/product/manSuit4.png', 100, 1),
(5, '男 套裝5', 0, 2, 'images/product/manSuit5.png', 100, 1),
(6, '女 頭髮6', 1, 1, 'images/product/womanHair6.png', 100, 1),
(7, '女 鞋子7', 1, 3, 'images/product/womanShoe7.png', 100, 1),
(8, '女 鞋子8', 1, 3, 'images/product/womanShoe8.png', 100, 1),
(9, '女 鞋子9', 1, 3, 'images/product/womanShoe9.png', 100, 1),
(10, '女 套裝10', 1, 2, 'images/product/womanSuit10.png', 100, 1),
(11, '女 套裝11', 1, 2, 'images/product/womanSuit11.png', 100, 1),
(12, '男 眼部12', 0, 4, 'images/product/manEye12.png', 100, 1),
(13, '女 武器13', 1, 5, 'images/product/womanWeapon13.png', 100, 1),
(14, '女 武器14', 1, 5, 'images/product/womanWeapon14.png', 100, 1),
(15, '女 肩膀15', 1, 6, 'images/product/womanShoulder15.png', 100, 1),
(16, '女 肩膀16', 1, 6, 'images/product/womanShoulder16.png', 100, 1),
(17, '女 手部17', 1, 7, 'images/product/womanHand17.png', 100, 1),
(18, '女 手部18', 1, 7, 'images/product/womanHand18.png', 100, 1),
(19, '女 頸部19', 1, 8, 'images/product/womanNeck19.png', 100, 1),
(20, '女 頸部20', 1, 8, 'images/product/womanNeck20.png', 100, 1),
(21, '男 手部21', 0, 7, 'images/product/manHand21.png', 100, 1),
(22, '男 手部22', 0, 7, 'images/product/manHand22.png', 100, 1),
(23, '男 頸部23', 0, 8, 'images/product/manNeck23.png', 100, 1),
(24, '男 頸部24', 0, 8, 'images/product/manNeck24.png', 100, 1),
(25, '男 肩膀25', 0, 6, 'images/product/manShoulder25.png', 100, 1),
(26, '男 肩膀26', 0, 6, 'images/product/manShoulder26.png', 100, 1),
(27, '男 武器27', 0, 5, 'images/product/manWeapon27.png', 100, 1),
(28, '男 武器28', 0, 5, 'images/product/manWeapon28.png', 100, 1),
(29, '男 武器29', 0, 5, 'images/product/manWeapon29.png', 100, 1),
(30, '女 武器30', 1, 5, 'images/product/womanWeapon30.png', 100, 1),
(31, '女 眼部31', 1, 4, 'images/product/womanEye31.png', 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ProductCategory`
--

CREATE TABLE `ProductCategory` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `e_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ProductCategory`
--

INSERT INTO `ProductCategory` (`id`, `name`, `e_name`) VALUES
(1, '頭髮', 'hair'),
(2, '套裝', 'suit'),
(3, '鞋子', 'shoe'),
(4, '眼部', 'eye'),
(5, '武器', 'weapon'),
(6, '肩膀', 'shoulder'),
(7, '手部', 'hand'),
(8, '頸部', 'neck');

-- --------------------------------------------------------

--
-- Table structure for table `Rating`
--

CREATE TABLE `Rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `failure` int(11) NOT NULL,
  `success` int(11) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Rating`
--

INSERT INTO `Rating` (`id`, `user_id`, `category_id`, `failure`, `success`, `rating`) VALUES
(2, 2, 27, 6, 4, 40),
(3, 3, 27, 1, 4, 80),
(4, 4, 27, 1, 2, 66.6667),
(5, 5, 27, 2, 1, 33.3333),
(6, 6, 27, 1, 1, 50),
(9, 1, 7, 22, 7, 24.1379);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nickname` varchar(30) CHARACTER SET utf8 NOT NULL,
  `email` varchar(60) NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `image` varchar(90) DEFAULT NULL,
  `verify_key` varchar(128) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'N',
  `forget_password_key` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ownAcc` varchar(200) DEFAULT NULL,
  `selectAcc` varchar(200) DEFAULT NULL,
  `money1` int(11) NOT NULL,
  `money2` int(11) NOT NULL,
  `money3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `username`, `password`, `nickname`, `email`, `gender`, `image`, `verify_key`, `status`, `forget_password_key`, `create_time`, `ownAcc`, `selectAcc`, `money1`, `money2`, `money3`) VALUES
(1, 'justin', 'justin0820', 'justin0u0', 'dancinglinkxalgorithm@gmail.com', b'0', '0', '', 'A', 'd214d11d329826c89b1e6f886af886bb', '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(2, 'a', 'a', 'a', 'a@gmail.com', b'1', '0', '', 'A', '16815712d05e2daedc9652e656f15d79', '2019-03-31 22:38:43', '00001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(3, 'peter10', 'ppeetteerr', 'peter', 'peter000@gmail.com', b'0', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(4, 'llstylish', 'prrrrrrrr', 'stylish', 'stylish@gmail.com', b'0', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(5, 'b', 'b', 'b', 'b@gmail.com', b'1', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(6, 'x', 'xxxxx', 'xxxxx', 'x@gmail.com', b'1', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(7, 'c', 'c', 'c', 'c@gmail.com', b'0', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(8, 'd', 'd', 'd', 'd@gmail.com', b'1', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(9, 'zz', 'zz', 'zz', 'zz@gmail.com', b'0', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(10, 'z', 'z', 'z', 'z@gmail.com', b'0', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(11, 'lalalal', 'lalal', 'ajkldafasdfsadf', 'la@gmail.com', b'1', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(12, 'jasdkf', 'ajsdkfjas', 'jaskldfj', 'ajklaf@gmail.com', b'0', '0', '', 'A', NULL, '2019-03-31 22:38:43', NULL, NULL, 0, 0, 0),
(13, 'test0331', 'test123', 'test', 'test@gmail.com', b'1', NULL, '', 'A', NULL, '2019-04-01 00:11:18', NULL, NULL, 0, 0, 0),
(20, 'y', 'y', 'y', 'shaokai0u0@gmail.com', b'0', NULL, 'cf1a72debfe3614e39406577b694cecb', 'N', NULL, '2019-04-03 00:51:10', NULL, NULL, 0, 0, 0),
(21, 'u', 'u', 'u', 'u@gmail.com', b'1', NULL, 'afaeec127a7e081535d95721b2dbf25f', 'N', NULL, '2019-04-04 03:55:27', NULL, NULL, 0, 0, 0),
(23, 't', 't', 't', 't@gmail.com', b'0', NULL, '41ce6b463a501a367fe3bf5af12c208e', 'N', NULL, '2019-04-04 03:57:42', NULL, NULL, 0, 0, 0),
(24, 'i', 'i', 'i', 'i@gmail.com', b'0', NULL, '4cd6246b3cd519d84626c2f08cd25a37', 'N', NULL, '2019-04-04 04:08:58', NULL, NULL, 0, 0, 0),
(25, 'l', 'l', 'l', 'l@gmail.com', b'1', NULL, '3d8ad64724897aacf50faf84d4936ec0', 'A', NULL, '2019-04-04 04:36:08', NULL, NULL, 0, 0, 0),
(26, 'op', 'op', 'op', 'op@gmail.com', b'0', NULL, '8aae82785d26853aaf931169e70dfa9b', 'N', NULL, '2019-04-04 04:40:07', NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `UserAsset`
--

CREATE TABLE `UserAsset` (
  `user_id` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `bonus` int(11) NOT NULL,
  `ownAcc` varchar(120) NOT NULL,
  `hairID` int(11) DEFAULT NULL,
  `suitID` int(11) DEFAULT NULL,
  `shoeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserAsset`
--

INSERT INTO `UserAsset` (`user_id`, `money`, `bonus`, `ownAcc`, `hairID`, `suitID`, `shoeID`) VALUES
(1, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(2, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(3, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(4, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(5, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(6, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(7, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(8, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(9, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(10, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(11, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(12, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0),
(13, 1000, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `BuyPredict`
--
ALTER TABLE `BuyPredict`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Follower`
--
ALTER TABLE `Follower`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Game`
--
ALTER TABLE `Game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `OnlineUser`
--
ALTER TABLE `OnlineUser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Predict`
--
ALTER TABLE `Predict`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ProductCategory`
--
ALTER TABLE `ProductCategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Rating`
--
ALTER TABLE `Rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `forget_password_key` (`forget_password_key`);

--
-- Indexes for table `UserAsset`
--
ALTER TABLE `UserAsset`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Article`
--
ALTER TABLE `Article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `BuyPredict`
--
ALTER TABLE `BuyPredict`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Class`
--
ALTER TABLE `Class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Comment`
--
ALTER TABLE `Comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Follower`
--
ALTER TABLE `Follower`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Game`
--
ALTER TABLE `Game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `Message`
--
ALTER TABLE `Message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `OnlineUser`
--
ALTER TABLE `OnlineUser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Predict`
--
ALTER TABLE `Predict`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `ProductCategory`
--
ALTER TABLE `ProductCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Rating`
--
ALTER TABLE `Rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
