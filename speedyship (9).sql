-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20251017.e515ecd108
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2026 at 11:37 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `speedyship`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int NOT NULL,
  `shipment_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `assigned_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('assigned','picking','delivering','completed','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'assigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `shipment_id`, `driver_id`, `assigned_at`, `status`) VALUES
(1, 1, 10, '2026-04-20 05:08:25', 'failed'),
(3, 5, 12, '2026-04-22 05:08:25', 'completed'),
(4, 6, 12, '2026-01-22 05:08:25', 'delivering'),
(5, 7, 7, '2026-04-20 05:08:25', 'completed'),
(6, 9, 12, '2026-04-24 05:08:25', 'completed'),
(7, 10, 12, '2026-04-26 05:08:25', 'completed'),
(8, 11, 7, '2025-12-26 05:08:25', 'completed'),
(9, 14, 12, '2026-01-21 05:08:25', 'completed'),
(10, 15, 6, '2026-04-22 05:08:25', 'picking'),
(11, 16, 10, '2026-02-19 05:08:25', 'delivering'),
(12, 17, 6, '2026-05-03 05:08:25', 'delivering'),
(13, 19, 12, '2026-04-25 05:08:25', 'completed'),
(14, 20, 7, '2026-02-21 05:08:25', 'completed'),
(15, 22, 2, '2026-04-24 05:08:25', 'delivering'),
(16, 23, 10, '2026-04-22 05:08:25', 'completed'),
(17, 24, 7, '2026-02-27 05:08:25', 'completed'),
(18, 25, 7, '2026-04-20 05:08:25', 'delivering'),
(19, 27, 11, '2026-03-12 05:08:25', 'completed'),
(20, 28, 11, '2026-05-02 05:08:25', 'delivering'),
(21, 29, 2, '2026-03-23 05:08:25', 'completed'),
(22, 30, 8, '2026-01-20 05:08:25', 'completed'),
(23, 33, 1, '2026-03-26 05:08:25', 'completed'),
(24, 34, 10, '2026-05-02 05:08:25', 'delivering'),
(25, 36, 11, '2026-05-01 05:08:25', 'completed'),
(26, 37, 7, '2026-04-05 05:08:25', 'completed'),
(27, 38, 7, '2026-04-19 05:08:25', 'completed'),
(28, 39, 10, '2026-03-09 05:08:25', 'completed'),
(29, 40, 9, '2026-04-30 05:08:25', 'completed'),
(30, 41, 8, '2026-03-25 05:08:26', 'delivering'),
(31, 43, 8, '2026-05-03 05:08:26', 'completed'),
(32, 44, 5, '2026-04-02 05:08:26', 'completed'),
(34, 48, 2, '2026-04-03 05:08:26', 'assigned'),
(35, 49, 1, '2026-03-06 05:08:26', 'picking'),
(36, 50, 9, '2026-04-28 05:08:26', 'delivering'),
(37, 51, 4, '2026-04-30 05:08:26', 'delivering'),
(38, 52, 7, '2026-04-24 05:08:26', 'completed'),
(39, 53, 6, '2026-04-14 05:08:26', 'delivering'),
(40, 54, 12, '2026-02-09 05:08:26', 'assigned'),
(41, 55, 6, '2026-03-20 05:08:26', 'completed'),
(42, 56, 10, '2026-05-03 05:08:26', 'picking'),
(43, 61, 8, '2026-04-26 05:08:26', 'completed'),
(45, 63, 2, '2026-04-28 05:08:26', 'delivering'),
(47, 65, 11, '2026-03-24 05:08:26', 'completed'),
(48, 66, 8, '2026-04-02 05:08:26', 'completed'),
(49, 67, 7, '2026-01-01 05:08:26', 'delivering'),
(53, 73, 1, '2026-05-01 05:08:26', 'assigned'),
(55, 76, 8, '2026-01-10 05:08:26', 'completed'),
(56, 78, 8, '2026-04-01 05:08:26', 'completed'),
(57, 79, 11, '2026-02-17 05:08:26', 'delivering'),
(59, 81, 10, '2026-05-03 05:08:26', 'delivering'),
(60, 85, 5, '2026-04-28 05:08:26', 'delivering'),
(61, 88, 3, '2026-05-01 05:08:26', 'completed'),
(62, 89, 2, '2026-04-10 05:08:26', 'completed'),
(63, 91, 3, '2026-04-21 05:08:27', 'delivering'),
(64, 93, 10, '2026-04-27 05:08:27', 'delivering'),
(65, 95, 6, '2026-04-21 05:08:27', 'completed'),
(66, 100, 6, '2026-02-22 05:08:27', 'delivering'),
(67, 101, 9, '2026-04-08 05:08:27', 'completed'),
(68, 103, 4, '2026-03-23 05:08:27', 'completed'),
(69, 104, 12, '2026-02-03 05:08:27', 'delivering'),
(72, 107, 2, '2026-04-01 05:08:27', 'completed'),
(73, 108, 12, '2026-03-28 05:08:27', 'completed'),
(75, 110, 6, '2026-04-04 05:08:27', 'completed'),
(76, 111, 6, '2026-04-21 05:08:27', 'completed'),
(77, 114, 5, '2026-03-29 05:08:27', 'completed'),
(78, 115, 5, '2026-04-24 05:08:27', 'completed'),
(79, 117, 10, '2026-04-29 05:08:27', 'completed'),
(80, 118, 12, '2026-04-26 05:08:27', 'completed'),
(81, 119, 3, '2026-03-30 05:08:27', 'delivering'),
(82, 120, 7, '2026-04-25 05:08:27', 'completed'),
(83, 245, 11, '2026-04-27 05:08:26', 'picking'),
(84, 240, 11, '2026-04-10 05:08:27', 'failed'),
(85, 271, 12, '2026-02-04 05:08:25', 'assigned'),
(86, 2, 8, '2026-05-03 06:01:08', 'assigned'),
(87, 3, 2, '2026-05-03 06:01:08', 'assigned'),
(88, 4, 6, '2026-05-03 06:01:08', 'assigned'),
(89, 8, 11, '2026-05-03 06:01:08', 'assigned'),
(90, 13, 7, '2026-05-03 06:01:08', 'assigned'),
(91, 18, 2, '2026-05-03 06:01:08', 'assigned'),
(92, 21, 8, '2026-05-03 06:01:08', 'assigned'),
(93, 26, 10, '2026-05-03 06:01:08', 'assigned'),
(94, 31, 2, '2026-05-03 06:01:08', 'assigned'),
(95, 32, 11, '2026-05-03 06:01:08', 'assigned'),
(96, 35, 7, '2026-05-03 06:01:08', 'assigned'),
(97, 42, 8, '2026-05-03 06:01:08', 'assigned'),
(98, 45, 12, '2026-05-03 06:01:08', 'assigned'),
(99, 46, 10, '2026-05-03 06:01:08', 'assigned'),
(100, 47, 11, '2026-05-03 06:01:08', 'assigned'),
(101, 57, 8, '2026-05-03 06:01:08', 'assigned'),
(102, 58, 1, '2026-05-03 06:01:08', 'assigned'),
(103, 59, 2, '2026-05-03 06:01:08', 'assigned'),
(104, 60, 1, '2026-05-03 06:01:08', 'assigned'),
(105, 62, 1, '2026-05-03 06:01:08', 'assigned'),
(106, 64, 4, '2026-05-03 06:01:08', 'assigned'),
(107, 69, 2, '2026-05-03 06:01:08', 'assigned'),
(108, 70, 12, '2026-05-03 06:01:08', 'assigned'),
(109, 71, 3, '2026-05-03 06:01:08', 'assigned'),
(110, 72, 10, '2026-05-03 06:01:08', 'assigned'),
(111, 74, 6, '2026-05-03 06:01:08', 'assigned'),
(112, 75, 2, '2026-05-03 06:01:08', 'assigned'),
(113, 77, 13, '2026-05-03 06:01:08', 'assigned'),
(114, 80, 7, '2026-05-03 06:01:08', 'assigned'),
(115, 82, 11, '2026-05-03 06:01:08', 'assigned'),
(116, 83, 13, '2026-05-03 06:01:08', 'assigned'),
(117, 84, 2, '2026-05-03 06:01:08', 'assigned'),
(118, 86, 11, '2026-05-03 06:01:08', 'assigned'),
(119, 87, 7, '2026-05-03 06:01:08', 'assigned'),
(120, 90, 11, '2026-05-03 06:01:08', 'assigned'),
(121, 92, 7, '2026-05-03 06:01:08', 'assigned'),
(122, 94, 1, '2026-05-03 06:01:08', 'assigned'),
(123, 96, 10, '2026-05-03 06:01:08', 'assigned'),
(124, 97, 1, '2026-05-03 06:01:08', 'assigned'),
(125, 98, 12, '2026-05-03 06:01:08', 'assigned'),
(126, 99, 10, '2026-05-03 06:01:08', 'assigned'),
(127, 102, 6, '2026-05-03 06:01:08', 'assigned'),
(128, 105, 2, '2026-05-03 06:01:08', 'assigned'),
(129, 106, 10, '2026-05-03 06:01:08', 'assigned'),
(130, 109, 10, '2026-05-03 06:01:08', 'assigned'),
(131, 112, 7, '2026-05-03 06:01:08', 'assigned'),
(132, 113, 5, '2026-05-03 06:01:08', 'assigned'),
(133, 116, 10, '2026-05-03 06:01:08', 'assigned'),
(134, 121, 5, '2026-05-03 06:01:08', 'assigned'),
(135, 122, 2, '2026-05-03 06:01:08', 'assigned'),
(136, 123, 4, '2026-05-03 06:01:08', 'assigned'),
(137, 124, 3, '2026-05-03 06:01:08', 'assigned'),
(138, 126, 8, '2026-05-03 06:01:08', 'assigned'),
(139, 127, 11, '2026-05-03 06:01:08', 'assigned'),
(140, 128, 1, '2026-05-03 06:01:08', 'assigned'),
(141, 129, 13, '2026-05-03 06:01:08', 'assigned'),
(142, 130, 6, '2026-05-03 06:01:08', 'assigned'),
(143, 131, 12, '2026-05-03 06:01:08', 'assigned'),
(144, 132, 10, '2026-05-03 06:01:08', 'assigned'),
(145, 133, 8, '2026-05-03 06:01:08', 'assigned'),
(146, 134, 11, '2026-05-03 06:01:08', 'assigned'),
(147, 136, 3, '2026-05-03 06:01:08', 'assigned'),
(148, 137, 6, '2026-05-03 06:01:08', 'assigned'),
(149, 138, 10, '2026-05-03 06:01:08', 'assigned'),
(150, 140, 13, '2026-05-03 06:01:08', 'assigned'),
(151, 141, 8, '2026-05-03 06:01:08', 'assigned'),
(152, 142, 8, '2026-05-03 06:01:08', 'assigned'),
(153, 143, 2, '2026-05-03 06:01:08', 'assigned'),
(154, 144, 4, '2026-05-03 06:01:08', 'assigned'),
(155, 145, 4, '2026-05-03 06:01:08', 'assigned'),
(156, 146, 9, '2026-05-03 06:01:08', 'assigned'),
(157, 147, 2, '2026-05-03 06:01:08', 'assigned'),
(158, 149, 5, '2026-05-03 06:01:08', 'assigned'),
(159, 150, 5, '2026-05-03 06:01:08', 'assigned'),
(160, 151, 8, '2026-05-03 06:01:08', 'assigned'),
(161, 152, 13, '2026-05-03 06:01:08', 'assigned'),
(162, 153, 12, '2026-05-03 06:01:08', 'assigned'),
(163, 154, 1, '2026-05-03 06:01:08', 'assigned'),
(164, 155, 13, '2026-05-03 06:01:08', 'completed'),
(165, 156, 3, '2026-05-03 06:01:08', 'assigned'),
(166, 157, 9, '2026-05-03 06:01:08', 'assigned'),
(167, 158, 12, '2026-05-03 06:01:08', 'assigned'),
(168, 159, 9, '2026-05-03 06:01:08', 'assigned'),
(169, 160, 13, '2026-05-03 06:01:08', 'assigned'),
(170, 161, 3, '2026-05-03 06:01:08', 'assigned'),
(171, 162, 8, '2026-05-03 06:01:08', 'assigned'),
(172, 163, 8, '2026-05-03 06:01:08', 'assigned'),
(173, 165, 4, '2026-05-03 06:01:08', 'assigned'),
(174, 166, 7, '2026-05-03 06:01:08', 'assigned'),
(175, 167, 11, '2026-05-03 06:01:08', 'assigned'),
(176, 168, 10, '2026-05-03 06:01:08', 'assigned'),
(177, 169, 9, '2026-05-03 06:01:08', 'assigned'),
(178, 170, 12, '2026-05-03 06:01:08', 'assigned'),
(179, 171, 13, '2026-05-03 06:01:08', 'completed'),
(180, 172, 10, '2026-05-03 06:01:08', 'assigned'),
(181, 173, 2, '2026-05-03 06:01:08', 'assigned'),
(182, 174, 3, '2026-05-03 06:01:08', 'assigned'),
(183, 175, 7, '2026-05-03 06:01:08', 'assigned'),
(184, 176, 11, '2026-05-03 06:01:08', 'assigned'),
(185, 177, 11, '2026-05-03 06:01:08', 'assigned'),
(186, 179, 3, '2026-05-03 06:01:08', 'assigned'),
(187, 180, 12, '2026-05-03 06:01:08', 'assigned'),
(188, 181, 7, '2026-05-03 06:01:08', 'assigned'),
(189, 182, 5, '2026-05-03 06:01:08', 'assigned'),
(190, 183, 4, '2026-05-03 06:01:08', 'assigned'),
(191, 184, 5, '2026-05-03 06:01:08', 'assigned'),
(192, 185, 4, '2026-05-03 06:01:08', 'assigned'),
(193, 186, 2, '2026-05-03 06:01:08', 'assigned'),
(194, 187, 2, '2026-05-03 06:01:08', 'assigned'),
(195, 188, 4, '2026-05-03 06:01:08', 'assigned'),
(196, 189, 7, '2026-05-03 06:01:08', 'assigned'),
(197, 190, 11, '2026-05-03 06:01:08', 'assigned'),
(198, 191, 12, '2026-05-03 06:01:08', 'assigned'),
(199, 192, 7, '2026-05-03 06:01:08', 'assigned'),
(200, 193, 8, '2026-05-03 06:01:08', 'assigned'),
(201, 194, 9, '2026-05-03 06:01:08', 'assigned'),
(202, 196, 12, '2026-05-03 06:01:08', 'assigned'),
(203, 197, 8, '2026-05-03 06:01:08', 'assigned'),
(204, 198, 10, '2026-05-03 06:01:08', 'assigned'),
(205, 199, 10, '2026-05-03 06:01:08', 'assigned'),
(206, 200, 13, '2026-05-03 06:01:08', 'completed'),
(207, 202, 3, '2026-05-03 06:01:08', 'assigned'),
(208, 204, 8, '2026-05-03 06:01:08', 'assigned'),
(209, 206, 10, '2026-05-03 06:01:08', 'assigned'),
(210, 207, 3, '2026-05-03 06:01:08', 'assigned'),
(211, 208, 1, '2026-05-03 06:01:08', 'assigned'),
(212, 209, 12, '2026-05-03 06:01:08', 'assigned'),
(213, 210, 7, '2026-05-03 06:01:08', 'assigned'),
(214, 211, 7, '2026-05-03 06:01:08', 'assigned'),
(215, 212, 7, '2026-05-03 06:01:08', 'assigned'),
(216, 213, 10, '2026-05-03 06:01:08', 'assigned'),
(217, 214, 7, '2026-05-03 06:01:08', 'assigned'),
(218, 216, 3, '2026-05-03 06:01:08', 'assigned'),
(219, 217, 4, '2026-05-03 06:01:08', 'assigned'),
(220, 219, 6, '2026-05-03 06:01:08', 'assigned'),
(221, 220, 1, '2026-05-03 06:01:08', 'assigned'),
(222, 221, 6, '2026-05-03 06:01:08', 'assigned'),
(223, 222, 10, '2026-05-03 06:01:08', 'assigned'),
(224, 223, 6, '2026-05-03 06:01:08', 'assigned'),
(225, 224, 9, '2026-05-03 06:01:08', 'assigned'),
(226, 225, 8, '2026-05-03 06:01:08', 'assigned'),
(227, 226, 8, '2026-05-03 06:01:08', 'assigned'),
(228, 227, 4, '2026-05-03 06:01:08', 'assigned'),
(229, 229, 5, '2026-05-03 06:01:08', 'assigned'),
(230, 230, 11, '2026-05-03 06:01:08', 'assigned'),
(231, 231, 10, '2026-05-03 06:01:08', 'assigned'),
(232, 232, 13, '2026-05-03 06:01:08', 'assigned'),
(233, 233, 1, '2026-05-03 06:01:08', 'assigned'),
(234, 234, 6, '2026-05-03 06:01:08', 'assigned'),
(235, 235, 7, '2026-05-03 06:01:08', 'assigned'),
(236, 236, 10, '2026-05-03 06:01:08', 'assigned'),
(237, 237, 8, '2026-05-03 06:01:08', 'assigned'),
(238, 239, 4, '2026-05-03 06:01:08', 'assigned'),
(239, 241, 5, '2026-05-03 06:01:08', 'assigned'),
(240, 242, 8, '2026-05-03 06:01:08', 'assigned'),
(241, 243, 8, '2026-05-03 06:01:08', 'assigned'),
(242, 244, 4, '2026-05-03 06:01:08', 'assigned'),
(243, 246, 11, '2026-05-03 06:01:08', 'assigned'),
(244, 247, 12, '2026-05-03 06:01:08', 'assigned'),
(245, 248, 5, '2026-05-03 06:01:08', 'assigned'),
(246, 249, 7, '2026-05-03 06:01:08', 'assigned'),
(247, 250, 2, '2026-05-03 06:01:08', 'assigned'),
(248, 251, 11, '2026-05-03 06:01:08', 'assigned'),
(249, 252, 2, '2026-05-03 06:01:08', 'assigned'),
(250, 253, 13, '2026-05-03 06:01:08', 'completed'),
(251, 254, 10, '2026-05-03 06:01:08', 'assigned'),
(252, 255, 13, '2026-05-03 06:01:08', 'assigned'),
(253, 256, 10, '2026-05-03 06:01:08', 'assigned'),
(254, 257, 11, '2026-05-03 06:01:08', 'assigned'),
(255, 258, 10, '2026-05-03 06:01:08', 'assigned'),
(256, 259, 12, '2026-05-03 06:01:08', 'assigned'),
(257, 260, 13, '2026-05-03 06:01:08', 'assigned'),
(258, 261, 7, '2026-05-03 06:01:08', 'assigned'),
(259, 262, 4, '2026-05-03 06:01:08', 'assigned'),
(260, 263, 10, '2026-05-03 06:01:08', 'assigned'),
(261, 264, 3, '2026-05-03 06:01:08', 'assigned'),
(262, 265, 1, '2026-05-03 06:01:08', 'assigned'),
(263, 266, 9, '2026-05-03 06:01:08', 'assigned'),
(264, 267, 9, '2026-05-03 06:01:08', 'assigned'),
(265, 268, 8, '2026-05-03 06:01:08', 'assigned'),
(266, 269, 3, '2026-05-03 06:01:08', 'assigned'),
(267, 270, 5, '2026-05-03 06:01:08', 'assigned'),
(268, 272, 13, '2026-05-03 06:01:08', 'assigned'),
(269, 273, 11, '2026-05-03 06:01:08', 'assigned'),
(270, 275, 9, '2026-05-03 06:01:08', 'assigned'),
(271, 276, 9, '2026-05-03 06:01:08', 'assigned'),
(272, 277, 5, '2026-05-03 06:01:08', 'assigned'),
(273, 278, 11, '2026-05-03 06:01:08', 'assigned'),
(274, 279, 4, '2026-05-03 06:01:08', 'assigned'),
(275, 280, 5, '2026-05-03 06:01:08', 'assigned'),
(276, 281, 5, '2026-05-03 06:01:08', 'assigned'),
(277, 282, 7, '2026-05-03 06:01:08', 'assigned'),
(278, 283, 5, '2026-05-03 06:01:08', 'assigned'),
(279, 284, 10, '2026-05-03 06:01:08', 'assigned'),
(280, 286, 2, '2026-05-03 06:01:08', 'assigned'),
(281, 287, 9, '2026-05-03 06:01:08', 'assigned'),
(282, 288, 9, '2026-05-03 06:01:08', 'assigned'),
(283, 289, 3, '2026-05-03 06:01:08', 'assigned'),
(284, 291, 7, '2026-05-03 06:01:08', 'assigned'),
(285, 292, 4, '2026-05-03 06:01:08', 'assigned'),
(286, 293, 12, '2026-05-03 06:01:08', 'assigned'),
(287, 294, 1, '2026-05-03 06:01:08', 'assigned'),
(288, 295, 2, '2026-05-03 06:01:08', 'assigned'),
(289, 296, 12, '2026-05-03 06:01:08', 'assigned'),
(290, 297, 6, '2026-05-03 06:01:08', 'assigned'),
(291, 298, 7, '2026-05-03 06:01:08', 'assigned'),
(292, 300, 6, '2026-05-03 06:01:08', 'assigned'),
(293, 302, 2, '2026-05-03 06:01:08', 'assigned'),
(294, 303, 7, '2026-05-03 06:01:08', 'assigned'),
(295, 304, 5, '2026-05-03 06:01:08', 'assigned'),
(296, 305, 1, '2026-05-03 06:01:08', 'assigned'),
(297, 306, 5, '2026-05-03 06:01:08', 'assigned'),
(298, 307, 8, '2026-05-03 06:01:08', 'assigned'),
(299, 308, 9, '2026-05-03 06:01:08', 'assigned'),
(300, 309, 4, '2026-05-03 06:01:08', 'assigned'),
(301, 312, 2, '2026-05-03 06:01:08', 'assigned'),
(302, 313, 9, '2026-05-03 06:01:08', 'assigned'),
(303, 314, 10, '2026-05-03 06:01:08', 'assigned'),
(304, 315, 12, '2026-05-03 06:01:08', 'assigned'),
(305, 316, 9, '2026-05-03 06:01:08', 'assigned'),
(306, 317, 11, '2026-05-03 06:01:08', 'assigned'),
(307, 318, 1, '2026-05-03 06:01:08', 'assigned'),
(308, 319, 2, '2026-05-03 06:01:08', 'assigned'),
(309, 320, 8, '2026-05-03 06:01:08', 'assigned'),
(310, 321, 6, '2026-05-03 06:01:08', 'assigned'),
(311, 322, 8, '2026-05-03 06:01:08', 'assigned'),
(312, 323, 1, '2026-05-03 06:01:08', 'assigned'),
(313, 324, 2, '2026-05-03 06:01:08', 'assigned'),
(314, 325, 12, '2026-05-03 06:01:08', 'assigned'),
(315, 326, 7, '2026-05-03 06:01:08', 'assigned'),
(316, 327, 2, '2026-05-03 06:01:08', 'assigned'),
(317, 328, 10, '2026-05-03 06:01:08', 'assigned'),
(318, 329, 8, '2026-05-03 06:01:08', 'assigned'),
(319, 330, 12, '2026-05-03 06:01:08', 'assigned'),
(320, 331, 8, '2026-05-03 06:01:08', 'assigned'),
(321, 333, 12, '2026-05-03 06:01:08', 'assigned'),
(322, 334, 6, '2026-05-03 06:01:08', 'assigned'),
(323, 335, 7, '2026-05-03 06:01:08', 'assigned'),
(324, 336, 9, '2026-05-03 06:01:08', 'assigned'),
(325, 337, 13, '2026-05-03 06:01:08', 'assigned'),
(326, 338, 9, '2026-05-03 06:01:08', 'assigned'),
(327, 339, 5, '2026-05-03 06:01:08', 'assigned'),
(328, 340, 11, '2026-05-03 06:01:08', 'assigned'),
(329, 341, 3, '2026-05-03 06:01:08', 'assigned'),
(330, 342, 1, '2026-05-03 06:01:08', 'assigned'),
(331, 343, 8, '2026-05-03 06:01:08', 'assigned'),
(332, 344, 12, '2026-05-03 06:01:08', 'assigned'),
(333, 345, 2, '2026-05-03 06:01:08', 'assigned'),
(334, 346, 10, '2026-05-03 06:01:08', 'assigned'),
(335, 347, 3, '2026-05-03 06:01:08', 'assigned'),
(336, 348, 11, '2026-05-03 06:01:08', 'assigned'),
(337, 349, 3, '2026-05-03 06:01:08', 'assigned'),
(338, 350, 6, '2026-05-03 06:01:08', 'assigned'),
(339, 352, 6, '2026-05-03 06:01:08', 'assigned'),
(340, 354, 2, '2026-05-03 06:01:08', 'assigned'),
(341, 355, 12, '2026-05-03 06:01:08', 'assigned'),
(342, 356, 4, '2026-05-03 06:01:08', 'assigned'),
(343, 357, 7, '2026-05-03 06:01:08', 'assigned'),
(344, 358, 8, '2026-05-03 06:01:08', 'assigned'),
(345, 359, 3, '2026-05-03 06:01:08', 'assigned'),
(346, 360, 11, '2026-05-03 06:01:08', 'assigned'),
(347, 361, 1, '2026-05-03 06:01:08', 'assigned'),
(348, 362, 4, '2026-05-03 06:01:08', 'assigned'),
(349, 363, 12, '2026-05-03 06:01:08', 'assigned'),
(350, 364, 2, '2026-05-03 06:01:08', 'assigned'),
(351, 366, 3, '2026-05-03 06:01:08', 'assigned'),
(352, 368, 3, '2026-05-03 06:01:08', 'assigned'),
(353, 369, 10, '2026-05-03 06:01:08', 'assigned'),
(354, 370, 2, '2026-05-03 06:01:09', 'assigned'),
(355, 371, 6, '2026-05-03 06:01:09', 'assigned'),
(356, 373, 1, '2026-05-03 06:01:09', 'assigned'),
(357, 374, 3, '2026-05-03 06:01:09', 'assigned'),
(358, 375, 8, '2026-05-03 06:01:09', 'assigned'),
(359, 376, 4, '2026-05-03 06:01:09', 'assigned'),
(360, 377, 9, '2026-05-03 06:01:09', 'assigned'),
(361, 378, 9, '2026-05-03 06:01:09', 'assigned'),
(362, 379, 8, '2026-05-03 06:01:09', 'assigned'),
(363, 380, 3, '2026-05-03 06:01:09', 'assigned'),
(364, 381, 13, '2026-05-03 06:01:09', 'assigned'),
(365, 382, 2, '2026-05-03 06:01:09', 'assigned'),
(366, 383, 6, '2026-05-03 06:01:09', 'assigned'),
(367, 384, 1, '2026-05-03 06:01:09', 'assigned'),
(368, 385, 8, '2026-05-03 06:01:09', 'assigned'),
(369, 386, 5, '2026-05-03 06:01:09', 'assigned'),
(370, 387, 3, '2026-05-03 06:01:09', 'assigned'),
(371, 388, 2, '2026-05-03 06:01:09', 'assigned'),
(372, 389, 11, '2026-05-03 06:01:09', 'assigned'),
(373, 390, 2, '2026-05-03 06:01:09', 'assigned'),
(374, 391, 1, '2026-05-03 06:01:09', 'assigned'),
(375, 392, 5, '2026-05-03 06:01:09', 'assigned'),
(376, 393, 5, '2026-05-03 06:01:09', 'assigned'),
(377, 394, 7, '2026-05-03 06:01:09', 'assigned'),
(378, 395, 11, '2026-05-03 06:01:09', 'assigned'),
(379, 396, 5, '2026-05-03 06:01:09', 'assigned'),
(380, 397, 2, '2026-05-03 06:01:09', 'assigned'),
(381, 398, 8, '2026-05-03 06:01:09', 'assigned'),
(382, 399, 3, '2026-05-03 06:01:09', 'assigned'),
(383, 400, 2, '2026-05-03 06:01:09', 'completed'),
(384, 401, 1, '2026-05-03 06:01:09', 'assigned'),
(385, 402, 4, '2026-05-03 06:01:09', 'assigned'),
(386, 403, 7, '2026-05-03 06:01:09', 'assigned'),
(387, 404, 5, '2026-05-03 06:01:09', 'assigned'),
(388, 405, 10, '2026-05-03 06:01:09', 'assigned'),
(389, 406, 5, '2026-05-03 06:01:09', 'assigned'),
(390, 407, 12, '2026-05-03 06:01:09', 'assigned'),
(391, 408, 2, '2026-05-03 06:01:09', 'completed'),
(392, 409, 2, '2026-05-03 06:01:09', 'assigned'),
(393, 410, 10, '2026-05-03 06:01:09', 'assigned'),
(394, 411, 6, '2026-05-03 06:01:09', 'assigned'),
(395, 412, 3, '2026-05-03 06:01:09', 'assigned'),
(396, 413, 11, '2026-05-03 06:01:09', 'assigned'),
(397, 414, 9, '2026-05-03 06:01:09', 'assigned'),
(398, 415, 13, '2026-05-03 06:01:09', 'assigned'),
(399, 416, 7, '2026-05-03 06:01:09', 'assigned'),
(400, 417, 2, '2026-05-03 06:01:09', 'assigned'),
(401, 418, 10, '2026-05-03 06:01:09', 'assigned'),
(402, 419, 12, '2026-05-03 06:01:09', 'assigned'),
(403, 420, 8, '2026-05-03 06:01:09', 'assigned'),
(404, 421, 11, '2026-05-03 06:01:09', 'assigned'),
(405, 422, 9, '2026-05-03 06:01:09', 'assigned'),
(406, 424, 10, '2026-05-03 06:01:09', 'assigned'),
(407, 425, 9, '2026-05-03 06:01:09', 'assigned'),
(408, 426, 9, '2026-05-03 06:01:09', 'assigned'),
(409, 427, 7, '2026-05-03 06:01:09', 'assigned'),
(410, 428, 4, '2026-05-03 06:01:09', 'assigned'),
(411, 429, 11, '2026-05-03 06:01:09', 'assigned'),
(412, 430, 13, '2026-05-03 06:01:09', 'assigned'),
(413, 431, 13, '2026-05-03 06:01:09', 'assigned'),
(414, 433, 11, '2026-05-03 06:01:09', 'assigned'),
(415, 434, 9, '2026-05-03 06:01:09', 'assigned'),
(416, 435, 5, '2026-05-03 06:01:09', 'assigned'),
(417, 436, 10, '2026-05-03 06:01:09', 'assigned'),
(418, 437, 4, '2026-05-03 06:01:09', 'assigned'),
(419, 438, 3, '2026-05-03 06:01:09', 'assigned'),
(420, 439, 5, '2026-05-03 06:01:09', 'assigned'),
(421, 440, 7, '2026-05-03 06:01:09', 'assigned'),
(422, 441, 7, '2026-05-03 06:01:09', 'assigned'),
(423, 442, 13, '2026-05-03 06:01:09', 'assigned'),
(424, 443, 10, '2026-05-03 06:01:09', 'assigned'),
(425, 444, 9, '2026-05-03 06:01:09', 'assigned'),
(426, 445, 4, '2026-05-03 06:01:09', 'assigned'),
(427, 446, 5, '2026-05-03 06:01:09', 'assigned'),
(428, 447, 2, '2026-05-03 06:01:09', 'assigned'),
(429, 449, 6, '2026-05-03 06:01:09', 'assigned'),
(430, 450, 5, '2026-05-03 06:01:09', 'assigned'),
(431, 451, 2, '2026-05-03 06:01:09', 'completed'),
(432, 452, 1, '2026-05-03 06:01:09', 'assigned'),
(433, 453, 3, '2026-05-03 06:01:09', 'assigned'),
(434, 454, 2, '2026-05-03 06:01:09', 'assigned'),
(435, 455, 6, '2026-05-03 06:01:09', 'assigned'),
(436, 456, 2, '2026-05-03 06:01:09', 'assigned'),
(437, 457, 10, '2026-05-03 06:01:09', 'assigned'),
(438, 458, 4, '2026-05-03 06:01:09', 'assigned'),
(439, 460, 9, '2026-05-03 06:01:09', 'assigned'),
(440, 461, 10, '2026-05-03 06:01:09', 'assigned'),
(441, 462, 11, '2026-05-03 06:01:09', 'assigned'),
(442, 463, 12, '2026-05-03 06:01:09', 'assigned'),
(443, 464, 12, '2026-05-03 06:01:09', 'assigned'),
(444, 465, 8, '2026-05-03 06:01:09', 'assigned'),
(445, 466, 1, '2026-05-03 06:01:09', 'assigned'),
(446, 468, 3, '2026-05-03 06:01:09', 'assigned'),
(447, 469, 11, '2026-05-03 06:01:09', 'assigned'),
(448, 470, 4, '2026-05-03 06:01:09', 'assigned'),
(449, 471, 11, '2026-05-03 06:01:09', 'assigned'),
(450, 472, 8, '2026-05-03 06:01:09', 'assigned'),
(451, 473, 4, '2026-05-03 06:01:09', 'assigned'),
(452, 474, 2, '2026-05-03 06:01:09', 'completed'),
(453, 476, 6, '2026-05-03 06:01:09', 'assigned'),
(454, 477, 2, '2026-05-03 06:01:09', 'assigned'),
(455, 478, 11, '2026-05-03 06:01:09', 'assigned'),
(456, 479, 11, '2026-05-03 06:01:09', 'assigned'),
(457, 480, 3, '2026-05-03 06:01:09', 'assigned'),
(458, 481, 2, '2026-05-03 06:01:09', 'completed'),
(459, 482, 1, '2026-05-03 06:01:09', 'assigned'),
(460, 483, 5, '2026-05-03 06:01:09', 'assigned'),
(461, 484, 8, '2026-05-03 06:01:09', 'assigned'),
(462, 485, 3, '2026-05-03 06:01:09', 'assigned'),
(463, 486, 5, '2026-05-03 06:01:09', 'assigned'),
(464, 487, 5, '2026-05-03 06:01:09', 'assigned'),
(465, 488, 1, '2026-05-03 06:01:09', 'assigned'),
(466, 489, 10, '2026-05-03 06:01:09', 'assigned'),
(467, 490, 12, '2026-05-03 06:01:09', 'assigned'),
(468, 491, 9, '2026-05-03 06:01:09', 'assigned'),
(469, 492, 6, '2026-05-03 06:01:09', 'assigned'),
(470, 493, 1, '2026-05-03 06:01:09', 'assigned'),
(471, 494, 3, '2026-05-03 06:01:09', 'assigned'),
(472, 495, 1, '2026-05-03 06:01:09', 'assigned'),
(473, 496, 12, '2026-05-03 06:01:09', 'assigned'),
(474, 497, 12, '2026-05-03 06:01:09', 'assigned'),
(475, 498, 3, '2026-05-03 06:01:09', 'assigned'),
(476, 499, 9, '2026-05-03 06:01:09', 'assigned'),
(477, 500, 8, '2026-05-03 06:01:09', 'assigned'),
(478, 501, 12, '2026-05-03 06:01:09', 'assigned'),
(479, 502, 13, '2026-05-03 06:01:09', 'assigned'),
(480, 503, 3, '2026-05-03 06:01:09', 'assigned'),
(481, 504, 13, '2026-05-03 06:01:09', 'assigned'),
(482, 505, 5, '2026-05-03 06:01:09', 'assigned'),
(483, 506, 6, '2026-05-03 06:01:09', 'assigned'),
(484, 507, 4, '2026-05-03 06:01:09', 'assigned'),
(485, 508, 12, '2026-05-03 06:01:09', 'assigned'),
(486, 509, 3, '2026-05-03 06:01:09', 'assigned'),
(487, 510, 4, '2026-05-03 06:01:09', 'assigned'),
(488, 512, 12, '2026-05-03 06:01:09', 'assigned'),
(489, 513, 3, '2026-05-03 06:01:09', 'assigned'),
(490, 514, 3, '2026-05-03 06:01:09', 'assigned'),
(491, 515, 1, '2026-05-03 06:01:09', 'assigned'),
(492, 516, 10, '2026-05-03 06:01:09', 'assigned'),
(493, 517, 13, '2026-05-03 06:01:09', 'completed'),
(494, 518, 13, '2026-05-03 06:01:09', 'assigned'),
(495, 519, 2, '2026-05-03 06:01:09', 'assigned'),
(496, 520, 8, '2026-05-03 06:01:09', 'assigned'),
(497, 521, 12, '2026-05-03 06:01:09', 'assigned'),
(498, 522, 9, '2026-05-03 06:01:09', 'assigned'),
(499, 523, 9, '2026-05-03 06:01:09', 'assigned'),
(500, 524, 2, '2026-05-03 06:01:09', 'completed'),
(501, 525, 4, '2026-05-03 06:01:09', 'assigned'),
(502, 527, 4, '2026-05-03 06:01:09', 'assigned'),
(503, 528, 2, '2026-05-03 06:01:09', 'completed'),
(504, 529, 7, '2026-05-03 06:01:09', 'assigned'),
(505, 530, 10, '2026-05-03 06:01:09', 'assigned'),
(506, 532, 3, '2026-05-03 06:01:09', 'assigned'),
(507, 533, 8, '2026-05-03 06:01:09', 'assigned'),
(508, 534, 12, '2026-05-03 06:01:09', 'assigned'),
(509, 535, 8, '2026-05-03 06:01:09', 'assigned'),
(510, 536, 8, '2026-05-03 06:01:09', 'assigned'),
(511, 537, 13, '2026-05-03 06:01:09', 'assigned'),
(512, 538, 5, '2026-05-03 06:01:09', 'assigned'),
(513, 539, 2, '2026-05-03 06:01:09', 'assigned'),
(514, 540, 12, '2026-05-03 06:01:09', 'assigned'),
(515, 541, 8, '2026-05-03 06:01:09', 'assigned'),
(516, 542, 10, '2026-05-03 06:01:09', 'assigned'),
(517, 543, 8, '2026-05-03 06:01:09', 'assigned'),
(518, 544, 7, '2026-05-03 06:01:09', 'assigned'),
(519, 545, 5, '2026-05-03 06:01:09', 'assigned'),
(520, 546, 11, '2026-05-03 06:01:09', 'assigned'),
(521, 548, 3, '2026-05-03 06:01:09', 'assigned'),
(522, 549, 4, '2026-05-03 06:01:09', 'assigned'),
(523, 550, 2, '2026-05-03 06:01:09', 'completed'),
(524, 551, 11, '2026-05-03 06:01:09', 'assigned'),
(525, 552, 9, '2026-05-03 06:01:09', 'assigned'),
(526, 553, 13, '2026-05-03 06:01:09', 'completed'),
(527, 554, 13, '2026-05-03 06:01:09', 'assigned'),
(528, 555, 1, '2026-05-03 06:01:09', 'assigned'),
(529, 556, 7, '2026-05-03 06:01:09', 'assigned'),
(530, 557, 7, '2026-05-03 06:01:09', 'assigned'),
(531, 558, 7, '2026-05-03 06:01:09', 'assigned'),
(532, 559, 2, '2026-05-03 06:01:09', 'completed'),
(533, 560, 3, '2026-05-03 06:01:09', 'assigned'),
(534, 561, 2, '2026-05-03 06:01:09', 'assigned'),
(535, 562, 1, '2026-05-03 06:01:09', 'assigned'),
(536, 563, 4, '2026-05-03 06:01:09', 'assigned'),
(537, 564, 10, '2026-05-03 06:01:09', 'assigned'),
(538, 565, 12, '2026-05-03 06:01:09', 'assigned'),
(539, 567, 11, '2026-05-03 06:01:09', 'assigned'),
(540, 568, 10, '2026-05-03 06:01:09', 'assigned'),
(541, 569, 3, '2026-05-03 06:01:09', 'assigned'),
(542, 570, 2, '2026-05-03 06:01:09', 'assigned'),
(543, 571, 3, '2026-05-03 06:01:09', 'assigned'),
(544, 332, 10, '2026-05-03 06:02:37', 'assigned'),
(545, 351, 10, '2026-05-03 06:02:37', 'assigned'),
(546, 290, 10, '2026-05-03 06:02:37', 'assigned'),
(547, 353, 10, '2026-05-03 06:02:37', 'assigned'),
(548, 301, 10, '2026-05-03 06:02:37', 'assigned'),
(549, 459, 12, '2026-05-03 06:02:43', 'assigned'),
(550, 215, 12, '2026-05-03 06:02:43', 'assigned'),
(551, 432, 12, '2026-05-03 06:02:43', 'assigned'),
(552, 139, 5, '2026-05-03 06:26:00', 'assigned');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `dispatcher_id` int DEFAULT NULL,
  `status` enum('active','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `started_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ended_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `customer_id`, `dispatcher_id`, `status`, `started_at`, `ended_at`) VALUES
(1, 5, NULL, 'active', '2026-05-02 21:38:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `assigned_to` int DEFAULT NULL,
  `status` enum('pending','approved','in_progress','resolved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `assigned_to`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Lê Văn Luyện', 'luyen@gmail.com', '0909001122', 'Cần tư vấn doanh nghiệp', NULL, 'pending', NULL, '2026-05-02 21:38:18', '2026-05-02 21:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `type` enum('home','office') DEFAULT 'home',
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `name`, `phone`, `address`, `type`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 9, 'nhà', '0363337081', 'Đường Nguyễn Huy Tưởng, Hòa Minh, 50600, Hoa Khanh, Đà Nẵng, Việt Nam', 'home', 1, '2025-12-24 06:41:15', '2026-03-29 05:14:14'),
(3, 45, 'Khanh', '0971832884', 'Tô hiệu, Phường Hòa Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'home', 1, '2026-03-27 13:28:13', '2026-03-27 13:28:13'),
(4, 9, 'Trường', '094567898', 'Viet An, Đà Nẵng, Việt Nam', 'office', 0, '2026-03-29 03:39:19', '2026-03-29 05:30:12'),
(5, 9, 'T123', '0321321321', '248, Điện Biên Phủ, Chính Gián, 50300, Thanh Khe, Đà Nẵng, Việt Nam', 'home', 0, '2026-03-29 05:30:38', '2026-03-29 05:30:38'),
(6, 9, 'Tr33', '0312321314', 'Mê Linh, Hòa Hiệp Nam, 50600, Hai Van, Đà Nẵng, Việt Nam', 'home', 0, '2026-03-29 05:32:35', '2026-03-29 05:32:35'),
(7, 9, 'Tre', '0128127891', '14, Dâm Thánh 4, Phường Hải Vân, Thành phố Đà Nẵng, 84236, Việt Nam', 'home', 0, '2026-03-29 05:44:06', '2026-03-29 05:44:06'),
(8, 9, 'sdaa', '0121133113', '81, Đường Yên Thế, Hòa An, Phường An Khê, Thành phố Đà Nẵng, 84236, Việt Nam', 'home', 0, '2026-03-29 05:46:34', '2026-03-29 05:46:34'),
(9, 5, 'Ngọc Trường', '0363337081', 'Kiệt 62 Nguyễn Huy Tưởng, Hòa Minh, Phường Hòa Khánh, Thành phố Đà Nẵng, 84236, Việt Nam', 'home', 1, '2026-05-02 22:30:39', '2026-05-02 22:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','busy','free','available','delivering') COLLATE utf8mb4_unicode_ci DEFAULT 'free',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` decimal(10,6) DEFAULT '10.762622',
  `longitude` decimal(10,6) DEFAULT '106.660172',
  `vehicle_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `region_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `email`, `phone`, `license_no`, `vehicle_type`, `status`, `user_id`, `created_at`, `latitude`, `longitude`, `vehicle_id`, `updated_at`, `region_id`) VALUES
(1, 'Hoàng Văn Nghĩa', 'tx.caugiay1@speedyship.com', '0224158063', 'B2-10011', 'Xe tải nhỏ', 'free', 11, '2026-05-02 21:38:17', 21.036600, 105.782000, 1, '2026-05-02 21:38:17', 'HN'),
(2, 'Lê Thanh Hùng', 'tx.dongda1@speedyship.com', '0273674735', 'B2-10012', 'Xe tải nhỏ', 'free', 12, '2026-05-02 21:38:17', 16.053630, 108.168266, 2, '2026-05-02 23:24:29', 'HN'),
(3, 'Phạm Trọng Đạt', 'tx.hoankiem1@speedyship.com', '0614552446', 'B2-10013', 'Xe tải nhỏ', 'free', 13, '2026-05-02 21:38:17', 21.028500, 105.854200, 3, '2026-05-02 21:38:17', 'HN'),
(4, 'Tài xế Demo (HN)', 'tx.demo.hn@speedyship.com', '0704427688', 'B2-10014', 'Xe tải nhỏ', 'free', 14, '2026-05-02 21:38:17', 21.020000, 105.840000, 4, '2026-05-02 21:38:17', 'HN'),
(5, 'Nguyễn Minh Tuấn', 'tx.govap1@speedyship.com', '0668487500', 'B2-10015', 'Xe tải nhỏ', 'free', 15, '2026-05-02 21:38:17', 10.838600, 106.665900, 5, '2026-05-02 21:38:17', 'HCM'),
(6, 'Trần Đình Bảo', 'tx.quan11@speedyship.com', '0739253755', 'B2-10016', 'Xe tải nhỏ', 'free', 16, '2026-05-02 21:38:17', 10.776900, 106.700900, 6, '2026-05-02 21:38:17', 'HCM'),
(7, 'Vũ Xuân Tiến', 'tx.binhthanh1@speedyship.com', '0306570989', 'B2-10017', 'Xe tải nhỏ', 'free', 17, '2026-05-02 21:38:17', 10.806100, 106.708800, 7, '2026-05-02 21:38:17', 'HCM'),
(8, 'Tài xế Demo (HCM)', 'tx.demo.hcm@speedyship.com', '0889290217', 'B2-10018', 'Xe tải nhỏ', 'free', 18, '2026-05-02 21:38:17', 10.780000, 106.690000, 8, '2026-05-02 21:38:17', 'HCM'),
(9, 'Phan Anh Kiệt', 'tx.lienchieu1@speedyship.com', '0261149607', 'B2-10019', 'Xe tải nhỏ', 'free', 19, '2026-05-02 21:38:17', 16.085000, 108.150000, 9, '2026-05-02 21:38:17', 'DN'),
(10, 'Bùi Quốc Anh', 'tx.haichau1@speedyship.com', '0414547504', 'B2-10020', 'Xe tải nhỏ', 'free', 20, '2026-05-02 21:38:17', 16.047100, 108.206800, 10, '2026-05-02 21:38:17', 'DN'),
(11, 'Hoàng Văn Nghĩa', 'tx.sontra1@speedyship.com', '0729853869', 'B2-10021', 'Xe tải nhỏ', 'free', 21, '2026-05-02 21:38:17', 16.053646, 108.168315, 11, '2026-05-02 22:48:50', 'DN'),
(12, 'Tài xế Demo (DN)', 'tx.demo.dn@speedyship.com', '0243075931', 'B2-10022', 'Xe tải nhỏ', 'free', 22, '2026-05-02 21:38:17', 16.053640, 108.168277, 12, '2026-05-02 22:05:36', 'DN'),
(13, 'Nguyễn Hoàng', 'hoang@gmail.com', '0909001122', '51C-12345', 'Xe tải', 'free', 23, '2026-05-02 21:47:49', 16.053630, 108.168266, 12, '2026-05-02 23:24:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_applications`
--

CREATE TABLE `driver_applications` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `license_plate` varchar(50) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `driver_applications`
--

INSERT INTO `driver_applications` (`id`, `name`, `phone`, `email`, `license_plate`, `vehicle_type`, `experience`, `status`, `created_at`) VALUES
(1, 'Nguyễn Hoàng', '0909001122', 'hoang@gmail.com', '51C-12345', 'Xe tải', '2 năm', 'approved', '2026-05-02 21:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `shipment_id` int DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` int DEFAULT '5',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `customer_id`, `shipment_id`, `content`, `rating`, `created_at`) VALUES
(1, 5, 5, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(2, 6, 24, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(3, 6, 29, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(4, 7, 41, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(5, 7, 54, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(6, 7, 56, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(7, 8, 63, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(8, 10, 118, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18'),
(9, 10, 119, 'Dịch vụ cực kỳ xuất sắc!', 5, '2026-05-02 21:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `chat_id` int NOT NULL,
  `sender_id` int DEFAULT NULL,
  `role` enum('customer','dispatcher') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `chat_id`, `sender_id`, `role`, `content`, `created_at`) VALUES
(1, 1, 5, 'customer', 'Chào admin', '2026-05-02 21:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `content` longtext,
  `image` varchar(500) DEFAULT NULL,
  `author` varchar(100) DEFAULT 'Admin',
  `comments` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `desc`, `content`, `image`, `author`, `comments`, `created_at`, `updated_at`) VALUES
(2, 'Phát triển ngành dịch vụ logistics Việt Nam trong bối cảnh hiện nay', 'Logistics là một ngành dịch vụ quan trọng trong cơ cấu tổng thể nền kinh tế quốc dân, đóng vai trò hỗ trợ, kết nối và thúc đẩy phát triển kinh tế - xã hội của cả nước cũng như từng địa phương, góp phần nâng cao năng lực cạnh tranh của nền kinh tế. Việt Nam được đánh giá là thị trường đầy tiềm năng và hấp dẫn cho sự phát triển của ngành dịch vụ logistics. Bài viết đánh giá thực trạng phát triển của ngành dịch vụ logistics hiện nay, từ đó đưa ra một số giải pháp nhằm thúc đẩy ngành dịch vụ này.', '<p><strong style=\"color: rgb(0, 0, 0);\">Từ&nbsp;khóa</strong><span style=\"color: rgb(0, 0, 0);\">:&nbsp;</span><em style=\"color: rgb(0, 0, 0);\">dịch&nbsp;vụ&nbsp;logistics,&nbsp;LPI,&nbsp;chi&nbsp;phí,&nbsp;hạ&nbsp;tầng&nbsp;giao&nbsp;thông,&nbsp;hoạt&nbsp;động&nbsp;vận&nbsp;tải,&nbsp;lưu&nbsp;thông&nbsp;hàng&nbsp;hóa</em></p><p><strong style=\"color: rgb(0, 0, 0);\">Summary</strong></p><p><em style=\"color: rgb(0, 0, 0);\">Logistics&nbsp;is&nbsp;an&nbsp;important&nbsp;service&nbsp;industry&nbsp;in&nbsp;the&nbsp;overall&nbsp;structure&nbsp;of&nbsp;the&nbsp;national&nbsp;economy,&nbsp;playing&nbsp;the&nbsp;role&nbsp;of&nbsp;supporting,&nbsp;connecting&nbsp;and&nbsp;promoting&nbsp;socio-economic&nbsp;development&nbsp;of&nbsp;the&nbsp;whole&nbsp;country&nbsp;as&nbsp;well&nbsp;as&nbsp;each&nbsp;locality,&nbsp;contributing&nbsp;to&nbsp;improving&nbsp;competitiveness&nbsp;of&nbsp;the&nbsp;whole&nbsp;economy.&nbsp;Vietnam&nbsp;is&nbsp;considered&nbsp;as&nbsp;a&nbsp;potential&nbsp;and&nbsp;attractive&nbsp;market&nbsp;for&nbsp;the&nbsp;development&nbsp;of&nbsp;the&nbsp;logistics&nbsp;service&nbsp;industry.&nbsp;The&nbsp;article&nbsp;assesses&nbsp;the&nbsp;current&nbsp;development&nbsp;of&nbsp;the&nbsp;logistics&nbsp;service&nbsp;industry,&nbsp;thereby&nbsp;proposing&nbsp;some&nbsp;solutions&nbsp;to&nbsp;promote&nbsp;this&nbsp;service&nbsp;industry.</em></p><p><strong style=\"color: rgb(0, 0, 0);\">Keywords</strong><em style=\"color: rgb(0, 0, 0);\">:&nbsp;logistics&nbsp;services,&nbsp;LPI,&nbsp;costs,&nbsp;transportation&nbsp;infrastructure,&nbsp;transportation&nbsp;activities,&nbsp;circulation&nbsp;of&nbsp;goods</em></p><p><strong style=\"color: rgb(0, 0, 0);\">GIỚI&nbsp;THIỆU</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Những&nbsp;năm&nbsp;gần&nbsp;đây,&nbsp;thương&nbsp;mại&nbsp;toàn&nbsp;cầu&nbsp;và&nbsp;trong&nbsp;nước&nbsp;gặp&nbsp;nhiều&nbsp;khó&nbsp;khăn&nbsp;do&nbsp;ảnh&nbsp;hưởng&nbsp;của&nbsp;đại&nbsp;dịch&nbsp;Covid-19,&nbsp;những&nbsp;rủi&nbsp;ro,&nbsp;bất&nbsp;ổn&nbsp;về&nbsp;kinh&nbsp;tế,&nbsp;chính&nbsp;trị&nbsp;trên&nbsp;phạm&nbsp;vi&nbsp;toàn&nbsp;cầu.&nbsp;Chuỗi&nbsp;cung&nbsp;ứng&nbsp;toàn&nbsp;cầu&nbsp;bị&nbsp;đứt&nbsp;gãy&nbsp;và&nbsp;đảo&nbsp;lộn,&nbsp;trong&nbsp;đó&nbsp;có&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;vốn&nbsp;được&nbsp;coi&nbsp;là&nbsp;“xương&nbsp;sống”&nbsp;của&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;cũng&nbsp;bị&nbsp;ảnh&nbsp;hưởng&nbsp;mạnh&nbsp;mẽ.&nbsp;Thực&nbsp;tế&nbsp;đó&nbsp;đã&nbsp;đặt&nbsp;ra&nbsp;yêu&nbsp;cầu&nbsp;đối&nbsp;với&nbsp;ngành&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;trong&nbsp;việc&nbsp;khắc&nbsp;phục&nbsp;những&nbsp;vấn&nbsp;đề&nbsp;nảy&nbsp;sinh&nbsp;trong&nbsp;đợt&nbsp;dịch&nbsp;Covid-19&nbsp;vừa&nbsp;qua,&nbsp;đồng&nbsp;thời&nbsp;vượt&nbsp;qua&nbsp;những&nbsp;khó&nbsp;khăn,&nbsp;thách&nbsp;thức&nbsp;và&nbsp;tận&nbsp;dụng&nbsp;cơ&nbsp;hội&nbsp;chuyển&nbsp;đổi&nbsp;phương&nbsp;pháp&nbsp;tổ&nbsp;chức&nbsp;sản&nbsp;xuất&nbsp;truyền&nbsp;thống,&nbsp;từ&nbsp;đó&nbsp;khẳng&nbsp;định&nbsp;vị&nbsp;thế&nbsp;của&nbsp;mình&nbsp;trên&nbsp;thị&nbsp;trường&nbsp;trong&nbsp;và&nbsp;ngoài&nbsp;nước.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">CƠ&nbsp;CHẾ,&nbsp;CHÍNH&nbsp;SÁCH&nbsp;TẠO&nbsp;ĐIỀU&nbsp;KIỆN&nbsp;PHÁT&nbsp;TRIỂN&nbsp;NGÀNH&nbsp;DỊCH&nbsp;VỤ&nbsp;LOGISTICS&nbsp;Ở&nbsp;VIỆT&nbsp;NAM&nbsp;HIỆN&nbsp;NAY</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Nghị&nbsp;quyết&nbsp;Đại&nbsp;hội&nbsp;đại&nbsp;biểu&nbsp;toàn&nbsp;quốc&nbsp;của&nbsp;Đảng&nbsp;lần&nbsp;thứ&nbsp;XII&nbsp;xác&nbsp;định,&nbsp;logistics&nbsp;là&nbsp;một&nbsp;“ngành&nbsp;dịch&nbsp;vụ&nbsp;giá&nbsp;trị&nbsp;gia&nbsp;tăng&nbsp;cao”&nbsp;và&nbsp;phải&nbsp;“hiện&nbsp;đại&nbsp;và&nbsp;mở&nbsp;rộng”&nbsp;dịch&nbsp;vụ&nbsp;logistics.&nbsp;Để&nbsp;tận&nbsp;dụng&nbsp;các&nbsp;lợi&nbsp;thế,&nbsp;cơ&nbsp;hội&nbsp;và&nbsp;đưa&nbsp;lĩnh&nbsp;vực&nbsp;logistics&nbsp;trở&nbsp;thành&nbsp;một&nbsp;ngành&nbsp;kinh&nbsp;tế&nbsp;mũi&nbsp;nhọn,&nbsp;đóng&nbsp;góp&nbsp;tích&nbsp;cực&nbsp;vào&nbsp;cải&nbsp;thiện&nbsp;năng&nbsp;lực&nbsp;cạnh&nbsp;tranh&nbsp;của&nbsp;nền&nbsp;kinh&nbsp;tế,&nbsp;thời&nbsp;gian&nbsp;qua,&nbsp;Đảng&nbsp;và&nbsp;Nhà&nbsp;nước&nbsp;đã&nbsp;ban&nbsp;hành&nbsp;nhiều&nbsp;chủ&nbsp;trương,&nbsp;chính&nbsp;sách&nbsp;đối&nbsp;với&nbsp;hoạt&nbsp;động&nbsp;này.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Nghị&nbsp;quyết&nbsp;Đại&nbsp;hội&nbsp;đại&nbsp;biểu&nbsp;toàn&nbsp;quốc&nbsp;của&nbsp;Đảng&nbsp;lần&nbsp;thứ&nbsp;XIII&nbsp;đã&nbsp;xác&nbsp;định,&nbsp;xây&nbsp;dựng&nbsp;kết&nbsp;cấu&nbsp;hạ&nbsp;tầng&nbsp;đồng&nbsp;bộ&nbsp;là&nbsp;1&nbsp;trong&nbsp;3&nbsp;đột&nbsp;phá&nbsp;chiến&nbsp;lược&nbsp;để&nbsp;phát&nbsp;triển&nbsp;đất&nbsp;nước.&nbsp;Thực&nbsp;hiện&nbsp;nhiệm&nbsp;vụ&nbsp;trên,&nbsp;nước&nbsp;ta&nbsp;đã&nbsp;từng&nbsp;bước&nbsp;nâng&nbsp;cấp&nbsp;đường&nbsp;bộ,&nbsp;đường&nbsp;sắt,&nbsp;đường&nbsp;không,&nbsp;đường&nbsp;biển,&nbsp;đường&nbsp;thủy&nbsp;nội&nbsp;địa&nbsp;giữa&nbsp;các&nbsp;địa&nbsp;phương&nbsp;và&nbsp;kết&nbsp;nối&nbsp;đồng&nbsp;thời&nbsp;với&nbsp;các&nbsp;nước.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Cụ&nbsp;thể&nbsp;hóa&nbsp;chủ&nbsp;trương&nbsp;của&nbsp;Đảng,&nbsp;Chính&nbsp;phủ&nbsp;đã&nbsp;ban&nbsp;hành&nbsp;hàng&nbsp;loạt&nbsp;những&nbsp;chính&nbsp;sách.&nbsp;Điển&nbsp;hình&nbsp;như:&nbsp;ngày&nbsp;14/2/2017,&nbsp;Thủ&nbsp;tướng&nbsp;Chính&nbsp;phủ&nbsp;đã&nbsp;ký&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;200/QĐ-TTg&nbsp;ban&nbsp;hành&nbsp;Kế&nbsp;hoạch&nbsp;hành&nbsp;động&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;cạnh&nbsp;tranh&nbsp;và&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;đến&nbsp;năm&nbsp;2025.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Ngày&nbsp;15/5/2018,&nbsp;Chính&nbsp;phủ&nbsp;ban&nbsp;hành&nbsp;Nghị&nbsp;quyết&nbsp;số&nbsp;19/2018/NQ-CP&nbsp;về&nbsp;tiếp&nbsp;tục&nbsp;thực&nbsp;hiện&nbsp;những&nbsp;nhiệm&nbsp;vụ,&nbsp;giải&nbsp;pháp&nbsp;chủ&nbsp;yếu&nbsp;cải&nbsp;thiện&nbsp;môi&nbsp;trường&nbsp;kinh&nbsp;doanh,&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;cạnh&nbsp;tranh&nbsp;quốc&nbsp;gia&nbsp;năm&nbsp;2018&nbsp;và&nbsp;những&nbsp;năm&nbsp;tiếp&nbsp;theo,&nbsp;trong&nbsp;đó,&nbsp;đề&nbsp;ra&nbsp;mục&nbsp;tiêu&nbsp;từng&nbsp;bước&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;logistics&nbsp;xuống&nbsp;mức&nbsp;bằng&nbsp;khoảng&nbsp;18%&nbsp;GDP;&nbsp;Cải&nbsp;thiện&nbsp;Xếp&nbsp;hạng&nbsp;theo&nbsp;chỉ&nbsp;số&nbsp;năng&nbsp;lực&nbsp;quốc&nbsp;gia&nbsp;về&nbsp;logistics&nbsp;(LPI)&nbsp;thêm&nbsp;10&nbsp;bậc&nbsp;(hiện&nbsp;xếp&nbsp;thứ&nbsp;64/160)...</span></p><p><span style=\"color: rgb(0, 0, 0);\">Ngày&nbsp;18/7/2018,&nbsp;Thủ&nbsp;tướng&nbsp;Chính&nbsp;phủ&nbsp;ban&nbsp;hành&nbsp;Chỉ&nbsp;thị&nbsp;số&nbsp;21/CT-TTg&nbsp;về&nbsp;đẩy&nbsp;mạnh&nbsp;triển&nbsp;khai&nbsp;các&nbsp;giải&nbsp;pháp&nbsp;nhằm&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;logistics,&nbsp;kết&nbsp;nối&nbsp;hiệu&nbsp;quả&nbsp;hệ&nbsp;thống&nbsp;hạ&nbsp;tầng&nbsp;giao&nbsp;thông.&nbsp;Theo&nbsp;đó,&nbsp;Thủ&nbsp;tướng&nbsp;Chính&nbsp;phủ&nbsp;yêu&nbsp;cầu&nbsp;tập&nbsp;trung&nbsp;cải&nbsp;thiện&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;gắn&nbsp;với&nbsp;thương&nbsp;mại&nbsp;điện&nbsp;tử,&nbsp;kết&nbsp;hợp&nbsp;logistics&nbsp;với&nbsp;thương&nbsp;mại&nbsp;điện&nbsp;tử&nbsp;theo&nbsp;xu&nbsp;hướng&nbsp;phát&nbsp;triển&nbsp;hiện&nbsp;nay&nbsp;trên&nbsp;thế&nbsp;giới&nbsp;và&nbsp;khu&nbsp;vực;&nbsp;Khuyến&nbsp;khích,&nbsp;hướng&nbsp;dẫn&nbsp;DN&nbsp;trong&nbsp;một&nbsp;số&nbsp;ngành&nbsp;áp&nbsp;dụng&nbsp;mô&nbsp;hình&nbsp;quản&nbsp;trị&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;tiên&nbsp;tiến&nbsp;trong&nbsp;quá&nbsp;trình&nbsp;sản&nbsp;xuất,&nbsp;kinh&nbsp;doanh,&nbsp;trong&nbsp;đó&nbsp;chú&nbsp;trọng&nbsp;triển&nbsp;khai&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;trên&nbsp;nền&nbsp;tảng&nbsp;công&nbsp;nghệ&nbsp;thông&nbsp;tin&nbsp;và&nbsp;các&nbsp;công&nbsp;nghệ&nbsp;mới...</span></p><p><span style=\"color: rgb(0, 0, 0);\">Đến&nbsp;ngày&nbsp;22/02/2021,&nbsp;Thủ&nbsp;tướng&nbsp;Chính&nbsp;phủ&nbsp;tiếp&nbsp;tục&nbsp;ban&nbsp;hành&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;</span><a href=\"https://vanban.chinhphu.vn/?pageid=27160&amp;docid=202698\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">221/QĐ-TTg&nbsp;</a><span style=\"color: rgb(0, 0, 0);\">sửa&nbsp;đổi,&nbsp;bổ&nbsp;sung&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;</span><a href=\"https://vanban.chinhphu.vn/?pageid=27160&amp;docid=188271\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">200/QĐ-TTg,</a><span style=\"color: rgb(0, 0, 0);\">&nbsp;ngày&nbsp;14/02/2017&nbsp;về&nbsp;việc&nbsp;phê&nbsp;duyệt&nbsp;Kế&nbsp;hoạch&nbsp;hành&nbsp;động&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;cạnh&nbsp;tranh&nbsp;và&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;đến&nbsp;năm&nbsp;2025&nbsp;và&nbsp;Nghị&nbsp;quyết&nbsp;số&nbsp;</span><a href=\"https://vanban.chinhphu.vn/?pageid=27160&amp;docid=205273\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">11/NQ-CP,&nbsp;</a><span style=\"color: rgb(0, 0, 0);\">ngày&nbsp;30/01/2022&nbsp;của&nbsp;Chính&nbsp;phủ&nbsp;về&nbsp;Chương&nbsp;trình&nbsp;phục&nbsp;hồi&nbsp;và&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế&nbsp;-&nbsp;xã&nbsp;hội,&nbsp;để&nbsp;góp&nbsp;phần&nbsp;đưa&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;sớm&nbsp;vượt&nbsp;qua&nbsp;khó&nbsp;khăn,&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;logistics&nbsp;đáp&nbsp;ứng&nbsp;được&nbsp;với&nbsp;sự&nbsp;vận&nbsp;hành&nbsp;của&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;trong&nbsp;giai&nbsp;đoạn&nbsp;mới,&nbsp;không&nbsp;lỡ&nbsp;nhịp&nbsp;với&nbsp;tiến&nbsp;trình&nbsp;phục&nbsp;hồi&nbsp;kinh&nbsp;tế&nbsp;toàn&nbsp;cầu,&nbsp;đồng&nbsp;thời&nbsp;tạo&nbsp;nền&nbsp;tảng&nbsp;và&nbsp;điều&nbsp;kiện&nbsp;thuận&nbsp;lợi&nbsp;cho&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;nói&nbsp;riêng&nbsp;và&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;nói&nbsp;chung&nbsp;cho&nbsp;cả&nbsp;giai&nbsp;đoạn&nbsp;đến&nbsp;năm&nbsp;2025&nbsp;và&nbsp;các&nbsp;năm&nbsp;tiếp&nbsp;theo.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Gần&nbsp;đây&nbsp;nhất,&nbsp;ngày&nbsp;16/12/2022,&nbsp;Thủ&nbsp;tướng&nbsp;Chính&nbsp;phủ&nbsp;đã&nbsp;ban&nbsp;hành&nbsp;Nghị&nbsp;quyết&nbsp;số&nbsp;163/NQ-CP&nbsp;về&nbsp;việc&nbsp;đẩy&nbsp;mạnh&nbsp;triển&nbsp;khai&nbsp;đồng&nbsp;bộ&nbsp;các&nbsp;nhiệm&nbsp;vụ,&nbsp;giải&nbsp;pháp&nbsp;chủ&nbsp;yếu&nbsp;nhằm&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;cạnh&nbsp;tranh&nbsp;và&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;với&nbsp;quan&nbsp;điểm:&nbsp;Phát&nbsp;triển&nbsp;logistics&nbsp;gắn&nbsp;với&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;bền&nbsp;vững,&nbsp;nâng&nbsp;cao&nbsp;chất&nbsp;lượng&nbsp;nguồn&nbsp;nhân&nbsp;lực,&nbsp;đẩy&nbsp;mạnh&nbsp;chuyển&nbsp;đổi&nbsp;số&nbsp;và&nbsp;ứng&nbsp;dụng&nbsp;công&nbsp;nghệ.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Bên&nbsp;cạnh&nbsp;đó,&nbsp;việc&nbsp;thực&nbsp;hiện&nbsp;Cơ&nbsp;chế&nbsp;Một&nbsp;cửa&nbsp;ASEAN&nbsp;và&nbsp;Cơ&nbsp;chế&nbsp;Một&nbsp;cửa&nbsp;Quốc&nbsp;gia&nbsp;đã&nbsp;được&nbsp;luật&nbsp;hóa&nbsp;tại&nbsp;Luật&nbsp;Hải&nbsp;quan&nbsp;năm&nbsp;2014&nbsp;và&nbsp;Nghị&nbsp;định&nbsp;số&nbsp;08/2015/NĐ-CP&nbsp;của&nbsp;Chính&nbsp;phủ,&nbsp;đã&nbsp;mang&nbsp;lại&nbsp;cho&nbsp;DN&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;nhiều&nbsp;lợi&nbsp;ích,&nbsp;như:&nbsp;Giảm&nbsp;thời&nbsp;gian&nbsp;thực&nbsp;hiện&nbsp;thủ&nbsp;tục&nbsp;hành&nbsp;chính;&nbsp;Giảm&nbsp;số&nbsp;hồ&nbsp;sơ&nbsp;phải&nbsp;nộp&nbsp;cho&nbsp;các&nbsp;cơ&nbsp;quan&nbsp;quản&nbsp;lý;&nbsp;Đơn&nbsp;giản&nbsp;hóa&nbsp;quy&nbsp;trình&nbsp;giao&nbsp;tiếp&nbsp;với&nbsp;cơ&nbsp;quan&nbsp;quản&nbsp;lý...&nbsp;Với&nbsp;việc&nbsp;hàng&nbsp;loạt&nbsp;các&nbsp;chứng&nbsp;từ&nbsp;phải&nbsp;nộp,&nbsp;phải&nbsp;xuất&nbsp;trình&nbsp;được&nbsp;đơn&nbsp;giản&nbsp;hóa,&nbsp;thậm&nbsp;chí&nbsp;loại&nbsp;bỏ&nbsp;và&nbsp;kéo&nbsp;theo&nbsp;lợi&nbsp;ích&nbsp;mang&nbsp;lại&nbsp;cho&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;về&nbsp;mặt&nbsp;chi&nbsp;phí&nbsp;và&nbsp;thời&nbsp;gian&nbsp;thực&nbsp;hiện&nbsp;thủ&nbsp;tục&nbsp;hành&nbsp;chính&nbsp;trong&nbsp;hoạt&nbsp;động&nbsp;logistics.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">THỰC&nbsp;TRẠNG&nbsp;PHÁT&nbsp;TRIỂN&nbsp;NGÀNH&nbsp;DỊCH&nbsp;VỤ&nbsp;LOGISTICS&nbsp;Ở&nbsp;VIỆT&nbsp;NAM&nbsp;HIỆN&nbsp;NAY</strong></p><p><strong style=\"color: rgb(0, 0, 0);\">Kết&nbsp;quả&nbsp;đạt&nbsp;được</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Nằm&nbsp;ở&nbsp;trung&nbsp;tâm&nbsp;khu&nbsp;vực&nbsp;châu&nbsp;Á&nbsp;-&nbsp;Thái&nbsp;Bình&nbsp;Dương,&nbsp;trên&nbsp;tuyến&nbsp;hàng&nbsp;hải&nbsp;quốc&nbsp;tế;&nbsp;đặc&nbsp;biệt&nbsp;có&nbsp;tuyến&nbsp;bờ&nbsp;biển&nbsp;dài,&nbsp;nhiều&nbsp;địa&nbsp;điểm&nbsp;có&nbsp;thể&nbsp;xây&nbsp;cảng&nbsp;nước&nbsp;sâu,&nbsp;cơ&nbsp;hội&nbsp;hội&nbsp;nhập&nbsp;kinh&nbsp;tế&nbsp;quốc&nbsp;tế&nbsp;ngày&nbsp;càng&nbsp;sâu&nbsp;rộng&nbsp;với&nbsp;nhiều&nbsp;hiệp&nbsp;định&nbsp;thương&nbsp;mại&nbsp;tự&nbsp;do&nbsp;(FTA)&nbsp;được&nbsp;ký&nbsp;kết…,&nbsp;Việt&nbsp;Nam&nbsp;được&nbsp;đánh&nbsp;giá&nbsp;là&nbsp;thị&nbsp;trường&nbsp;đầy&nbsp;tiềm&nbsp;năng&nbsp;để&nbsp;phát&nbsp;triển&nbsp;ngành&nbsp;dịch&nbsp;vụ&nbsp;logistics.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Theo&nbsp;Báo&nbsp;cáo&nbsp;&quot;Quy&nbsp;hoạch&nbsp;chi&nbsp;tiết&nbsp;nhóm&nbsp;cảng&nbsp;biển,&nbsp;bến&nbsp;cảng,&nbsp;cầu&nbsp;cảng,&nbsp;bến&nbsp;phao,&nbsp;khu&nbsp;nước,&nbsp;vùng&nbsp;nước&nbsp;thời&nbsp;kỳ&nbsp;2021&nbsp;-&nbsp;2030,&nbsp;tầm&nbsp;nhìn&nbsp;đến&nbsp;năm&nbsp;2050&quot;&nbsp;của&nbsp;Bộ&nbsp;Giao&nbsp;thông&nbsp;vận&nbsp;tải&nbsp;(2023),&nbsp;tính&nbsp;đến&nbsp;tháng&nbsp;10/2022,&nbsp;cả&nbsp;nước&nbsp;có&nbsp;286&nbsp;bến&nbsp;cảng&nbsp;thuộc&nbsp;năm&nbsp;nhóm&nbsp;cảng&nbsp;biển,&nbsp;với&nbsp;chiều&nbsp;dài&nbsp;khoảng&nbsp;95&nbsp;km&nbsp;cầu&nbsp;cảng&nbsp;(gấp&nbsp;hơn&nbsp;4,5&nbsp;lần&nbsp;năm&nbsp;2000).&nbsp;Nhờ&nbsp;hình&nbsp;thành&nbsp;các&nbsp;cảng&nbsp;cửa&nbsp;ngõ&nbsp;kết&nbsp;hợp&nbsp;trung&nbsp;chuyển&nbsp;quốc&nbsp;tế,&nbsp;Việt&nbsp;Nam&nbsp;tiếp&nbsp;nhận&nbsp;thành&nbsp;công&nbsp;tàu&nbsp;container&nbsp;đến&nbsp;132.000&nbsp;tấn&nbsp;tại&nbsp;khu&nbsp;bến&nbsp;cảng&nbsp;Lạch&nbsp;Huyện&nbsp;(Hải&nbsp;Phòng),&nbsp;đến&nbsp;214.000&nbsp;tấn&nbsp;tại&nbsp;khu&nbsp;bến&nbsp;cảng&nbsp;Cái&nbsp;Mép&nbsp;(Bà&nbsp;Rịa&nbsp;-&nbsp;Vũng&nbsp;Tàu).&nbsp;Việt&nbsp;Nam&nbsp;thiết&nbsp;lập&nbsp;được&nbsp;32&nbsp;tuyến&nbsp;vận&nbsp;tải,&nbsp;trong&nbsp;đó&nbsp;25&nbsp;tuyến&nbsp;quốc&nbsp;tế&nbsp;và&nbsp;7&nbsp;tuyến&nbsp;nội&nbsp;địa.&nbsp;Ngoài&nbsp;các&nbsp;tuyến&nbsp;nội&nbsp;Á,&nbsp;khu&nbsp;vực&nbsp;phía&nbsp;Bắc&nbsp;đã&nbsp;khai&nbsp;thác&nbsp;2&nbsp;tuyến&nbsp;đi&nbsp;Bắc&nbsp;Mỹ;&nbsp;phía&nbsp;Nam&nbsp;hình&nbsp;thành&nbsp;được&nbsp;16&nbsp;tuyến&nbsp;tàu&nbsp;xa&nbsp;đi&nbsp;Bắc&nbsp;Mỹ&nbsp;và&nbsp;châu&nbsp;Âu&nbsp;vượt&nbsp;trội&nbsp;hơn&nbsp;các&nbsp;nước&nbsp;khu&nbsp;vực&nbsp;Đông&nbsp;Nam&nbsp;Á&nbsp;(chỉ&nbsp;sau&nbsp;Malaysia&nbsp;và&nbsp;Singapore).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Sau&nbsp;hơn&nbsp;2&nbsp;năm&nbsp;bị&nbsp;ảnh&nbsp;hưởng&nbsp;nặng&nbsp;nề&nbsp;bởi&nbsp;đại&nbsp;dịch&nbsp;Covid-19,&nbsp;bước&nbsp;sang&nbsp;năm&nbsp;2022,&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;đã&nbsp;dần&nbsp;trở&nbsp;lại&nbsp;bình&nbsp;thường,&nbsp;từng&nbsp;bước&nbsp;bảo&nbsp;đảm&nbsp;sự&nbsp;kết&nbsp;nối&nbsp;trong&nbsp;hoạt&nbsp;động&nbsp;vận&nbsp;tải,&nbsp;lưu&nbsp;thông&nbsp;hàng&nbsp;hóa.&nbsp;Không&nbsp;chỉ&nbsp;ở&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;kinh&nbsp;tế&nbsp;và&nbsp;các&nbsp;địa&nbsp;phương&nbsp;vệ&nbsp;tinh,&nbsp;nhiều&nbsp;tỉnh,&nbsp;thành&nbsp;phố&nbsp;trong&nbsp;cả&nbsp;nước&nbsp;cũng&nbsp;đã&nbsp;chú&nbsp;trọng&nbsp;hơn&nbsp;tới&nbsp;việc&nbsp;đổi&nbsp;mới&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;logistics,&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ,&nbsp;hạ&nbsp;tầng&nbsp;và&nbsp;kết&nbsp;nối&nbsp;về&nbsp;logistics&nbsp;giữa&nbsp;các&nbsp;tác&nbsp;nhân&nbsp;trong&nbsp;chuỗi&nbsp;cung&nbsp;ứng;&nbsp;coi&nbsp;đây&nbsp;là&nbsp;yếu&nbsp;tố&nbsp;quan&nbsp;trọng&nbsp;thúc&nbsp;đẩy&nbsp;sự&nbsp;phục&nbsp;hồi&nbsp;của&nbsp;hoạt&nbsp;động&nbsp;sản&nbsp;xuất,&nbsp;lưu&nbsp;thông&nbsp;hàng&nbsp;hóa,&nbsp;góp&nbsp;phần&nbsp;giúp&nbsp;giá&nbsp;trị&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;của&nbsp;Việt&nbsp;Nam&nbsp;tiếp&nbsp;tục&nbsp;lập&nbsp;kỷ&nbsp;lục&nbsp;khi&nbsp;nước&nbsp;ta&nbsp;chuyển&nbsp;sang&nbsp;giai&nbsp;đoạn&nbsp;“bình&nbsp;thường&nbsp;mới”&nbsp;và&nbsp;tận&nbsp;dụng&nbsp;cơ&nbsp;hội&nbsp;từ&nbsp;việc&nbsp;ký&nbsp;kết&nbsp;các&nbsp;FTA&nbsp;mang&nbsp;lại.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Theo&nbsp;Hiệp&nbsp;hội&nbsp;DN&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;Việt&nbsp;Nam,&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;của&nbsp;Việt&nbsp;Nam&nbsp;có&nbsp;tốc&nbsp;độ&nbsp;tăng&nbsp;trưởng&nbsp;tương&nbsp;đối&nbsp;cao,&nbsp;đạt&nbsp;khoảng&nbsp;14%-16%;&nbsp;tỷ&nbsp;lệ&nbsp;DN&nbsp;thuê&nbsp;ngoài&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;đạt&nbsp;khoảng&nbsp;60%-70%,&nbsp;đóng&nbsp;góp&nbsp;khoảng&nbsp;4-5%&nbsp;GDP&nbsp;(Song&nbsp;Hà,&nbsp;2023),&nbsp;đồng&nbsp;thời,&nbsp;đưa&nbsp;hoạt&nbsp;động&nbsp;xuất&nbsp;-&nbsp;nhập&nbsp;khẩu&nbsp;trở&nbsp;thành&nbsp;điểm&nbsp;sáng&nbsp;trong&nbsp;bức&nbsp;tranh&nbsp;kinh&nbsp;tế&nbsp;Việt&nbsp;Nam&nbsp;(Bộ&nbsp;Công&nbsp;Thương,&nbsp;2022).&nbsp;Năm&nbsp;2022,&nbsp;tổng&nbsp;kim&nbsp;ngạch&nbsp;xuất&nbsp;-&nbsp;nhập&nbsp;khẩu&nbsp;đạt&nbsp;hơn&nbsp;723&nbsp;tỷ&nbsp;USD,&nbsp;tăng&nbsp;10%&nbsp;so&nbsp;năm&nbsp;2021&nbsp;(Tổng&nbsp;cục&nbsp;Thống&nbsp;kê,&nbsp;2022).&nbsp;Đây&nbsp;là&nbsp;kết&nbsp;quả&nbsp;đáng&nbsp;khích&nbsp;lệ&nbsp;trong&nbsp;bối&nbsp;cảnh&nbsp;thương&nbsp;mại&nbsp;toàn&nbsp;cầu&nbsp;và&nbsp;trong&nbsp;nước&nbsp;gặp&nbsp;nhiều&nbsp;khó&nbsp;khăn&nbsp;do&nbsp;ảnh&nbsp;hưởng&nbsp;của&nbsp;đại&nbsp;dịch&nbsp;Covid-19&nbsp;và&nbsp;những&nbsp;rủi&nbsp;ro,&nbsp;bất&nbsp;ổn&nbsp;về&nbsp;kinh&nbsp;tế,&nbsp;chính&nbsp;trị&nbsp;trên&nbsp;phạm&nbsp;vi&nbsp;toàn&nbsp;cầu.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Theo&nbsp;Báo&nbsp;cáo&nbsp;về&nbsp;chỉ&nbsp;số&nbsp;Năng&nbsp;lực&nbsp;logistics&nbsp;theo&nbsp;quốc&nbsp;gia&nbsp;năm&nbsp;2022&nbsp;của&nbsp;Agility&nbsp;-&nbsp;nhà&nbsp;cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;và&nbsp;hậu&nbsp;cần&nbsp;kho&nbsp;vận&nbsp;hàng&nbsp;đầu&nbsp;thế&nbsp;giới,&nbsp;thị&nbsp;trường&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;được&nbsp;xếp&nbsp;thứ&nbsp;11&nbsp;trong&nbsp;nhóm&nbsp;50&nbsp;thị&nbsp;trường&nbsp;logistics&nbsp;mới&nbsp;nổi&nbsp;toàn&nbsp;cầu.&nbsp;Tỷ&nbsp;lệ&nbsp;tăng&nbsp;trưởng&nbsp;kép&nbsp;hằng&nbsp;năm&nbsp;(CAGR)&nbsp;giai&nbsp;đoạn&nbsp;2022-2027&nbsp;được&nbsp;dự&nbsp;báo&nbsp;đạt&nbsp;mức&nbsp;5,5%,&nbsp;song&nbsp;hành&nbsp;cùng&nbsp;với&nbsp;sự&nbsp;phục&nbsp;hồi&nbsp;mạnh&nbsp;mẽ&nbsp;của&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;sau&nbsp;đại&nbsp;dịch&nbsp;Covid-19.&nbsp;Việt&nbsp;Nam&nbsp;hiện&nbsp;là&nbsp;quốc&nbsp;gia&nbsp;đứng&nbsp;đầu&nbsp;trong&nbsp;các&nbsp;nước&nbsp;ASEAN&nbsp;về&nbsp;số&nbsp;lượng&nbsp;DN&nbsp;kinh&nbsp;doanh&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;được&nbsp;Cơ&nbsp;quan&nbsp;Quản&nbsp;lý&nbsp;hoạt&nbsp;động&nbsp;hàng&nbsp;hải&nbsp;của&nbsp;Mỹ&nbsp;(FMC)&nbsp;cấp&nbsp;phép.&nbsp;Đóng&nbsp;góp&nbsp;của&nbsp;lĩnh&nbsp;vực&nbsp;logistics&nbsp;vào&nbsp;GDP&nbsp;hằng&nbsp;năm&nbsp;ở&nbsp;mức&nbsp;4-5%.&nbsp;Bên&nbsp;cạnh&nbsp;đó,&nbsp;e-Logistics&nbsp;(logistics&nbsp;điện&nbsp;tử)&nbsp;đã&nbsp;thúc&nbsp;đẩy&nbsp;ngành&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;cải&nbsp;thiện&nbsp;chất&nbsp;lượng&nbsp;dịch&nbsp;vụ&nbsp;ngày&nbsp;càng&nbsp;chuyên&nbsp;nghiệp&nbsp;và&nbsp;hiệu&nbsp;quả&nbsp;hơn.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Còn&nbsp;theo&nbsp;Báo&nbsp;cáo&nbsp;về&nbsp;chỉ&nbsp;số&nbsp;Năng&nbsp;lực&nbsp;logistics&nbsp;theo&nbsp;quốc&nbsp;gia&nbsp;năm&nbsp;2023&nbsp;của&nbsp;Agility,&nbsp;Việt&nbsp;Nam&nbsp;lọt&nbsp;top&nbsp;10&nbsp;thị&nbsp;trường&nbsp;logistics&nbsp;mới&nbsp;nổi&nbsp;trên&nbsp;thế&nbsp;giới&nbsp;và&nbsp;đứng&nbsp;thứ&nbsp;4&nbsp;Đông&nbsp;Nam&nbsp;Á,&nbsp;sau&nbsp;Malaysia,&nbsp;Indonesia&nbsp;và&nbsp;Thái&nbsp;Lan.&nbsp;Về&nbsp;cơ&nbsp;hội&nbsp;logistics&nbsp;trong&nbsp;nước,&nbsp;Việt&nbsp;Nam&nbsp;được&nbsp;đánh&nbsp;giá&nbsp;ở&nbsp;vị&nbsp;trí&nbsp;16,&nbsp;cải&nbsp;thiện&nbsp;1&nbsp;bậc&nbsp;so&nbsp;với&nbsp;năm&nbsp;2022&nbsp;với&nbsp;5,02&nbsp;điểm.&nbsp;Còn&nbsp;về&nbsp;yếu&nbsp;tố&nbsp;cơ&nbsp;hội&nbsp;logistics&nbsp;quốc&nbsp;tế,&nbsp;Việt&nbsp;Nam&nbsp;hiện&nbsp;dẫn&nbsp;đầu&nbsp;Đông&nbsp;Nam&nbsp;Á,&nbsp;đứng&nbsp;vị&nbsp;trí&nbsp;thứ&nbsp;4&nbsp;của&nbsp;bảng&nbsp;xếp&nbsp;hạng&nbsp;với&nbsp;6,03&nbsp;điểm.&nbsp;Dựa&nbsp;trên&nbsp;các&nbsp;điều&nbsp;kiện&nbsp;kinh&nbsp;doanh&nbsp;và&nbsp;chỉ&nbsp;số&nbsp;sẵn&nbsp;sàng&nbsp;công&nbsp;nghệ,&nbsp;Việt&nbsp;Nam&nbsp;được&nbsp;đánh&nbsp;giá&nbsp;lần&nbsp;lượt&nbsp;ở&nbsp;vị&nbsp;trí&nbsp;19&nbsp;và&nbsp;15&nbsp;của&nbsp;bảng&nbsp;xếp&nbsp;hạng.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Một&nbsp;số&nbsp;khó&nbsp;khăn,&nbsp;hạn&nbsp;chế</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Bên&nbsp;cạnh&nbsp;những&nbsp;kết&nbsp;quả&nbsp;đạt&nbsp;được,&nbsp;thì&nbsp;ngành&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;cũng&nbsp;gặp&nbsp;phải&nbsp;một&nbsp;số&nbsp;khó&nbsp;khăn,&nbsp;hạn&nbsp;chế&nbsp;như&nbsp;sau:</span></p><p><em style=\"color: rgb(0, 0, 0);\">Thứ&nbsp;nhất</em><span style=\"color: rgb(0, 0, 0);\">,&nbsp;chi&nbsp;phí&nbsp;logistics&nbsp;ở&nbsp;nước&nbsp;ta&nbsp;còn&nbsp;cao,&nbsp;tương&nbsp;đương&nbsp;khoảng&nbsp;20%&nbsp;GDP;&nbsp;trong&nbsp;khi&nbsp;đó,&nbsp;ở&nbsp;các&nbsp;nước&nbsp;phát&nbsp;triển,&nbsp;tỷ&nbsp;lệ&nbsp;tương&nbsp;ứng&nbsp;chỉ&nbsp;khoảng&nbsp;7%-9%&nbsp;GDP.&nbsp;Theo&nbsp;đó,&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;phục&nbsp;vụ&nbsp;cho&nbsp;logistics&nbsp;thiếu&nbsp;đồng&nbsp;bộ.&nbsp;Ví&nbsp;dụ,&nbsp;Cát&nbsp;Lái&nbsp;(TP.&nbsp;Hồ&nbsp;Chí&nbsp;Minh)&nbsp;là&nbsp;cảng&nbsp;container&nbsp;quốc&nbsp;tế&nbsp;lớn&nbsp;nhất&nbsp;Việt&nbsp;Nam,&nbsp;đầu&nbsp;mối&nbsp;trọng&nbsp;điểm&nbsp;trong&nbsp;hệ&nbsp;thống&nbsp;cảng&nbsp;biển&nbsp;vùng&nbsp;Đông&nbsp;Nam&nbsp;Bộ,&nbsp;nhưng&nbsp;suốt&nbsp;nhiều&nbsp;năm&nbsp;bị&nbsp;bủa&nbsp;vây&nbsp;bởi&nbsp;ùn&nbsp;tắc&nbsp;đã&nbsp;làm&nbsp;suy&nbsp;giảm&nbsp;hoạt&nbsp;động&nbsp;kinh&nbsp;tế&nbsp;toàn&nbsp;khu&nbsp;vực.&nbsp;Trung&nbsp;bình&nbsp;mỗi&nbsp;ngày&nbsp;có&nbsp;khoảng&nbsp;19.000&nbsp;đến&nbsp;20.000&nbsp;lượt&nbsp;xe&nbsp;ô&nbsp;tô&nbsp;ra&nbsp;vào&nbsp;cảng&nbsp;(Trọng&nbsp;Điển&nbsp;–&nbsp;Diễm&nbsp;Thúy,&nbsp;2023),&nbsp;do&nbsp;kết&nbsp;cấu&nbsp;giao&nbsp;thông&nbsp;chưa&nbsp;hợp&nbsp;lý,&nbsp;vào&nbsp;giờ&nbsp;cao&nbsp;điểm&nbsp;các&nbsp;xe&nbsp;container&nbsp;thường&nbsp;bị&nbsp;ùn&nbsp;tắc&nbsp;ở&nbsp;đây&nbsp;vài&nbsp;giờ&nbsp;đồng&nbsp;hồ&nbsp;trước&nbsp;khi&nbsp;vào&nbsp;được&nbsp;cảng,&nbsp;lượng&nbsp;tiêu&nbsp;tốn&nbsp;nhiên&nbsp;liệu&nbsp;sẽ&nbsp;nhiều&nbsp;hơn,&nbsp;thời&nbsp;gian&nbsp;vận&nbsp;chuyển&nbsp;hàng&nbsp;hóa&nbsp;bị&nbsp;chậm&nbsp;lại.&nbsp;Điều&nbsp;này&nbsp;tạo&nbsp;nên&nbsp;tình&nbsp;trạng,&nbsp;hàng&nbsp;hóa&nbsp;sản&nbsp;xuất&nbsp;tại&nbsp;thị&nbsp;xã&nbsp;Phú&nbsp;Mỹ&nbsp;(Bà&nbsp;Rịa&nbsp;-&nbsp;Vũng&nbsp;Tàu)&nbsp;phải&nbsp;chuyển&nbsp;đến&nbsp;Bình&nbsp;Dương&nbsp;để&nbsp;đóng&nbsp;container,&nbsp;sau&nbsp;đó&nbsp;lại&nbsp;phải&nbsp;vận&nbsp;chuyển&nbsp;từ&nbsp;Bình&nbsp;Dương&nbsp;-&nbsp;nơi&nbsp;DN&nbsp;tốn&nbsp;thêm&nbsp;chi&nbsp;phí&nbsp;nâng&nbsp;-&nbsp;hạ&nbsp;đến&nbsp;cảng&nbsp;Cát&nbsp;Lái&nbsp;để&nbsp;xuất&nbsp;khẩu.</span></p><p><em style=\"color: rgb(0, 0, 0);\">Thứ&nbsp;hai</em><span style=\"color: rgb(0, 0, 0);\">,&nbsp;về&nbsp;nhân&nbsp;lực,&nbsp;dự&nbsp;kiến&nbsp;đến&nbsp;năm&nbsp;2030,&nbsp;nhu&nbsp;cầu&nbsp;nguồn&nbsp;nhân&nbsp;lực&nbsp;về&nbsp;logistics&nbsp;là&nbsp;hơn&nbsp;200.000&nbsp;người;&nbsp;trong&nbsp;khi&nbsp;đó,&nbsp;khả&nbsp;năng&nbsp;đáp&nbsp;ứng&nbsp;về&nbsp;nguồn&nbsp;nhân&nbsp;lực&nbsp;logistics&nbsp;chỉ&nbsp;khoảng&nbsp;10%&nbsp;nhu&nbsp;cầu&nbsp;thị&nbsp;trường&nbsp;(Thanh&nbsp;Hải,&nbsp;2023).&nbsp;Nguồn&nbsp;nhân&nbsp;lực&nbsp;logistics&nbsp;của&nbsp;Việt&nbsp;Nam&nbsp;không&nbsp;những&nbsp;thiếu&nbsp;về&nbsp;số&nbsp;lượng,&nbsp;mà&nbsp;còn&nbsp;yếu&nbsp;về&nbsp;chất&nbsp;lượng.&nbsp;Bên&nbsp;cạnh&nbsp;đó,&nbsp;Báo&nbsp;cáo&nbsp;Logistics&nbsp;Việt&nbsp;Nam&nbsp;2022&nbsp;cũng&nbsp;cho&nbsp;biết,&nbsp;số&nbsp;lao&nbsp;động&nbsp;được&nbsp;đào&nbsp;tạo&nbsp;bài&nbsp;bản&nbsp;về&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;chỉ&nbsp;chiếm&nbsp;khoảng&nbsp;5%-7%&nbsp;số&nbsp;lao&nbsp;động&nbsp;đang&nbsp;làm&nbsp;trong&nbsp;lĩnh&nbsp;vực&nbsp;này.</span></p><p><em style=\"color: rgb(0, 0, 0);\">Thứ&nbsp;ba</em><span style=\"color: rgb(0, 0, 0);\">,&nbsp;DN&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;tuy&nbsp;nhiều,&nbsp;nhưng&nbsp;không&nbsp;mạnh.&nbsp;Theo&nbsp;đó,&nbsp;Việt&nbsp;Nam&nbsp;đang&nbsp;có&nbsp;hơn&nbsp;30.000&nbsp;DN&nbsp;đăng&nbsp;ký&nbsp;hoạt&nbsp;động&nbsp;trong&nbsp;lĩnh&nbsp;vực&nbsp;logistics.&nbsp;Thị&nbsp;trường&nbsp;logistics&nbsp;có&nbsp;sự&nbsp;tham&nbsp;gia&nbsp;của&nbsp;hơn&nbsp;5.000&nbsp;DN&nbsp;cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;3PL.&nbsp;Trong&nbsp;đó,&nbsp;DN&nbsp;trong&nbsp;nước&nbsp;chiếm&nbsp;89%,&nbsp;còn&nbsp;10%&nbsp;là&nbsp;DN&nbsp;liên&nbsp;doanh&nbsp;và&nbsp;1%&nbsp;là&nbsp;DN&nbsp;100%&nbsp;vốn&nbsp;nước&nbsp;ngoài&nbsp;cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;xuyên&nbsp;quốc&nbsp;gia,&nbsp;với&nbsp;các&nbsp;tên&nbsp;tuổi&nbsp;lớn&nbsp;như:&nbsp;DHL,&nbsp;Kuehne+Nagel,&nbsp;DSV,&nbsp;DB&nbsp;Schenker…&nbsp;Cho&nbsp;dù&nbsp;các&nbsp;DN&nbsp;trong&nbsp;nước&nbsp;chiếm&nbsp;tỷ&nbsp;lệ&nbsp;lớn,&nbsp;nhưng&nbsp;lại&nbsp;chỉ&nbsp;chiếm&nbsp;khoảng&nbsp;30%&nbsp;thị&nbsp;phần&nbsp;(Hoàng&nbsp;Anh,&nbsp;2023),&nbsp;còn&nbsp;lại&nbsp;thuộc&nbsp;về&nbsp;các&nbsp;DN&nbsp;nước&nbsp;ngoài,&nbsp;vì&nbsp;DN&nbsp;Việt&nbsp;Nam&nbsp;chủ&nbsp;yếu&nbsp;là&nbsp;DN&nbsp;nhỏ,&nbsp;quy&nbsp;mô&nbsp;hạn&nbsp;chế&nbsp;cả&nbsp;về&nbsp;vốn&nbsp;và&nbsp;nhân&nbsp;lực&nbsp;cũng&nbsp;như&nbsp;kinh&nbsp;nghiệm&nbsp;hoạt&nbsp;động&nbsp;quốc&nbsp;tế,&nbsp;chưa&nbsp;có&nbsp;sự&nbsp;liên&nbsp;kết&nbsp;giữa&nbsp;các&nbsp;khâu&nbsp;trong&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;logistics&nbsp;và&nbsp;giữa&nbsp;DN&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;với&nbsp;DN&nbsp;xuất&nbsp;nhập&nbsp;khẩu.&nbsp;Chính&nbsp;vì&nbsp;vậy,&nbsp;ở&nbsp;cả&nbsp;chiều&nbsp;mua&nbsp;và&nbsp;chiều&nbsp;bán,&nbsp;DN&nbsp;logistics&nbsp;trong&nbsp;nước&nbsp;đều&nbsp;bị&nbsp;hạn&nbsp;chế&nbsp;về&nbsp;“sân&nbsp;chơi”…</span></p><p><strong style=\"color: rgb(0, 0, 0);\">MỘT&nbsp;SỐ&nbsp;ĐỀ&nbsp;XUẤT&nbsp;TRONG&nbsp;THỜI&nbsp;GIAN&nbsp;TỚI</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Trong&nbsp;thời&nbsp;gian&nbsp;tới,&nbsp;nhằm&nbsp;thúc&nbsp;đẩy&nbsp;phát&nbsp;triển&nbsp;ngành&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;theo&nbsp;hướng&nbsp;hội&nbsp;nhập&nbsp;kinh&nbsp;tế&nbsp;quốc&nbsp;tế,&nbsp;theo&nbsp;tác&nbsp;giả,&nbsp;cần&nbsp;chú&nbsp;trọng&nbsp;triển&nbsp;khai&nbsp;một&nbsp;số&nbsp;giải&nbsp;pháp&nbsp;sau:</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Một&nbsp;là,</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;tiếp&nbsp;tục&nbsp;hoàn&nbsp;thiện&nbsp;chính&nbsp;sách,&nbsp;pháp&nbsp;luật&nbsp;về&nbsp;dịch&nbsp;vụ&nbsp;logistics.&nbsp;Theo&nbsp;đó,&nbsp;tiếp&nbsp;tục&nbsp;sửa&nbsp;đổi&nbsp;một&nbsp;số&nbsp;quy&nbsp;định,&nbsp;bổ&nbsp;sung&nbsp;về&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;tại&nbsp;Luật&nbsp;Thương&nbsp;mại,&nbsp;tạo&nbsp;cơ&nbsp;sở&nbsp;pháp&nbsp;lý&nbsp;thuận&nbsp;lợi&nbsp;cho&nbsp;hoạt&nbsp;động&nbsp;logistics;&nbsp;sửa&nbsp;đổi,&nbsp;ban&nbsp;hành&nbsp;mới&nbsp;các&nbsp;chính&nbsp;sách,&nbsp;pháp&nbsp;luật&nbsp;điều&nbsp;chỉnh&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;vận&nbsp;tải&nbsp;đa&nbsp;phương&nbsp;thức,&nbsp;vận&nbsp;tải&nbsp;xuyên&nbsp;biên&nbsp;giới.&nbsp;Bao&nbsp;quát&nbsp;toàn&nbsp;diện&nbsp;các&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;nội&nbsp;luật&nbsp;hóa&nbsp;các&nbsp;cam&nbsp;kết&nbsp;quốc&nbsp;tế&nbsp;về&nbsp;logistics...</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Hai&nbsp;là</strong><span style=\"color: rgb(0, 0, 0);\">,&nbsp;ban&nbsp;hành&nbsp;các&nbsp;chính&nbsp;sách&nbsp;hỗ&nbsp;trợ&nbsp;thúc&nbsp;đẩy&nbsp;ngành&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;phát&nbsp;triển.&nbsp;Theo&nbsp;đó,&nbsp;xây&nbsp;dựng&nbsp;chính&nbsp;sách&nbsp;hỗ&nbsp;trợ&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;tại&nbsp;địa&nbsp;phương&nbsp;hiệu&nbsp;quả,&nbsp;phù&nbsp;hợp&nbsp;với&nbsp;đặc&nbsp;điểm&nbsp;kinh&nbsp;tế&nbsp;-&nbsp;xã&nbsp;hội&nbsp;của&nbsp;từng&nbsp;địa&nbsp;phương.&nbsp;Hỗ&nbsp;trợ&nbsp;DN&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;đặc&nbsp;biệt&nbsp;là&nbsp;các&nbsp;DN&nbsp;nhỏ&nbsp;và&nbsp;vừa,&nbsp;thuận&nbsp;lợi&nbsp;trong&nbsp;việc&nbsp;tiếp&nbsp;cận&nbsp;các&nbsp;nguồn&nbsp;vốn&nbsp;trong&nbsp;và&nbsp;ngoài&nbsp;nước,&nbsp;phát&nbsp;triển&nbsp;thị&nbsp;trường,&nbsp;đào&nbsp;tạo,&nbsp;tiếp&nbsp;cận&nbsp;thông&nbsp;tin.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Ưu&nbsp;tiên&nbsp;bố&nbsp;trí&nbsp;ngân&nbsp;sách&nbsp;hỗ&nbsp;trợ&nbsp;nghiên&nbsp;cứu,&nbsp;ứng&nbsp;dụng,&nbsp;chuyển&nbsp;giao&nbsp;công&nbsp;nghệ&nbsp;và&nbsp;tiến&nbsp;bộ&nbsp;kỹ&nbsp;thuật&nbsp;cho&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;xã&nbsp;hội&nbsp;hóa&nbsp;nguồn&nbsp;lực&nbsp;cho&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;góp&nbsp;phần&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;và&nbsp;khả&nbsp;năng&nbsp;cạnh&nbsp;tranh&nbsp;của&nbsp;các&nbsp;DN&nbsp;cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;logistics.&nbsp;Hỗ&nbsp;trợ&nbsp;xây&nbsp;dựng&nbsp;những&nbsp;tập&nbsp;đoàn&nbsp;mạnh&nbsp;về&nbsp;logistics,&nbsp;đẩy&nbsp;mạnh&nbsp;đầu&nbsp;tư&nbsp;ra&nbsp;nước&nbsp;ngoài&nbsp;và&nbsp;xuất&nbsp;khẩu&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;tạo&nbsp;định&nbsp;hướng&nbsp;và&nbsp;động&nbsp;lực&nbsp;phát&nbsp;triển&nbsp;thị&nbsp;trường.&nbsp;Rà&nbsp;soát&nbsp;các&nbsp;cam&nbsp;kết&nbsp;quốc&nbsp;tế&nbsp;về&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;tại&nbsp;WTO,&nbsp;ASEAN&nbsp;và&nbsp;các&nbsp;hiệp&nbsp;định&nbsp;thương&nbsp;mại&nbsp;tự&nbsp;do,&nbsp;từ&nbsp;đó&nbsp;hỗ&nbsp;trợ&nbsp;DN&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;đàm&nbsp;phán,&nbsp;ký&nbsp;kết,&nbsp;thực&nbsp;hiện&nbsp;hợp&nbsp;đồng,&nbsp;xử&nbsp;lý&nbsp;tranh&nbsp;chấp&nbsp;liên&nbsp;quan&nbsp;đến&nbsp;hoạt&nbsp;động&nbsp;logistics...</span></p><p><span style=\"color: rgb(0, 0, 0);\">Đặc&nbsp;biệt,&nbsp;cần&nbsp;lưu&nbsp;ý&nbsp;tới&nbsp;các&nbsp;chính&nbsp;sách&nbsp;tiêu&nbsp;chuẩn&nbsp;logistics&nbsp;chung&nbsp;của&nbsp;quốc&nbsp;gia:&nbsp;Trong&nbsp;kỹ&nbsp;thuật&nbsp;công&nbsp;nghệ,&nbsp;tiêu&nbsp;chuẩn&nbsp;là&nbsp;ưu&nbsp;tiên&nbsp;số&nbsp;1,&nbsp;nên&nbsp;cần&nbsp;xây&nbsp;dựng&nbsp;chính&nbsp;sách&nbsp;tiêu&nbsp;chuẩn&nbsp;logistics&nbsp;chung&nbsp;của&nbsp;Việt&nbsp;Nam&nbsp;phù&nbsp;hợp&nbsp;với&nbsp;xu&nbsp;hướng&nbsp;tiêu&nbsp;chuẩn&nbsp;và&nbsp;quy&nbsp;tắc&nbsp;chuyển&nbsp;đổi&nbsp;số&nbsp;của&nbsp;các&nbsp;nước&nbsp;công&nbsp;nghiệp&nbsp;phát&nbsp;triển.&nbsp;Đảm&nbsp;bảo&nbsp;sự&nbsp;kết&nbsp;nối&nbsp;hoàn&nbsp;hảo&nbsp;tất&nbsp;cả&nbsp;các&nbsp;tiêu&nbsp;chuẩn&nbsp;phần&nbsp;mềm&nbsp;và&nbsp;phần&nbsp;cứng&nbsp;của&nbsp;hệ&nbsp;thống&nbsp;logistics&nbsp;và&nbsp;giao&nbsp;thông&nbsp;nhằm&nbsp;tạo&nbsp;sức&nbsp;mạnh&nbsp;cộng&nbsp;hưởng.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Ba&nbsp;là</strong><span style=\"color: rgb(0, 0, 0);\">,&nbsp;hoàn&nbsp;thiện&nbsp;kết&nbsp;cấu&nbsp;hạ&nbsp;tầng&nbsp;logistics,&nbsp;đảm&nbsp;bảo&nbsp;tính&nbsp;đồng&nbsp;bộ&nbsp;của&nbsp;hạ&nbsp;tầng&nbsp;giao&nbsp;thông&nbsp;và&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;với&nbsp;mục&nbsp;tiêu&nbsp;phát&nbsp;triển&nbsp;ngành&nbsp;dịch&nbsp;vụ&nbsp;logistics;&nbsp;Rà&nbsp;soát,&nbsp;điều&nbsp;chỉnh&nbsp;quy&nbsp;hoạch,&nbsp;cơ&nbsp;cấu&nbsp;sản&nbsp;xuất&nbsp;địa&nbsp;phương&nbsp;gắn&nbsp;với&nbsp;phát&nbsp;triển&nbsp;hạ&nbsp;tầng&nbsp;và&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;đảm&nbsp;bảo&nbsp;các&nbsp;quy&nbsp;hoạch,&nbsp;kế&nbsp;hoạch&nbsp;về&nbsp;giao&nbsp;thông,&nbsp;vận&nbsp;tải&nbsp;phù&nbsp;hợp&nbsp;với&nbsp;các&nbsp;chiến&nbsp;lược,&nbsp;quy&nbsp;hoạch&nbsp;về&nbsp;sản&nbsp;xuất&nbsp;công&nbsp;nghiệp,&nbsp;nông&nbsp;nghiệp,&nbsp;xuất&nbsp;nhập&nbsp;khẩu,&nbsp;chiến&nbsp;lược&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế&nbsp;-&nbsp;xã&nbsp;hội&nbsp;của&nbsp;các&nbsp;địa&nbsp;phương,&nbsp;gắn&nbsp;kết&nbsp;quy&nbsp;hoạch&nbsp;về&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;cảng&nbsp;cạn,&nbsp;kho&nbsp;ngoại&nbsp;quan&nbsp;trong&nbsp;một&nbsp;tổng&nbsp;thể&nbsp;thống&nbsp;nhất.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Bốn&nbsp;là</strong><span style=\"color: rgb(0, 0, 0);\">,&nbsp;phát&nbsp;triển&nbsp;thị&nbsp;trường&nbsp;dịch&nbsp;vụ&nbsp;logistics.&nbsp;Đẩy&nbsp;mạnh&nbsp;xúc&nbsp;tiến&nbsp;thương&nbsp;mại&nbsp;cho&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;thông&nbsp;qua&nbsp;việc&nbsp;đăng&nbsp;cai,&nbsp;tổ&nbsp;chức&nbsp;các&nbsp;hội&nbsp;thảo,&nbsp;hội&nbsp;chợ,&nbsp;triển&nbsp;lãm&nbsp;quốc&nbsp;tế&nbsp;về&nbsp;logistics;&nbsp;Học&nbsp;hỏi&nbsp;kinh&nbsp;nghiệm&nbsp;nước&nbsp;ngoài&nbsp;trao&nbsp;đổi&nbsp;cơ&nbsp;hội&nbsp;đầu&nbsp;tư,&nbsp;hợp&nbsp;tác&nbsp;về&nbsp;phát&nbsp;triển&nbsp;dịch&nbsp;vụ&nbsp;logistics;&nbsp;Đẩy&nbsp;mạnh&nbsp;tuyên&nbsp;truyền&nbsp;cho&nbsp;các&nbsp;DN&nbsp;sản&nbsp;xuất,&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;và&nbsp;thương&nbsp;mại&nbsp;nội&nbsp;địa&nbsp;về&nbsp;việc&nbsp;sử&nbsp;dụng&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;thuê&nbsp;ngoài&nbsp;theo&nbsp;hướng&nbsp;chuyên&nbsp;môn&nbsp;hóa,&nbsp;phân&nbsp;công&nbsp;lao&nbsp;động&nbsp;hợp&nbsp;lý&nbsp;trong&nbsp;chuỗi&nbsp;cung&nbsp;ứng.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Đặc&nbsp;biệt,&nbsp;tập&nbsp;trung&nbsp;cải&nbsp;thiện&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;gắn&nbsp;với&nbsp;thương&nbsp;mại&nbsp;điện&nbsp;tử,&nbsp;kết&nbsp;hợp&nbsp;logistics&nbsp;với&nbsp;thương&nbsp;mại&nbsp;điện&nbsp;tử&nbsp;theo&nbsp;xu&nbsp;hướng&nbsp;phát&nbsp;triển&nbsp;trên&nbsp;thế&nbsp;giới&nbsp;và&nbsp;khu&nbsp;vực.&nbsp;Chú&nbsp;trọng&nbsp;đào&nbsp;tạo&nbsp;nguồn&nbsp;nhân&nbsp;lực&nbsp;cho&nbsp;cả&nbsp;DN&nbsp;lẫn&nbsp;cơ&nbsp;quan&nbsp;quản&nbsp;lý&nbsp;để&nbsp;phục&nbsp;vụ&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;nhanh&nbsp;chóng&nbsp;của&nbsp;dịch&nbsp;vụ&nbsp;logistics.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Năm&nbsp;là</strong><span style=\"color: rgb(0, 0, 0);\">,&nbsp;đẩy&nbsp;mạnh&nbsp;hợp&nbsp;tác&nbsp;quốc&nbsp;tế&nbsp;trong&nbsp;lĩnh&nbsp;vực&nbsp;logistics.&nbsp;Tiếp&nbsp;tục&nbsp;mở&nbsp;rộng&nbsp;kết&nbsp;nối&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;với&nbsp;các&nbsp;nước&nbsp;trong&nbsp;khu&nbsp;vực&nbsp;ASEAN,&nbsp;Đông&nbsp;Bắc&nbsp;Á&nbsp;và&nbsp;các&nbsp;khu&nbsp;vực&nbsp;khác&nbsp;trên&nbsp;thế&nbsp;giới&nbsp;nhằm&nbsp;phát&nbsp;huy&nbsp;tác&nbsp;dụng&nbsp;của&nbsp;vận&nbsp;tải&nbsp;đa&nbsp;phương&nbsp;thức,&nbsp;vận&nbsp;tải&nbsp;xuyên&nbsp;biên&nbsp;giới&nbsp;và&nbsp;quá&nbsp;cảnh;&nbsp;Xây&nbsp;dựng&nbsp;công&nbsp;trình&nbsp;giao&nbsp;thông,&nbsp;kho&nbsp;bãi,&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;trên&nbsp;các&nbsp;tuyến&nbsp;đường,&nbsp;hành&nbsp;lang&nbsp;kết&nbsp;nối&nbsp;các&nbsp;cảng&nbsp;của&nbsp;Việt&nbsp;Nam&nbsp;với&nbsp;Lào,&nbsp;Campuchia,&nbsp;Thái&nbsp;Lan&nbsp;và&nbsp;Nam&nbsp;Trung&nbsp;Quốc.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Đẩy&nbsp;mạnh&nbsp;phát&nbsp;triển&nbsp;loại&nbsp;hình&nbsp;vận&nbsp;tải&nbsp;đa&nbsp;phương&nbsp;thức,&nbsp;vận&nbsp;tải&nbsp;xuyên&nbsp;biên&nbsp;giới,&nbsp;nhất&nbsp;là&nbsp;đối&nbsp;với&nbsp;hàng&nbsp;hóa&nbsp;quá&nbsp;cảnh.&nbsp;Hình&nbsp;thành&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;ở&nbsp;nước&nbsp;ngoài&nbsp;làm&nbsp;đầu&nbsp;cầu,&nbsp;tập&nbsp;kết&nbsp;và&nbsp;phân&nbsp;phối&nbsp;hàng&nbsp;hóa&nbsp;Việt&nbsp;Nam&nbsp;đến&nbsp;các&nbsp;thị&nbsp;trường&nbsp;quốc&nbsp;tế.&nbsp;Tăng&nbsp;cường&nbsp;liên&nbsp;kết&nbsp;với&nbsp;các&nbsp;hiệp&nbsp;hội&nbsp;và&nbsp;DN&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;khu&nbsp;vực&nbsp;ASEAN&nbsp;và&nbsp;trên&nbsp;thế&nbsp;giới.&nbsp;Vận&nbsp;động&nbsp;thu&nbsp;hút&nbsp;đầu&nbsp;tư&nbsp;xây&nbsp;dựng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;để&nbsp;thúc&nbsp;đẩy&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;hàng&nbsp;hóa&nbsp;Việt&nbsp;Nam&nbsp;với&nbsp;thị&nbsp;trường&nbsp;toàn&nbsp;cầu,&nbsp;nhằm&nbsp;hình&nbsp;thành&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;ở&nbsp;nước&nbsp;ngoài&nbsp;làm&nbsp;đầu&nbsp;cầu,&nbsp;tập&nbsp;kết&nbsp;và&nbsp;phân&nbsp;phối&nbsp;hàng&nbsp;hóa&nbsp;Việt&nbsp;Nam&nbsp;đến&nbsp;các&nbsp;thị&nbsp;trường&nbsp;quốc&nbsp;tế...</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Sáu&nbsp;là</strong><span style=\"color: rgb(0, 0, 0);\">,&nbsp;cần&nbsp;chú&nbsp;trọng&nbsp;đến&nbsp;vấn&nbsp;đề&nbsp;an&nbsp;ninh&nbsp;mạng.&nbsp;Chuyển&nbsp;đổi&nbsp;công&nbsp;nghệ&nbsp;số&nbsp;đem&nbsp;lại&nbsp;nhiều&nbsp;lợi&nbsp;ích,&nbsp;tuy&nbsp;nhiên&nbsp;việc&nbsp;ứng&nbsp;dụng&nbsp;nó&nbsp;cũng&nbsp;đem&nbsp;lại&nbsp;nhiều&nbsp;rủi&nbsp;ro.&nbsp;Vì&nbsp;vậy,&nbsp;cần&nbsp;tăng&nbsp;cường&nbsp;hợp&nbsp;tác&nbsp;và&nbsp;nâng&nbsp;cao&nbsp;năng&nbsp;lực&nbsp;trong&nbsp;lĩnh&nbsp;vực&nbsp;an&nbsp;ninh&nbsp;mạng&nbsp;khi&nbsp;xây&nbsp;dựng&nbsp;và&nbsp;triển&nbsp;khai&nbsp;chiến&nbsp;lược&nbsp;ứng&nbsp;dụng&nbsp;công&nbsp;nghệ.&nbsp;Cùng&nbsp;với&nbsp;sự&nbsp;nhận&nbsp;thức&nbsp;và&nbsp;nỗ&nbsp;lực&nbsp;của&nbsp;cộng&nbsp;đồng&nbsp;DN&nbsp;trong&nbsp;lĩnh&nbsp;vực&nbsp;chuyển&nbsp;đổi&nbsp;số,&nbsp;việc&nbsp;xây&nbsp;dựng&nbsp;và&nbsp;thực&nbsp;thi&nbsp;hiệu&nbsp;quả&nbsp;các&nbsp;chính&nbsp;sách&nbsp;liên&nbsp;quan&nbsp;của&nbsp;Chính&nbsp;phủ&nbsp;sẽ&nbsp;định&nbsp;vị&nbsp;ngành&nbsp;logistics&nbsp;của&nbsp;Việt&nbsp;Nam&nbsp;đóng&nbsp;vai&nbsp;trò&nbsp;ngày&nbsp;càng&nbsp;quan&nbsp;trọng&nbsp;không&nbsp;những&nbsp;trong&nbsp;các&nbsp;nguồn&nbsp;lực&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế&nbsp;-&nbsp;xã&nbsp;hội&nbsp;của&nbsp;đất&nbsp;nước,&nbsp;mà&nbsp;còn&nbsp;trong&nbsp;sự&nbsp;chuyển&nbsp;dịch&nbsp;của&nbsp;kinh&nbsp;tế&nbsp;khu&nbsp;vực&nbsp;và&nbsp;toàn&nbsp;cầu./.</span></p>', '/uploads/news-1777760748170-65558083.jpg', 'Admin', 0, '2026-05-02 22:21:56', '2026-05-02 22:25:48');
INSERT INTO `news` (`id`, `title`, `desc`, `content`, `image`, `author`, `comments`, `created_at`, `updated_at`) VALUES
(3, 'Thực trạng và giải pháp phát triển các trung tâm Logistics tại Việt Nam hiện nay', 'Phân tích và dự báo về thị trường logistics, chuỗi cung ứng quốc tế và trong nước, độ tin cậy của lịch trình, tình hình hoạt động tại các cảng biển, cửa khẩu, thị trường giao nhận, chuyển phát, kho bãi, bất động sản, doanh nghiệp logistics mới nhất', '<p><strong style=\"color: rgb(0, 0, 0);\">TÓM&nbsp;TẮT:</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Tại&nbsp;Việt&nbsp;Nam,&nbsp;khái&nbsp;niệm&nbsp;&quot;dịch&nbsp;vụ&nbsp;logistics&quot;&nbsp;lần&nbsp;đầu&nbsp;tiên&nbsp;được&nbsp;luật&nbsp;hóa&nbsp;trong&nbsp;Luật&nbsp;Thương&nbsp;mại&nbsp;năm&nbsp;2005.&nbsp;Tuy&nbsp;nhiên&nbsp;mãi&nbsp;đến&nbsp;năm&nbsp;2015,&nbsp;Quy&nbsp;hoạch&nbsp;Phát&nbsp;triển&nbsp;hệ&nbsp;thống&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;đến&nbsp;năm&nbsp;2020&nbsp;và&nbsp;định&nbsp;hướng&nbsp;đến&nbsp;năm&nbsp;2030&nbsp;mới&nbsp;được&nbsp;phê&nbsp;duyệt&nbsp;theo&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg&nbsp;ngày&nbsp;03/7/2015&nbsp;(sau&nbsp;đây&nbsp;gọi&nbsp;tắt&nbsp;là&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg).&nbsp;Cùng&nbsp;với&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;chung&nbsp;của&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;và&nbsp;lĩnh&nbsp;vực&nbsp;dịch&nbsp;vụ&nbsp;logistics,&nbsp;nhu&nbsp;cầu&nbsp;đầu&nbsp;tư&nbsp;phát&nbsp;triển&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;của&nbsp;các&nbsp;tỉnh,&nbsp;thành&nbsp;phố&nbsp;và&nbsp;các&nbsp;nhà&nbsp;đầu&nbsp;tư&nbsp;trên&nbsp;cả&nbsp;nước&nbsp;ngày&nbsp;càng&nbsp;nhiều.&nbsp;Nghiên&nbsp;cứu&nbsp;về&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;của&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;gần&nbsp;đây&nbsp;cho&nbsp;thấy&nbsp;tại&nbsp;Việt&nbsp;Nam&nbsp;đang&nbsp;thiếu&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistic&nbsp;chuyên&nbsp;nghiệp&nbsp;đáp&nbsp;ứng&nbsp;nhu&nbsp;cầu&nbsp;thực&nbsp;tế.&nbsp;Vì&nbsp;vậy,&nbsp;bài&nbsp;viết&nbsp;đã&nbsp;đưa&nbsp;ra&nbsp;những&nbsp;kiến&nbsp;nghị&nbsp;đối&nbsp;với&nbsp;cơ&nbsp;quan&nbsp;quản&nbsp;lý&nbsp;và&nbsp;đề&nbsp;xuất&nbsp;giải&nbsp;pháp&nbsp;chính&nbsp;để&nbsp;xây&nbsp;dựng&nbsp;và&nbsp;phát&nbsp;triển&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;tại&nbsp;Việt&nbsp;Nam.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Từ&nbsp;khóa:&nbsp;logistics,&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;giải&nbsp;pháp&nbsp;phát&nbsp;triển.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">1.&nbsp;Khái&nbsp;niệm&nbsp;trung&nbsp;tâm&nbsp;logistics</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Cũng&nbsp;giống&nbsp;như&nbsp;khái&nbsp;niệm&nbsp;logistics,&nbsp;có&nbsp;nhiều&nbsp;quan&nbsp;điểm&nbsp;và&nbsp;định&nbsp;nghĩa&nbsp;khác&nbsp;nhau&nbsp;về&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;nhưng&nbsp;định&nbsp;nghĩa&nbsp;được&nbsp;thừa&nbsp;nhận&nbsp;rộng&nbsp;rãi&nbsp;nhất&nbsp;và&nbsp;tương&nbsp;đối&nbsp;hoàn&nbsp;chỉnh&nbsp;là&nbsp;định&nbsp;nghĩa&nbsp;của&nbsp;Hiệp&nbsp;hội&nbsp;Trung&nbsp;tâm&nbsp;Logistics&nbsp;châu&nbsp;Âu&nbsp;Europlatforms&nbsp;(European&nbsp;Association&nbsp;of&nbsp;Freight&nbsp;Villages).&nbsp;Theo&nbsp;Hiệp&nbsp;hội&nbsp;này&nbsp;&quot;Trung&nbsp;tâm&nbsp;logistics&nbsp;là&nbsp;một&nbsp;khu&nbsp;vực&nbsp;nơi&nbsp;thực&nbsp;hiện&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;liên&nbsp;quan&nbsp;đến&nbsp;vận&nbsp;tải,&nbsp;logistics&nbsp;và&nbsp;phân&nbsp;phối&nbsp;hàng&nbsp;hóa&nbsp;nội&nbsp;địa&nbsp;cũng&nbsp;như&nbsp;quốc&nbsp;tế,&nbsp;được&nbsp;thực&nbsp;hiện&nbsp;bởi&nbsp;nhiều&nbsp;chủ&nbsp;thể&nbsp;khác&nbsp;nhau.&nbsp;Các&nbsp;chủ&nbsp;thể&nbsp;này&nbsp;có&nbsp;thể&nbsp;là&nbsp;người&nbsp;chủ&nbsp;sở&nbsp;hữu&nbsp;hoặc&nbsp;là&nbsp;người&nbsp;thuê&nbsp;sử&nbsp;dụng&nbsp;các&nbsp;cơ&nbsp;sở&nbsp;vật&nbsp;chất&nbsp;và&nbsp;trang&nbsp;thiết&nbsp;bị&nbsp;của&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;như&nbsp;kho&nbsp;bãi,&nbsp;văn&nbsp;phòng,&nbsp;khu&nbsp;vực&nbsp;xếp&nbsp;dỡ&nbsp;hàng,…&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;cần&nbsp;phải&nbsp;có&nbsp;và&nbsp;được&nbsp;trang&nbsp;bị&nbsp;các&nbsp;trang&nbsp;thiết&nbsp;bị&nbsp;phục&nbsp;vụ&nbsp;cho&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;và&nbsp;dịch&nbsp;vụ&nbsp;của&nbsp;trung&nbsp;tâm.&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;cần&nbsp;được&nbsp;kết&nbsp;nối&nbsp;với&nbsp;các&nbsp;phương&nbsp;thức&nbsp;vận&nbsp;tải&nbsp;khác&nbsp;nhau&nbsp;như&nbsp;đường&nbsp;ôtô,&nbsp;đường&nbsp;sắt,&nbsp;đường&nbsp;biển,&nbsp;đường&nbsp;sông,&nbsp;đường&nbsp;hàng&nbsp;không...&quot;&nbsp;(Đại&nbsp;học&nbsp;Huế,&nbsp;Trường&nbsp;Đại&nbsp;học&nbsp;Thủy&nbsp;lợi,&nbsp;Trường&nbsp;Đại&nbsp;học&nbsp;Bremen&nbsp;CHLB&nbsp;Đức&nbsp;(2023).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Điểm&nbsp;d,&nbsp;khoản&nbsp;14&nbsp;Điều&nbsp;2&nbsp;của&nbsp;Nghị&nbsp;định&nbsp;số&nbsp;40/2025/NĐ-CP&nbsp;ngày&nbsp;26/02/2025&nbsp;quy&nbsp;định&nbsp;chức&nbsp;năng,&nbsp;nhiệm&nbsp;vụ,&nbsp;quyền&nbsp;hạn&nbsp;và&nbsp;cơ&nbsp;cấu&nbsp;tổ&nbsp;chức&nbsp;của&nbsp;Bộ&nbsp;Công&nbsp;Thương&nbsp;quy&nbsp;định:&nbsp;“Bộ&nbsp;Công&nbsp;Thương&nbsp;chủ&nbsp;trì,&nbsp;phối&nbsp;hợp&nbsp;với&nbsp;các&nbsp;bộ,&nbsp;ngành,&nbsp;địa&nbsp;phương&nbsp;xây&nbsp;dựng&nbsp;chính&nbsp;sách&nbsp;phát&nbsp;triển&nbsp;hạ&nbsp;tầng&nbsp;thương&nbsp;mại&nbsp;(bao&nbsp;gồm&nbsp;chợ,&nbsp;siêu&nbsp;thị,&nbsp;trung&nbsp;tâm&nbsp;thương&nbsp;mại,&nbsp;trung&nbsp;tâm&nbsp;mua&nbsp;sắm,&nbsp;trung&nbsp;tâm&nbsp;đấu&nbsp;giá&nbsp;hàng&nbsp;hóa,&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;kho&nbsp;hàng&nbsp;hóa,&nbsp;trung&nbsp;tâm&nbsp;hội&nbsp;chợ,&nbsp;triển&nbsp;lãm,&nbsp;cửa&nbsp;hàng&nbsp;bán&nbsp;lẻ)&nbsp;theo&nbsp;quy&nbsp;định&nbsp;của&nbsp;pháp&nbsp;luật”.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Như&nbsp;vậy,&nbsp;tiếp&nbsp;cận&nbsp;dưới&nbsp;góc&nbsp;độ&nbsp;là&nbsp;một&nbsp;loại&nbsp;hình&nbsp;hạ&nbsp;tầng&nbsp;thương&nbsp;mại,&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;là&nbsp;địa&nbsp;điểm&nbsp;trực&nbsp;tiếp&nbsp;cung&nbsp;cấp&nbsp;các&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;được&nbsp;thực&nbsp;hiện&nbsp;bởi&nbsp;các&nbsp;thương&nbsp;nhân&nbsp;kinh&nbsp;doanh&nbsp;dịch&nbsp;vụ&nbsp;logistics.&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;là&nbsp;cơ&nbsp;sở&nbsp;kinh&nbsp;doanh&nbsp;hoặc&nbsp;thuộc&nbsp;sở&nbsp;hữu&nbsp;của&nbsp;các&nbsp;chủ&nbsp;thể&nbsp;này&nbsp;hoặc&nbsp;dành&nbsp;cho&nbsp;các&nbsp;chủ&nbsp;thể&nbsp;này&nbsp;thuê&nbsp;để&nbsp;tổ&nbsp;chức&nbsp;kinh&nbsp;doanh&nbsp;(cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;cho&nbsp;khách&nbsp;hàng).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Trung&nbsp;tâm&nbsp;logistics&nbsp;quy&nbsp;hoạch&nbsp;theo&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg&nbsp;thực&nbsp;hiện&nbsp;các&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;gắn&nbsp;liền&nbsp;với&nbsp;lưu&nbsp;thông,&nbsp;phục&nbsp;vụ&nbsp;nhu&nbsp;cầu&nbsp;về&nbsp;hậu&nbsp;cần&nbsp;cho&nbsp;các&nbsp;hệ&nbsp;thống,&nbsp;mạng&nbsp;lưới&nbsp;phân&nbsp;phối&nbsp;hàng&nbsp;hóa.&nbsp;Trong&nbsp;đó&nbsp;đề&nbsp;cập&nbsp;tới&nbsp;bộ&nbsp;phận&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;thuê&nbsp;ngoài&nbsp;(outsourcing&nbsp;logistics),&nbsp;chủ&nbsp;yếu&nbsp;được&nbsp;tổ&nbsp;chức&nbsp;kinh&nbsp;doanh&nbsp;đồng&nbsp;bộ&nbsp;và&nbsp;trọn&nbsp;gói&nbsp;(tích&nbsp;hợp,&nbsp;hợp&nbsp;nhất&nbsp;nhiều&nbsp;dịch&nbsp;vụ),&nbsp;tổ&nbsp;chức&nbsp;và&nbsp;hoạt&nbsp;động&nbsp;theo&nbsp;mô&nbsp;hình&nbsp;logistics&nbsp;3PL;&nbsp;không&nbsp;quy&nbsp;hoạch&nbsp;(nhưng&nbsp;vẫn&nbsp;xem&nbsp;xét,&nbsp;tính&nbsp;đến&nbsp;trong&nbsp;mối&nbsp;quan&nbsp;hệ&nbsp;tương&nbsp;hỗ&nbsp;và&nbsp;ảnh&nbsp;hưởng&nbsp;qua&nbsp;lại&nbsp;lẫn&nbsp;nhau)&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;với&nbsp;mục&nbsp;đích,&nbsp;công&nbsp;năng&nbsp;chủ&nbsp;yếu&nbsp;là&nbsp;cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;giao&nbsp;nhận,&nbsp;vận&nbsp;tải,&nbsp;kho&nbsp;bãi&nbsp;phục&nbsp;vụ&nbsp;cho&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;và&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;mô&nbsp;hình&nbsp;1PL,&nbsp;2PL,&nbsp;các&nbsp;dạng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;nội&nbsp;bộ&nbsp;doanh&nbsp;nghiệp&nbsp;khác&nbsp;(do&nbsp;doanh&nbsp;nghiệp&nbsp;tự&nbsp;lập&nbsp;ra&nbsp;để&nbsp;tự&nbsp;phục&nbsp;vụ&nbsp;mình).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Trung&nbsp;tâm&nbsp;logistics&nbsp;là&nbsp;yếu&nbsp;tố&nbsp;quan&nbsp;trọng&nbsp;trong&nbsp;hệ&nbsp;thống&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;thực&nbsp;hiện&nbsp;các&nbsp;chức&nbsp;năng&nbsp;cơ&nbsp;bản&nbsp;như&nbsp;lưu&nbsp;kho&nbsp;bãi,&nbsp;xếp&nbsp;dỡ&nbsp;hàng,&nbsp;gom&nbsp;hàng,&nbsp;chia&nbsp;nhỏ&nbsp;hàng,&nbsp;phối&nbsp;hợp&nbsp;phân&nbsp;chia&nbsp;hàng,&nbsp;lưu&nbsp;giữ&nbsp;hàng&nbsp;tối&nbsp;ưu,&nbsp;tạo&nbsp;ra&nbsp;giá&nbsp;trị&nbsp;gia&nbsp;tăng,&nbsp;chuyển&nbsp;tải&nbsp;và&nbsp;logistics&nbsp;ngược,&nbsp;xúc&nbsp;tiến&nbsp;thương&nbsp;mại,&nbsp;thúc&nbsp;đẩy&nbsp;tiêu&nbsp;thụ&nbsp;sản&nbsp;phẩm&nbsp;và&nbsp;thực&nbsp;hiện&nbsp;liên&nbsp;kết&nbsp;kinh&nbsp;tế.&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;còn&nbsp;là&nbsp;nơi&nbsp;thực&nbsp;hiện&nbsp;các&nbsp;thủ&nbsp;tục&nbsp;hải&nbsp;quan,&nbsp;thông&nbsp;quan,&nbsp;kiểm&nbsp;tra&nbsp;kiểm&nbsp;soát&nbsp;hàng&nbsp;hóa,…&nbsp;cũng&nbsp;như&nbsp;các&nbsp;chức&nbsp;năng&nbsp;quản&nbsp;lý&nbsp;nhà&nbsp;nước&nbsp;khác&nbsp;theo&nbsp;quy&nbsp;định&nbsp;đối&nbsp;với&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;nội&nbsp;địa&nbsp;và&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;quốc&nbsp;tế.&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;cũng&nbsp;có&nbsp;thể&nbsp;cung&nbsp;cấp&nbsp;các&nbsp;dịch&nbsp;vụ&nbsp;hỗ&nbsp;trợ&nbsp;cho&nbsp;khách&nbsp;hàng&nbsp;như&nbsp;ăn,&nbsp;nghỉ,&nbsp;dịch&nbsp;vụ&nbsp;tư&nbsp;vấn,&nbsp;dịch&nbsp;vụ&nbsp;tài&nbsp;chính&nbsp;-&nbsp;tín&nbsp;dụng,&nbsp;cho&nbsp;thuê&nbsp;văn&nbsp;phòng,&nbsp;cung&nbsp;cấp&nbsp;dịch&nbsp;vụ&nbsp;cho&nbsp;hoạt&nbsp;động&nbsp;bán&nbsp;lẻ&nbsp;các&nbsp;sản&nbsp;phẩm&nbsp;cuối,&nbsp;cũng&nbsp;như&nbsp;các&nbsp;linh&nbsp;phụ&nbsp;kiện&nbsp;cho&nbsp;khách&nbsp;hàng&nbsp;cuối,&nbsp;mang&nbsp;lại&nbsp;lợi&nbsp;ích&nbsp;và&nbsp;hiệu&nbsp;quả&nbsp;sản&nbsp;xuất&nbsp;-&nbsp;kinh&nbsp;doanh&nbsp;cho&nbsp;cả&nbsp;khách&nbsp;hàng&nbsp;cuối&nbsp;cũng&nbsp;như&nbsp;nhà&nbsp;sản&nbsp;xuất&nbsp;phân&nbsp;phối.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Trung&nbsp;tâm&nbsp;logistics&nbsp;có&nbsp;vai&nbsp;trò&nbsp;rất&nbsp;quan&nbsp;trọng&nbsp;trong&nbsp;việc&nbsp;tối&nbsp;ưu&nbsp;hóa&nbsp;các&nbsp;dòng&nbsp;vận&nbsp;động&nbsp;hàng&nbsp;hóa,&nbsp;tiền&nbsp;tệ,&nbsp;thông&nbsp;tin,&nbsp;thúc&nbsp;đẩy&nbsp;lưu&nbsp;thông&nbsp;hàng&nbsp;hóa,&nbsp;xuất&nbsp;nhập&nbsp;khẩu,&nbsp;rút&nbsp;ngắn&nbsp;thời&nbsp;gian&nbsp;vận&nbsp;chuyển,&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;logistics,&nbsp;nâng&nbsp;cao&nbsp;hiệu&nbsp;quả,&nbsp;tạo&nbsp;cơ&nbsp;hội&nbsp;mở&nbsp;rộng&nbsp;kinh&nbsp;doanh&nbsp;và&nbsp;khả&nbsp;năng&nbsp;cạnh&nbsp;tranh&nbsp;cho&nbsp;các&nbsp;doanh&nbsp;nghiệp,&nbsp;làm&nbsp;tăng&nbsp;hiệu&nbsp;quả&nbsp;và&nbsp;năng&nbsp;lực&nbsp;cạnh&nbsp;tranh&nbsp;cho&nbsp;quốc&nbsp;gia,&nbsp;từ&nbsp;đó&nbsp;thúc&nbsp;đẩy&nbsp;tăng&nbsp;trưởng&nbsp;kinh&nbsp;tế.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">2.&nbsp;Thực&nbsp;trạng&nbsp;phát&nbsp;triển&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;tại&nbsp;Việt&nbsp;Nam&nbsp;hiện&nbsp;nay</strong></p><p><strong style=\"color: rgb(0, 0, 0);\"><em>2.1.&nbsp;Về&nbsp;hành&nbsp;lang&nbsp;pháp&nbsp;lý</em></strong></p><p><span style=\"color: rgb(0, 0, 0);\">Hoạt&nbsp;động&nbsp;logistics&nbsp;đã&nbsp;diễn&nbsp;ra&nbsp;từ&nbsp;lâu&nbsp;tại&nbsp;Việt&nbsp;Nam&nbsp;nhưng&nbsp;phải&nbsp;đến&nbsp;năm&nbsp;2005,&nbsp;nước&nbsp;ta&nbsp;mới&nbsp;có&nbsp;văn&nbsp;bản&nbsp;pháp&nbsp;luật&nbsp;đầu&nbsp;tiên&nbsp;định&nbsp;nghĩa&nbsp;về&nbsp;hoạt&nbsp;động&nbsp;này&nbsp;tại&nbsp;Luật&nbsp;Thương&nbsp;mại&nbsp;và&nbsp;đến&nbsp;năm&nbsp;2015&nbsp;Quy&nbsp;hoạch&nbsp;Phát&nbsp;triển&nbsp;hệ&nbsp;thống&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;đến&nbsp;năm&nbsp;2020&nbsp;và&nbsp;định&nbsp;hướng&nbsp;đến&nbsp;năm&nbsp;2030&nbsp;mới&nbsp;được&nbsp;phê&nbsp;duyệt&nbsp;theo&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Sau&nbsp;khi&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg&nbsp;được&nbsp;ban&nbsp;hành,&nbsp;nhiều&nbsp;địa&nbsp;phương,&nbsp;doanh&nbsp;nghiệp&nbsp;đã&nbsp;phản&nbsp;ánh&nbsp;sự&nbsp;lúng&nbsp;túng&nbsp;trong&nbsp;việc&nbsp;xác&nbsp;định,&nbsp;phân&nbsp;loại,&nbsp;phân&nbsp;hạng&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;để&nbsp;thực&nbsp;hiện&nbsp;các&nbsp;nội&nbsp;dung&nbsp;nêu&nbsp;trong&nbsp;Quyết&nbsp;định&nbsp;nói&nbsp;trên.&nbsp;Tuy&nbsp;nhiên,&nbsp;đến&nbsp;thời&nbsp;điểm&nbsp;hiện&nbsp;tại,&nbsp;vẫn&nbsp;chưa&nbsp;có&nbsp;một&nbsp;văn&nbsp;bản&nbsp;nào&nbsp;quy&nbsp;định&nbsp;rõ&nbsp;về&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;như&nbsp;khái&nbsp;niệm,&nbsp;phân&nbsp;loại…&nbsp;dẫn&nbsp;đến&nbsp;việc&nbsp;lúng&nbsp;túng&nbsp;trong&nbsp;quản&nbsp;lý&nbsp;nhà&nbsp;nước&nbsp;và&nbsp;triển&nbsp;khai&nbsp;trong&nbsp;thực&nbsp;tiễn.</span></p><p><strong style=\"color: rgb(0, 0, 0);\"><em>2.2.&nbsp;Về&nbsp;thực&nbsp;tiễn&nbsp;hoạt&nbsp;động&nbsp;của&nbsp;trung&nbsp;tâm&nbsp;logistics</em></strong></p><p><span style=\"color: rgb(0, 0, 0);\">Dịch&nbsp;vụ&nbsp;logistics&nbsp;có&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;nhanh&nbsp;chóng&nbsp;và&nbsp;trở&nbsp;thành&nbsp;ngành&nbsp;kinh&nbsp;tế&nbsp;đóng&nbsp;góp&nbsp;ngày&nbsp;càng&nbsp;quan&nbsp;trọng&nbsp;đối&nbsp;với&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế&nbsp;đất&nbsp;nước.&nbsp;Cùng&nbsp;với&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;của&nbsp;ngành&nbsp;Logistics,&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics,&nbsp;trong&nbsp;đó&nbsp;có&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;từng&nbsp;bước&nbsp;được&nbsp;đầu&nbsp;tư&nbsp;xây&nbsp;dựng&nbsp;ở&nbsp;Việt&nbsp;Nam&nbsp;từ&nbsp;năm&nbsp;2007,&nbsp;đến&nbsp;nay,&nbsp;một&nbsp;số&nbsp;trung&nbsp;tâm&nbsp;đã&nbsp;và&nbsp;đang&nbsp;hoạt&nbsp;động.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Năm&nbsp;2012,&nbsp;tại&nbsp;miền&nbsp;Bắc&nbsp;có&nbsp;02&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;gồm:&nbsp;Trung&nbsp;tâm&nbsp;Logistics&nbsp;Cái&nbsp;Lân-VOSA&nbsp;(Quảng&nbsp;Ninh),&nbsp;Trung&nbsp;tâm&nbsp;Logistics&nbsp;Green-Đình&nbsp;Vũ&nbsp;(Hải&nbsp;Phòng).&nbsp;Tại&nbsp;miền&nbsp;Nam&nbsp;có&nbsp;04&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;gồm:&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Geodis&nbsp;Wilson&nbsp;Cát&nbsp;Lái&nbsp;(TP.&nbsp;Hồ&nbsp;Chí&nbsp;Minh),&nbsp;Trung&nbsp;tâm&nbsp;tiếp&nbsp;vận&nbsp;Schenker&nbsp;Germadept&nbsp;(Bình&nbsp;Dương),&nbsp;Trung&nbsp;tâm&nbsp;Logistics&nbsp;Gemadept&nbsp;Sóng&nbsp;Thần&nbsp;(Bình&nbsp;Dương),&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Damco&nbsp;Bình&nbsp;Dương.&nbsp;Một&nbsp;số&nbsp;trung&nbsp;tâm&nbsp;được&nbsp;cấp&nbsp;giấy&nbsp;phép&nbsp;đầu&nbsp;tư&nbsp;và&nbsp;cấp&nbsp;đất&nbsp;như:&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Kerry&nbsp;Hưng&nbsp;Yên,&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Kerry&nbsp;Đà&nbsp;Nẵng,&nbsp;Trung&nbsp;tâm&nbsp;Logistics&nbsp;tại&nbsp;xã&nbsp;Hòa&nbsp;Nhơn,&nbsp;huyện&nbsp;Hòa&nbsp;Vang,&nbsp;Đà&nbsp;Nẵng,&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Kim&nbsp;Thành&nbsp;(Lào&nbsp;Cai).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Đến&nbsp;hết&nbsp;năm&nbsp;2021,&nbsp;cả&nbsp;nước&nbsp;đã&nbsp;xây&nbsp;dựng&nbsp;và&nbsp;phát&nbsp;triển&nbsp;79&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;bao&nbsp;gồm&nbsp;48&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;đã&nbsp;đi&nbsp;vào&nbsp;hoạt&nbsp;động,&nbsp;31&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;đang&nbsp;trong&nbsp;quá&nbsp;trình&nbsp;triển&nbsp;khai&nbsp;xây&nbsp;dựng.&nbsp;Trong&nbsp;giai&nbsp;đoạn&nbsp;2017-&nbsp;2022,&nbsp;nhiều&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;hiện&nbsp;đại,&nbsp;áp&nbsp;dụng&nbsp;công&nbsp;nghệ&nbsp;tiên&nbsp;tiến&nbsp;và&nbsp;được&nbsp;tiêu&nbsp;chuẩn&nbsp;hóa&nbsp;đã&nbsp;đi&nbsp;vào&nbsp;hoạt&nbsp;động,&nbsp;như:&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Vinatrans&nbsp;Đà&nbsp;Nẵng,&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;KM&nbsp;Cargo&nbsp;Services&nbsp;Hải&nbsp;Phòng,&nbsp;Trung&nbsp;tâm&nbsp;logistics&nbsp;Vĩnh&nbsp;Tân&nbsp;Bình&nbsp;Thuận...&nbsp;Vùng&nbsp;Bắc&nbsp;Trung&nbsp;Bộ&nbsp;và&nbsp;Duyên&nbsp;hải&nbsp;Trung&nbsp;Bộ&nbsp;là&nbsp;vùng&nbsp;đang&nbsp;có&nbsp;tốc&nbsp;độ&nbsp;phát&nbsp;triển&nbsp;số&nbsp;lượng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;nhanh&nbsp;nhất&nbsp;cả&nbsp;nước&nbsp;với&nbsp;12&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;đang&nbsp;được&nbsp;triển&nbsp;khai&nbsp;xây&nbsp;dựng&nbsp;trong&nbsp;tổng&nbsp;số&nbsp;17&nbsp;trung&nbsp;tâm&nbsp;logistics.&nbsp;Tuy&nbsp;nhiên,&nbsp;tổng&nbsp;thể&nbsp;chung&nbsp;vẫn&nbsp;còn&nbsp;nhiều&nbsp;bất&nbsp;cập&nbsp;và&nbsp;chưa&nbsp;đáp&nbsp;ứng&nbsp;được&nbsp;các&nbsp;yêu&nbsp;cầu&nbsp;đặt&nbsp;ra&nbsp;để&nbsp;thu&nbsp;hút&nbsp;doanh&nbsp;nghiệp&nbsp;tham&nbsp;gia&nbsp;vào&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;dịch&nbsp;vụ&nbsp;(Anh&nbsp;Đào,&nbsp;2023).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Theo&nbsp;Báo&nbsp;cáo&nbsp;Logistics&nbsp;các&nbsp;năm&nbsp;2022,&nbsp;2023&nbsp;và&nbsp;2024,&nbsp;hệ&nbsp;thống&nbsp;kết&nbsp;cấu&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;tiếp&nbsp;tục&nbsp;được&nbsp;quan&nbsp;tâm&nbsp;đầu&nbsp;tư,&nbsp;phát&nbsp;triển&nbsp;mạnh&nbsp;mẽ&nbsp;theo&nbsp;hướng&nbsp;hiện&nbsp;đại,&nbsp;an&nbsp;toàn,&nbsp;nhiều&nbsp;công&nbsp;trình&nbsp;đạt&nbsp;chất&nbsp;lượng&nbsp;theo&nbsp;tiêu&nbsp;chuẩn&nbsp;quốc&nbsp;tế,&nbsp;mạng&nbsp;lưới&nbsp;giao&nbsp;thông&nbsp;đã&nbsp;kết&nbsp;nối&nbsp;đến&nbsp;mọi&nbsp;vùng,&nbsp;miền&nbsp;trong&nbsp;cả&nbsp;nước,&nbsp;giúp&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;logistics&nbsp;và&nbsp;thời&nbsp;gian&nbsp;giao&nbsp;hàng.&nbsp;Nhiều&nbsp;chính&nbsp;sách&nbsp;mới&nbsp;được&nbsp;ban&nbsp;hành,&nbsp;các&nbsp;thủ&nbsp;tục&nbsp;được&nbsp;điều&nbsp;chỉnh&nbsp;theo&nbsp;hướng&nbsp;tạo&nbsp;thuận&nbsp;lợi&nbsp;cho&nbsp;doanh&nbsp;nghiệp;&nbsp;công&nbsp;tác&nbsp;thông&nbsp;tin,&nbsp;tuyên&nbsp;truyền&nbsp;và&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;nghiên&nbsp;cứu,&nbsp;xúc&nbsp;tiến,&nbsp;hợp&nbsp;tác&nbsp;quốc&nbsp;tế&nbsp;về&nbsp;logistics&nbsp;diễn&nbsp;ra&nbsp;sôi&nbsp;nổi,&nbsp;rộng&nbsp;khắp&nbsp;ở&nbsp;cả&nbsp;cấp&nbsp;trung&nbsp;ương&nbsp;và&nbsp;địa&nbsp;phương.&nbsp;Vấn&nbsp;đề&nbsp;sản&nbsp;xuất&nbsp;thân&nbsp;thiện&nbsp;môi&nbsp;trường&nbsp;và&nbsp;phát&nbsp;triển&nbsp;bền&nbsp;vững&nbsp;được&nbsp;quan&nbsp;tâm&nbsp;ở&nbsp;cả&nbsp;cấp&nbsp;quản&nbsp;lý&nbsp;vĩ&nbsp;mô&nbsp;và&nbsp;doanh&nbsp;nghiệp.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Với&nbsp;tiềm&nbsp;năng&nbsp;phát&nbsp;triển&nbsp;thị&nbsp;trường&nbsp;logistics&nbsp;Việt&nbsp;Nam,&nbsp;nhiều&nbsp;doanh&nbsp;nghiệp&nbsp;trong&nbsp;nước&nbsp;và&nbsp;quốc&nbsp;tế&nbsp;đã&nbsp;và&nbsp;đang&nbsp;đầu&nbsp;tư&nbsp;mạnh&nbsp;vào&nbsp;lĩnh&nbsp;vực&nbsp;logistics,&nbsp;như:&nbsp;Công&nbsp;ty&nbsp;liên&nbsp;doanh&nbsp;Indo-Trans&nbsp;keppel&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;(ITL&nbsp;Keppel),&nbsp;Công&nbsp;ty&nbsp;Keppel&nbsp;logistics&nbsp;thuộc&nbsp;Tập&nbsp;đoàn&nbsp;Viễn&nbsp;thông&nbsp;và&nbsp;Vận&nbsp;tải&nbsp;Keppel,&nbsp;Công&nbsp;ty&nbsp;sản&nbsp;xuất,&nbsp;nhập&nbsp;khẩu&nbsp;Bình&nbsp;Dương&nbsp;(Protrade),&nbsp;Tập&nbsp;đoàn&nbsp;YCH&nbsp;của&nbsp;Singapore,&nbsp;Công&nbsp;ty&nbsp;DB&nbsp;Schenker&nbsp;Việt&nbsp;Nam&nbsp;thuộc&nbsp;Tập&nbsp;đoàn&nbsp;logistics&nbsp;Schenker&nbsp;đưa&nbsp;vào&nbsp;khai&nbsp;thác&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;SCL&nbsp;tại&nbsp;khu&nbsp;công&nbsp;nghiệp&nbsp;Sóng&nbsp;thần&nbsp;I&nbsp;(Bình&nbsp;Dương)…&nbsp;Cùng&nbsp;với&nbsp;quá&nbsp;trình&nbsp;hội&nbsp;nhập&nbsp;ngày&nbsp;càng&nbsp;sâu&nbsp;rộng&nbsp;vào&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;khu&nbsp;vực&nbsp;và&nbsp;thế&nbsp;giới,&nbsp;hệ&nbsp;thống&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;Việt&nbsp;Nam&nbsp;từng&nbsp;bước&nbsp;được&nbsp;hình&nbsp;thành,&nbsp;chủ&nbsp;yếu&nbsp;nằm&nbsp;trong&nbsp;các&nbsp;khu&nbsp;công&nbsp;nghiệp&nbsp;và&nbsp;ngày&nbsp;càng&nbsp;đóng&nbsp;vai&nbsp;trò&nbsp;quan&nbsp;trọng&nbsp;trong&nbsp;hệ&nbsp;thống&nbsp;logistics&nbsp;quốc&nbsp;gia,&nbsp;góp&nbsp;phần&nbsp;thúc&nbsp;đẩy&nbsp;thương&nbsp;mại&nbsp;trong&nbsp;nước&nbsp;và&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;hàng&nbsp;hóa.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Tuy&nbsp;nhiên,&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;ở&nbsp;nước&nbsp;ta&nbsp;chủ&nbsp;yếu&nbsp;thuộc&nbsp;sở&nbsp;hữu&nbsp;của&nbsp;một&nbsp;doanh&nbsp;nghiệp&nbsp;và&nbsp;cung&nbsp;ứng&nbsp;dịch&nbsp;vụ&nbsp;cho&nbsp;khách&nbsp;hàng,&nbsp;chưa&nbsp;có&nbsp;nhiều&nbsp;trung&nbsp;tâm&nbsp;phát&nbsp;triển&nbsp;đến&nbsp;quy&nbsp;mô&nbsp;hội&nbsp;đủ&nbsp;các&nbsp;yếu&nbsp;tố&nbsp;của&nbsp;một&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;hiện&nbsp;đại&nbsp;như&nbsp;các&nbsp;nước&nbsp;phát&nbsp;triển,&nbsp;chưa&nbsp;hình&nbsp;thành&nbsp;các&nbsp;cụm&nbsp;logistics.&nbsp;Một&nbsp;số&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;chưa&nbsp;thực&nbsp;hiện&nbsp;được&nbsp;chức&nbsp;năng&nbsp;kết&nbsp;nối&nbsp;liên&nbsp;hoàn&nbsp;các&nbsp;phương&nbsp;tiện&nbsp;vận&nbsp;tải&nbsp;của&nbsp;các&nbsp;địa&nbsp;phương&nbsp;và&nbsp;vùng&nbsp;lãnh&nbsp;thổ&nbsp;vì&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;hiện&nbsp;nay&nbsp;được&nbsp;xây&nbsp;dựng&nbsp;riêng&nbsp;lẻ&nbsp;chỉ&nbsp;để&nbsp;phục&nbsp;vụ&nbsp;mục&nbsp;đích&nbsp;của&nbsp;doanh&nbsp;nghiệp&nbsp;đầu&nbsp;tư&nbsp;kinh&nbsp;doanh.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg&nbsp;về&nbsp;quy&nbsp;hoạch&nbsp;phát&nbsp;triển&nbsp;hệ&nbsp;thống&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;quy&nbsp;mô&nbsp;loại&nbsp;1&nbsp;mới&nbsp;chỉ&nbsp;có&nbsp;20&nbsp;-&nbsp;30&nbsp;ha,&nbsp;loại&nbsp;2:&nbsp;10&nbsp;-&nbsp;12&nbsp;ha;&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;chuyên&nbsp;dùng&nbsp;chỉ&nbsp;có&nbsp;3&nbsp;-&nbsp;4&nbsp;ha.&nbsp;Tại&nbsp;các&nbsp;khu&nbsp;công&nbsp;nghiệp&nbsp;hiện&nbsp;có&nbsp;của&nbsp;các&nbsp;địa&nbsp;phương,&nbsp;thành&nbsp;phố,&nbsp;các&nbsp;doanh&nbsp;nghiệp&nbsp;đầu&nbsp;tư&nbsp;xây&nbsp;dựng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;riêng&nbsp;để&nbsp;phục&nbsp;vụ&nbsp;cho&nbsp;sản&nbsp;xuất,&nbsp;kinh&nbsp;doanh;&nbsp;bên&nbsp;cạnh&nbsp;đó&nbsp;đang&nbsp;có&nbsp;sự&nbsp;bất&nbsp;cập&nbsp;trong&nbsp;quy&nbsp;hoạch&nbsp;các&nbsp;khu&nbsp;công&nbsp;nghiệp&nbsp;và&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;ở&nbsp;Việt&nbsp;Nam.&nbsp;Thực&nbsp;trạng&nbsp;này&nbsp;khiến&nbsp;cho&nbsp;chi&nbsp;phí&nbsp;logistics&nbsp;tăng&nbsp;cao&nbsp;so&nbsp;với&nbsp;các&nbsp;nước,&nbsp;thời&nbsp;gian&nbsp;luân&nbsp;chuyển&nbsp;hàng&nbsp;hóa&nbsp;giữa&nbsp;các&nbsp;vùng&nbsp;còn&nbsp;dài,&nbsp;do&nbsp;đó&nbsp;làm&nbsp;giảm&nbsp;giá&nbsp;trị,&nbsp;chất&nbsp;lượng&nbsp;hàng&nbsp;hóa&nbsp;và&nbsp;khả&nbsp;năng&nbsp;cạnh&nbsp;tranh&nbsp;trên&nbsp;các&nbsp;thị&nbsp;trường.&nbsp;Hiện&nbsp;nay,&nbsp;các&nbsp;địa&nbsp;phương&nbsp;đã&nbsp;quy&nbsp;hoạch,&nbsp;triển&nbsp;khai&nbsp;và&nbsp;xây&nbsp;dựng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;tích&nbsp;hợp&nbsp;trong&nbsp;quy&nbsp;hoạch&nbsp;tỉnh,&nbsp;song&nbsp;việc&nbsp;triển&nbsp;khai&nbsp;thực&nbsp;hiện&nbsp;vẫn&nbsp;còn&nbsp;chậm.&nbsp;Năng&nbsp;lực&nbsp;khai&nbsp;thác&nbsp;của&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;chưa&nbsp;đạt&nbsp;như&nbsp;kỳ&nbsp;vọng&nbsp;do&nbsp;quy&nbsp;mô,&nbsp;tác&nbsp;động&nbsp;của&nbsp;thị&nbsp;trường.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Sự&nbsp;phát&nbsp;triển&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;ở&nbsp;nước&nbsp;ta&nbsp;vẫn&nbsp;còn&nbsp;nhiều&nbsp;bất&nbsp;cập&nbsp;do&nbsp;nhiều&nbsp;nguyên&nbsp;nhân&nbsp;chủ&nbsp;quan&nbsp;và&nbsp;khách&nbsp;quan.&nbsp;Trước&nbsp;hết&nbsp;do&nbsp;cơ&nbsp;chế,&nbsp;chính&nbsp;sách&nbsp;phát&nbsp;triển&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;hạn&nbsp;chế&nbsp;nên&nbsp;chưa&nbsp;thực&nbsp;sự&nbsp;thúc&nbsp;đẩy&nbsp;và&nbsp;thu&nbsp;hút&nbsp;đầu&nbsp;tư&nbsp;vào&nbsp;lĩnh&nbsp;vực&nbsp;này.&nbsp;Vì&nbsp;vậy,&nbsp;cho&nbsp;đến&nbsp;thời&nbsp;điểm&nbsp;hiện&nbsp;tại&nbsp;số&nbsp;lượng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;ở&nbsp;Việt&nbsp;Nam&nbsp;không&nbsp;nhiều.&nbsp;Sự&nbsp;quan&nbsp;tâm,&nbsp;quy&nbsp;hoạch&nbsp;đầu&nbsp;tư&nbsp;xây&nbsp;dựng&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;còn&nbsp;hạn&nbsp;chế;&nbsp;hệ&nbsp;thống&nbsp;kết&nbsp;cấu&nbsp;hạ&nbsp;tầng&nbsp;giao&nbsp;thông&nbsp;tuy&nbsp;được&nbsp;đầu&nbsp;tư&nbsp;xây&nbsp;dựng&nbsp;khang&nbsp;trang&nbsp;nhưng&nbsp;mang&nbsp;tính&nbsp;đơn&nbsp;lẻ&nbsp;theo&nbsp;từng&nbsp;phương&nbsp;tiện,&nbsp;thiếu&nbsp;kết&nbsp;nối&nbsp;liên&nbsp;hoàn,&nbsp;thiếu&nbsp;mô&nbsp;hình&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;cho&nbsp;vận&nbsp;hành&nbsp;khai&nbsp;thác&nbsp;hiệu&nbsp;quả&nbsp;và&nbsp;văn&nbsp;minh&nbsp;giao&nbsp;thông;&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;có&nbsp;quy&nbsp;mô&nbsp;rất&nbsp;hạn&nbsp;chế.&nbsp;Nhận&nbsp;thức&nbsp;về&nbsp;vai&nbsp;trò&nbsp;và&nbsp;vị&nbsp;trí&nbsp;của&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;nói&nbsp;chung&nbsp;và&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;nói&nbsp;riêng&nbsp;trong&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;chưa&nbsp;đầy&nbsp;đủ.&nbsp;Các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;chưa&nbsp;phát&nbsp;huy&nbsp;hiệu&nbsp;quả&nbsp;cao&nbsp;trong&nbsp;việc&nbsp;thúc&nbsp;đẩy&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;hàng&nbsp;hóa.&nbsp;Các&nbsp;ngành&nbsp;và&nbsp;các&nbsp;địa&nbsp;phương&nbsp;chưa&nbsp;thực&nbsp;sự&nbsp;quan&nbsp;tâm,&nbsp;ủng&nbsp;hộ&nbsp;logistics&nbsp;và&nbsp;phát&nbsp;triển&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;vì&nbsp;mô&nbsp;hình&nbsp;tăng&nbsp;trưởng&nbsp;kinh&nbsp;tế&nbsp;vẫn&nbsp;chủ&nbsp;yếu&nbsp;dựa&nbsp;vào&nbsp;tài&nbsp;nguyên&nbsp;và&nbsp;lao&nbsp;động&nbsp;trình&nbsp;độ&nbsp;thấp.&nbsp;Hàng&nbsp;hóa&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;chủ&nbsp;yếu&nbsp;vẫn&nbsp;là&nbsp;gia&nbsp;công&nbsp;và&nbsp;khối&nbsp;doanh&nbsp;nghiệp&nbsp;nước&nbsp;ngoài&nbsp;vẫn&nbsp;chiểm&nbsp;tỷ&nbsp;trọng&nbsp;chủ&nbsp;yếu&nbsp;trong&nbsp;kim&nbsp;ngạch&nbsp;xuất&nbsp;khẩu&nbsp;của&nbsp;Việt&nbsp;Nam.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Ngoài&nbsp;ra,&nbsp;một&nbsp;nguyên&nbsp;nhân&nbsp;không&nbsp;kém&nbsp;phần&nbsp;quan&nbsp;trọng&nbsp;nữa&nbsp;đó&nbsp;là&nbsp;do&nbsp;nhân&nbsp;lực&nbsp;trong&nbsp;ngành&nbsp;Logistics&nbsp;vẫn&nbsp;còn&nbsp;thiếu&nbsp;và&nbsp;hạn&nbsp;chế.&nbsp;Việc&nbsp;thiếu&nbsp;nhân&nbsp;lực&nbsp;được&nbsp;đào&nbsp;tạo&nbsp;bài&nbsp;bản,&nbsp;chính&nbsp;quy&nbsp;về&nbsp;các&nbsp;kiến&nbsp;thức&nbsp;và&nbsp;kỹ&nbsp;năng&nbsp;chuyên&nbsp;ngành&nbsp;cũng&nbsp;là&nbsp;một&nbsp;rào&nbsp;cản&nbsp;không&nbsp;nhỏ&nbsp;đối&nbsp;với&nbsp;sự&nbsp;phát&nbsp;triển&nbsp;chung&nbsp;của&nbsp;ngành&nbsp;Logistics.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">3.&nbsp;Đề&nbsp;xuất&nbsp;giải&nbsp;pháp&nbsp;phát&nbsp;triển&nbsp;trung&nbsp;tâm&nbsp;logistics</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Một&nbsp;là,&nbsp;để&nbsp;quản&nbsp;lý&nbsp;nhà&nbsp;nước&nbsp;và&nbsp;thu&nbsp;hút&nbsp;đầu&nbsp;tư&nbsp;phát&nbsp;triển&nbsp;hệ&nbsp;thống&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;cần&nbsp;xây&nbsp;dựng&nbsp;cơ&nbsp;chế,&nbsp;chính&nbsp;sách&nbsp;rõ&nbsp;ràng&nbsp;hơn.&nbsp;Có&nbsp;thể&nbsp;ban&nbsp;hành&nbsp;Quyết&nbsp;định,&nbsp;Nghị&nbsp;định&nbsp;của&nbsp;Chính&nbsp;phủ&nbsp;hoặc&nbsp;Thông&nbsp;tư&nbsp;quy&nbsp;định&nbsp;các&nbsp;nội&nbsp;dung&nbsp;quan&nbsp;trọng&nbsp;về&nbsp;hạ&nbsp;tầng&nbsp;logistics,&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;như&nbsp;khái&nbsp;niệm&nbsp;(làm&nbsp;rõ&nbsp;nội&nbsp;hàm),&nbsp;tiêu&nbsp;chí&nbsp;phân&nbsp;loại,&nbsp;phân&nbsp;hạng&nbsp;trung&nbsp;tâm&nbsp;logistics,&nbsp;phân&nbsp;cấp,&nbsp;phân&nbsp;quyền&nbsp;quản&nbsp;lý&nbsp;trung&nbsp;tâm&nbsp;logistics…).</span></p><p><span style=\"color: rgb(0, 0, 0);\">Hai&nbsp;là,&nbsp;cần&nbsp;đánh&nbsp;giá&nbsp;tổng&nbsp;thể&nbsp;việc&nbsp;thực&nbsp;hiện&nbsp;Quyết&nbsp;định&nbsp;số&nbsp;1012/QĐ-TTg,&nbsp;cần&nbsp;rút&nbsp;ra&nbsp;bài&nbsp;học&nbsp;kinh&nbsp;nghiệm.&nbsp;Đồng&nbsp;thời,&nbsp;theo&nbsp;quy&nbsp;định&nbsp;tại&nbsp;điểm&nbsp;c,&nbsp;khoản&nbsp;1,&nbsp;Điều&nbsp;59&nbsp;Luật&nbsp;Quy&nbsp;hoạch&nbsp;năm&nbsp;2017,&nbsp;Quy&nbsp;hoạch&nbsp;phát&nbsp;triển&nbsp;hệ&nbsp;thống&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;sẽ&nbsp;tích&nbsp;hợp&nbsp;vào&nbsp;quy&nbsp;hoạch&nbsp;cấp&nbsp;quốc&nbsp;gia,&nbsp;quy&nbsp;hoạch&nbsp;vùng,&nbsp;quy&nbsp;hoạch&nbsp;tỉnh&nbsp;được&nbsp;thực&nbsp;hiện&nbsp;cho&nbsp;đến&nbsp;khi&nbsp;quy&nbsp;hoạch&nbsp;cấp&nbsp;quốc&nbsp;gia,&nbsp;quy&nbsp;hoạch&nbsp;vùng,&nbsp;quy&nbsp;hoạch&nbsp;tỉnh&nbsp;được&nbsp;quyết&nbsp;định&nbsp;hoặc&nbsp;phê&nbsp;duyệt.&nbsp;Thực&nbsp;hiện&nbsp;chủ&nbsp;trương&nbsp;đã&nbsp;được&nbsp;Trung&nbsp;ương&nbsp;Đảng&nbsp;thông&nbsp;qua&nbsp;tại&nbsp;Hội&nbsp;nghị&nbsp;Trung&nbsp;ương&nbsp;lần&nbsp;thứ&nbsp;11,&nbsp;khóa&nbsp;XIII,&nbsp;sắp&nbsp;tới&nbsp;sẽ&nbsp;có&nbsp;nhiều&nbsp;địa&nbsp;phương&nbsp;nằm&nbsp;trong&nbsp;diện&nbsp;sáp&nbsp;nhập,&nbsp;do&nbsp;vậy,&nbsp;quy&nbsp;hoạch&nbsp;của&nbsp;các&nbsp;địa&nbsp;phương&nbsp;cũng&nbsp;sẽ&nbsp;có&nbsp;thay&nbsp;đổi.&nbsp;Dựa&nbsp;vào&nbsp;quy&nbsp;hoạch&nbsp;chung,&nbsp;cần&nbsp;điều&nbsp;chỉnh,&nbsp;bổ&nbsp;sung&nbsp;quy&nbsp;hoạch&nbsp;phát&nbsp;triển&nbsp;hệ&nbsp;thống&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;tại&nbsp;các&nbsp;địa&nbsp;bàn&nbsp;cả&nbsp;nước.&nbsp;Trong&nbsp;đó,&nbsp;xác&nbsp;định&nbsp;lại&nbsp;các&nbsp;không&nbsp;gian&nbsp;kinh&nbsp;tế&nbsp;và&nbsp;phân&nbsp;bố&nbsp;một&nbsp;cách&nbsp;tương&nbsp;thích&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;quốc&nbsp;gia&nbsp;và&nbsp;cấp&nbsp;vùng,&nbsp;đảm&nbsp;bảo&nbsp;thống&nbsp;nhất&nbsp;với&nbsp;định&nbsp;hướng&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế,&nbsp;xã&nbsp;hội,&nbsp;định&nbsp;hướng&nbsp;ngành&nbsp;và&nbsp;lĩnh&nbsp;vực&nbsp;liên&nbsp;quan,&nbsp;đáp&nbsp;ứng&nbsp;nhu&nbsp;cầu&nbsp;phát&nbsp;triển&nbsp;sản&nbsp;xuất&nbsp;kinh&nbsp;doanh,&nbsp;thúc&nbsp;đẩy&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế&nbsp;các&nbsp;vùng&nbsp;và&nbsp;cả&nbsp;nước.&nbsp;Ưu&nbsp;tiên&nbsp;đầu&nbsp;tư&nbsp;nâng&nbsp;cấp&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;hiện&nbsp;có&nbsp;hoạt&nbsp;động&nbsp;hiệu&nbsp;quả&nbsp;hơn,&nbsp;hướng&nbsp;tới&nbsp;xây&nbsp;dựng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;quy&nbsp;mô,&nbsp;hiện&nbsp;đại&nbsp;và&nbsp;đầy&nbsp;đủ&nbsp;chức&nbsp;năng.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Ba&nbsp;là,&nbsp;cần&nbsp;có&nbsp;chính&nbsp;sách&nbsp;ưu&nbsp;tiên&nbsp;tập&nbsp;trung&nbsp;đầu&nbsp;tư&nbsp;cho&nbsp;phát&nbsp;triển&nbsp;các&nbsp;cụm&nbsp;logistics&nbsp;kết&nbsp;nối&nbsp;với&nbsp;các&nbsp;cảng&nbsp;biển&nbsp;quốc&nbsp;tế,&nbsp;các&nbsp;cửa&nbsp;khẩu&nbsp;quốc&nbsp;tế&nbsp;và&nbsp;các&nbsp;cửa&nbsp;ngõ&nbsp;đi&nbsp;vào&nbsp;các&nbsp;thành&nbsp;phố&nbsp;lớn&nbsp;để&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;logistics.&nbsp;Xây&nbsp;dựng&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;để&nbsp;kết&nbsp;nối&nbsp;các&nbsp;địa&nbsp;phương&nbsp;nhằm&nbsp;thực&nbsp;hiện&nbsp;liên&nbsp;kết&nbsp;kinh&nbsp;tế,&nbsp;khai&nbsp;thác&nbsp;hiệu&nbsp;quả&nbsp;các&nbsp;hành&nbsp;lang&nbsp;kinh&nbsp;tế&nbsp;trên&nbsp;các&nbsp;địa&nbsp;bàn.&nbsp;Khuyến&nbsp;khích&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;cung&nbsp;cấp&nbsp;chuỗi&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;toàn&nbsp;trình&nbsp;nhằm&nbsp;tiết&nbsp;kiệm&nbsp;thời&nbsp;gian,&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;cho&nbsp;các&nbsp;doanh&nbsp;nghiệp.&nbsp;Dựa&nbsp;vào&nbsp;sự&nbsp;tăng&nbsp;trưởng&nbsp;quy&nbsp;mô&nbsp;của&nbsp;thị&nbsp;trường,&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;cần&nbsp;được&nbsp;thiết&nbsp;kế&nbsp;các&nbsp;dịch&nbsp;vụ&nbsp;trọng&nbsp;tâm&nbsp;nhằm&nbsp;giảm&nbsp;hiện&nbsp;tượng&nbsp;phân&nbsp;mảnh&nbsp;và&nbsp;manh&nbsp;mún.&nbsp;Các&nbsp;dịch&nbsp;vụ&nbsp;đi&nbsp;kèm&nbsp;khác&nbsp;như&nbsp;ngân&nbsp;hàng,&nbsp;bảo&nbsp;hiểm,&nbsp;văn&nbsp;phòng,&nbsp;sửa&nbsp;chữa&nbsp;container,&nbsp;pallet&nbsp;cũng&nbsp;cần&nbsp;được&nbsp;hỗ&nbsp;trợ.&nbsp;Bên&nbsp;cạnh&nbsp;đó,&nbsp;cần&nbsp;đầu&nbsp;tư&nbsp;xây&nbsp;dựng&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;tập&nbsp;trung&nbsp;vào&nbsp;các&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;thuê&nbsp;ngoài,&nbsp;tích&nbsp;hợp&nbsp;trọn&nbsp;gói&nbsp;và&nbsp;đồng&nbsp;bộ,&nbsp;tổ&nbsp;chức&nbsp;và&nbsp;hoạt&nbsp;động&nbsp;theo&nbsp;mô&nbsp;hình&nbsp;logistics&nbsp;bên&nbsp;thứ&nbsp;3&nbsp;(3PL),&nbsp;triển&nbsp;khai&nbsp;mô&nbsp;hình&nbsp;logistics&nbsp;bên&nbsp;thứ&nbsp;4&nbsp;(4PL)&nbsp;và&nbsp;logistics&nbsp;bên&nbsp;thứ&nbsp;5&nbsp;(5PL)&nbsp;trên&nbsp;cơ&nbsp;sở&nbsp;phát&nbsp;triển&nbsp;thương&nbsp;mại&nbsp;điện&nbsp;tử&nbsp;và&nbsp;quản&nbsp;trị&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;hiện&nbsp;đại,&nbsp;hiệu&nbsp;quả,&nbsp;chuyên&nbsp;nghiệp.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Bốn&nbsp;là,&nbsp;hoàn&nbsp;thiện&nbsp;cơ&nbsp;chế,&nbsp;chính&nbsp;sách&nbsp;khuyến&nbsp;khích,&nbsp;ưu&nbsp;tiên&nbsp;cho&nbsp;đầu&nbsp;tư&nbsp;phát&nbsp;triển&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;hiện&nbsp;đại,&nbsp;bền&nbsp;vững&nbsp;(trong&nbsp;đó&nbsp;có&nbsp;logistics&nbsp;xanh&nbsp;nhằm&nbsp;bảo&nbsp;vệ&nbsp;môi&nbsp;trường,&nbsp;giảm&nbsp;thiểu&nbsp;khí&nbsp;thải&nbsp;carbon).&nbsp;Cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;logistics&nbsp;phát&nbsp;triển&nbsp;chính&nbsp;là&nbsp;hệ&nbsp;thống&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;được&nbsp;kết&nbsp;nối&nbsp;liên&nbsp;hoàn&nbsp;của&nbsp;các&nbsp;cơ&nbsp;sở&nbsp;hạ&nbsp;tầng&nbsp;giao&nbsp;thông,&nbsp;thương&nbsp;mại,&nbsp;công&nbsp;nghệ&nbsp;thông&nbsp;tin&nbsp;và&nbsp;các&nbsp;lĩnh&nbsp;vực&nbsp;dịch&nbsp;vụ&nbsp;khác&nbsp;có&nbsp;liên&nbsp;quan&nbsp;theo&nbsp;hướng&nbsp;đảm&nbsp;bảo&nbsp;tối&nbsp;ưu&nbsp;hóa&nbsp;dòng&nbsp;vận&nbsp;động&nbsp;hàng&nbsp;hóa,&nbsp;tiền&nbsp;tệ,&nbsp;thông&nbsp;tin&nbsp;với&nbsp;mục&nbsp;tiêu&nbsp;giảm&nbsp;chi&nbsp;phí&nbsp;thấp&nbsp;nhất&nbsp;trong&nbsp;phân&nbsp;phối,&nbsp;lưu&nbsp;thông&nbsp;của&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;quốc&nbsp;dân.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Công&nbsp;nghệ&nbsp;thông&nbsp;tin&nbsp;ứng&nbsp;dụng&nbsp;hiệu&nbsp;quả&nbsp;sẽ&nbsp;giúp&nbsp;các&nbsp;doanh&nbsp;nghiệp&nbsp;logistics&nbsp;nhanh&nbsp;chóng&nbsp;cập&nbsp;nhật&nbsp;các&nbsp;phương&nbsp;tiện,&nbsp;hàng&nbsp;hóa&nbsp;được&nbsp;vận&nbsp;chuyển&nbsp;giữa&nbsp;các&nbsp;bên&nbsp;liên&nbsp;quan,&nbsp;kịp&nbsp;thời&nbsp;triển&nbsp;khai&nbsp;các&nbsp;dịch&nbsp;vụ,&nbsp;từ&nbsp;đó&nbsp;hạn&nbsp;chế&nbsp;tối&nbsp;đa&nbsp;các&nbsp;chi&nbsp;phí&nbsp;phát&nbsp;sinh&nbsp;cũng&nbsp;như&nbsp;các&nbsp;chi&nbsp;phí&nbsp;không&nbsp;chính&nbsp;thức&nbsp;khác,&nbsp;qua&nbsp;đó&nbsp;nâng&nbsp;cao&nbsp;khả&nbsp;năng&nbsp;cạnh&nbsp;tranh&nbsp;của&nbsp;hàng&nbsp;hóa&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;Việt&nbsp;Nam&nbsp;trên&nbsp;thị&nbsp;trường&nbsp;quốc&nbsp;tế.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Năm&nbsp;là,&nbsp;cần&nbsp;có&nbsp;cơ&nbsp;chế,&nbsp;chính&nbsp;sách&nbsp;thu&nbsp;hút&nbsp;các&nbsp;nguồn&nbsp;hàng&nbsp;trong&nbsp;lưu&nbsp;thông&nbsp;(có&nbsp;hàng&nbsp;hóa&nbsp;mới&nbsp;có&nbsp;dịch&nbsp;vụ&nbsp;logistics),&nbsp;liên&nbsp;kết,&nbsp;mở&nbsp;rộng&nbsp;các&nbsp;thị&nbsp;trường&nbsp;trong&nbsp;nước&nbsp;và&nbsp;quốc&nbsp;tế&nbsp;bằng&nbsp;cơ&nbsp;chế&nbsp;hợp&nbsp;tác&nbsp;liên&nbsp;ngành,&nbsp;liên&nbsp;vùng,&nbsp;liên&nbsp;quốc&nbsp;gia,&nbsp;thu&nbsp;hút&nbsp;các&nbsp;doanh&nbsp;nghiệp&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;lớn&nbsp;đầu&nbsp;tư&nbsp;vào&nbsp;sản&nbsp;xuất&nbsp;-&nbsp;kinh&nbsp;doanh,&nbsp;thúc&nbsp;đẩy&nbsp;hoạt&nbsp;động&nbsp;xuất&nbsp;nhập&nbsp;khẩu.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Sáu&nbsp;là,&nbsp;đẩy&nbsp;mạnh&nbsp;đào&nbsp;tạo&nbsp;và&nbsp;phát&nbsp;triển&nbsp;nguồn&nbsp;nhân&nbsp;lực&nbsp;cho&nbsp;ngành&nbsp;Logistics&nbsp;Việt&nbsp;Nam&nbsp;nhằm&nbsp;thúc&nbsp;đẩy&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;xuất&nbsp;nhập&nbsp;khẩu&nbsp;cho&nbsp;các&nbsp;doanh&nbsp;nghiệp.&nbsp;Theo&nbsp;Báo&nbsp;cáo&nbsp;Logistics&nbsp;Việt&nbsp;Nam&nbsp;năm&nbsp;2024,&nbsp;ngành&nbsp;Logistics&nbsp;Việt&nbsp;Nam&nbsp;đang&nbsp;phải&nbsp;đối&nbsp;mặt&nbsp;với&nbsp;một&nbsp;khoảng&nbsp;trống&nbsp;lớn&nbsp;về&nbsp;nguồn&nbsp;nhân&nbsp;lực&nbsp;có&nbsp;trình&nbsp;độ&nbsp;chuyên&nbsp;môn.&nbsp;Nhu&nbsp;cầu&nbsp;về&nbsp;nhân&nbsp;lực&nbsp;trong&nbsp;ngành&nbsp;này&nbsp;dự&nbsp;kiến&nbsp;sẽ&nbsp;tăng&nbsp;mạnh,&nbsp;từ&nbsp;khoảng&nbsp;1,2&nbsp;triệu&nbsp;người&nbsp;hiện&nbsp;tại&nbsp;lên&nbsp;tới&nbsp;2,5&nbsp;triệu&nbsp;người&nbsp;vào&nbsp;năm&nbsp;2030.&nbsp;Tuy&nbsp;nhiên,&nbsp;chỉ&nbsp;có&nbsp;khoảng&nbsp;5&nbsp;-&nbsp;7%&nbsp;lực&nbsp;lượng&nbsp;lao&nbsp;động&nbsp;trong&nbsp;ngành&nbsp;Logistics&nbsp;được&nbsp;đào&nbsp;tạo&nbsp;bài&nbsp;bản,&nbsp;dẫn&nbsp;đến&nbsp;tình&nbsp;trạng&nbsp;thiếu&nbsp;hụt&nbsp;nghiêm&nbsp;trọng&nbsp;về&nbsp;nhân&nbsp;lực&nbsp;có&nbsp;trình&nbsp;độ.&nbsp;Do&nbsp;đó,&nbsp;cần&nbsp;có&nbsp;chính&nbsp;sách&nbsp;hỗ&nbsp;trợ&nbsp;phát&nbsp;triển&nbsp;nguồn&nbsp;nhân&nbsp;lực&nbsp;logistics&nbsp;(học&nbsp;bổng,&nbsp;hỗ&nbsp;trợ&nbsp;tài&nbsp;chính&nbsp;và&nbsp;khuyến&nbsp;khích&nbsp;doanh&nbsp;nghiệp&nbsp;đầu&nbsp;tư&nbsp;vào&nbsp;đào&nbsp;tạo),&nbsp;tạo&nbsp;điều&nbsp;kiện&nbsp;để&nbsp;sinh&nbsp;viên&nbsp;được&nbsp;tiếp&nbsp;cận&nbsp;với&nbsp;môi&nbsp;trường&nbsp;thực&nbsp;tế.&nbsp;Tăng&nbsp;cường&nbsp;phối&nbsp;hợp&nbsp;giữa&nbsp;các&nbsp;bộ,&nbsp;ngành&nbsp;liên&nbsp;quan&nbsp;đến&nbsp;logistics&nbsp;như&nbsp;Bộ&nbsp;Xây&nbsp;dựng,&nbsp;Bộ&nbsp;Giáo&nbsp;dục&nbsp;và&nbsp;Đào&nbsp;tạo,&nbsp;Bộ&nbsp;Công&nbsp;Thương,&nbsp;các&nbsp;Hiệp&nbsp;hội&nbsp;và&nbsp;các&nbsp;trường&nbsp;đại&nbsp;học&nbsp;để&nbsp;phát&nbsp;triển&nbsp;chương&nbsp;trình&nbsp;đào&nbsp;tạo&nbsp;logistics&nbsp;phù&nbsp;hợp&nbsp;với&nbsp;nhu&nbsp;cầu&nbsp;thị&nbsp;trường.</span></p><p><strong style=\"color: rgb(0, 0, 0);\">4.&nbsp;Kết&nbsp;luận</strong></p><p><span style=\"color: rgb(0, 0, 0);\">Với&nbsp;vị&nbsp;trí&nbsp;thuận&nbsp;lợi&nbsp;trong&nbsp;vận&nbsp;chuyển&nbsp;đường&nbsp;hàng&nbsp;hải,&nbsp;hàng&nbsp;không&nbsp;quốc&nbsp;tế,&nbsp;đường&nbsp;bộ,&nbsp;đường&nbsp;sắt,&nbsp;Việt&nbsp;Nam&nbsp;có&nbsp;thể&nbsp;trở&nbsp;thành&nbsp;trung&nbsp;tâm&nbsp;trung&nbsp;chuyển&nbsp;thương&nbsp;mại&nbsp;quan&nbsp;trọng,&nbsp;kết&nbsp;nối&nbsp;khu&nbsp;vực&nbsp;và&nbsp;quốc&nbsp;tế.&nbsp;Đồng&nbsp;thời,&nbsp;với&nbsp;vị&nbsp;trí&nbsp;chiến&nbsp;lược&nbsp;tại&nbsp;Đông&nbsp;Nam&nbsp;Á,&nbsp;nằm&nbsp;giữa&nbsp;các&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;lớn&nbsp;và&nbsp;tiềm&nbsp;năng&nbsp;phát&nbsp;triển&nbsp;mạnh&nbsp;mẽ&nbsp;trong&nbsp;lĩnh&nbsp;vực&nbsp;logistics,&nbsp;Việt&nbsp;Nam&nbsp;có&nbsp;thể&nbsp;được&nbsp;định&nbsp;vị&nbsp;như&nbsp;một&nbsp;trung&nbsp;tâm&nbsp;trung&nbsp;chuyển&nbsp;hàng&nbsp;hóa&nbsp;quan&nbsp;trọng&nbsp;trên&nbsp;bản&nbsp;đồ&nbsp;kinh&nbsp;tế&nbsp;toàn&nbsp;cầu.&nbsp;Trong&nbsp;thời&nbsp;gian&nbsp;tới,&nbsp;cần&nbsp;tiếp&nbsp;tục&nbsp;triển&nbsp;khai&nbsp;đồng&nbsp;bộ&nbsp;các&nbsp;giải&nbsp;pháp&nbsp;nhằm&nbsp;phát&nbsp;triển&nbsp;hạ&nbsp;tầng&nbsp;logistics,&nbsp;trung&nbsp;tâm&nbsp;logistics&nbsp;đồng&nbsp;bộ&nbsp;hơn,&nbsp;hiện&nbsp;đại&nbsp;hơn&nbsp;nhằm&nbsp;đáp&nbsp;ứng&nbsp;nhu&nbsp;cầu&nbsp;hội&nbsp;nhập,&nbsp;thu&nbsp;hút&nbsp;đầu&nbsp;tư,&nbsp;kết&nbsp;nối&nbsp;và&nbsp;thúc&nbsp;đẩy&nbsp;phát&nbsp;triển&nbsp;kinh&nbsp;tế&nbsp;-&nbsp;xã&nbsp;hội&nbsp;của&nbsp;các&nbsp;địa&nbsp;phương&nbsp;và&nbsp;cả&nbsp;nước./.</span></p><p><em style=\"color: rgb(0, 0, 0);\">Nguồn:&nbsp;Bài&nbsp;báo&nbsp;Thực&nbsp;trạng&nbsp;và&nbsp;giải&nbsp;pháp&nbsp;phát&nbsp;triển&nbsp;các&nbsp;trung&nbsp;tâm&nbsp;Logistics&nbsp;tại&nbsp;Việt&nbsp;Nam&nbsp;hiện&nbsp;nay&nbsp;do&nbsp;Đào&nbsp;Minh&nbsp;Thu1&nbsp;-&nbsp;Lê&nbsp;Thị&nbsp;Thu&nbsp;Hằng2&nbsp;(1Cục&nbsp;Quản&nbsp;lý&nbsp;và&nbsp;Phát&nbsp;triển&nbsp;thị&nbsp;trường&nbsp;trong&nbsp;nước,&nbsp;Bộ&nbsp;Công&nbsp;Thương&nbsp;-&nbsp;2Khoa&nbsp;Quản&nbsp;trị&nbsp;Kinh&nbsp;doanh&nbsp;I,&nbsp;Học&nbsp;viện&nbsp;Công&nbsp;nghệ&nbsp;bưu&nbsp;chính&nbsp;viễn&nbsp;thông)&nbsp;thực&nbsp;hiện.</em></p><p><em style=\"color: rgb(0, 0, 0);\"><u><a href=\"https://tapchicongthuong.vn/thuc-trang-va-giai-phap-phat-trien-cac-trung-tam-logistics-tai-viet-nam-hien-nay-245654.htm\" rel=\"noopener noreferrer\" target=\"_blank\">Link&nbsp;gốc</a></u>&nbsp;Tạp&nbsp;chí&nbsp;Công&nbsp;Thương</em></p>', '/uploads/news-1777760736873-831096217.jpg', 'Admin', 0, '2026-05-02 22:23:36', '2026-05-02 22:25:36');
INSERT INTO `news` (`id`, `title`, `desc`, `content`, `image`, `author`, `comments`, `created_at`, `updated_at`) VALUES
(4, 'Ngành logistics là gì? Ý nghĩa và vai trò', 'Ngành logistics là gì? Nó có ý nghĩa và vai trò như thế nào trong thời đại công nghiệp hóa hiện nay? Cùng Cơ Khí Việt Thắng tìm hiểu về logistics trong bài viết dưới đây nhé!', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Logistics&nbsp;là&nbsp;giải&nbsp;pháp&nbsp;trong&nbsp;quá&nbsp;trình&nbsp;sản&nbsp;xuất&nbsp;và&nbsp;phân&nbsp;phối&nbsp;sản&nbsp;phẩm&nbsp;đến&nbsp;tay&nbsp;người&nbsp;tiêu&nbsp;dùng&nbsp;được&nbsp;ứng&nbsp;dụng&nbsp;phổ&nbsp;biến&nbsp;và&nbsp;vô&nbsp;cùng&nbsp;linh&nbsp;hoạt.&nbsp;Vì&nbsp;vậy&nbsp;có&nbsp;thể&nbsp;nói&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;vô&nbsp;cùng&nbsp;quan&nbsp;trọng.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\"><img src=\"https://cokhivietthang.vn/wp-content/uploads/2024/02/Nganh-logistics-la-gi-Y-nghia-va-vai-tro-trong-cong-nghiep-hoa.jpg\" alt=\"Ngành logistics là gì? Ý nghĩa và vai trò trong công nghiệp hóa\" height=\"400\" width=\"600\"></span><em style=\"background-color: rgba(0, 0, 0, 0.05); color: rgb(70, 66, 66);\">Ngành&nbsp;logistics&nbsp;là&nbsp;gì?&nbsp;Ý&nbsp;nghĩa&nbsp;và&nbsp;vai&nbsp;trò&nbsp;trong&nbsp;công&nbsp;nghiệp&nbsp;hóa</em></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">Ngành&nbsp;logistics&nbsp;là&nbsp;gì?</strong></h2><p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Khái&nbsp;niệm</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;Là&nbsp;tổng&nbsp;hợp&nbsp;quá&nbsp;trình&nbsp;quản&nbsp;lý,&nbsp;lên&nbsp;kế&nbsp;hoạch&nbsp;triển&nbsp;khai&nbsp;điều&nbsp;phối&nbsp;lưu&nbsp;trữ&nbsp;và&nbsp;vận&nbsp;chuyển&nbsp;hàng&nbsp;hóa&nbsp;và&nbsp;dịch&nbsp;vụ.&nbsp;Là&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;mang&nbsp;tính&nbsp;dây&nbsp;chuyền&nbsp;nhằm&nbsp;đảm&nbsp;bảo&nbsp;hàng&nbsp;hóa&nbsp;được&nbsp;chuyển&nbsp;từ&nbsp;nơi&nbsp;sản&nbsp;xuất&nbsp;đến&nbsp;điểm&nbsp;tiêu&nbsp;dùng&nbsp;cuối&nbsp;một&nbsp;cách&nbsp;hiệu&nbsp;quả.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Logistics&nbsp;trở&nbsp;nên&nbsp;quan&nbsp;trọng&nbsp;và&nbsp;phổ&nbsp;biến&nbsp;hơn&nbsp;khi&nbsp;nó&nbsp;được&nbsp;ghi&nbsp;nhận&nbsp;trong&nbsp;Luật&nbsp;Thương&nbsp;Mại&nbsp;năm&nbsp;2005.&nbsp;Với&nbsp;các&nbsp;khái&nbsp;niệm&nbsp;được&nbsp;dịch&nbsp;sang&nbsp;Tiếng&nbsp;Việt&nbsp;tại&nbsp;</span><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Điều&nbsp;233&nbsp;Luật&nbsp;Thương&nbsp;Mại</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Chuỗi&nbsp;hoạt&nbsp;động&nbsp;này&nbsp;phổ&nbsp;biến&nbsp;trong&nbsp;logistic&nbsp;và&nbsp;cung&nbsp;ứng&nbsp;như:&nbsp;đóng&nbsp;gói,&nbsp;giao&nbsp;hàng,&nbsp;lưu&nbsp;kho,&nbsp;xử&nbsp;lý&nbsp;đơn&nbsp;hàng,&nbsp;vận&nbsp;chuyển…</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Đối&nbsp;với&nbsp;kinh&nbsp;doanh&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;nước&nbsp;ta&nbsp;có&nbsp;Nghị&nbsp;Định&nbsp;quy&nbsp;định&nbsp;về&nbsp;kinh&nbsp;doanh&nbsp;dịch&nbsp;vụ&nbsp;logistic&nbsp;với&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;dịch&nbsp;vụ&nbsp;được&nbsp;phân&nbsp;loại&nbsp;cụ&nbsp;thể&nbsp;và&nbsp;rõ&nbsp;ràng.</span></p><p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Nghị&nbsp;định&nbsp;Số:&nbsp;163/2017/NĐ-CP</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">&nbsp;nêu&nbsp;rõ&nbsp;phân&nbsp;loại&nbsp;dịch&nbsp;vụ&nbsp;logistics:</span></p><ol><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;xếp&nbsp;dỡ&nbsp;container,&nbsp;trừ&nbsp;dịch&nbsp;vụ&nbsp;cung&nbsp;cấp&nbsp;tại&nbsp;các&nbsp;sân&nbsp;bay.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;kho&nbsp;bãi&nbsp;container&nbsp;thuộc&nbsp;dịch&nbsp;vụ&nbsp;hỗ&nbsp;trợ&nbsp;vận&nbsp;tải&nbsp;biển.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;kho&nbsp;bãi&nbsp;thuộc&nbsp;dịch&nbsp;vụ&nbsp;hỗ&nbsp;trợ&nbsp;mọi&nbsp;phương&nbsp;thức&nbsp;vận&nbsp;tải.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;chuyển&nbsp;phát.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;đại&nbsp;lý&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;hóa.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;đại&nbsp;lý&nbsp;làm&nbsp;thủ&nbsp;tục&nbsp;hải&nbsp;quan&nbsp;(bao&nbsp;gồm&nbsp;cả&nbsp;dịch&nbsp;vụ&nbsp;thông&nbsp;quan).</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;khác,&nbsp;bao&nbsp;gồm&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;sau:&nbsp;Kiểm&nbsp;tra&nbsp;vận&nbsp;đơn,&nbsp;dịch&nbsp;vụ&nbsp;môi&nbsp;giới&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;hóa,&nbsp;kiểm&nbsp;định&nbsp;hàng&nbsp;hóa,&nbsp;dịch&nbsp;vụ&nbsp;lấy&nbsp;mẫu&nbsp;và&nbsp;xác&nbsp;định&nbsp;trọng&nbsp;lượng;&nbsp;dịch&nbsp;vụ&nbsp;nhận&nbsp;và&nbsp;chấp&nbsp;nhận&nbsp;hàng;&nbsp;dịch&nbsp;vụ&nbsp;chuẩn&nbsp;bị&nbsp;chứng&nbsp;từ&nbsp;vận&nbsp;tải.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;hỗ&nbsp;trợ&nbsp;bán&nbsp;buôn,&nbsp;hỗ&nbsp;trợ&nbsp;bán&nbsp;lẻ&nbsp;bao&nbsp;gồm&nbsp;cả&nbsp;hoạt&nbsp;động&nbsp;quản&nbsp;lý&nbsp;hàng&nbsp;lưu&nbsp;kho,&nbsp;thu&nbsp;gom,&nbsp;tập&nbsp;hợp,&nbsp;phân&nbsp;loại&nbsp;hàng&nbsp;hóa&nbsp;và&nbsp;giao&nbsp;hàng.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;hóa&nbsp;thuộc&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;biển.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;hóa&nbsp;thuộc&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;đường&nbsp;thủy&nbsp;nội&nbsp;địa.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;hóa&nbsp;thuộc&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;đường&nbsp;sắt.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;hóa&nbsp;thuộc&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;đường&nbsp;bộ.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;hàng&nbsp;không.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;vận&nbsp;tải&nbsp;đa&nbsp;phương&nbsp;thức.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Dịch&nbsp;vụ&nbsp;phân&nbsp;tích&nbsp;và&nbsp;kiểm&nbsp;định&nbsp;kỹ&nbsp;thuật.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Các&nbsp;dịch&nbsp;vụ&nbsp;hỗ&nbsp;trợ&nbsp;vận&nbsp;tải&nbsp;khác.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Các&nbsp;dịch&nbsp;vụ&nbsp;khác&nbsp;do&nbsp;thương&nbsp;nhân&nbsp;kinh&nbsp;doanh&nbsp;dịch&nbsp;vụ&nbsp;logistics&nbsp;và&nbsp;khách&nbsp;hàng&nbsp;thỏa&nbsp;thuận&nbsp;phù&nbsp;hợp&nbsp;với&nbsp;nguyên&nbsp;tắc&nbsp;cơ&nbsp;bản&nbsp;của&nbsp;Luật&nbsp;thương&nbsp;mại.</span></li></ol><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Như&nbsp;vậy&nbsp;ta&nbsp;có&nbsp;thể&nbsp;nắm&nbsp;tổng&nbsp;quan&nbsp;khái&nbsp;niệm&nbsp;cũng&nbsp;như&nbsp;phân&nbsp;loại&nbsp;theo&nbsp;luật&nbsp;nước&nbsp;ta&nbsp;để&nbsp;có&nbsp;thể&nbsp;hiểu&nbsp;hết&nbsp;ý&nbsp;nghĩa&nbsp;cũng&nbsp;như&nbsp;quy&nbsp;mô&nbsp;của&nbsp;nhóm&nbsp;lĩnh&nbsp;vực&nbsp;này.</span></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">Vai&nbsp;trò&nbsp;của&nbsp;ngành&nbsp;logistics&nbsp;là&nbsp;gì</strong></h2><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Logistics&nbsp;là&nbsp;gì?&nbsp;và&nbsp;có&nbsp;vai&nbsp;trò&nbsp;như&nbsp;thế&nbsp;nào?&nbsp;Nó&nbsp;là&nbsp;chuỗi&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;đã&nbsp;được&nbsp;mô&nbsp;tả&nbsp;ở&nbsp;phần&nbsp;đầu&nbsp;bài&nbsp;viết,&nbsp;vậy&nbsp;ý&nbsp;nghĩa&nbsp;và&nbsp;tầm&nbsp;quan&nbsp;trọng&nbsp;của&nbsp;nó&nbsp;như&nbsp;thế&nbsp;nào&nbsp;trong&nbsp;hoạt&nbsp;động&nbsp;kinh&nbsp;doanh&nbsp;hiện&nbsp;đại&nbsp;ngày&nbsp;nay?</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Logistics&nbsp;là&nbsp;một&nbsp;phần&nbsp;trong&nbsp;chuỗi&nbsp;cung&nbsp;ứng&nbsp;của&nbsp;doanh&nbsp;nghiệp.&nbsp;Đối&nbsp;với&nbsp;sản&nbsp;phẩm/dịch&nbsp;vụ&nbsp;cần&nbsp;có&nbsp;các&nbsp;kế&nbsp;hoạch&nbsp;và&nbsp;quản&nbsp;lý&nbsp;rõ&nbsp;ràng.&nbsp;Trong&nbsp;quá&nbsp;trình&nbsp;hoạt&nbsp;động&nbsp;doanh&nbsp;nghiệp&nbsp;cung&nbsp;ứng&nbsp;các&nbsp;sản&nbsp;phẩm&nbsp;dịch&nbsp;vụ&nbsp;không&nbsp;kịp&nbsp;thời&nbsp;gian&nbsp;hoặc&nbsp;không&nbsp;đúng&nbsp;địa&nbsp;điểm&nbsp;thì&nbsp;sẽ&nbsp;ảnh&nbsp;hưởng&nbsp;tới&nbsp;doanh&nbsp;thu.&nbsp;Vì&nbsp;vậy&nbsp;vai&nbsp;trò&nbsp;của&nbsp;ngành&nbsp;logistics&nbsp;vô&nbsp;cùng&nbsp;quan&nbsp;trọng.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Cuộc&nbsp;sống&nbsp;hiện&nbsp;đại,&nbsp;mọi&nbsp;hoạt&nbsp;động&nbsp;mua&nbsp;bán&nbsp;ngày&nbsp;càng&nbsp;phát&nbsp;triển&nbsp;và&nbsp;logistics&nbsp;đều&nbsp;xuất&nbsp;hiện&nbsp;trong&nbsp;mọi&nbsp;công&nbsp;đoạn&nbsp;mua&nbsp;bán,&nbsp;sử&nbsp;dụng&nbsp;dịch&nbsp;vụ.&nbsp;Vì&nbsp;vậy&nbsp;logistics&nbsp;càng&nbsp;trở&nbsp;nên&nbsp;quan&nbsp;trọng&nbsp;đối&nbsp;với&nbsp;nền&nbsp;kinh&nbsp;tế.</span></p><ul><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Vận&nbsp;chuyển&nbsp;hiệu&nbsp;quả</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;Đảm&nbsp;bảo&nbsp;hoạt&nbsp;động&nbsp;vận&nbsp;chuyển&nbsp;giao&nbsp;nhận,&nbsp;đáp&nbsp;ứng&nbsp;nhu&nbsp;cầu&nbsp;tiêu&nbsp;dùng&nbsp;hiệu&nbsp;quả.</span></li><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Quản&nbsp;lý&nbsp;lưu&nbsp;trữ</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;quản&nbsp;lý&nbsp;lưu&nbsp;trữ&nbsp;với&nbsp;vô&nbsp;số&nbsp;các&nbsp;công&nbsp;đoạn:&nbsp;thu&nbsp;mua,&nbsp;vận&nbsp;chuyển&nbsp;lưu&nbsp;trữ&nbsp;tạo&nbsp;nên&nbsp;lợi&nbsp;thế&nbsp;cạnh&nbsp;tranh&nbsp;tăng&nbsp;lợi&nbsp;nhuận&nbsp;doanh&nbsp;nghiệp.</span></li><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Tối&nbsp;ưu&nbsp;chi&nbsp;phí</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;giảm&nbsp;thiểu&nbsp;các&nbsp;thất&nbsp;thoát&nbsp;trong&nbsp;quá&nbsp;trình&nbsp;quản&nbsp;lý&nbsp;giúp&nbsp;doanh&nbsp;nghiệp&nbsp;giảm&nbsp;các&nbsp;chi&nbsp;phí.</span></li><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Kết&nbsp;nối&nbsp;thị&nbsp;trường</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;giao&nbsp;tiếp&nbsp;giữa&nbsp;các&nbsp;đối&nbsp;tác&nbsp;trên&nbsp;thị&nbsp;trường&nbsp;trong&nbsp;và&nbsp;ngoài&nbsp;nước&nbsp;sẽ&nbsp;giúp&nbsp;doanh&nbsp;nghiệp&nbsp;nhanh&nbsp;chóng&nbsp;mở&nbsp;ra&nbsp;những&nbsp;cơ&nbsp;hội&nbsp;kinh&nbsp;doanh&nbsp;mới.</span></li></ul><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Trên&nbsp;đây&nbsp;là&nbsp;một&nbsp;số&nbsp;lợi&nbsp;thế&nbsp;khi&nbsp;doanh&nbsp;nghiệp&nbsp;thực&nbsp;hiện&nbsp;tốt&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;logistics.&nbsp;Như&nbsp;vậy&nbsp;có&nbsp;thể&nbsp;kết&nbsp;luận&nbsp;logistics&nbsp;đóng&nbsp;vai&nbsp;trò&nbsp;vô&nbsp;cùng&nbsp;quan&nbsp;trọng&nbsp;đối&nbsp;với&nbsp;kinh&nbsp;tế&nbsp;hiện&nbsp;nay,&nbsp;đặc&nbsp;biệt&nbsp;là&nbsp;nền&nbsp;kinh&nbsp;tế&nbsp;của&nbsp;thời&nbsp;đại&nbsp;công&nbsp;nghiệp&nbsp;tự&nbsp;động&nbsp;hóa&nbsp;hiện&nbsp;nay.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Với&nbsp;các&nbsp;kho&nbsp;hàng&nbsp;logistics&nbsp;luôn&nbsp;nâng&nbsp;cao&nbsp;các&nbsp;phương&nbsp;thức&nbsp;quản&nbsp;lý&nbsp;nhằm&nbsp;tránh&nbsp;những&nbsp;rủi&nbsp;ro&nbsp;trong&nbsp;vận&nbsp;chuyển&nbsp;giao&nbsp;nhận.&nbsp;Khi&nbsp;đó&nbsp;sẽ&nbsp;nhận&nbsp;được&nbsp;sự&nbsp;hài&nbsp;lòng&nbsp;từ&nbsp;phía&nbsp;khách&nbsp;hàng,&nbsp;tác&nbsp;động&nbsp;tích&nbsp;cực&nbsp;đến&nbsp;lợi&nbsp;nhuận&nbsp;và&nbsp;các&nbsp;yếu&nbsp;tố&nbsp;khác.</span></p><p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">→&nbsp;Tham&nbsp;khảo:</strong><strong style=\"background-color: transparent; color: rgb(220, 86, 50);\"><a href=\"https://cokhivietthang.vn/top-10-cong-ty-logistics-lon-nhat-tai-viet-nam/\" rel=\"noopener noreferrer\" target=\"_blank\">&nbsp;Top&nbsp;10&nbsp;công&nbsp;ty&nbsp;logistics&nbsp;lớn&nbsp;nhất&nbsp;tại&nbsp;Việt&nbsp;Nam</a></strong></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">Logistics&nbsp;là&nbsp;làm&nbsp;gì?</strong></h2><p><em style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Logistics&nbsp;là&nbsp;gì?&nbsp;Và&nbsp;logistics&nbsp;là&nbsp;làm&nbsp;gì?&nbsp;Câu&nbsp;hỏi&nbsp;hơi&nbsp;thiên&nbsp;về&nbsp;văn&nbsp;nói,&nbsp;và&nbsp;nó&nbsp;được&nbsp;hỏi&nbsp;cụ&nbsp;thể&nbsp;sẽ&nbsp;là&nbsp;những&nbsp;vị&nbsp;trí&nbsp;phổ&nbsp;biến&nbsp;trong&nbsp;ngành&nbsp;logistics&nbsp;hiện&nbsp;nay?</em></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Bởi&nbsp;đây&nbsp;là&nbsp;ngành&nbsp;đang&nbsp;trở&nbsp;nên&nbsp;phát&nbsp;triển&nbsp;và&nbsp;phổ&nbsp;biến,&nbsp;vì&nbsp;thế&nbsp;mà&nbsp;tại&nbsp;nước&nbsp;ta&nbsp;nhiều&nbsp;người&nbsp;vẫn&nbsp;chưa&nbsp;nắm&nbsp;được&nbsp;làm&nbsp;logistics&nbsp;là&nbsp;làm&nbsp;gì?</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\"><img src=\"https://cokhivietthang.vn/wp-content/uploads/2024/02/Logistics-la-lam-gi.jpg\" alt=\"Logistics-là-làm-gì\" height=\"400\" width=\"600\"></span></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">1.&nbsp;Nhân&nbsp;viên&nbsp;vận&nbsp;chuyển</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Đây&nbsp;là&nbsp;vị&nbsp;trí&nbsp;đảm&nbsp;nhận&nbsp;nhiệm&nbsp;vụ&nbsp;vận&nbsp;chuyển&nbsp;hàng&nbsp;hóa&nbsp;từ&nbsp;kho&nbsp;hàng&nbsp;đến&nbsp;đích&nbsp;một&nbsp;cách&nbsp;an&nbsp;toàn&nbsp;và&nbsp;đúng&nbsp;thời&nbsp;hạn.&nbsp;Với&nbsp;một&nbsp;loạt&nbsp;các&nbsp;thao&nbsp;tác&nbsp;cần&nbsp;thực&nbsp;hiện&nbsp;như:&nbsp;chuẩn&nbsp;bị&nbsp;và&nbsp;kiểm&nbsp;tra&nbsp;phương&nbsp;tiện,&nbsp;xếp&nbsp;dỡ&nbsp;đóng&nbsp;gói&nbsp;hàng&nbsp;hóa,…&nbsp;bảo&nbsp;trì&nbsp;phương&nbsp;tiện&nbsp;vận&nbsp;chuyển,&nbsp;xử&nbsp;lý&nbsp;các&nbsp;vấn&nbsp;đề&nbsp;trong&nbsp;quá&nbsp;trình&nbsp;vận&nbsp;chuyển…</span></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">2.&nbsp;Nhân&nbsp;viên&nbsp;thu&nbsp;mua</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Thực&nbsp;hiện&nbsp;tìm&nbsp;kiếm&nbsp;và&nbsp;mua&nbsp;nguyên&nbsp;vật&nbsp;liệu,&nbsp;thiết&nbsp;bị&nbsp;cần&nbsp;thiết&nbsp;cho&nbsp;cá&nbsp;nhân,&nbsp;tổ&nbsp;chức.&nbsp;Đối&nbsp;với&nbsp;vị&nbsp;trí&nbsp;này&nbsp;cần&nbsp;thực&nbsp;hiện&nbsp;nghiên&nbsp;cứu,&nbsp;lên&nbsp;kế&nbsp;hoạch,&nbsp;thương&nbsp;thảo&nbsp;ký&nbsp;hợp&nbsp;đồng,&nbsp;theo&nbsp;dõi&nbsp;đơn&nbsp;hàng&nbsp;cũng&nbsp;như&nbsp;giám&nbsp;sát&nbsp;xử&nbsp;lý&nbsp;và&nbsp;các&nbsp;vấn&nbsp;đề&nbsp;liên&nbsp;quan…</span></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">3.&nbsp;Nhân&nbsp;viên&nbsp;định&nbsp;tuyến</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Trong&nbsp;logistics&nbsp;nhân&nbsp;viên&nbsp;định&nbsp;tuyến&nbsp;có&nbsp;vai&nbsp;trò&nbsp;phân&nbsp;phối&nbsp;lộ&nbsp;trình&nbsp;vận&nbsp;chuyển&nbsp;hàng&nbsp;diễn&nbsp;ra&nbsp;hiệu&nbsp;quả.&nbsp;Các&nbsp;thao&nbsp;tác&nbsp;cần&nbsp;thực&nbsp;tiện&nbsp;của&nbsp;một&nbsp;nhân&nbsp;viên&nbsp;định&nbsp;tuyến&nbsp;đó&nbsp;là&nbsp;lên&nbsp;lộ&nbsp;trình,&nbsp;lập&nbsp;kế&nbsp;hoạch,&nbsp;theo&nbsp;dõi&nbsp;và&nbsp;xử&nbsp;lý&nbsp;vấn&nbsp;đề,&nbsp;tương&nbsp;tác&nbsp;với&nbsp;đối&nbsp;tác&nbsp;khách&nbsp;hàng,&nbsp;báo&nbsp;cáo&nbsp;và&nbsp;ghi&nbsp;chép…</span></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">4.&nbsp;Quản&nbsp;lý&nbsp;kho</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Là&nbsp;một&nbsp;trong&nbsp;những&nbsp;vị&nbsp;trí&nbsp;phổ&nbsp;biến&nbsp;được&nbsp;biết&nbsp;đến&nbsp;nhiều&nbsp;nhất.&nbsp;Với&nbsp;vai&nbsp;trò&nbsp;quản&nbsp;lý&nbsp;lưu&nbsp;kho&nbsp;một&nbsp;cách&nbsp;tối&nbsp;ưu&nbsp;đảm&nbsp;bảo&nbsp;tính&nbsp;toàn&nbsp;vẹn&nbsp;của&nbsp;hàng&nbsp;hóa.&nbsp;Vị&nbsp;trí&nbsp;này&nbsp;cần&nbsp;có&nbsp;kinh&nbsp;nghiệm&nbsp;tổ&nbsp;chức&nbsp;và&nbsp;sắp&nbsp;xếp&nbsp;kho,&nbsp;theo&nbsp;dõi&nbsp;kiểm&nbsp;soát&nbsp;hàng&nbsp;tồn&nbsp;kho,&nbsp;điều&nbsp;phối&nbsp;xử&nbsp;lý&nbsp;hàng&nbsp;hóa&nbsp;xuất&nbsp;nhập&nbsp;kho…</span></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">5.&nbsp;Chuyên&nbsp;viên&nbsp;Hải&nbsp;quan</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Là&nbsp;vị&nbsp;trí&nbsp;nằm&nbsp;trong&nbsp;chuỗi&nbsp;hoạt&nbsp;động&nbsp;của&nbsp;logistics&nbsp;với&nbsp;vai&nbsp;trò&nbsp;chính&nbsp;là&nbsp;kiểm&nbsp;tra&nbsp;các&nbsp;thủ&nbsp;tục&nbsp;thông&nbsp;quan,&nbsp;đảm&nbsp;bảo&nbsp;an&nbsp;ninh&nbsp;hiệu&nbsp;quả.</span></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">6.&nbsp;Nhân&nbsp;viên&nbsp;chăm&nbsp;sóc&nbsp;khách&nbsp;hàng</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Vị&nbsp;trí&nbsp;tưởng&nbsp;rằng&nbsp;không&nbsp;liên&nbsp;quan,&nbsp;nhưng&nbsp;đây&nbsp;là&nbsp;một&nbsp;trong&nbsp;những&nbsp;vị&nbsp;trí&nbsp;duy&nbsp;trì&nbsp;mối&nbsp;quan&nbsp;hệ&nbsp;với&nbsp;khách&nbsp;hàng.&nbsp;Với&nbsp;kinh&nbsp;nghiệm&nbsp;xử&nbsp;lý&nbsp;các&nbsp;khiếu&nbsp;nại,&nbsp;cung&nbsp;cấp&nbsp;thông&nbsp;tin&nbsp;tới&nbsp;khách&nbsp;hàng,&nbsp;tư&nbsp;vấn&nbsp;hỗ&nbsp;trợ&nbsp;khách&nbsp;hàng&nbsp;đem&nbsp;lại&nbsp;sự&nbsp;hài&nbsp;lòng…</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Trên&nbsp;đây&nbsp;là&nbsp;một&nbsp;số&nbsp;vị&nbsp;trí&nbsp;làm&nbsp;việc&nbsp;trong&nbsp;ngành&nbsp;logistics.&nbsp;Ngoài&nbsp;ra&nbsp;còn&nbsp;nhiều&nbsp;vị&nbsp;trí&nbsp;liên&nbsp;quan&nbsp;đến&nbsp;logistics&nbsp;như:&nbsp;nhân&nbsp;viên&nbsp;quản&nbsp;lý&nbsp;hàng&nbsp;hóa,&nbsp;điều&nbsp;phối&nbsp;sản&nbsp;xuất,&nbsp;nhân&nbsp;viên&nbsp;lên&nbsp;kế&nbsp;hoạch…</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Với&nbsp;doanh&nbsp;nghiệp&nbsp;vừa&nbsp;và&nbsp;nhỏ&nbsp;logistics&nbsp;có&nbsp;thể&nbsp;là&nbsp;một&nbsp;nhân&nbsp;viên&nbsp;kiêm&nbsp;nhiều&nbsp;vị&nbsp;trí.&nbsp;Nhưng&nbsp;khi&nbsp;doanh&nbsp;nghiệp&nbsp;lớn,&nbsp;hay&nbsp;doanh&nbsp;nghiệp&nbsp;vận&nbsp;tải&nbsp;cần&nbsp;những&nbsp;vị&nbsp;trí&nbsp;cụ&nbsp;thể&nbsp;để&nbsp;mọi&nbsp;hoạt&nbsp;động&nbsp;được&nbsp;quản&nbsp;lý&nbsp;hiệu&nbsp;quả.</span></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(18, 102, 175);\">Yếu&nbsp;tố&nbsp;ảnh&nbsp;hưởng&nbsp;tới&nbsp;hoạt&nbsp;động&nbsp;logistics&nbsp;là&nbsp;gì?</strong></h2><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Có&nbsp;nhiều&nbsp;yếu&nbsp;tố&nbsp;có&nbsp;thể&nbsp;ảnh&nbsp;hưởng&nbsp;tới&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;của&nbsp;logistics&nbsp;của&nbsp;một&nbsp;doanh&nbsp;nghiệp.&nbsp;Cũng&nbsp;như&nbsp;vận&nbsp;hành&nbsp;một&nbsp;thiết&nbsp;bị,&nbsp;chuỗi&nbsp;hoạt&nbsp;động&nbsp;này&nbsp;cần&nbsp;chú&nbsp;ý:</span></p><ul><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Hạ&nbsp;tầng&nbsp;và&nbsp;phương&nbsp;tiện&nbsp;vận&nbsp;tải</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;hạ&nbsp;tầng&nbsp;và&nbsp;phương&nbsp;tiện&nbsp;vận&nbsp;tải&nbsp;ảnh&nbsp;hưởng&nbsp;tới&nbsp;khả&nbsp;năng&nbsp;vận&nbsp;chuyển&nbsp;hàng&nbsp;hóa.</span></li><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Chi&nbsp;phí&nbsp;vận&nbsp;chuyển</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;là&nbsp;chi&nbsp;phí&nbsp;này&nbsp;do&nbsp;nhiều&nbsp;yếu&nbsp;tố&nbsp;như:&nbsp;quãng&nbsp;đường,&nbsp;nhiên&nbsp;liệu…&nbsp;ảnh&nbsp;hưởng&nbsp;đến&nbsp;lợi&nbsp;nhuận.</span></li><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Quản&nbsp;lý&nbsp;kho&nbsp;hàng:</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">&nbsp;Hiệu&nbsp;suất&nbsp;quản&nbsp;lý&nbsp;kho&nbsp;hàng&nbsp;ảnh&nbsp;hưởng&nbsp;đến&nbsp;việc&nbsp;duy&nbsp;trì&nbsp;lượng&nbsp;hàng&nbsp;tồn&nbsp;kho&nbsp;cần&nbsp;thiết&nbsp;và&nbsp;đáp&nbsp;ứng&nbsp;nhanh&nbsp;chóng&nbsp;nhu&nbsp;cầu&nbsp;của&nbsp;khách&nbsp;hàng.&nbsp;Quản&nbsp;lý&nbsp;kho&nbsp;hàng&nbsp;hiệu&nbsp;quả&nbsp;giúp&nbsp;giảm&nbsp;thiểu&nbsp;chi&nbsp;phí&nbsp;tồn&nbsp;kho&nbsp;và&nbsp;tối&nbsp;ưu&nbsp;hóa&nbsp;quy&nbsp;trình&nbsp;logistics.</span></li><li><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Tham&nbsp;khảo:&nbsp;Kệ&nbsp;chứa&nbsp;hàng&nbsp;tổ&nbsp;chức&nbsp;quản&nbsp;lý&nbsp;không&nbsp;gian&nbsp;lưu&nbsp;trữ&nbsp;kho&nbsp;hiệu&nbsp;quả</span></li><li><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Công&nbsp;nghệ&nbsp;và&nbsp;tự&nbsp;động&nbsp;hóa</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">:&nbsp;Sự&nbsp;tiến&nbsp;bộ&nbsp;trong&nbsp;công&nbsp;nghệ&nbsp;và&nbsp;tự&nbsp;động&nbsp;hóa&nbsp;có&nbsp;thể&nbsp;cải&nbsp;thiện&nbsp;hiệu&nbsp;suất&nbsp;và&nbsp;độ&nbsp;chính&nbsp;xác&nbsp;trong&nbsp;hoạt&nbsp;động&nbsp;logistics.&nbsp;Các&nbsp;hệ&nbsp;thống&nbsp;quản&nbsp;lý&nbsp;kho,&nbsp;định&nbsp;vị&nbsp;GPS&nbsp;và&nbsp;robot&nbsp;tự&nbsp;động&nbsp;là&nbsp;những&nbsp;ví&nbsp;dụ.</span></li></ul><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Trên&nbsp;đây&nbsp;là&nbsp;một&nbsp;số&nbsp;yếu&nbsp;tố&nbsp;có&nbsp;ảnh&nbsp;hưởng&nbsp;rõ&nbsp;rệt&nbsp;tới&nbsp;các&nbsp;hoạt&nbsp;động&nbsp;logistics.&nbsp;Vì&nbsp;vậy&nbsp;doanh&nbsp;nghiệp&nbsp;cần&nbsp;có&nbsp;các&nbsp;chính&nbsp;sách,&nbsp;quy&nbsp;định&nbsp;để&nbsp;tránh&nbsp;những&nbsp;rủi&nbsp;ro.&nbsp;Do&nbsp;nhu&nbsp;cầu&nbsp;thị&nbsp;trường&nbsp;logistics&nbsp;ngày&nbsp;một&nbsp;nhiều&nbsp;nên&nbsp;các&nbsp;công&nbsp;ty&nbsp;chuyên&nbsp;dịch&nbsp;vụ&nbsp;vận&nbsp;chuyển&nbsp;trở&nbsp;nên&nbsp;phổ&nbsp;biến&nbsp;và&nbsp;đa&nbsp;dạng.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Một&nbsp;số&nbsp;công&nbsp;ty&nbsp;logistics&nbsp;lớn&nbsp;trên&nbsp;thế&nbsp;giới&nbsp;như:&nbsp;DHL;&nbsp;Kuehne&nbsp;+&nbsp;Nagel&nbsp;(Thụy&nbsp;Sĩ);&nbsp;DB&nbsp;Schenker&nbsp;(Đức)&nbsp;…&nbsp;tại&nbsp;nước&nbsp;ta&nbsp;các&nbsp;công&nbsp;ty&nbsp;logistics&nbsp;cũng&nbsp;trở&nbsp;nên&nbsp;phổ&nbsp;biến&nbsp;và&nbsp;thông&nbsp;dụng&nbsp;như:&nbsp;Viettel&nbsp;post;&nbsp;Vietnam&nbsp;post;&nbsp;giao&nbsp;hàng&nbsp;tiết&nbsp;kiệm;&nbsp;Vinafco…</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\"><img src=\"https://cokhivietthang.vn/wp-content/uploads/2024/02/Yeu-to-anh-huong-toi-hoat-dong-logistics.jpg\" alt=\"Yếu-tố-ảnh-hưởng-tới-hoạt-động-logistics\" height=\"400\" width=\"600\"></span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Trên&nbsp;đây&nbsp;là&nbsp;tổng&nbsp;quan&nbsp;về&nbsp;</span><strong style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">Ngành&nbsp;logistics&nbsp;là&nbsp;gì?&nbsp;Ý&nbsp;nghĩa&nbsp;và&nbsp;vai&nbsp;trò&nbsp;trong&nbsp;công&nbsp;nghiệp&nbsp;hóa&nbsp;</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(70, 66, 66);\">do&nbsp;Cơ&nbsp;Khí&nbsp;Việt&nbsp;Thắng&nbsp;tổng&nbsp;hợp.&nbsp;Hy&nbsp;vọng&nbsp;mang&nbsp;lại&nbsp;những&nbsp;kiến&nbsp;thức&nbsp;logistics&nbsp;hữu&nbsp;ích&nbsp;tới&nbsp;quý&nbsp;khách.</span></p>', '/uploads/news-1777760729186-795610258.jpg', 'Admin', 0, '2026-05-02 22:24:28', '2026-05-02 22:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `receiver_id` int DEFAULT NULL,
  `shipment_id` int DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_role` enum('driver','dispatcher','admin','customer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `receiver_id`, `shipment_id`, `message`, `target_role`, `is_read`, `created_at`) VALUES
(1, 11, NULL, 'Bạn vừa được phân công 2 đơn hàng mới!', 'driver', 1, '2026-05-02 21:54:14'),
(2, 9, 240, '🚚 Đơn hàng #DN-783043 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 21:54:14'),
(3, 7, 245, '🚚 Đơn hàng #DN-783048 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 21:54:14'),
(4, 7, 245, 'Tài xế đang trên đường đến lấy đơn hàng #DN-783048.', 'customer', 0, '2026-05-02 21:56:28'),
(5, 9, 240, 'Tài xế đang trên đường đến lấy đơn hàng #DN-783043.', 'customer', 0, '2026-05-02 21:56:29'),
(6, 7, 245, 'Đơn hàng #DN-783048 đang được giao đến bạn.', 'customer', 0, '2026-05-02 21:57:00'),
(7, 1, 271, '🆕 Đơn hàng mới tại DN: #DN-491585', 'dispatcher', 0, '2026-05-02 22:04:51'),
(8, 5, 271, '🎉 Đơn hàng #DN-491585 của bạn đã được tạo thành công!', 'customer', 1, '2026-05-02 22:04:51'),
(9, 12, NULL, 'Bạn vừa được phân công 1 đơn hàng mới!', 'driver', 0, '2026-05-02 22:05:32'),
(10, 5, 271, '🚚 Đơn hàng #DN-491585 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 1, '2026-05-02 22:05:32'),
(11, 10, NULL, 'Bạn vừa được phân công 5 đơn hàng mới!', 'driver', 0, '2026-05-02 23:02:36'),
(12, 9, 290, '🚚 Đơn hàng #DN-683152 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:36'),
(13, 9, 301, '🚚 Đơn hàng #DN-683163 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:36'),
(14, 7, 332, '🚚 Đơn hàng #DN-683194 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:36'),
(15, 10, 351, '🚚 Đơn hàng #DN-683213 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:36'),
(16, 9, 353, '🚚 Đơn hàng #DN-683215 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:36'),
(17, 12, NULL, 'Bạn vừa được phân công 3 đơn hàng mới!', 'driver', 0, '2026-05-02 23:02:42'),
(18, 10, 215, '🚚 Đơn hàng #DN-783018 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:42'),
(19, 8, 432, '🚚 Đơn hàng #DN-705109 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:02:42'),
(20, 5, 459, '🚚 Đơn hàng #DN-705136 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 1, '2026-05-02 23:02:42'),
(21, 6, 400, 'Đơn hàng #DN-683262 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:44'),
(22, 8, 408, 'Đơn hàng #DN-683270 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:46'),
(23, 10, 451, 'Đơn hàng #DN-705128 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:47'),
(24, 10, 524, 'Đơn hàng #DN-705201 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:49'),
(25, 9, 474, 'Đơn hàng #DN-705151 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:50'),
(26, 6, 481, 'Đơn hàng #DN-705158 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:51'),
(27, 8, 528, 'Đơn hàng #DN-705205 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:53'),
(28, 9, 550, 'Đơn hàng #DN-705227 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:54'),
(29, 8, 559, 'Đơn hàng #DN-705236 đã được giao thành công!', 'customer', 0, '2026-05-02 23:15:55'),
(30, 6, 517, 'Đơn hàng #DN-705194 đã được giao thành công!', 'customer', 0, '2026-05-02 23:24:15'),
(31, 5, 553, 'Đơn hàng #DN-705230 đã được giao thành công!', 'customer', 0, '2026-05-02 23:24:17'),
(32, 9, 171, 'Đơn hàng #HCM-782974 đã được giao thành công!', 'customer', 0, '2026-05-02 23:24:21'),
(33, 6, 155, 'Đơn hàng #DN-782958 đã được giao thành công!', 'customer', 0, '2026-05-02 23:24:23'),
(34, 6, 200, 'Đơn hàng #DN-783003 đã được giao thành công!', 'customer', 0, '2026-05-02 23:24:24'),
(35, 5, 253, 'Đơn hàng #HN-783056 đã được giao thành công!', 'customer', 0, '2026-05-02 23:24:38'),
(36, 5, NULL, 'Bạn vừa được phân công 1 đơn hàng mới!', 'driver', 0, '2026-05-02 23:26:00'),
(37, 9, 139, '🚚 Đơn hàng #HCM-782942 đã được phân công cho tài xế và đang chờ đi lấy!', 'customer', 0, '2026-05-02 23:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `otp_codes`
--

CREATE TABLE `otp_codes` (
  `id` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp_codes`
--

INSERT INTO `otp_codes` (`id`, `email`, `code`, `expires_at`) VALUES
(1, 'truongdubai107@gmail.com', '163755', 1761719813458),
(2, 'truongdubai107@gmail.com', '402514', 1761720078142),
(3, 'truongdubaix107@gmail.com', '280555', 1761720234122),
(4, 'truongdubai2704@gmail.com', '872278', 1761720559002),
(5, 'khuongkhuong1604@gmail.com', '375002', 1761720732400),
(6, 'nbminh1207@gmail.com', '747179', 1763455700524),
(7, 'truongdubai2704@gmail.com', '287972', 1763535089977),
(8, 'truongdubai2704@gmail.com', '201793', 1763535179878),
(9, 'truongdubai2704@gmail.com', '645945', 1763535446826),
(10, 'truongdubai2704@sadsads.cc', '206001', 1763535554595),
(11, 'truongdubai2704@sadsads.cc', '465590', 1763535711085),
(12, 'truongdubai2704@gmail.com', '623933', 1763535785224),
(13, 'truongdubai2704@gmail.com', '321939', 1763536051677),
(14, 'truongdubai2704@gmail.com', '139957', 1763536221498),
(15, 'truongdubai2704@gmail.com', '171852', 1763536626698),
(16, 'cs@g.c', '135180', 1763537000689),
(17, 'truongdubai2704@gmail.com', '542069', 1763537317257),
(18, 'truongdubai2704@gmail.com', '415969', 1763537769557),
(19, 'truongdubai2704@gmail.com', '332723', 1763537852709),
(20, 'truongdubai2704@gmail.com', '285552', 1763538346505),
(21, 'nbminh1207@gmail.com', '303094', 1764059221988),
(22, 'nbminh1207@gmail.com', '889078', 1764059360441),
(23, 'nbminh1207@gmail.com', '148338', 1764059446797),
(24, 'nbminh1207@gmail.com', '948651', 1764061869050),
(25, 'truongdubai2704@gmail.com', '427323', 1764062051666),
(26, 'nbminh1207@gmail.com', '753640', 1764062129626),
(27, 'occho1401@gmail.com', '427073', 1764132411527),
(28, 'khanh12b3cv@gmail.com', '311541', 1764132426763),
(29, 'khuongkhuong1604@gmail.com', '811302', 1764132525922),
(30, 'khuongkhuong1604@gmail.com', '118801', 1764132606853),
(31, 'khuongkhuong1604@gmail.com', '978693', 1764132692693),
(32, 'khanh12b3cv@gmail.com', '983843', 1764132712149),
(33, 'duongthikimloanbs274@gmail.com', '241220', 1764133025822),
(34, 'truongdubai107@gmail.com', '364567', 1764548388133),
(35, 'truongdubai107@gmail.com', '493671', 1764549095608),
(36, 'truongdubai107@gmail.com', '423752', 1767453576187),
(37, 'hothaituankhanh@gmail.com', '715746', 1774618222455),
(38, 'biettenchua@gmail.com', '125936', 1777743974235);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `shipment_id`, `customer_id`, `amount`, `method`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HN-897641', 2, 5, 35000.00, 'WALLET', 'completed', '2026-04-10 22:08:25', '2026-05-02 22:08:25'),
(2, 'DN-897644', 5, 5, 35000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(3, 'HCM-897654', 15, 5, 35000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(4, 'HCM-897659', 20, 5, 35000.00, 'WALLET', 'completed', '2026-02-20 22:08:25', '2026-05-02 22:08:25'),
(5, 'HN-897668', 29, 6, 35000.00, 'WALLET', 'completed', '2026-03-22 22:08:25', '2026-05-02 22:08:25'),
(6, 'HCM-897669', 30, 6, 35000.00, 'WALLET', 'completed', '2026-01-19 22:08:25', '2026-05-02 22:08:25'),
(7, 'HCM-897685', 46, 7, 35000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(8, 'DN-897689', 50, 7, 35000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(9, 'DN-897693', 54, 7, 35000.00, 'WALLET', 'completed', '2026-02-08 22:08:26', '2026-05-02 22:08:26'),
(10, 'HCM-897715', 76, 8, 35000.00, 'WALLET', 'completed', '2026-01-09 22:08:26', '2026-05-02 22:08:26'),
(11, 'HCM-897734', 95, 9, 35000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(12, 'HN-897745', 106, 10, 35000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(13, 'HN-897758', 119, 10, 35000.00, 'WALLET', 'completed', '2026-03-29 22:08:27', '2026-05-02 22:08:27'),
(14, 'HCM-897759', 120, 10, 35000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(15, 'TRANS1777759496152', 271, 5, 38500.00, 'WALLET', 'completed', '2026-02-03 22:08:25', '2026-05-02 22:08:25'),
(16, 'TXN-1', 1, 5, 25000.00, 'WALLET', 'completed', '2026-04-19 22:08:25', '2026-05-02 22:08:25'),
(17, 'TXN-3', 3, 5, 42000.00, 'WALLET', 'completed', '2026-04-18 22:08:25', '2026-05-02 22:08:25'),
(18, 'TXN-4', 4, 5, 36000.00, 'WALLET', 'completed', '2026-04-27 22:08:25', '2026-05-02 22:08:25'),
(19, 'TXN-6', 6, 5, 26000.00, 'WALLET', 'completed', '2026-01-21 22:08:25', '2026-05-02 22:08:25'),
(20, 'TXN-7', 7, 5, 44000.00, 'WALLET', 'completed', '2026-04-19 22:08:25', '2026-05-02 22:08:25'),
(21, 'TXN-8', 8, 5, 37000.00, 'WALLET', 'completed', '2025-12-24 22:08:25', '2026-05-02 22:08:25'),
(22, 'TXN-9', 9, 5, 43000.00, 'WALLET', 'completed', '2026-04-23 22:08:25', '2026-05-02 22:08:25'),
(23, 'TXN-10', 10, 5, 42000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(24, 'TXN-11', 11, 5, 43000.00, 'WALLET', 'completed', '2025-12-25 22:08:25', '2026-05-02 22:08:25'),
(25, 'TXN-12', 12, 5, 43000.00, 'WALLET', 'completed', '2026-02-17 22:08:25', '2026-05-02 22:08:25'),
(26, 'TXN-13', 13, 5, 39000.00, 'WALLET', 'completed', '2026-02-04 22:08:25', '2026-05-02 22:08:25'),
(27, 'TXN-14', 14, 5, 41000.00, 'WALLET', 'completed', '2026-01-20 22:08:25', '2026-05-02 22:08:25'),
(28, 'TXN-16', 16, 5, 37000.00, 'WALLET', 'completed', '2026-02-18 22:08:25', '2026-05-02 22:08:25'),
(29, 'TXN-17', 17, 5, 27000.00, 'WALLET', 'completed', '2026-05-02 22:08:25', '2026-05-02 22:08:25'),
(30, 'TXN-18', 18, 5, 34000.00, 'WALLET', 'completed', '2026-04-15 22:08:25', '2026-05-02 22:08:25'),
(31, 'TXN-19', 19, 5, 35000.00, 'WALLET', 'completed', '2026-04-24 22:08:25', '2026-05-02 22:08:25'),
(32, 'TXN-125', 125, 5, 42000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(33, 'TXN-130', 130, 5, 36000.00, 'WALLET', 'completed', '2026-04-20 22:08:25', '2026-05-02 22:08:25'),
(34, 'TXN-138', 138, 5, 42000.00, 'WALLET', 'completed', '2026-02-19 22:08:25', '2026-05-02 22:08:25'),
(35, 'TXN-143', 143, 5, 38000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(36, 'TXN-144', 144, 5, 27000.00, 'WALLET', 'completed', '2026-04-28 22:08:25', '2026-05-02 22:08:25'),
(37, 'TXN-154', 154, 5, 29000.00, 'WALLET', 'completed', '2026-04-28 22:08:25', '2026-05-02 22:08:25'),
(38, 'TXN-172', 172, 5, 38000.00, 'WALLET', 'completed', '2026-04-12 22:08:25', '2026-05-02 22:08:25'),
(39, 'TXN-176', 176, 5, 26000.00, 'WALLET', 'completed', '2026-03-06 22:08:25', '2026-05-02 22:08:25'),
(40, 'TXN-178', 178, 5, 30000.00, 'WALLET', 'completed', '2026-02-04 22:08:25', '2026-05-02 22:08:25'),
(41, 'TXN-181', 181, 5, 34000.00, 'WALLET', 'completed', '2026-04-09 22:08:25', '2026-05-02 22:08:25'),
(42, 'TXN-186', 186, 5, 39000.00, 'WALLET', 'completed', '2026-01-01 22:08:25', '2026-05-02 22:08:25'),
(43, 'TXN-197', 197, 5, 28000.00, 'WALLET', 'completed', '2026-03-20 22:08:25', '2026-05-02 22:08:25'),
(44, 'TXN-201', 201, 5, 35000.00, 'WALLET', 'completed', '2026-04-20 22:08:25', '2026-05-02 22:08:25'),
(45, 'TXN-203', 203, 5, 32000.00, 'WALLET', 'completed', '2026-03-11 22:08:25', '2026-05-02 22:08:25'),
(46, 'TXN-214', 214, 5, 43000.00, 'WALLET', 'completed', '2026-04-22 22:08:25', '2026-05-02 22:08:25'),
(47, 'TXN-228', 228, 5, 36000.00, 'WALLET', 'completed', '2026-04-19 22:08:25', '2026-05-02 22:08:25'),
(48, 'TXN-232', 232, 5, 33000.00, 'WALLET', 'completed', '2026-02-26 22:08:25', '2026-05-02 22:08:25'),
(49, 'TXN-237', 237, 5, 35000.00, 'WALLET', 'completed', '2026-03-30 22:08:25', '2026-05-02 22:08:25'),
(50, 'TXN-242', 242, 5, 29000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(51, 'TXN-248', 248, 5, 40000.00, 'WALLET', 'completed', '2026-04-01 22:08:25', '2026-05-02 22:08:25'),
(52, 'TXN-250', 250, 5, 32000.00, 'WALLET', 'completed', '2026-03-14 22:08:25', '2026-05-02 22:08:25'),
(53, 'TXN-252', 252, 5, 26000.00, 'WALLET', 'completed', '2026-03-24 22:08:25', '2026-05-02 22:08:25'),
(54, 'TXN-253', 253, 5, 37000.00, 'WALLET', 'completed', '2026-02-19 22:08:25', '2026-05-02 22:08:25'),
(55, 'TXN-261', 261, 5, 34000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(56, 'TXN-270', 270, 5, 26000.00, 'WALLET', 'completed', '2026-02-22 22:08:25', '2026-05-02 22:08:25'),
(57, 'TXN-280', 280, 5, 36000.00, 'WALLET', 'completed', '2026-03-27 22:08:25', '2026-05-02 22:08:25'),
(58, 'TXN-282', 282, 5, 41000.00, 'WALLET', 'completed', '2026-02-22 22:08:25', '2026-05-02 22:08:25'),
(59, 'TXN-283', 283, 5, 27000.00, 'WALLET', 'completed', '2026-04-08 22:08:25', '2026-05-02 22:08:25'),
(60, 'TXN-288', 288, 5, 31000.00, 'WALLET', 'completed', '2026-03-01 22:08:25', '2026-05-02 22:08:25'),
(61, 'TXN-289', 289, 5, 25000.00, 'WALLET', 'completed', '2026-04-24 22:08:25', '2026-05-02 22:08:25'),
(62, 'TXN-292', 292, 5, 34000.00, 'WALLET', 'completed', '2026-04-19 22:08:25', '2026-05-02 22:08:25'),
(63, 'TXN-299', 299, 5, 30000.00, 'WALLET', 'completed', '2026-04-12 22:08:25', '2026-05-02 22:08:25'),
(64, 'TXN-300', 300, 5, 30000.00, 'WALLET', 'completed', '2026-03-19 22:08:25', '2026-05-02 22:08:25'),
(65, 'TXN-311', 311, 5, 39000.00, 'WALLET', 'completed', '2026-04-05 22:08:25', '2026-05-02 22:08:25'),
(66, 'TXN-312', 312, 5, 27000.00, 'WALLET', 'completed', '2026-04-30 22:08:25', '2026-05-02 22:08:25'),
(67, 'TXN-321', 321, 5, 31000.00, 'WALLET', 'completed', '2026-05-02 22:08:25', '2026-05-02 22:08:25'),
(68, 'TXN-325', 325, 5, 33000.00, 'WALLET', 'completed', '2026-05-02 22:08:25', '2026-05-02 22:08:25'),
(69, 'TXN-352', 352, 5, 28000.00, 'WALLET', 'completed', '2026-04-28 22:08:25', '2026-05-02 22:08:25'),
(70, 'TXN-361', 361, 5, 30000.00, 'WALLET', 'completed', '2026-04-26 22:08:25', '2026-05-02 22:08:25'),
(71, 'TXN-366', 366, 5, 33000.00, 'WALLET', 'completed', '2026-03-30 22:08:25', '2026-05-02 22:08:25'),
(72, 'TXN-368', 368, 5, 38000.00, 'WALLET', 'completed', '2026-04-22 22:08:25', '2026-05-02 22:08:25'),
(73, 'TXN-371', 371, 5, 30000.00, 'WALLET', 'completed', '2026-03-01 22:08:25', '2026-05-02 22:08:25'),
(74, 'TXN-374', 374, 5, 26000.00, 'WALLET', 'completed', '2026-02-23 22:08:25', '2026-05-02 22:08:25'),
(75, 'TXN-378', 378, 5, 33000.00, 'WALLET', 'completed', '2026-04-13 22:08:25', '2026-05-02 22:08:25'),
(76, 'TXN-384', 384, 5, 40000.00, 'WALLET', 'completed', '2026-04-11 22:08:25', '2026-05-02 22:08:25'),
(77, 'TXN-387', 387, 5, 40000.00, 'WALLET', 'completed', '2026-04-20 22:08:25', '2026-05-02 22:08:25'),
(78, 'TXN-391', 391, 5, 36000.00, 'WALLET', 'completed', '2026-01-01 22:08:25', '2026-05-02 22:08:25'),
(79, 'TXN-393', 393, 5, 36000.00, 'WALLET', 'completed', '2026-02-23 22:08:25', '2026-05-02 22:08:25'),
(80, 'TXN-411', 411, 5, 29000.00, 'WALLET', 'completed', '2026-05-02 22:08:25', '2026-05-02 22:08:25'),
(81, 'TXN-428', 428, 5, 42000.00, 'WALLET', 'completed', '2026-03-26 22:08:25', '2026-05-02 22:08:25'),
(82, 'TXN-430', 430, 5, 30000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(83, 'TXN-431', 431, 5, 36000.00, 'WALLET', 'completed', '2026-04-23 22:08:25', '2026-05-02 22:08:25'),
(84, 'TXN-436', 436, 5, 36000.00, 'WALLET', 'completed', '2026-01-01 22:08:25', '2026-05-02 22:08:25'),
(85, 'TXN-449', 449, 5, 41000.00, 'WALLET', 'completed', '2026-04-22 22:08:25', '2026-05-02 22:08:25'),
(86, 'TXN-453', 453, 5, 26000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(87, 'TXN-459', 459, 5, 38000.00, 'WALLET', 'completed', '2026-04-29 22:08:25', '2026-05-02 22:08:25'),
(88, 'TXN-461', 461, 5, 31000.00, 'WALLET', 'completed', '2026-02-27 22:08:25', '2026-05-02 22:08:25'),
(89, 'TXN-464', 464, 5, 32000.00, 'WALLET', 'completed', '2026-03-04 22:08:25', '2026-05-02 22:08:25'),
(90, 'TXN-482', 482, 5, 30000.00, 'WALLET', 'completed', '2026-02-25 22:08:25', '2026-05-02 22:08:25'),
(91, 'TXN-483', 483, 5, 35000.00, 'WALLET', 'completed', '2026-03-03 22:08:25', '2026-05-02 22:08:25'),
(92, 'TXN-484', 484, 5, 40000.00, 'WALLET', 'completed', '2026-04-18 22:08:25', '2026-05-02 22:08:25'),
(93, 'TXN-488', 488, 5, 38000.00, 'WALLET', 'completed', '2026-04-20 22:08:25', '2026-05-02 22:08:25'),
(94, 'TXN-490', 490, 5, 26000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(95, 'TXN-493', 493, 5, 27000.00, 'WALLET', 'completed', '2026-05-02 22:08:25', '2026-05-02 22:08:25'),
(96, 'TXN-494', 494, 5, 33000.00, 'WALLET', 'completed', '2026-04-26 22:08:25', '2026-05-02 22:08:25'),
(97, 'TXN-501', 501, 5, 38000.00, 'WALLET', 'completed', '2026-04-02 22:08:25', '2026-05-02 22:08:25'),
(98, 'TXN-502', 502, 5, 43000.00, 'WALLET', 'completed', '2026-04-15 22:08:25', '2026-05-02 22:08:25'),
(99, 'TXN-506', 506, 5, 41000.00, 'WALLET', 'completed', '2026-04-19 22:08:25', '2026-05-02 22:08:25'),
(100, 'TXN-523', 523, 5, 31000.00, 'WALLET', 'completed', '2026-04-05 22:08:25', '2026-05-02 22:08:25'),
(101, 'TXN-544', 544, 5, 26000.00, 'WALLET', 'completed', '2026-04-26 22:08:25', '2026-05-02 22:08:25'),
(102, 'TXN-546', 546, 5, 30000.00, 'WALLET', 'completed', '2026-04-17 22:08:25', '2026-05-02 22:08:25'),
(103, 'TXN-553', 553, 5, 28000.00, 'WALLET', 'completed', '2026-02-26 22:08:25', '2026-05-02 22:08:25'),
(104, 'TXN-554', 554, 5, 40000.00, 'WALLET', 'completed', '2026-02-01 22:08:25', '2026-05-02 22:08:25'),
(105, 'TXN-555', 555, 5, 34000.00, 'WALLET', 'completed', '2026-03-27 22:08:25', '2026-05-02 22:08:25'),
(106, 'TXN-563', 563, 5, 35000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(107, 'TXN-565', 565, 5, 33000.00, 'WALLET', 'completed', '2026-04-27 22:08:25', '2026-05-02 22:08:25'),
(108, 'TXN-566', 566, 5, 27000.00, 'WALLET', 'completed', '2026-02-28 22:08:25', '2026-05-02 22:08:25'),
(109, 'TXN-568', 568, 5, 36000.00, 'WALLET', 'completed', '2026-03-09 22:08:25', '2026-05-02 22:08:25'),
(110, 'TXN-21', 21, 6, 39000.00, 'WALLET', 'completed', '2026-04-20 22:08:25', '2026-05-02 22:08:25'),
(111, 'TXN-22', 22, 6, 41000.00, 'WALLET', 'completed', '2026-04-23 22:08:25', '2026-05-02 22:08:25'),
(112, 'TXN-23', 23, 6, 44000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(113, 'TXN-24', 24, 6, 27000.00, 'WALLET', 'completed', '2026-02-26 22:08:25', '2026-05-02 22:08:25'),
(114, 'TXN-25', 25, 6, 29000.00, 'WALLET', 'completed', '2026-04-19 22:08:25', '2026-05-02 22:08:25'),
(115, 'TXN-26', 26, 6, 40000.00, 'WALLET', 'completed', '2026-04-20 22:08:25', '2026-05-02 22:08:25'),
(116, 'TXN-27', 27, 6, 41000.00, 'WALLET', 'completed', '2026-03-11 22:08:25', '2026-05-02 22:08:25'),
(117, 'TXN-28', 28, 6, 38000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(118, 'TXN-31', 31, 6, 44000.00, 'WALLET', 'completed', '2026-04-26 22:08:25', '2026-05-02 22:08:25'),
(119, 'TXN-32', 32, 6, 40000.00, 'WALLET', 'completed', '2026-01-25 22:08:25', '2026-05-02 22:08:25'),
(120, 'TXN-33', 33, 6, 26000.00, 'WALLET', 'completed', '2026-03-25 22:08:25', '2026-05-02 22:08:25'),
(121, 'TXN-34', 34, 6, 29000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(122, 'TXN-35', 35, 6, 36000.00, 'WALLET', 'completed', '2026-03-12 22:08:25', '2026-05-02 22:08:25'),
(123, 'TXN-36', 36, 6, 40000.00, 'WALLET', 'completed', '2026-04-30 22:08:25', '2026-05-02 22:08:25'),
(124, 'TXN-37', 37, 6, 28000.00, 'WALLET', 'completed', '2026-04-04 22:08:25', '2026-05-02 22:08:25'),
(125, 'TXN-38', 38, 6, 29000.00, 'WALLET', 'completed', '2026-04-18 22:08:25', '2026-05-02 22:08:25'),
(126, 'TXN-39', 39, 6, 32000.00, 'WALLET', 'completed', '2026-03-08 22:08:25', '2026-05-02 22:08:25'),
(127, 'TXN-40', 40, 6, 33000.00, 'WALLET', 'completed', '2026-04-29 22:08:25', '2026-05-02 22:08:25'),
(128, 'TXN-124', 124, 6, 34000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(129, 'TXN-132', 132, 6, 28000.00, 'WALLET', 'completed', '2026-03-22 22:08:25', '2026-05-02 22:08:25'),
(130, 'TXN-133', 133, 6, 44000.00, 'WALLET', 'completed', '2026-04-22 22:08:25', '2026-05-02 22:08:25'),
(131, 'TXN-137', 137, 6, 37000.00, 'WALLET', 'completed', '2026-04-27 22:08:25', '2026-05-02 22:08:25'),
(132, 'TXN-147', 147, 6, 43000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(133, 'TXN-151', 151, 6, 36000.00, 'WALLET', 'completed', '2026-02-21 22:08:25', '2026-05-02 22:08:25'),
(134, 'TXN-155', 155, 6, 38000.00, 'WALLET', 'completed', '2026-04-24 22:08:25', '2026-05-02 22:08:25'),
(135, 'TXN-157', 157, 6, 25000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(136, 'TXN-175', 175, 6, 40000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(137, 'TXN-179', 179, 6, 33000.00, 'WALLET', 'completed', '2026-04-22 22:08:25', '2026-05-02 22:08:25'),
(138, 'TXN-188', 188, 6, 41000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(139, 'TXN-191', 191, 6, 42000.00, 'WALLET', 'completed', '2026-03-04 22:08:25', '2026-05-02 22:08:25'),
(140, 'TXN-194', 194, 6, 40000.00, 'WALLET', 'completed', '2026-04-28 22:08:25', '2026-05-02 22:08:25'),
(141, 'TXN-196', 196, 6, 29000.00, 'WALLET', 'completed', '2026-04-26 22:08:25', '2026-05-02 22:08:25'),
(142, 'TXN-200', 200, 6, 33000.00, 'WALLET', 'completed', '2026-05-01 22:08:25', '2026-05-02 22:08:25'),
(143, 'TXN-206', 206, 6, 27000.00, 'WALLET', 'completed', '2026-03-01 22:08:25', '2026-05-02 22:08:25'),
(144, 'TXN-207', 207, 6, 42000.00, 'WALLET', 'completed', '2026-04-01 22:08:25', '2026-05-02 22:08:25'),
(145, 'TXN-217', 217, 6, 27000.00, 'WALLET', 'completed', '2026-02-20 22:08:25', '2026-05-02 22:08:25'),
(146, 'TXN-235', 235, 6, 33000.00, 'WALLET', 'completed', '2026-03-18 22:08:25', '2026-05-02 22:08:25'),
(147, 'TXN-241', 241, 6, 43000.00, 'WALLET', 'completed', '2026-04-23 22:08:25', '2026-05-02 22:08:25'),
(148, 'TXN-254', 254, 6, 27000.00, 'WALLET', 'completed', '2026-03-09 22:08:25', '2026-05-02 22:08:25'),
(149, 'TXN-258', 258, 6, 38000.00, 'WALLET', 'completed', '2026-04-29 22:08:25', '2026-05-02 22:08:25'),
(150, 'TXN-267', 267, 6, 41000.00, 'WALLET', 'completed', '2026-01-18 22:08:25', '2026-05-02 22:08:25'),
(151, 'TXN-275', 275, 6, 33000.00, 'WALLET', 'completed', '2026-04-07 22:08:25', '2026-05-02 22:08:25'),
(152, 'TXN-291', 291, 6, 33000.00, 'WALLET', 'completed', '2026-04-24 22:08:25', '2026-05-02 22:08:25'),
(153, 'TXN-295', 295, 6, 30000.00, 'WALLET', 'completed', '2026-05-02 22:08:25', '2026-05-02 22:08:25'),
(154, 'TXN-304', 304, 6, 37000.00, 'WALLET', 'completed', '2026-04-17 22:08:25', '2026-05-02 22:08:25'),
(155, 'TXN-307', 307, 6, 37000.00, 'WALLET', 'completed', '2026-03-19 22:08:25', '2026-05-02 22:08:25'),
(156, 'TXN-319', 319, 6, 42000.00, 'WALLET', 'completed', '2026-03-27 22:08:25', '2026-05-02 22:08:25'),
(157, 'TXN-322', 322, 6, 25000.00, 'WALLET', 'completed', '2026-03-01 22:08:25', '2026-05-02 22:08:25'),
(158, 'TXN-327', 327, 6, 27000.00, 'WALLET', 'completed', '2026-01-23 22:08:25', '2026-05-02 22:08:25'),
(159, 'TXN-329', 329, 6, 39000.00, 'WALLET', 'completed', '2026-04-28 22:08:25', '2026-05-02 22:08:25'),
(160, 'TXN-330', 330, 6, 36000.00, 'WALLET', 'completed', '2026-04-25 22:08:25', '2026-05-02 22:08:25'),
(161, 'TXN-333', 333, 6, 27000.00, 'WALLET', 'completed', '2026-04-21 22:08:25', '2026-05-02 22:08:25'),
(162, 'TXN-349', 349, 6, 31000.00, 'WALLET', 'completed', '2026-03-11 22:08:25', '2026-05-02 22:08:25'),
(163, 'TXN-356', 356, 6, 35000.00, 'WALLET', 'completed', '2026-04-15 22:08:25', '2026-05-02 22:08:25'),
(164, 'TXN-359', 359, 6, 27000.00, 'WALLET', 'completed', '2026-01-29 22:08:25', '2026-05-02 22:08:25'),
(165, 'TXN-363', 363, 6, 26000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(166, 'TXN-364', 364, 6, 38000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(167, 'TXN-379', 379, 6, 28000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(168, 'TXN-385', 385, 6, 37000.00, 'WALLET', 'completed', '2026-03-31 22:08:26', '2026-05-02 22:08:26'),
(169, 'TXN-400', 400, 6, 38000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(170, 'TXN-414', 414, 6, 28000.00, 'WALLET', 'completed', '2026-04-21 22:08:26', '2026-05-02 22:08:26'),
(171, 'TXN-416', 416, 6, 40000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(172, 'TXN-419', 419, 6, 27000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(173, 'TXN-423', 423, 6, 35000.00, 'WALLET', 'completed', '2026-04-01 22:08:26', '2026-05-02 22:08:26'),
(174, 'TXN-443', 443, 6, 30000.00, 'WALLET', 'completed', '2026-02-24 22:08:26', '2026-05-02 22:08:26'),
(175, 'TXN-444', 444, 6, 27000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(176, 'TXN-445', 445, 6, 37000.00, 'WALLET', 'completed', '2026-04-23 22:08:26', '2026-05-02 22:08:26'),
(177, 'TXN-452', 452, 6, 28000.00, 'WALLET', 'completed', '2026-04-17 22:08:26', '2026-05-02 22:08:26'),
(178, 'TXN-456', 456, 6, 42000.00, 'WALLET', 'completed', '2026-04-28 22:08:26', '2026-05-02 22:08:26'),
(179, 'TXN-462', 462, 6, 33000.00, 'WALLET', 'completed', '2026-03-12 22:08:26', '2026-05-02 22:08:26'),
(180, 'TXN-476', 476, 6, 25000.00, 'WALLET', 'completed', '2026-03-28 22:08:26', '2026-05-02 22:08:26'),
(181, 'TXN-481', 481, 6, 37000.00, 'WALLET', 'completed', '2026-02-22 22:08:26', '2026-05-02 22:08:26'),
(182, 'TXN-495', 495, 6, 41000.00, 'WALLET', 'completed', '2026-04-03 22:08:26', '2026-05-02 22:08:26'),
(183, 'TXN-497', 497, 6, 34000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(184, 'TXN-513', 513, 6, 34000.00, 'WALLET', 'completed', '2026-03-01 22:08:26', '2026-05-02 22:08:26'),
(185, 'TXN-517', 517, 6, 41000.00, 'WALLET', 'completed', '2026-04-12 22:08:26', '2026-05-02 22:08:26'),
(186, 'TXN-521', 521, 6, 40000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(187, 'TXN-531', 531, 6, 29000.00, 'WALLET', 'completed', '2026-04-18 22:08:26', '2026-05-02 22:08:26'),
(188, 'TXN-535', 535, 6, 33000.00, 'WALLET', 'completed', '2026-03-17 22:08:26', '2026-05-02 22:08:26'),
(189, 'TXN-540', 540, 6, 35000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(190, 'TXN-547', 547, 6, 25000.00, 'WALLET', 'completed', '2026-04-05 22:08:26', '2026-05-02 22:08:26'),
(191, 'TXN-549', 549, 6, 36000.00, 'WALLET', 'completed', '2026-03-08 22:08:26', '2026-05-02 22:08:26'),
(192, 'TXN-552', 552, 6, 25000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(193, 'TXN-41', 41, 7, 30000.00, 'WALLET', 'completed', '2026-03-24 22:08:26', '2026-05-02 22:08:26'),
(194, 'TXN-42', 42, 7, 35000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(195, 'TXN-43', 43, 7, 39000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(196, 'TXN-44', 44, 7, 38000.00, 'WALLET', 'completed', '2026-04-01 22:08:26', '2026-05-02 22:08:26'),
(197, 'TXN-45', 45, 7, 26000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(198, 'TXN-47', 47, 7, 27000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(199, 'TXN-48', 48, 7, 32000.00, 'WALLET', 'completed', '2026-04-02 22:08:26', '2026-05-02 22:08:26'),
(200, 'TXN-49', 49, 7, 43000.00, 'WALLET', 'completed', '2026-03-05 22:08:26', '2026-05-02 22:08:26'),
(201, 'TXN-51', 51, 7, 38000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(202, 'TXN-52', 52, 7, 33000.00, 'WALLET', 'completed', '2026-04-23 22:08:26', '2026-05-02 22:08:26'),
(203, 'TXN-53', 53, 7, 30000.00, 'WALLET', 'completed', '2026-04-13 22:08:26', '2026-05-02 22:08:26'),
(204, 'TXN-55', 55, 7, 35000.00, 'WALLET', 'completed', '2026-03-19 22:08:26', '2026-05-02 22:08:26'),
(205, 'TXN-56', 56, 7, 29000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(206, 'TXN-57', 57, 7, 28000.00, 'WALLET', 'completed', '2026-04-15 22:08:26', '2026-05-02 22:08:26'),
(207, 'TXN-58', 58, 7, 28000.00, 'WALLET', 'completed', '2026-04-01 22:08:26', '2026-05-02 22:08:26'),
(208, 'TXN-59', 59, 7, 33000.00, 'WALLET', 'completed', '2026-04-18 22:08:26', '2026-05-02 22:08:26'),
(209, 'TXN-60', 60, 7, 33000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(210, 'TXN-126', 126, 7, 43000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(211, 'TXN-128', 128, 7, 39000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(212, 'TXN-142', 142, 7, 34000.00, 'WALLET', 'completed', '2026-03-29 22:08:26', '2026-05-02 22:08:26'),
(213, 'TXN-146', 146, 7, 38000.00, 'WALLET', 'completed', '2026-02-21 22:08:26', '2026-05-02 22:08:26'),
(214, 'TXN-167', 167, 7, 41000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(215, 'TXN-170', 170, 7, 29000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(216, 'TXN-173', 173, 7, 31000.00, 'WALLET', 'completed', '2026-04-14 22:08:26', '2026-05-02 22:08:26'),
(217, 'TXN-190', 190, 7, 35000.00, 'WALLET', 'completed', '2026-04-02 22:08:26', '2026-05-02 22:08:26'),
(218, 'TXN-198', 198, 7, 43000.00, 'WALLET', 'completed', '2026-03-24 22:08:26', '2026-05-02 22:08:26'),
(219, 'TXN-208', 208, 7, 37000.00, 'WALLET', 'completed', '2026-04-01 22:08:26', '2026-05-02 22:08:26'),
(220, 'TXN-213', 213, 7, 35000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(221, 'TXN-216', 216, 7, 27000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(222, 'TXN-224', 224, 7, 31000.00, 'WALLET', 'completed', '2026-02-27 22:08:26', '2026-05-02 22:08:26'),
(223, 'TXN-230', 230, 7, 31000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(224, 'TXN-231', 231, 7, 27000.00, 'WALLET', 'completed', '2026-04-28 22:08:26', '2026-05-02 22:08:26'),
(225, 'TXN-236', 236, 7, 40000.00, 'WALLET', 'completed', '2026-04-02 22:08:26', '2026-05-02 22:08:26'),
(226, 'TXN-238', 238, 7, 26000.00, 'WALLET', 'completed', '2026-03-23 22:08:26', '2026-05-02 22:08:26'),
(227, 'TXN-245', 245, 7, 26000.00, 'WALLET', 'completed', '2026-04-26 22:08:26', '2026-05-02 22:08:26'),
(228, 'TXN-255', 255, 7, 42000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(229, 'TXN-259', 259, 7, 38000.00, 'WALLET', 'completed', '2026-03-31 22:08:26', '2026-05-02 22:08:26'),
(230, 'TXN-260', 260, 7, 41000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(231, 'TXN-265', 265, 7, 27000.00, 'WALLET', 'completed', '2026-04-25 22:08:26', '2026-05-02 22:08:26'),
(232, 'TXN-268', 268, 7, 35000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(233, 'TXN-276', 276, 7, 31000.00, 'WALLET', 'completed', '2026-04-26 22:08:26', '2026-05-02 22:08:26'),
(234, 'TXN-285', 285, 7, 29000.00, 'WALLET', 'completed', '2026-04-10 22:08:26', '2026-05-02 22:08:26'),
(235, 'TXN-286', 286, 7, 29000.00, 'WALLET', 'completed', '2026-04-28 22:08:26', '2026-05-02 22:08:26'),
(236, 'TXN-294', 294, 7, 27000.00, 'WALLET', 'completed', '2026-04-25 22:08:26', '2026-05-02 22:08:26'),
(237, 'TXN-313', 313, 7, 33000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(238, 'TXN-332', 332, 7, 35000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(239, 'TXN-336', 336, 7, 30000.00, 'WALLET', 'completed', '2026-03-13 22:08:26', '2026-05-02 22:08:26'),
(240, 'TXN-344', 344, 7, 29000.00, 'WALLET', 'completed', '2026-03-27 22:08:26', '2026-05-02 22:08:26'),
(241, 'TXN-347', 347, 7, 32000.00, 'WALLET', 'completed', '2026-04-21 22:08:26', '2026-05-02 22:08:26'),
(242, 'TXN-354', 354, 7, 26000.00, 'WALLET', 'completed', '2026-03-10 22:08:26', '2026-05-02 22:08:26'),
(243, 'TXN-357', 357, 7, 28000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(244, 'TXN-367', 367, 7, 40000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(245, 'TXN-395', 395, 7, 42000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(246, 'TXN-396', 396, 7, 39000.00, 'WALLET', 'completed', '2026-03-07 22:08:26', '2026-05-02 22:08:26'),
(247, 'TXN-405', 405, 7, 28000.00, 'WALLET', 'completed', '2026-01-01 22:08:26', '2026-05-02 22:08:26'),
(248, 'TXN-410', 410, 7, 41000.00, 'WALLET', 'completed', '2026-03-15 22:08:26', '2026-05-02 22:08:26'),
(249, 'TXN-415', 415, 7, 44000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(250, 'TXN-418', 418, 7, 39000.00, 'WALLET', 'completed', '2026-04-28 22:08:26', '2026-05-02 22:08:26'),
(251, 'TXN-421', 421, 7, 38000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(252, 'TXN-422', 422, 7, 39000.00, 'WALLET', 'completed', '2026-03-04 22:08:26', '2026-05-02 22:08:26'),
(253, 'TXN-425', 425, 7, 30000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(254, 'TXN-433', 433, 7, 34000.00, 'WALLET', 'completed', '2026-04-07 22:08:26', '2026-05-02 22:08:26'),
(255, 'TXN-435', 435, 7, 40000.00, 'WALLET', 'completed', '2026-04-23 22:08:26', '2026-05-02 22:08:26'),
(256, 'TXN-438', 438, 7, 39000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(257, 'TXN-455', 455, 7, 38000.00, 'WALLET', 'completed', '2026-04-23 22:08:26', '2026-05-02 22:08:26'),
(258, 'TXN-463', 463, 7, 38000.00, 'WALLET', 'completed', '2026-04-12 22:08:26', '2026-05-02 22:08:26'),
(259, 'TXN-466', 466, 7, 44000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(260, 'TXN-467', 467, 7, 43000.00, 'WALLET', 'completed', '2026-03-17 22:08:26', '2026-05-02 22:08:26'),
(261, 'TXN-470', 470, 7, 43000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(262, 'TXN-472', 472, 7, 33000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(263, 'TXN-477', 477, 7, 38000.00, 'WALLET', 'completed', '2026-03-06 22:08:26', '2026-05-02 22:08:26'),
(264, 'TXN-489', 489, 7, 34000.00, 'WALLET', 'completed', '2026-03-20 22:08:26', '2026-05-02 22:08:26'),
(265, 'TXN-491', 491, 7, 31000.00, 'WALLET', 'completed', '2026-01-23 22:08:26', '2026-05-02 22:08:26'),
(266, 'TXN-504', 504, 7, 37000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(267, 'TXN-508', 508, 7, 27000.00, 'WALLET', 'completed', '2026-02-22 22:08:26', '2026-05-02 22:08:26'),
(268, 'TXN-510', 510, 7, 25000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(269, 'TXN-511', 511, 7, 44000.00, 'WALLET', 'completed', '2026-02-07 22:08:26', '2026-05-02 22:08:26'),
(270, 'TXN-522', 522, 7, 27000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(271, 'TXN-529', 529, 7, 31000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(272, 'TXN-530', 530, 7, 32000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(273, 'TXN-534', 534, 7, 42000.00, 'WALLET', 'completed', '2026-02-24 22:08:26', '2026-05-02 22:08:26'),
(274, 'TXN-537', 537, 7, 40000.00, 'WALLET', 'completed', '2026-03-30 22:08:26', '2026-05-02 22:08:26'),
(275, 'TXN-542', 542, 7, 31000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(276, 'TXN-543', 543, 7, 25000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(277, 'TXN-545', 545, 7, 43000.00, 'WALLET', 'completed', '2026-04-15 22:08:26', '2026-05-02 22:08:26'),
(278, 'TXN-556', 556, 7, 25000.00, 'WALLET', 'completed', '2026-02-16 22:08:26', '2026-05-02 22:08:26'),
(279, 'TXN-558', 558, 7, 25000.00, 'WALLET', 'completed', '2026-02-01 22:08:26', '2026-05-02 22:08:26'),
(280, 'TXN-61', 61, 8, 25000.00, 'WALLET', 'completed', '2026-04-25 22:08:26', '2026-05-02 22:08:26'),
(281, 'TXN-62', 62, 8, 30000.00, 'WALLET', 'completed', '2026-04-04 22:08:26', '2026-05-02 22:08:26'),
(282, 'TXN-63', 63, 8, 39000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(283, 'TXN-64', 64, 8, 28000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(284, 'TXN-65', 65, 8, 40000.00, 'WALLET', 'completed', '2026-03-23 22:08:26', '2026-05-02 22:08:26'),
(285, 'TXN-66', 66, 8, 32000.00, 'WALLET', 'completed', '2026-04-01 22:08:26', '2026-05-02 22:08:26'),
(286, 'TXN-67', 67, 8, 32000.00, 'WALLET', 'completed', '2025-12-31 22:08:26', '2026-05-02 22:08:26'),
(287, 'TXN-68', 68, 8, 31000.00, 'WALLET', 'completed', '2026-03-19 22:08:26', '2026-05-02 22:08:26'),
(288, 'TXN-69', 69, 8, 42000.00, 'WALLET', 'completed', '2026-04-23 22:08:26', '2026-05-02 22:08:26'),
(289, 'TXN-70', 70, 8, 26000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(290, 'TXN-71', 71, 8, 41000.00, 'WALLET', 'completed', '2026-04-05 22:08:26', '2026-05-02 22:08:26'),
(291, 'TXN-72', 72, 8, 29000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(292, 'TXN-73', 73, 8, 42000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(293, 'TXN-74', 74, 8, 33000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(294, 'TXN-75', 75, 8, 31000.00, 'WALLET', 'completed', '2026-04-03 22:08:26', '2026-05-02 22:08:26'),
(295, 'TXN-77', 77, 8, 40000.00, 'WALLET', 'completed', '2026-04-02 22:08:26', '2026-05-02 22:08:26'),
(296, 'TXN-78', 78, 8, 33000.00, 'WALLET', 'completed', '2026-03-31 22:08:26', '2026-05-02 22:08:26'),
(297, 'TXN-79', 79, 8, 25000.00, 'WALLET', 'completed', '2026-02-16 22:08:26', '2026-05-02 22:08:26'),
(298, 'TXN-80', 80, 8, 26000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(299, 'TXN-123', 123, 8, 36000.00, 'WALLET', 'completed', '2026-04-23 22:08:26', '2026-05-02 22:08:26'),
(300, 'TXN-131', 131, 8, 30000.00, 'WALLET', 'completed', '2026-01-19 22:08:26', '2026-05-02 22:08:26'),
(301, 'TXN-148', 148, 8, 36000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(302, 'TXN-156', 156, 8, 28000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(303, 'TXN-158', 158, 8, 42000.00, 'WALLET', 'completed', '2026-02-21 22:08:26', '2026-05-02 22:08:26'),
(304, 'TXN-161', 161, 8, 36000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(305, 'TXN-165', 165, 8, 41000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(306, 'TXN-174', 174, 8, 40000.00, 'WALLET', 'completed', '2026-03-31 22:08:26', '2026-05-02 22:08:26'),
(307, 'TXN-180', 180, 8, 33000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(308, 'TXN-185', 185, 8, 27000.00, 'WALLET', 'completed', '2026-04-25 22:08:26', '2026-05-02 22:08:26'),
(309, 'TXN-189', 189, 8, 30000.00, 'WALLET', 'completed', '2026-04-28 22:08:26', '2026-05-02 22:08:26'),
(310, 'TXN-199', 199, 8, 34000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(311, 'TXN-205', 205, 8, 31000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(312, 'TXN-210', 210, 8, 39000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(313, 'TXN-219', 219, 8, 27000.00, 'WALLET', 'completed', '2026-04-18 22:08:26', '2026-05-02 22:08:26'),
(314, 'TXN-220', 220, 8, 29000.00, 'WALLET', 'completed', '2026-02-07 22:08:26', '2026-05-02 22:08:26'),
(315, 'TXN-226', 226, 8, 27000.00, 'WALLET', 'completed', '2026-02-25 22:08:26', '2026-05-02 22:08:26'),
(316, 'TXN-227', 227, 8, 44000.00, 'WALLET', 'completed', '2026-04-10 22:08:26', '2026-05-02 22:08:26'),
(317, 'TXN-229', 229, 8, 44000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(318, 'TXN-233', 233, 8, 36000.00, 'WALLET', 'completed', '2026-03-26 22:08:26', '2026-05-02 22:08:26'),
(319, 'TXN-243', 243, 8, 43000.00, 'WALLET', 'completed', '2026-03-06 22:08:26', '2026-05-02 22:08:26'),
(320, 'TXN-244', 244, 8, 39000.00, 'WALLET', 'completed', '2026-03-22 22:08:26', '2026-05-02 22:08:26'),
(321, 'TXN-246', 246, 8, 33000.00, 'WALLET', 'completed', '2026-04-21 22:08:26', '2026-05-02 22:08:26'),
(322, 'TXN-262', 262, 8, 37000.00, 'WALLET', 'completed', '2026-04-21 22:08:26', '2026-05-02 22:08:26'),
(323, 'TXN-263', 263, 8, 25000.00, 'WALLET', 'completed', '2026-03-20 22:08:26', '2026-05-02 22:08:26'),
(324, 'TXN-269', 269, 8, 38000.00, 'WALLET', 'completed', '2026-04-26 22:08:26', '2026-05-02 22:08:26'),
(325, 'TXN-274', 274, 8, 25000.00, 'WALLET', 'completed', '2026-04-17 22:08:26', '2026-05-02 22:08:26'),
(326, 'TXN-278', 278, 8, 26000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(327, 'TXN-287', 287, 8, 36000.00, 'WALLET', 'completed', '2026-04-21 22:08:26', '2026-05-02 22:08:26'),
(328, 'TXN-303', 303, 8, 34000.00, 'WALLET', 'completed', '2026-04-25 22:08:26', '2026-05-02 22:08:26'),
(329, 'TXN-305', 305, 8, 26000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(330, 'TXN-306', 306, 8, 34000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(331, 'TXN-308', 308, 8, 27000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(332, 'TXN-315', 315, 8, 37000.00, 'WALLET', 'completed', '2026-03-07 22:08:26', '2026-05-02 22:08:26'),
(333, 'TXN-317', 317, 8, 27000.00, 'WALLET', 'completed', '2026-04-13 22:08:26', '2026-05-02 22:08:26'),
(334, 'TXN-323', 323, 8, 37000.00, 'WALLET', 'completed', '2026-04-21 22:08:26', '2026-05-02 22:08:26'),
(335, 'TXN-326', 326, 8, 42000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(336, 'TXN-328', 328, 8, 29000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(337, 'TXN-334', 334, 8, 44000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(338, 'TXN-340', 340, 8, 29000.00, 'WALLET', 'completed', '2026-01-17 22:08:26', '2026-05-02 22:08:26'),
(339, 'TXN-343', 343, 8, 37000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(340, 'TXN-346', 346, 8, 43000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(341, 'TXN-348', 348, 8, 43000.00, 'WALLET', 'completed', '2026-04-25 22:08:26', '2026-05-02 22:08:26'),
(342, 'TXN-358', 358, 8, 44000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(343, 'TXN-365', 365, 8, 37000.00, 'WALLET', 'completed', '2026-04-18 22:08:26', '2026-05-02 22:08:26'),
(344, 'TXN-369', 369, 8, 38000.00, 'WALLET', 'completed', '2026-04-01 22:08:26', '2026-05-02 22:08:26'),
(345, 'TXN-370', 370, 8, 40000.00, 'WALLET', 'completed', '2026-04-28 22:08:26', '2026-05-02 22:08:26'),
(346, 'TXN-381', 381, 8, 29000.00, 'WALLET', 'completed', '2026-04-08 22:08:26', '2026-05-02 22:08:26'),
(347, 'TXN-386', 386, 8, 29000.00, 'WALLET', 'completed', '2026-04-17 22:08:26', '2026-05-02 22:08:26'),
(348, 'TXN-397', 397, 8, 33000.00, 'WALLET', 'completed', '2026-04-05 22:08:26', '2026-05-02 22:08:26'),
(349, 'TXN-403', 403, 8, 41000.00, 'WALLET', 'completed', '2026-04-07 22:08:26', '2026-05-02 22:08:26'),
(350, 'TXN-404', 404, 8, 27000.00, 'WALLET', 'completed', '2026-04-18 22:08:26', '2026-05-02 22:08:26'),
(351, 'TXN-408', 408, 8, 41000.00, 'WALLET', 'completed', '2026-03-28 22:08:26', '2026-05-02 22:08:26'),
(352, 'TXN-409', 409, 8, 40000.00, 'WALLET', 'completed', '2026-03-17 22:08:26', '2026-05-02 22:08:26'),
(353, 'TXN-420', 420, 8, 43000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(354, 'TXN-424', 424, 8, 27000.00, 'WALLET', 'completed', '2026-04-29 22:08:26', '2026-05-02 22:08:26'),
(355, 'TXN-429', 429, 8, 29000.00, 'WALLET', 'completed', '2026-01-30 22:08:26', '2026-05-02 22:08:26'),
(356, 'TXN-432', 432, 8, 33000.00, 'WALLET', 'completed', '2026-04-22 22:08:26', '2026-05-02 22:08:26'),
(357, 'TXN-446', 446, 8, 32000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(358, 'TXN-468', 468, 8, 27000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(359, 'TXN-485', 485, 8, 25000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(360, 'TXN-486', 486, 8, 38000.00, 'WALLET', 'completed', '2026-02-26 22:08:26', '2026-05-02 22:08:26'),
(361, 'TXN-492', 492, 8, 34000.00, 'WALLET', 'completed', '2026-03-11 22:08:26', '2026-05-02 22:08:26'),
(362, 'TXN-503', 503, 8, 43000.00, 'WALLET', 'completed', '2026-03-01 22:08:26', '2026-05-02 22:08:26'),
(363, 'TXN-507', 507, 8, 40000.00, 'WALLET', 'completed', '2026-03-23 22:08:26', '2026-05-02 22:08:26'),
(364, 'TXN-509', 509, 8, 38000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(365, 'TXN-514', 514, 8, 37000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(366, 'TXN-525', 525, 8, 34000.00, 'WALLET', 'completed', '2026-04-18 22:08:26', '2026-05-02 22:08:26'),
(367, 'TXN-526', 526, 8, 33000.00, 'WALLET', 'completed', '2026-03-16 22:08:26', '2026-05-02 22:08:26'),
(368, 'TXN-527', 527, 8, 27000.00, 'WALLET', 'completed', '2026-04-13 22:08:26', '2026-05-02 22:08:26'),
(369, 'TXN-528', 528, 8, 25000.00, 'WALLET', 'completed', '2026-04-17 22:08:26', '2026-05-02 22:08:26'),
(370, 'TXN-533', 533, 8, 26000.00, 'WALLET', 'completed', '2026-02-27 22:08:26', '2026-05-02 22:08:26'),
(371, 'TXN-539', 539, 8, 25000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(372, 'TXN-548', 548, 8, 41000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(373, 'TXN-557', 557, 8, 36000.00, 'WALLET', 'completed', '2026-04-24 22:08:26', '2026-05-02 22:08:26'),
(374, 'TXN-559', 559, 8, 43000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(375, 'TXN-561', 561, 8, 25000.00, 'WALLET', 'completed', '2026-04-19 22:08:26', '2026-05-02 22:08:26'),
(376, 'TXN-569', 569, 8, 34000.00, 'WALLET', 'completed', '2026-03-29 22:08:26', '2026-05-02 22:08:26'),
(377, 'TXN-570', 570, 8, 32000.00, 'WALLET', 'completed', '2026-05-01 22:08:26', '2026-05-02 22:08:26'),
(378, 'TXN-81', 81, 9, 36000.00, 'WALLET', 'completed', '2026-05-02 22:08:26', '2026-05-02 22:08:26'),
(379, 'TXN-82', 82, 9, 27000.00, 'WALLET', 'completed', '2026-03-24 22:08:26', '2026-05-02 22:08:26'),
(380, 'TXN-83', 83, 9, 32000.00, 'WALLET', 'completed', '2026-01-19 22:08:26', '2026-05-02 22:08:26'),
(381, 'TXN-84', 84, 9, 28000.00, 'WALLET', 'completed', '2025-12-30 22:08:26', '2026-05-02 22:08:26'),
(382, 'TXN-85', 85, 9, 31000.00, 'WALLET', 'completed', '2026-04-27 22:08:26', '2026-05-02 22:08:26'),
(383, 'TXN-86', 86, 9, 44000.00, 'WALLET', 'completed', '2026-01-22 22:08:26', '2026-05-02 22:08:26'),
(384, 'TXN-87', 87, 9, 37000.00, 'WALLET', 'completed', '2026-04-26 22:08:26', '2026-05-02 22:08:26'),
(385, 'TXN-88', 88, 9, 31000.00, 'WALLET', 'completed', '2026-04-30 22:08:26', '2026-05-02 22:08:26'),
(386, 'TXN-89', 89, 9, 35000.00, 'WALLET', 'completed', '2026-04-09 22:08:26', '2026-05-02 22:08:26'),
(387, 'TXN-90', 90, 9, 41000.00, 'WALLET', 'completed', '2026-04-20 22:08:26', '2026-05-02 22:08:26'),
(388, 'TXN-91', 91, 9, 36000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(389, 'TXN-92', 92, 9, 31000.00, 'WALLET', 'completed', '2026-04-25 22:08:27', '2026-05-02 22:08:27'),
(390, 'TXN-93', 93, 9, 40000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(391, 'TXN-94', 94, 9, 32000.00, 'WALLET', 'completed', '2026-04-28 22:08:27', '2026-05-02 22:08:27'),
(392, 'TXN-96', 96, 9, 39000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(393, 'TXN-97', 97, 9, 26000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(394, 'TXN-98', 98, 9, 35000.00, 'WALLET', 'completed', '2026-03-26 22:08:27', '2026-05-02 22:08:27'),
(395, 'TXN-99', 99, 9, 42000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(396, 'TXN-100', 100, 9, 34000.00, 'WALLET', 'completed', '2026-02-21 22:08:27', '2026-05-02 22:08:27'),
(397, 'TXN-121', 121, 9, 41000.00, 'WALLET', 'completed', '2026-03-13 22:08:27', '2026-05-02 22:08:27'),
(398, 'TXN-135', 135, 9, 42000.00, 'WALLET', 'completed', '2026-02-17 22:08:27', '2026-05-02 22:08:27'),
(399, 'TXN-136', 136, 9, 32000.00, 'WALLET', 'completed', '2026-03-12 22:08:27', '2026-05-02 22:08:27'),
(400, 'TXN-139', 139, 9, 36000.00, 'WALLET', 'completed', '2026-05-02 22:08:27', '2026-05-02 22:08:27'),
(401, 'TXN-140', 140, 9, 38000.00, 'WALLET', 'completed', '2026-04-21 22:08:27', '2026-05-02 22:08:27'),
(402, 'TXN-141', 141, 9, 36000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(403, 'TXN-150', 150, 9, 34000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(404, 'TXN-152', 152, 9, 36000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(405, 'TXN-153', 153, 9, 40000.00, 'WALLET', 'completed', '2026-03-05 22:08:27', '2026-05-02 22:08:27'),
(406, 'TXN-159', 159, 9, 35000.00, 'WALLET', 'completed', '2026-04-25 22:08:27', '2026-05-02 22:08:27'),
(407, 'TXN-163', 163, 9, 30000.00, 'WALLET', 'completed', '2026-04-18 22:08:27', '2026-05-02 22:08:27'),
(408, 'TXN-166', 166, 9, 43000.00, 'WALLET', 'completed', '2026-03-06 22:08:27', '2026-05-02 22:08:27'),
(409, 'TXN-171', 171, 9, 25000.00, 'WALLET', 'completed', '2026-03-31 22:08:27', '2026-05-02 22:08:27'),
(410, 'TXN-177', 177, 9, 44000.00, 'WALLET', 'completed', '2026-04-30 22:08:27', '2026-05-02 22:08:27'),
(411, 'TXN-183', 183, 9, 44000.00, 'WALLET', 'completed', '2026-04-23 22:08:27', '2026-05-02 22:08:27'),
(412, 'TXN-184', 184, 9, 33000.00, 'WALLET', 'completed', '2026-02-23 22:08:27', '2026-05-02 22:08:27'),
(413, 'TXN-187', 187, 9, 41000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(414, 'TXN-202', 202, 9, 28000.00, 'WALLET', 'completed', '2026-03-14 22:08:27', '2026-05-02 22:08:27'),
(415, 'TXN-204', 204, 9, 38000.00, 'WALLET', 'completed', '2026-02-28 22:08:27', '2026-05-02 22:08:27'),
(416, 'TXN-221', 221, 9, 37000.00, 'WALLET', 'completed', '2026-04-30 22:08:27', '2026-05-02 22:08:27'),
(417, 'TXN-222', 222, 9, 36000.00, 'WALLET', 'completed', '2026-02-17 22:08:27', '2026-05-02 22:08:27'),
(418, 'TXN-223', 223, 9, 28000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(419, 'TXN-234', 234, 9, 37000.00, 'WALLET', 'completed', '2026-03-30 22:08:27', '2026-05-02 22:08:27'),
(420, 'TXN-240', 240, 9, 33000.00, 'WALLET', 'completed', '2026-04-09 22:08:27', '2026-05-02 22:08:27'),
(421, 'TXN-247', 247, 9, 43000.00, 'WALLET', 'completed', '2026-04-28 22:08:27', '2026-05-02 22:08:27'),
(422, 'TXN-249', 249, 9, 39000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(423, 'TXN-256', 256, 9, 25000.00, 'WALLET', 'completed', '2026-03-24 22:08:27', '2026-05-02 22:08:27'),
(424, 'TXN-257', 257, 9, 44000.00, 'WALLET', 'completed', '2026-04-11 22:08:27', '2026-05-02 22:08:27'),
(425, 'TXN-266', 266, 9, 32000.00, 'WALLET', 'completed', '2026-04-18 22:08:27', '2026-05-02 22:08:27'),
(426, 'TXN-273', 273, 9, 31000.00, 'WALLET', 'completed', '2026-02-25 22:08:27', '2026-05-02 22:08:27'),
(427, 'TXN-281', 281, 9, 40000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(428, 'TXN-290', 290, 9, 32000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(429, 'TXN-301', 301, 9, 41000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(430, 'TXN-302', 302, 9, 36000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(431, 'TXN-310', 310, 9, 32000.00, 'WALLET', 'completed', '2026-03-17 22:08:27', '2026-05-02 22:08:27'),
(432, 'TXN-314', 314, 9, 40000.00, 'WALLET', 'completed', '2026-04-18 22:08:27', '2026-05-02 22:08:27'),
(433, 'TXN-316', 316, 9, 31000.00, 'WALLET', 'completed', '2026-02-17 22:08:27', '2026-05-02 22:08:27'),
(434, 'TXN-318', 318, 9, 44000.00, 'WALLET', 'completed', '2026-04-29 22:08:27', '2026-05-02 22:08:27'),
(435, 'TXN-320', 320, 9, 26000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(436, 'TXN-335', 335, 9, 40000.00, 'WALLET', 'completed', '2026-04-21 22:08:27', '2026-05-02 22:08:27'),
(437, 'TXN-338', 338, 9, 30000.00, 'WALLET', 'completed', '2026-04-30 22:08:27', '2026-05-02 22:08:27'),
(438, 'TXN-339', 339, 9, 32000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(439, 'TXN-341', 341, 9, 40000.00, 'WALLET', 'completed', '2026-03-07 22:08:27', '2026-05-02 22:08:27'),
(440, 'TXN-350', 350, 9, 25000.00, 'WALLET', 'completed', '2026-04-04 22:08:27', '2026-05-02 22:08:27'),
(441, 'TXN-353', 353, 9, 40000.00, 'WALLET', 'completed', '2026-04-23 22:08:27', '2026-05-02 22:08:27'),
(442, 'TXN-355', 355, 9, 35000.00, 'WALLET', 'completed', '2026-02-27 22:08:27', '2026-05-02 22:08:27'),
(443, 'TXN-360', 360, 9, 42000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(444, 'TXN-362', 362, 9, 39000.00, 'WALLET', 'completed', '2026-03-30 22:08:27', '2026-05-02 22:08:27'),
(445, 'TXN-372', 372, 9, 40000.00, 'WALLET', 'completed', '2026-04-05 22:08:27', '2026-05-02 22:08:27'),
(446, 'TXN-375', 375, 9, 44000.00, 'WALLET', 'completed', '2026-02-06 22:08:27', '2026-05-02 22:08:27'),
(447, 'TXN-376', 376, 9, 26000.00, 'WALLET', 'completed', '2026-04-30 22:08:27', '2026-05-02 22:08:27'),
(448, 'TXN-377', 377, 9, 27000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(449, 'TXN-382', 382, 9, 25000.00, 'WALLET', 'completed', '2026-02-05 22:08:27', '2026-05-02 22:08:27'),
(450, 'TXN-389', 389, 9, 34000.00, 'WALLET', 'completed', '2026-05-02 22:08:27', '2026-05-02 23:09:42'),
(451, 'TXN-390', 390, 9, 33000.00, 'WALLET', 'completed', '2026-03-23 22:08:27', '2026-05-02 22:08:27'),
(452, 'TXN-401', 401, 9, 36000.00, 'WALLET', 'completed', '2026-04-21 22:08:27', '2026-05-02 22:08:27'),
(453, 'TXN-402', 402, 9, 43000.00, 'WALLET', 'completed', '2026-01-02 22:08:27', '2026-05-02 22:08:27'),
(454, 'TXN-406', 406, 9, 39000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(455, 'TXN-413', 413, 9, 40000.00, 'WALLET', 'completed', '2026-04-27 22:08:27', '2026-05-02 22:08:27'),
(456, 'TXN-417', 417, 9, 34000.00, 'WALLET', 'completed', '2026-04-29 22:08:27', '2026-05-02 22:08:27'),
(457, 'TXN-426', 426, 9, 41000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(458, 'TXN-437', 437, 9, 35000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(459, 'TXN-439', 439, 9, 26000.00, 'WALLET', 'completed', '2026-04-23 22:08:27', '2026-05-02 22:08:27'),
(460, 'TXN-442', 442, 9, 32000.00, 'WALLET', 'completed', '2026-02-20 22:08:27', '2026-05-02 22:08:27'),
(461, 'TXN-448', 448, 9, 37000.00, 'WALLET', 'completed', '2026-04-09 22:08:27', '2026-05-02 22:08:27'),
(462, 'TXN-457', 457, 9, 38000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(463, 'TXN-460', 460, 9, 44000.00, 'WALLET', 'completed', '2026-03-05 22:08:27', '2026-05-02 22:08:27'),
(464, 'TXN-465', 465, 9, 25000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(465, 'TXN-471', 471, 9, 35000.00, 'WALLET', 'completed', '2026-04-27 22:08:27', '2026-05-02 22:08:27'),
(466, 'TXN-473', 473, 9, 44000.00, 'WALLET', 'completed', '2026-04-25 22:08:27', '2026-05-02 22:08:27'),
(467, 'TXN-474', 474, 9, 26000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(468, 'TXN-475', 475, 9, 26000.00, 'WALLET', 'completed', '2026-04-17 22:08:27', '2026-05-02 22:08:27'),
(469, 'TXN-479', 479, 9, 39000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(470, 'TXN-487', 487, 9, 37000.00, 'WALLET', 'completed', '2026-04-30 22:08:27', '2026-05-02 22:08:27'),
(471, 'TXN-498', 498, 9, 26000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(472, 'TXN-499', 499, 9, 36000.00, 'WALLET', 'completed', '2026-02-20 22:08:27', '2026-05-02 22:08:27'),
(473, 'TXN-500', 500, 9, 37000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(474, 'TXN-505', 505, 9, 32000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(475, 'TXN-516', 516, 9, 25000.00, 'WALLET', 'completed', '2026-05-02 22:08:27', '2026-05-02 22:08:27'),
(476, 'TXN-519', 519, 9, 42000.00, 'WALLET', 'completed', '2026-03-27 22:08:27', '2026-05-02 22:08:27'),
(477, 'TXN-536', 536, 9, 43000.00, 'WALLET', 'completed', '2026-03-26 22:08:27', '2026-05-02 22:08:27'),
(478, 'TXN-550', 550, 9, 35000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(479, 'TXN-551', 551, 9, 27000.00, 'WALLET', 'completed', '2026-03-03 22:08:27', '2026-05-02 22:08:27'),
(480, 'TXN-560', 560, 9, 35000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(481, 'TXN-562', 562, 9, 31000.00, 'WALLET', 'completed', '2026-04-25 22:08:27', '2026-05-02 22:08:27'),
(482, 'TXN-567', 567, 9, 36000.00, 'WALLET', 'completed', '2026-03-01 22:08:27', '2026-05-02 22:08:27'),
(483, 'TXN-571', 571, 9, 38000.00, 'WALLET', 'completed', '2026-01-11 22:08:27', '2026-05-02 22:08:27'),
(484, 'TXN-101', 101, 10, 43000.00, 'WALLET', 'completed', '2026-04-07 22:08:27', '2026-05-02 22:08:27'),
(485, 'TXN-102', 102, 10, 40000.00, 'WALLET', 'completed', '2026-03-25 22:08:27', '2026-05-02 22:08:27'),
(486, 'TXN-103', 103, 10, 32000.00, 'WALLET', 'completed', '2026-03-22 22:08:27', '2026-05-02 22:08:27');
INSERT INTO `payments` (`id`, `order_id`, `shipment_id`, `customer_id`, `amount`, `method`, `status`, `created_at`, `updated_at`) VALUES
(487, 'TXN-104', 104, 10, 38000.00, 'WALLET', 'completed', '2026-02-02 22:08:27', '2026-05-02 22:08:27'),
(488, 'TXN-105', 105, 10, 40000.00, 'WALLET', 'completed', '2026-01-28 22:08:27', '2026-05-02 22:08:27'),
(489, 'TXN-107', 107, 10, 44000.00, 'WALLET', 'completed', '2026-03-31 22:08:27', '2026-05-02 22:08:27'),
(490, 'TXN-108', 108, 10, 26000.00, 'WALLET', 'completed', '2026-03-27 22:08:27', '2026-05-02 22:08:27'),
(491, 'TXN-109', 109, 10, 28000.00, 'WALLET', 'completed', '2026-04-02 22:08:27', '2026-05-02 22:08:27'),
(492, 'TXN-110', 110, 10, 38000.00, 'WALLET', 'completed', '2026-04-03 22:08:27', '2026-05-02 22:08:27'),
(493, 'TXN-111', 111, 10, 35000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(494, 'TXN-112', 112, 10, 39000.00, 'WALLET', 'completed', '2026-05-01 22:08:27', '2026-05-02 22:08:27'),
(495, 'TXN-113', 113, 10, 30000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(496, 'TXN-114', 114, 10, 33000.00, 'WALLET', 'completed', '2026-03-28 22:08:27', '2026-05-02 22:08:27'),
(497, 'TXN-115', 115, 10, 26000.00, 'WALLET', 'completed', '2026-04-23 22:08:27', '2026-05-02 22:08:27'),
(498, 'TXN-116', 116, 10, 31000.00, 'WALLET', 'completed', '2026-04-09 22:08:27', '2026-05-02 22:08:27'),
(499, 'TXN-117', 117, 10, 44000.00, 'WALLET', 'completed', '2026-04-28 22:08:27', '2026-05-02 22:08:27'),
(500, 'TXN-118', 118, 10, 33000.00, 'WALLET', 'completed', '2026-04-25 22:08:27', '2026-05-02 22:08:27'),
(501, 'TXN-122', 122, 10, 44000.00, 'WALLET', 'completed', '2026-04-18 22:08:27', '2026-05-02 22:08:27'),
(502, 'TXN-127', 127, 10, 44000.00, 'WALLET', 'completed', '2026-03-19 22:08:27', '2026-05-02 22:08:27'),
(503, 'TXN-129', 129, 10, 28000.00, 'WALLET', 'completed', '2026-03-19 22:08:27', '2026-05-02 22:08:27'),
(504, 'TXN-134', 134, 10, 35000.00, 'WALLET', 'completed', '2026-04-29 22:08:27', '2026-05-02 22:08:27'),
(505, 'TXN-145', 145, 10, 41000.00, 'WALLET', 'completed', '2026-02-22 22:08:27', '2026-05-02 22:08:27'),
(506, 'TXN-149', 149, 10, 26000.00, 'WALLET', 'completed', '2026-04-29 22:08:27', '2026-05-02 22:08:27'),
(507, 'TXN-160', 160, 10, 27000.00, 'WALLET', 'completed', '2026-03-09 22:08:27', '2026-05-02 22:08:27'),
(508, 'TXN-162', 162, 10, 43000.00, 'WALLET', 'completed', '2025-12-29 22:08:27', '2026-05-02 22:08:27'),
(509, 'TXN-164', 164, 10, 34000.00, 'WALLET', 'completed', '2026-02-23 22:08:27', '2026-05-02 22:08:27'),
(510, 'TXN-168', 168, 10, 43000.00, 'WALLET', 'completed', '2026-03-04 22:08:27', '2026-05-02 22:08:27'),
(511, 'TXN-169', 169, 10, 26000.00, 'WALLET', 'completed', '2026-04-27 22:08:27', '2026-05-02 22:08:27'),
(512, 'TXN-182', 182, 10, 34000.00, 'WALLET', 'completed', '2026-04-14 22:08:27', '2026-05-02 22:08:27'),
(513, 'TXN-192', 192, 10, 40000.00, 'WALLET', 'completed', '2026-04-27 22:08:27', '2026-05-02 22:08:27'),
(514, 'TXN-193', 193, 10, 25000.00, 'WALLET', 'completed', '2026-02-23 22:08:27', '2026-05-02 22:08:27'),
(515, 'TXN-195', 195, 10, 32000.00, 'WALLET', 'completed', '2026-04-18 22:08:27', '2026-05-02 22:08:27'),
(516, 'TXN-209', 209, 10, 26000.00, 'WALLET', 'completed', '2026-02-04 22:08:27', '2026-05-02 22:08:27'),
(517, 'TXN-211', 211, 10, 40000.00, 'WALLET', 'completed', '2026-04-21 22:08:27', '2026-05-02 22:08:27'),
(518, 'TXN-212', 212, 10, 29000.00, 'WALLET', 'completed', '2026-01-19 22:08:27', '2026-05-02 22:08:27'),
(519, 'TXN-215', 215, 10, 25000.00, 'WALLET', 'completed', '2026-04-27 22:08:27', '2026-05-02 22:08:27'),
(520, 'TXN-218', 218, 10, 41000.00, 'WALLET', 'completed', '2026-01-20 22:08:27', '2026-05-02 22:08:27'),
(521, 'TXN-225', 225, 10, 25000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(522, 'TXN-239', 239, 10, 28000.00, 'WALLET', 'completed', '2026-01-01 22:08:27', '2026-05-02 22:08:27'),
(523, 'TXN-251', 251, 10, 40000.00, 'WALLET', 'completed', '2026-04-09 22:08:27', '2026-05-02 22:08:27'),
(524, 'TXN-264', 264, 10, 36000.00, 'WALLET', 'completed', '2026-03-08 22:08:27', '2026-05-02 22:08:27'),
(525, 'TXN-272', 272, 10, 30000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(526, 'TXN-277', 277, 10, 27000.00, 'WALLET', 'completed', '2026-01-04 22:08:27', '2026-05-02 22:08:27'),
(527, 'TXN-279', 279, 10, 44000.00, 'WALLET', 'completed', '2026-05-02 22:08:27', '2026-05-02 22:08:27'),
(528, 'TXN-284', 284, 10, 27000.00, 'WALLET', 'completed', '2026-02-07 22:08:27', '2026-05-02 22:08:27'),
(529, 'TXN-293', 293, 10, 34000.00, 'WALLET', 'completed', '2026-03-06 22:08:27', '2026-05-02 22:08:27'),
(530, 'TXN-296', 296, 10, 37000.00, 'WALLET', 'completed', '2026-04-04 22:08:27', '2026-05-02 22:08:27'),
(531, 'TXN-297', 297, 10, 39000.00, 'WALLET', 'completed', '2026-01-20 22:08:27', '2026-05-02 22:08:27'),
(532, 'TXN-298', 298, 10, 28000.00, 'WALLET', 'completed', '2026-03-15 22:08:27', '2026-05-02 22:08:27'),
(533, 'TXN-309', 309, 10, 39000.00, 'WALLET', 'completed', '2026-04-30 22:08:27', '2026-05-02 22:08:27'),
(534, 'TXN-324', 324, 10, 40000.00, 'WALLET', 'completed', '2026-04-08 22:08:27', '2026-05-02 22:08:27'),
(535, 'TXN-331', 331, 10, 40000.00, 'WALLET', 'completed', '2026-04-26 22:08:27', '2026-05-02 22:08:27'),
(536, 'TXN-337', 337, 10, 37000.00, 'WALLET', 'completed', '2026-02-10 22:08:27', '2026-05-02 22:08:27'),
(537, 'TXN-342', 342, 10, 39000.00, 'WALLET', 'completed', '2026-04-15 22:08:27', '2026-05-02 22:08:27'),
(538, 'TXN-345', 345, 10, 37000.00, 'WALLET', 'completed', '2026-03-27 22:08:27', '2026-05-02 22:08:27'),
(539, 'TXN-351', 351, 10, 34000.00, 'WALLET', 'completed', '2026-05-02 22:08:27', '2026-05-02 22:08:27'),
(540, 'TXN-373', 373, 10, 27000.00, 'WALLET', 'completed', '2026-03-28 22:08:27', '2026-05-02 22:08:27'),
(541, 'TXN-380', 380, 10, 40000.00, 'WALLET', 'completed', '2026-04-17 22:08:27', '2026-05-02 22:08:27'),
(542, 'TXN-383', 383, 10, 33000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(543, 'TXN-388', 388, 10, 30000.00, 'WALLET', 'completed', '2026-01-07 22:08:27', '2026-05-02 22:08:27'),
(544, 'TXN-392', 392, 10, 31000.00, 'WALLET', 'completed', '2025-12-28 22:08:27', '2026-05-02 22:08:27'),
(545, 'TXN-394', 394, 10, 44000.00, 'WALLET', 'completed', '2026-04-03 22:08:27', '2026-05-02 22:08:27'),
(546, 'TXN-398', 398, 10, 25000.00, 'WALLET', 'completed', '2026-05-01 22:08:27', '2026-05-02 22:08:27'),
(547, 'TXN-399', 399, 10, 25000.00, 'WALLET', 'completed', '2026-04-20 22:08:27', '2026-05-02 22:08:27'),
(548, 'TXN-407', 407, 10, 41000.00, 'WALLET', 'completed', '2026-02-21 22:08:27', '2026-05-02 22:08:27'),
(549, 'TXN-412', 412, 10, 42000.00, 'WALLET', 'completed', '2026-01-15 22:08:27', '2026-05-02 22:08:27'),
(550, 'TXN-427', 427, 10, 41000.00, 'WALLET', 'completed', '2026-04-18 22:08:27', '2026-05-02 22:08:27'),
(551, 'TXN-434', 434, 10, 44000.00, 'WALLET', 'completed', '2026-04-22 22:08:27', '2026-05-02 22:08:27'),
(552, 'TXN-440', 440, 10, 35000.00, 'WALLET', 'completed', '2026-03-15 22:08:27', '2026-05-02 22:08:27'),
(553, 'TXN-441', 441, 10, 26000.00, 'WALLET', 'completed', '2026-04-17 22:08:27', '2026-05-02 22:08:27'),
(554, 'TXN-447', 447, 10, 44000.00, 'WALLET', 'completed', '2026-04-13 22:08:27', '2026-05-02 22:08:27'),
(555, 'TXN-450', 450, 10, 32000.00, 'WALLET', 'completed', '2026-05-02 22:08:27', '2026-05-02 22:08:27'),
(556, 'TXN-451', 451, 10, 36000.00, 'WALLET', 'completed', '2026-04-21 22:08:27', '2026-05-02 22:08:27'),
(557, 'TXN-454', 454, 10, 27000.00, 'WALLET', 'completed', '2026-01-03 22:08:27', '2026-05-02 22:08:27'),
(558, 'TXN-458', 458, 10, 42000.00, 'WALLET', 'completed', '2026-04-23 22:08:27', '2026-05-02 22:08:27'),
(559, 'TXN-469', 469, 10, 44000.00, 'WALLET', 'completed', '2026-02-28 22:08:27', '2026-05-02 22:08:27'),
(560, 'TXN-478', 478, 10, 44000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(561, 'TXN-480', 480, 10, 25000.00, 'WALLET', 'completed', '2026-02-25 22:08:27', '2026-05-02 22:08:27'),
(562, 'TXN-496', 496, 10, 36000.00, 'WALLET', 'completed', '2026-04-16 22:08:27', '2026-05-02 22:08:27'),
(563, 'TXN-512', 512, 10, 38000.00, 'WALLET', 'completed', '2026-04-15 22:08:27', '2026-05-02 22:08:27'),
(564, 'TXN-515', 515, 10, 28000.00, 'WALLET', 'completed', '2026-04-19 22:08:27', '2026-05-02 22:08:27'),
(565, 'TXN-518', 518, 10, 43000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(566, 'TXN-520', 520, 10, 32000.00, 'WALLET', 'completed', '2026-04-11 22:08:27', '2026-05-02 22:08:27'),
(567, 'TXN-524', 524, 10, 27000.00, 'WALLET', 'completed', '2026-04-24 22:08:27', '2026-05-02 22:08:27'),
(568, 'TXN-532', 532, 10, 41000.00, 'WALLET', 'completed', '2026-03-29 22:08:27', '2026-05-02 22:08:27'),
(569, 'TXN-538', 538, 10, 28000.00, 'WALLET', 'completed', '2026-04-27 22:08:27', '2026-05-02 22:08:27'),
(570, 'TXN-541', 541, 10, 25000.00, 'WALLET', 'completed', '2026-04-29 22:08:27', '2026-05-02 22:08:27'),
(571, 'TXN-564', 564, 10, 33000.00, 'WALLET', 'completed', '2026-02-02 22:08:27', '2026-05-02 22:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `name`, `description`) VALUES
(1, 'admin', 'Quản trị', NULL),
(2, 'dispatcher', 'Điều phối', NULL),
(3, 'driver', 'Tài xế', NULL),
(4, 'customer', 'Khách hàng', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int NOT NULL,
  `tracking_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `sender_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_kg` decimal(8,2) DEFAULT NULL,
  `cod_amount` decimal(12,2) DEFAULT '0.00',
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `payment_method` enum('COD','MOMO','WALLET') COLLATE utf8mb4_unicode_ci DEFAULT 'COD',
  `status` enum('pending','assigned','picking','delivering','delivered','failed','completed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `failure_note` text COLLATE utf8mb4_unicode_ci,
  `fail_count` tinyint DEFAULT '0',
  `scheduled_date` date DEFAULT NULL,
  `current_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pickup_lat` decimal(10,6) DEFAULT NULL,
  `pickup_lng` decimal(10,6) DEFAULT NULL,
  `delivery_lat` decimal(10,6) DEFAULT NULL,
  `delivery_lng` decimal(10,6) DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `pickup_option` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'sender',
  `service_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'standard',
  `region_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `tracking_code`, `customer_id`, `sender_name`, `sender_phone`, `receiver_name`, `receiver_phone`, `item_name`, `pickup_address`, `delivery_address`, `weight_kg`, `cod_amount`, `shipping_fee`, `payment_method`, `status`, `failure_note`, `fail_count`, `scheduled_date`, `current_location`, `created_at`, `updated_at`, `pickup_lat`, `pickup_lng`, `delivery_lat`, `delivery_lng`, `quantity`, `pickup_option`, `service_type`, `region_id`) VALUES
(1, 'DN-897640', 5, 'Mai Phương Thúy', '0427745274', 'Đỗ Mỹ Linh', '0237823065', 'Cáp sạc Type-C', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 100000.00, 50000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-04-19 22:08:25', '2026-05-02 22:08:25', 16.030099, 108.185751, 16.028320, 108.214665, 1, 'sender', 'standard', 'DN'),
(2, 'HN-897641', 5, 'Mai Phương Thúy', '0427745274', 'Lý Nhã Kỳ', '0399943674', 'Mỹ phẩm dưỡng da', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 440000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-10 22:08:25', '2026-05-02 22:08:25', 21.011672, 105.848196, 21.042197, 105.847199, 1, 'sender', 'standard', 'HN'),
(3, 'DN-897642', 5, 'Mai Phương Thúy', '0427745274', 'Mai Phương Thúy', '0108981638', 'Ốp lưng điện thoại', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 140000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-18 22:08:25', '2026-05-02 22:08:25', 16.040219, 108.196159, 16.043648, 108.209901, 1, 'sender', 'standard', 'DN'),
(4, 'DN-897643', 5, 'Mai Phương Thúy', '0427745274', 'Lý Nhã Kỳ', '0576319393', 'Tai nghe Bluetooth', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 270000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:25', '2026-05-02 22:08:25', 16.034901, 108.229164, 16.051152, 108.213718, 1, 'sender', 'standard', 'DN'),
(5, 'DN-897644', 5, 'Mai Phương Thúy', '0427745274', 'Hồ Ngọc Hà', '0341365738', 'Quần áo trẻ em', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 420000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 16.042707, 108.219021, 16.060598, 108.214474, 1, 'sender', 'standard', 'DN'),
(6, 'DN-897645', 5, 'Mai Phương Thúy', '0427745274', 'Phạm Hương', '0952461837', 'Vợt cầu lông', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 430000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-21 22:08:25', '2026-05-02 22:08:25', 16.069234, 108.226438, 16.063569, 108.224289, 1, 'sender', 'standard', 'DN'),
(7, 'HCM-897646', 5, 'Mai Phương Thúy', '0427745274', 'Nguyễn Thúc Thùy Tiên', '0930713453', 'Vợt cầu lông', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 'Bến Lức, Long An', 2.50, 470000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-19 22:08:25', '2026-05-02 22:08:25', 10.830241, 106.627972, 10.819859, 106.636157, 1, 'sender', 'standard', 'HCM'),
(8, 'DN-897647', 5, 'Mai Phương Thúy', '0427745274', 'Đỗ Mỹ Linh', '0392972910', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 280000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2025-12-24 22:08:25', '2026-05-02 22:08:25', 16.062945, 108.186201, 16.064956, 108.229936, 1, 'sender', 'standard', 'DN'),
(9, 'DN-897648', 5, 'Mai Phương Thúy', '0427745274', 'Hồ Ngọc Hà', '0198101483', 'Tai nghe Bluetooth', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'KCN Điện Nam, Quảng Nam', 2.50, 310000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:25', '2026-05-02 22:08:25', 16.029905, 108.205842, 16.029929, 108.197802, 1, 'sender', 'standard', 'DN'),
(10, 'DN-897649', 5, 'Mai Phương Thúy', '0427745274', 'Đỗ Mỹ Linh', '0707793775', 'Cáp sạc Type-C', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 'KCN Điện Nam, Quảng Nam', 2.50, 380000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 16.065941, 108.210124, 16.032709, 108.221513, 1, 'sender', 'standard', 'DN'),
(11, 'HCM-897650', 5, 'Mai Phương Thúy', '0427745274', 'Phạm Hương', '0349000194', 'Vitamin Omega 3', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 20000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2025-12-25 22:08:25', '2026-05-02 22:08:25', 10.811350, 106.623719, 10.813041, 106.643527, 1, 'sender', 'standard', 'HCM'),
(12, 'HCM-897651', 5, 'Mai Phương Thúy', '0427745274', 'Mai Phương Thúy', '0549243637', 'Vợt cầu lông', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 330000.00, 30000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-02-17 22:08:25', '2026-05-02 22:08:25', 10.845447, 106.626947, 10.818870, 106.627744, 1, 'sender', 'standard', 'HCM'),
(13, 'HCM-897652', 5, 'Mai Phương Thúy', '0427745274', 'Phạm Hương', '0782539891', 'Mỹ phẩm dưỡng da', '789 CMT8, Tân Bình, TP.HCM', 'Bến Lức, Long An', 2.50, 300000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-04 22:08:25', '2026-05-02 22:08:25', 10.813220, 106.611818, 10.836955, 106.645398, 1, 'sender', 'standard', 'HCM'),
(14, 'DN-897653', 5, 'Mai Phương Thúy', '0427745274', 'Lý Nhã Kỳ', '0556045917', 'Mỹ phẩm dưỡng da', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 250000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-01-20 22:08:25', '2026-05-02 22:08:25', 16.049514, 108.210092, 16.070959, 108.221992, 1, 'sender', 'standard', 'DN'),
(15, 'HCM-897654', 5, 'Mai Phương Thúy', '0427745274', 'Phạm Hương', '0577207982', 'Tai nghe Bluetooth', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 120000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 10.841224, 106.613813, 10.803710, 106.651901, 1, 'sender', 'standard', 'HCM'),
(16, 'DN-897655', 5, 'Mai Phương Thúy', '0427745274', 'Hồ Ngọc Hà', '0936988716', 'Tai nghe Bluetooth', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'KCN Điện Nam, Quảng Nam', 2.50, 270000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-18 22:08:25', '2026-05-02 22:08:25', 16.063263, 108.203523, 16.038181, 108.203713, 1, 'sender', 'standard', 'DN'),
(17, 'HCM-897656', 5, 'Mai Phương Thúy', '0427745274', 'Phạm Hương', '0464252507', 'Laptop Dell', '789 CMT8, Tân Bình, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 370000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:25', 10.827362, 106.624026, 10.836125, 106.653157, 1, 'sender', 'standard', 'HCM'),
(18, 'HCM-897657', 5, 'Mai Phương Thúy', '0427745274', 'Đỗ Mỹ Linh', '0622750118', 'Vitamin Omega 3', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 110000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-15 22:08:25', '2026-05-02 22:08:25', 10.839348, 106.628419, 10.830561, 106.649790, 1, 'sender', 'standard', 'HCM'),
(19, 'DN-897658', 5, 'Mai Phương Thúy', '0427745274', 'Mai Phương Thúy', '0754072226', 'Vitamin Omega 3', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 240000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:25', '2026-05-02 22:08:25', 16.040913, 108.224474, 16.034864, 108.204180, 1, 'sender', 'standard', 'DN'),
(20, 'HCM-897659', 5, 'Mai Phương Thúy', '0427745274', 'Nguyễn Thúc Thùy Tiên', '0554603050', 'Vợt cầu lông', '11 Lê Duẩn, Quận 1, TP.HCM', 'Bến Lức, Long An', 2.50, 400000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-20 22:08:25', '2026-05-02 22:08:25', 10.847558, 106.635262, 10.845981, 106.621132, 1, 'sender', 'standard', 'HCM'),
(21, 'HN-897660', 6, 'Lý Nhã Kỳ', '0265919622', 'Hồ Ngọc Hà', '0146377438', 'Tai nghe Bluetooth', '12 Thái Hà, Đống Đa, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 250000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:25', '2026-05-02 22:08:25', 21.029036, 105.849647, 21.008241, 105.877424, 1, 'sender', 'standard', 'HN'),
(22, 'HN-897661', 6, 'Lý Nhã Kỳ', '0265919622', 'Lý Nhã Kỳ', '0572506345', 'Quần áo trẻ em', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 310000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-23 22:08:25', '2026-05-02 22:08:25', 21.034007, 105.875329, 21.033890, 105.852794, 1, 'sender', 'standard', 'HN'),
(23, 'DN-897662', 6, 'Lý Nhã Kỳ', '0265919622', 'Nguyễn Thúc Thùy Tiên', '0696333936', 'Laptop Dell', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 80000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 16.070667, 108.218194, 16.069813, 108.219021, 1, 'sender', 'standard', 'DN'),
(24, 'HCM-897663', 6, 'Lý Nhã Kỳ', '0265919622', 'Mai Phương Thúy', '0983980941', 'Sách tiểu thuyết', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 300000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-26 22:08:25', '2026-05-02 22:08:25', 10.824248, 106.605083, 10.798485, 106.634614, 1, 'sender', 'standard', 'HCM'),
(25, 'HCM-897664', 6, 'Lý Nhã Kỳ', '0265919622', 'Đỗ Mỹ Linh', '0822455354', 'Tai nghe Bluetooth', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 410000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:25', '2026-05-02 22:08:25', 10.810716, 106.611591, 10.836206, 106.653918, 1, 'sender', 'standard', 'HCM'),
(26, 'DN-897665', 6, 'Lý Nhã Kỳ', '0265919622', 'Nguyễn Thúc Thùy Tiên', '0100340675', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 340000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:25', '2026-05-02 22:08:25', 16.066356, 108.200951, 16.039530, 108.185012, 1, 'sender', 'standard', 'DN'),
(27, 'DN-897666', 6, 'Lý Nhã Kỳ', '0265919622', 'Mai Phương Thúy', '0119801379', 'Quần áo trẻ em', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 90000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-11 22:08:25', '2026-05-02 22:08:25', 16.043169, 108.183540, 16.044034, 108.205773, 1, 'sender', 'standard', 'DN'),
(28, 'DN-897667', 6, 'Lý Nhã Kỳ', '0265919622', 'Lý Nhã Kỳ', '0328962939', 'Vitamin Omega 3', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'KCN Điện Nam, Quảng Nam', 2.50, 380000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 22:08:25', 16.059036, 108.223941, 16.043548, 108.231143, 1, 'sender', 'standard', 'DN'),
(29, 'HN-897668', 6, 'Lý Nhã Kỳ', '0265919622', 'Hồ Ngọc Hà', '0625935237', 'Ốp lưng điện thoại', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 50000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-22 22:08:25', '2026-05-02 22:08:25', 21.045951, 105.861652, 21.045251, 105.875981, 1, 'sender', 'standard', 'HN'),
(30, 'HCM-897669', 6, 'Lý Nhã Kỳ', '0265919622', 'Lý Nhã Kỳ', '0119018900', 'Mỹ phẩm dưỡng da', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 420000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-19 22:08:25', '2026-05-02 22:08:25', 10.817745, 106.621557, 10.821242, 106.643798, 1, 'sender', 'standard', 'HCM'),
(31, 'HN-897670', 6, 'Lý Nhã Kỳ', '0265919622', 'Hồ Ngọc Hà', '0207111425', 'Mỹ phẩm dưỡng da', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 60000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-26 22:08:25', '2026-05-02 22:08:25', 21.033878, 105.853781, 21.028348, 105.843114, 1, 'sender', 'standard', 'HN'),
(32, 'HN-897671', 6, 'Lý Nhã Kỳ', '0265919622', 'Nguyễn Thúc Thùy Tiên', '0363797991', 'Ốp lưng điện thoại', '12 Thái Hà, Đống Đa, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 210000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-25 22:08:25', '2026-05-02 22:08:25', 21.031946, 105.840485, 21.029961, 105.866598, 1, 'sender', 'standard', 'HN'),
(33, 'HN-897672', 6, 'Lý Nhã Kỳ', '0265919622', 'Lý Nhã Kỳ', '0625879535', 'Laptop Dell', '12 Thái Hà, Đống Đa, Hà Nội', 'KCN Yên Phong, Bắc Ninh', 2.50, 170000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-25 22:08:25', '2026-05-02 22:08:25', 21.022984, 105.839541, 21.020212, 105.852298, 1, 'sender', 'standard', 'HN'),
(34, 'DN-897673', 6, 'Lý Nhã Kỳ', '0265919622', 'Hồ Ngọc Hà', '0861278257', 'Laptop Dell', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 190000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 22:08:25', 16.023392, 108.225175, 16.048607, 108.198140, 1, 'sender', 'standard', 'DN'),
(35, 'HN-897674', 6, 'Lý Nhã Kỳ', '0265919622', 'Hồ Ngọc Hà', '0698991568', 'Cáp sạc Type-C', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 220000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-12 22:08:25', '2026-05-02 22:08:25', 21.009291, 105.850883, 21.027117, 105.839011, 1, 'sender', 'standard', 'HN'),
(36, 'DN-897675', 6, 'Lý Nhã Kỳ', '0265919622', 'Phạm Hương', '0346961397', 'Tai nghe Bluetooth', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 80000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:25', '2026-05-02 22:08:25', 16.056040, 108.185637, 16.056942, 108.190490, 1, 'sender', 'standard', 'DN'),
(37, 'HCM-897676', 6, 'Lý Nhã Kỳ', '0265919622', 'Mai Phương Thúy', '0460867699', 'Ốp lưng điện thoại', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 470000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-04 22:08:25', '2026-05-02 22:08:25', 10.832039, 106.639745, 10.811754, 106.637690, 1, 'sender', 'standard', 'HCM'),
(38, 'HCM-897677', 6, 'Lý Nhã Kỳ', '0265919622', 'Hồ Ngọc Hà', '0849307435', 'Quần áo trẻ em', '789 CMT8, Tân Bình, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 150000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-18 22:08:25', '2026-05-02 22:08:25', 10.831115, 106.612955, 10.818733, 106.612623, 1, 'sender', 'standard', 'HCM'),
(39, 'DN-897678', 6, 'Lý Nhã Kỳ', '0265919622', 'Lý Nhã Kỳ', '0309195239', 'Mỹ phẩm dưỡng da', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 240000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-08 22:08:25', '2026-05-02 22:08:25', 16.048992, 108.188996, 16.049796, 108.193367, 1, 'sender', 'standard', 'DN'),
(40, 'DN-897679', 6, 'Lý Nhã Kỳ', '0265919622', 'Đỗ Mỹ Linh', '0631915846', 'Sách tiểu thuyết', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 170000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:25', '2026-05-02 22:08:25', 16.069599, 108.220030, 16.023841, 108.218567, 1, 'sender', 'standard', 'DN'),
(41, 'HCM-897680', 7, 'Hồ Ngọc Hà', '0784330191', 'Phạm Hương', '0345633843', 'Tai nghe Bluetooth', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 100000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-24 22:08:26', '2026-05-02 22:08:26', 10.832196, 106.623883, 10.838851, 106.623588, 1, 'sender', 'standard', 'HCM'),
(42, 'HN-897681', 7, 'Hồ Ngọc Hà', '0784330191', 'Nguyễn Thúc Thùy Tiên', '0120836373', 'Vitamin Omega 3', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 340000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 21.043697, 105.861919, 21.014068, 105.844202, 1, 'sender', 'standard', 'HN'),
(43, 'HCM-897682', 7, 'Hồ Ngọc Hà', '0784330191', 'Lý Nhã Kỳ', '0241560012', 'Ốp lưng điện thoại', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'KCN VSIP, Bình Dương', 2.50, 240000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 10.821266, 106.609404, 10.817012, 106.607522, 1, 'sender', 'standard', 'HCM'),
(44, 'HCM-897683', 7, 'Hồ Ngọc Hà', '0784330191', 'Phạm Hương', '0576101711', 'Tai nghe Bluetooth', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 80000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-01 22:08:26', '2026-05-02 22:08:26', 10.845133, 106.615622, 10.811849, 106.633283, 1, 'sender', 'standard', 'HCM'),
(45, 'HN-897684', 7, 'Hồ Ngọc Hà', '0784330191', 'Mai Phương Thúy', '0157310290', 'Vợt cầu lông', '12 Thái Hà, Đống Đa, Hà Nội', 'KCN Yên Phong, Bắc Ninh', 2.50, 200000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 21.005846, 105.878812, 21.030409, 105.836075, 1, 'sender', 'standard', 'HN'),
(46, 'HCM-897685', 7, 'Hồ Ngọc Hà', '0784330191', 'Mai Phương Thúy', '0168738362', 'Quần áo trẻ em', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 380000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 10.816421, 106.654245, 10.824118, 106.614427, 1, 'sender', 'standard', 'HCM'),
(47, 'HN-897686', 7, 'Hồ Ngọc Hà', '0784330191', 'Mai Phương Thúy', '0353258234', 'Vitamin Omega 3', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 360000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 21.029091, 105.829475, 21.014539, 105.832324, 1, 'sender', 'standard', 'HN'),
(48, 'HN-897687', 7, 'Hồ Ngọc Hà', '0784330191', 'Hồ Ngọc Hà', '0151720671', 'Mỹ phẩm dưỡng da', '45 Cầu Giấy, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 70000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-02 22:08:26', '2026-05-02 22:08:26', 21.020838, 105.861512, 21.040586, 105.874098, 1, 'sender', 'standard', 'HN'),
(49, 'HN-897688', 7, 'Hồ Ngọc Hà', '0784330191', 'Đỗ Mỹ Linh', '0414343426', 'Ốp lưng điện thoại', '12 Thái Hà, Đống Đa, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 430000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-03-05 22:08:26', '2026-05-02 22:08:26', 21.018615, 105.872517, 21.052079, 105.854077, 1, 'sender', 'standard', 'HN'),
(50, 'DN-897689', 7, 'Hồ Ngọc Hà', '0784330191', 'Nguyễn Thúc Thùy Tiên', '0643340926', 'Ốp lưng điện thoại', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 100000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.063768, 108.201146, 16.027155, 108.195163, 1, 'sender', 'standard', 'DN'),
(51, 'HN-897690', 7, 'Hồ Ngọc Hà', '0784330191', 'Hồ Ngọc Hà', '0741104744', 'Ốp lưng điện thoại', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 480000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 21.033552, 105.842944, 21.039550, 105.844129, 1, 'sender', 'standard', 'HN'),
(52, 'HCM-897691', 7, 'Hồ Ngọc Hà', '0784330191', 'Hồ Ngọc Hà', '0557115388', 'Quần áo trẻ em', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 410000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-23 22:08:26', '2026-05-02 22:08:26', 10.814280, 106.641158, 10.843457, 106.649692, 1, 'sender', 'standard', 'HCM'),
(53, 'HCM-897692', 7, 'Hồ Ngọc Hà', '0784330191', 'Nguyễn Thúc Thùy Tiên', '0103919004', 'Vợt cầu lông', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 'KCN Amata, Đồng Nai', 2.50, 190000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-13 22:08:26', '2026-05-02 22:08:26', 10.798602, 106.651407, 10.810794, 106.616682, 1, 'sender', 'standard', 'HCM'),
(54, 'DN-897693', 7, 'Hồ Ngọc Hà', '0784330191', 'Nguyễn Thúc Thùy Tiên', '0608792545', 'Tai nghe Bluetooth', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 'KCN Điện Nam, Quảng Nam', 2.50, 450000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-02-08 22:08:26', '2026-05-02 22:08:26', 16.059454, 108.203465, 16.053710, 108.220448, 1, 'sender', 'standard', 'DN'),
(55, 'HCM-897694', 7, 'Hồ Ngọc Hà', '0784330191', 'Nguyễn Thúc Thùy Tiên', '0602538868', 'Tai nghe Bluetooth', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 360000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-19 22:08:26', '2026-05-02 22:08:26', 10.829785, 106.625916, 10.838493, 106.647987, 1, 'sender', 'standard', 'HCM'),
(56, 'DN-897695', 7, 'Hồ Ngọc Hà', '0784330191', 'Hồ Ngọc Hà', '0978162497', 'Laptop Dell', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 190000.00, 20000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.025438, 108.206578, 16.029517, 108.222972, 1, 'sender', 'standard', 'DN'),
(57, 'HCM-897696', 7, 'Hồ Ngọc Hà', '0784330191', 'Phạm Hương', '0584716983', 'Ốp lưng điện thoại', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'KCN Amata, Đồng Nai', 2.50, 400000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-15 22:08:26', '2026-05-02 22:08:26', 10.812874, 106.617962, 10.835476, 106.650275, 1, 'sender', 'standard', 'HCM'),
(58, 'DN-897697', 7, 'Hồ Ngọc Hà', '0784330191', 'Nguyễn Thúc Thùy Tiên', '0926691431', 'Cáp sạc Type-C', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 390000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-01 22:08:26', '2026-05-02 22:08:26', 16.063296, 108.195705, 16.070056, 108.211883, 1, 'sender', 'standard', 'DN'),
(59, 'HCM-897698', 7, 'Hồ Ngọc Hà', '0784330191', 'Hồ Ngọc Hà', '0825876127', 'Laptop Dell', '11 Lê Duẩn, Quận 1, TP.HCM', 'Bến Lức, Long An', 2.50, 110000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-18 22:08:26', '2026-05-02 22:08:26', 10.819488, 106.615674, 10.801987, 106.633648, 1, 'sender', 'standard', 'HCM'),
(60, 'HN-897699', 7, 'Hồ Ngọc Hà', '0784330191', 'Hồ Ngọc Hà', '0109951460', 'Ốp lưng điện thoại', '45 Cầu Giấy, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 410000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 21.013786, 105.857370, 21.007548, 105.860607, 1, 'sender', 'standard', 'HN'),
(61, 'HCM-897700', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Phạm Hương', '0171515462', 'Vợt cầu lông', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 10000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:26', '2026-05-02 22:08:26', 10.815904, 106.652206, 10.821329, 106.610526, 1, 'sender', 'standard', 'HCM'),
(62, 'HCM-897701', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Phạm Hương', '0974267873', 'Ốp lưng điện thoại', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 350000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-04 22:08:26', '2026-05-02 22:08:26', 10.798202, 106.612277, 10.826971, 106.652205, 1, 'sender', 'standard', 'HCM'),
(63, 'HN-897702', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Mai Phương Thúy', '0285223768', 'Ốp lưng điện thoại', '12 Thái Hà, Đống Đa, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 240000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 21.029317, 105.844327, 21.026136, 105.852733, 1, 'sender', 'standard', 'HN'),
(64, 'HN-897703', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Hồ Ngọc Hà', '0571932576', 'Tai nghe Bluetooth', '45 Cầu Giấy, Hà Nội', 'KCN Yên Phong, Bắc Ninh', 2.50, 280000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 21.021574, 105.837468, 21.043612, 105.845081, 1, 'sender', 'standard', 'HN'),
(65, 'DN-897704', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Lý Nhã Kỳ', '0653105221', 'Vitamin Omega 3', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 80000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-23 22:08:26', '2026-05-02 22:08:26', 16.040178, 108.197900, 16.058195, 108.214597, 1, 'sender', 'standard', 'DN'),
(66, 'HCM-897705', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Đỗ Mỹ Linh', '0219329754', 'Tai nghe Bluetooth', '11 Lê Duẩn, Quận 1, TP.HCM', 'KCN Amata, Đồng Nai', 2.50, 0.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-01 22:08:26', '2026-05-02 22:08:26', 10.840108, 106.626343, 10.814412, 106.632053, 1, 'sender', 'standard', 'HCM'),
(67, 'HCM-897706', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Mai Phương Thúy', '0892788922', 'Vợt cầu lông', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 'KCN Amata, Đồng Nai', 2.50, 270000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2025-12-31 22:08:26', '2026-05-02 22:08:26', 10.801560, 106.647649, 10.841365, 106.611937, 1, 'sender', 'standard', 'HCM'),
(68, 'HCM-897707', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Lý Nhã Kỳ', '0181487734', 'Tai nghe Bluetooth', '11 Lê Duẩn, Quận 1, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 390000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-03-19 22:08:26', '2026-05-02 22:08:26', 10.839275, 106.638956, 10.818455, 106.637152, 1, 'sender', 'standard', 'HCM'),
(69, 'HCM-897708', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Nguyễn Thúc Thùy Tiên', '0446517108', 'Ốp lưng điện thoại', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 480000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:26', '2026-05-02 22:08:26', 10.838705, 106.652910, 10.838365, 106.627383, 1, 'sender', 'standard', 'HCM'),
(70, 'HN-897709', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Đỗ Mỹ Linh', '0490019484', 'Sách tiểu thuyết', '12 Thái Hà, Đống Đa, Hà Nội', 'Khu Ecopark, Hưng Yên', 2.50, 80000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 21.046663, 105.862752, 21.026623, 105.856690, 1, 'sender', 'standard', 'HN'),
(71, 'HCM-897710', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Hồ Ngọc Hà', '0648256570', 'Mỹ phẩm dưỡng da', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 290000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-05 22:08:26', '2026-05-02 22:08:26', 10.809147, 106.642900, 10.839432, 106.644520, 1, 'sender', 'standard', 'HCM'),
(72, 'HCM-897711', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Đỗ Mỹ Linh', '0296200475', 'Sách tiểu thuyết', '11 Lê Duẩn, Quận 1, TP.HCM', 'KCN VSIP, Bình Dương', 2.50, 140000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 10.827789, 106.622763, 10.813086, 106.624928, 1, 'sender', 'standard', 'HCM'),
(73, 'HN-897712', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Lý Nhã Kỳ', '0425525543', 'Vitamin Omega 3', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 420000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 21.044634, 105.859911, 21.037564, 105.834710, 1, 'sender', 'standard', 'HN'),
(74, 'HCM-897713', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Phạm Hương', '0260927948', 'Vợt cầu lông', '789 CMT8, Tân Bình, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 260000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 10.799386, 106.642170, 10.801580, 106.624882, 1, 'sender', 'standard', 'HCM'),
(75, 'DN-897714', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Mai Phương Thúy', '0715860906', 'Tai nghe Bluetooth', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 120000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-03 22:08:26', '2026-05-02 22:08:26', 16.037515, 108.201925, 16.022475, 108.182489, 1, 'sender', 'standard', 'DN'),
(76, 'HCM-897715', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Hồ Ngọc Hà', '0613004350', 'Mỹ phẩm dưỡng da', '11 Lê Duẩn, Quận 1, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 340000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-01-09 22:08:26', '2026-05-02 22:08:26', 10.815856, 106.645338, 10.806698, 106.628750, 1, 'sender', 'standard', 'HCM'),
(77, 'HCM-897716', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Mai Phương Thúy', '0654989899', 'Vitamin Omega 3', '789 CMT8, Tân Bình, TP.HCM', 'KCN Amata, Đồng Nai', 2.50, 400000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-02 22:08:26', '2026-05-02 22:08:26', 10.816619, 106.606367, 10.818110, 106.610239, 1, 'sender', 'standard', 'HCM'),
(78, 'HCM-897717', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Nguyễn Thúc Thùy Tiên', '0933608836', 'Quần áo trẻ em', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 330000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-31 22:08:26', '2026-05-02 22:08:26', 10.817838, 106.628599, 10.808863, 106.607923, 1, 'sender', 'standard', 'HCM'),
(79, 'DN-897718', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Đỗ Mỹ Linh', '0153484746', 'Mỹ phẩm dưỡng da', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 290000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-16 22:08:26', '2026-05-02 22:08:26', 16.028206, 108.202356, 16.044921, 108.187513, 1, 'sender', 'standard', 'DN'),
(80, 'HCM-897719', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Hồ Ngọc Hà', '0707633697', 'Mỹ phẩm dưỡng da', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 460000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 10.826340, 106.610356, 10.818617, 106.641570, 1, 'sender', 'standard', 'HCM'),
(81, 'DN-897720', 9, 'Đỗ Mỹ Linh', '0923617686', 'Mai Phương Thúy', '0486708747', 'Vợt cầu lông', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 20000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.024940, 108.188594, 16.025374, 108.207431, 1, 'sender', 'standard', 'DN'),
(82, 'DN-897721', 9, 'Đỗ Mỹ Linh', '0923617686', 'Mai Phương Thúy', '0429445321', 'Ốp lưng điện thoại', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 50000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-24 22:08:26', '2026-05-02 22:08:26', 16.050806, 108.200255, 16.023753, 108.194961, 1, 'sender', 'standard', 'DN'),
(83, 'HN-897722', 9, 'Đỗ Mỹ Linh', '0923617686', 'Mai Phương Thúy', '0884167027', 'Laptop Dell', '12 Thái Hà, Đống Đa, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 140000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-01-19 22:08:26', '2026-05-02 22:08:26', 21.050500, 105.862040, 21.042061, 105.844651, 1, 'sender', 'standard', 'HN'),
(84, 'HCM-897723', 9, 'Đỗ Mỹ Linh', '0923617686', 'Phạm Hương', '0370767213', 'Vitamin Omega 3', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 440000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2025-12-30 22:08:26', '2026-05-02 22:08:26', 10.835007, 106.650580, 10.808248, 106.640235, 1, 'sender', 'standard', 'HCM'),
(85, 'HCM-897724', 9, 'Đỗ Mỹ Linh', '0923617686', 'Phạm Hương', '0330063477', 'Cáp sạc Type-C', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 120000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 10.822937, 106.608490, 10.822300, 106.631201, 1, 'sender', 'standard', 'HCM'),
(86, 'DN-897725', 9, 'Đỗ Mỹ Linh', '0923617686', 'Đỗ Mỹ Linh', '0794209887', 'Vợt cầu lông', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 'KCN Điện Nam, Quảng Nam', 2.50, 210000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-01-22 22:08:26', '2026-05-02 22:08:26', 16.045363, 108.199786, 16.037537, 108.189792, 1, 'sender', 'standard', 'DN'),
(87, 'HCM-897726', 9, 'Đỗ Mỹ Linh', '0923617686', 'Hồ Ngọc Hà', '0312971127', 'Cáp sạc Type-C', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 10000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-26 22:08:26', '2026-05-02 22:08:26', 10.807742, 106.646405, 10.809384, 106.605472, 1, 'sender', 'standard', 'HCM'),
(88, 'HN-897727', 9, 'Đỗ Mỹ Linh', '0923617686', 'Phạm Hương', '0704153752', 'Vitamin Omega 3', '12 Thái Hà, Đống Đa, Hà Nội', 'KCN Yên Phong, Bắc Ninh', 2.50, 70000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 21.012988, 105.834230, 21.030889, 105.854444, 1, 'sender', 'standard', 'HN'),
(89, 'HN-897728', 9, 'Đỗ Mỹ Linh', '0923617686', 'Nguyễn Thúc Thùy Tiên', '0939997443', 'Sách tiểu thuyết', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 440000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-09 22:08:26', '2026-05-02 22:08:26', 21.027020, 105.834910, 21.035209, 105.867069, 1, 'sender', 'standard', 'HN'),
(90, 'HN-897729', 9, 'Đỗ Mỹ Linh', '0923617686', 'Phạm Hương', '0712013722', 'Vitamin Omega 3', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 480000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 21.046217, 105.870534, 21.040237, 105.853329, 1, 'sender', 'standard', 'HN'),
(91, 'HN-897730', 9, 'Đỗ Mỹ Linh', '0923617686', 'Hồ Ngọc Hà', '0597045145', 'Mỹ phẩm dưỡng da', '12 Thái Hà, Đống Đa, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 330000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 21.027344, 105.877599, 21.024237, 105.874720, 1, 'sender', 'standard', 'HN'),
(92, 'HCM-897731', 9, 'Đỗ Mỹ Linh', '0923617686', 'Đỗ Mỹ Linh', '0205979080', 'Vợt cầu lông', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 190000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:27', '2026-05-02 22:08:27', 10.847428, 106.641711, 10.844271, 106.631501, 1, 'sender', 'standard', 'HCM'),
(93, 'DN-897732', 9, 'Đỗ Mỹ Linh', '0923617686', 'Mai Phương Thúy', '0717912258', 'Mỹ phẩm dưỡng da', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 60000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 16.039320, 108.217444, 16.024676, 108.227803, 1, 'sender', 'standard', 'DN'),
(94, 'HN-897733', 9, 'Đỗ Mỹ Linh', '0923617686', 'Phạm Hương', '0747445772', 'Laptop Dell', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 230000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-28 22:08:27', '2026-05-02 22:08:27', 21.012508, 105.853595, 21.031689, 105.877270, 1, 'sender', 'standard', 'HN'),
(95, 'HCM-897734', 9, 'Đỗ Mỹ Linh', '0923617686', 'Mai Phương Thúy', '0164898267', 'Laptop Dell', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 390000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 10.812360, 106.619107, 10.814397, 106.641402, 1, 'sender', 'standard', 'HCM'),
(96, 'HN-897735', 9, 'Đỗ Mỹ Linh', '0923617686', 'Nguyễn Thúc Thùy Tiên', '0270899349', 'Quần áo trẻ em', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 20000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 21.044504, 105.850880, 21.027111, 105.867401, 1, 'sender', 'standard', 'HN'),
(97, 'DN-897736', 9, 'Đỗ Mỹ Linh', '0923617686', 'Mai Phương Thúy', '0406607718', 'Cáp sạc Type-C', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 210000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 16.054952, 108.192815, 16.047840, 108.219335, 1, 'sender', 'standard', 'DN'),
(98, 'HCM-897737', 9, 'Đỗ Mỹ Linh', '0923617686', 'Nguyễn Thúc Thùy Tiên', '0983712297', 'Quần áo trẻ em', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 30000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-26 22:08:27', '2026-05-02 22:08:27', 10.842824, 106.642753, 10.842907, 106.628460, 1, 'sender', 'standard', 'HCM'),
(99, 'HCM-897738', 9, 'Đỗ Mỹ Linh', '0923617686', 'Phạm Hương', '0292455128', 'Tai nghe Bluetooth', '789 CMT8, Tân Bình, TP.HCM', 'KCN VSIP, Bình Dương', 2.50, 10000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 10.813728, 106.624785, 10.837083, 106.639030, 1, 'sender', 'standard', 'HCM'),
(100, 'HCM-897739', 9, 'Đỗ Mỹ Linh', '0923617686', 'Nguyễn Thúc Thùy Tiên', '0378506696', 'Vitamin Omega 3', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 410000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-21 22:08:27', '2026-05-02 22:08:27', 10.834225, 106.607585, 10.828628, 106.648645, 1, 'sender', 'standard', 'HCM'),
(101, 'DN-897740', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0159094160', 'Cáp sạc Type-C', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 30000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-07 22:08:27', '2026-05-02 22:08:27', 16.023491, 108.231027, 16.045036, 108.196223, 1, 'sender', 'standard', 'DN'),
(102, 'HN-897741', 10, 'Phạm Hương', '0422886964', 'Nguyễn Thúc Thùy Tiên', '0940697228', 'Cáp sạc Type-C', '12 Thái Hà, Đống Đa, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 10000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-25 22:08:27', '2026-05-02 22:08:27', 21.028654, 105.847506, 21.019312, 105.859447, 1, 'sender', 'standard', 'HN'),
(103, 'HN-897742', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0541741307', 'Vitamin Omega 3', '45 Cầu Giấy, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 210000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-22 22:08:27', '2026-05-02 22:08:27', 21.040262, 105.857231, 21.050494, 105.865464, 1, 'sender', 'standard', 'HN'),
(104, 'DN-897743', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0673152949', 'Tai nghe Bluetooth', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 'Phố cổ Hội An, Quảng Nam', 2.50, 410000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-02 22:08:27', '2026-05-02 22:08:27', 16.036175, 108.214803, 16.044459, 108.223005, 1, 'sender', 'standard', 'DN'),
(105, 'HN-897744', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0145203612', 'Quần áo trẻ em', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 20000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-28 22:08:27', '2026-05-02 22:08:27', 21.033663, 105.873801, 21.011889, 105.854454, 1, 'sender', 'standard', 'HN'),
(106, 'HN-897745', 10, 'Phạm Hương', '0422886964', 'Đỗ Mỹ Linh', '0375269564', 'Vợt cầu lông', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 'KCN Yên Phong, Bắc Ninh', 2.50, 140000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 21.035721, 105.869559, 21.026885, 105.856752, 1, 'sender', 'standard', 'HN'),
(107, 'HN-897746', 10, 'Phạm Hương', '0422886964', 'Mai Phương Thúy', '0360663642', 'Quần áo trẻ em', '45 Cầu Giấy, Hà Nội', 'Khu Ecopark, Hưng Yên', 2.50, 430000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-31 22:08:27', '2026-05-02 22:08:27', 21.030097, 105.831176, 21.032577, 105.876568, 1, 'sender', 'standard', 'HN'),
(108, 'DN-897747', 10, 'Phạm Hương', '0422886964', 'Mai Phương Thúy', '0647778059', 'Laptop Dell', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 0.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-27 22:08:27', '2026-05-02 22:08:27', 16.031469, 108.230207, 16.068903, 108.186583, 1, 'sender', 'standard', 'DN'),
(109, 'HCM-897748', 10, 'Phạm Hương', '0422886964', 'Lý Nhã Kỳ', '0813683727', 'Sách tiểu thuyết', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 270000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-02 22:08:27', '2026-05-02 22:08:27', 10.825291, 106.619809, 10.835159, 106.629263, 1, 'sender', 'standard', 'HCM'),
(110, 'HCM-897749', 10, 'Phạm Hương', '0422886964', 'Nguyễn Thúc Thùy Tiên', '0494954210', 'Cáp sạc Type-C', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 'KCN VSIP, Bình Dương', 2.50, 300000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-03 22:08:27', '2026-05-02 22:08:27', 10.812839, 106.637403, 10.809672, 106.609203, 1, 'sender', 'standard', 'HCM'),
(111, 'HCM-897750', 10, 'Phạm Hương', '0422886964', 'Đỗ Mỹ Linh', '0602530681', 'Ốp lưng điện thoại', '11 Lê Duẩn, Quận 1, TP.HCM', 'Bến Lức, Long An', 2.50, 410000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 10.846659, 106.610315, 10.809303, 106.621346, 1, 'sender', 'standard', 'HCM'),
(112, 'HCM-897751', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0179048009', 'Vợt cầu lông', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 340000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-01 22:08:27', '2026-05-02 22:08:27', 10.821110, 106.652605, 10.799199, 106.636194, 1, 'sender', 'standard', 'HCM'),
(113, 'HN-897752', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0100686065', 'Sách tiểu thuyết', '45 Cầu Giấy, Hà Nội', 'KCN Từ Sơn, Bắc Ninh', 2.50, 220000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 21.010783, 105.877163, 21.040349, 105.863209, 1, 'sender', 'standard', 'HN'),
(114, 'HCM-897753', 10, 'Phạm Hương', '0422886964', 'Phạm Hương', '0234228680', 'Cáp sạc Type-C', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'KCN VSIP, Bình Dương', 2.50, 480000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-28 22:08:27', '2026-05-02 22:08:27', 10.824539, 106.615103, 10.798825, 106.606260, 1, 'sender', 'standard', 'HCM'),
(115, 'HCM-897754', 10, 'Phạm Hương', '0422886964', 'Nguyễn Thúc Thùy Tiên', '0968462511', 'Quần áo trẻ em', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 350000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-23 22:08:27', '2026-05-02 22:08:27', 10.799027, 106.635269, 10.806500, 106.615488, 1, 'sender', 'standard', 'HCM'),
(116, 'HN-897755', 10, 'Phạm Hương', '0422886964', 'Lý Nhã Kỳ', '0718941019', 'Vitamin Omega 3', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 20000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-09 22:08:27', '2026-05-02 22:08:27', 21.025671, 105.842999, 21.019539, 105.833475, 1, 'sender', 'standard', 'HN'),
(117, 'DN-897756', 10, 'Phạm Hương', '0422886964', 'Hồ Ngọc Hà', '0960233312', 'Laptop Dell', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 110000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-28 22:08:27', '2026-05-02 22:08:27', 16.033225, 108.222623, 16.053869, 108.230095, 1, 'sender', 'standard', 'DN'),
(118, 'DN-897757', 10, 'Phạm Hương', '0422886964', 'Hồ Ngọc Hà', '0915633418', 'Tai nghe Bluetooth', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 130000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:27', '2026-05-02 22:08:27', 16.031135, 108.190887, 16.062687, 108.207285, 1, 'sender', 'standard', 'DN'),
(119, 'HN-897758', 10, 'Phạm Hương', '0422886964', 'Nguyễn Thúc Thùy Tiên', '0336024288', 'Ốp lưng điện thoại', '12 Thái Hà, Đống Đa, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 360000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-29 22:08:27', '2026-05-02 22:08:27', 21.034358, 105.834189, 21.048458, 105.860760, 1, 'sender', 'standard', 'HN'),
(120, 'HCM-897759', 10, 'Phạm Hương', '0422886964', 'Hồ Ngọc Hà', '0785468490', 'Quần áo trẻ em', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 70000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 10.815696, 106.645835, 10.811551, 106.620026, 1, 'sender', 'standard', 'HCM'),
(121, 'HN-782924', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 0', '0666757998', 'Vitamin Omega 3', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 310000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-13 22:08:27', '2026-05-02 22:08:27', 21.029537, 105.835700, 21.038244, 105.851336, 1, 'sender', 'fast', 'HN'),
(122, 'DN-782925', 10, 'Phạm Hương', '0422886964', 'Khách nhận 1', '0176900236', 'Laptop Dell', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 70000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-18 22:08:27', '2026-05-02 22:08:27', 16.048686, 108.190667, 16.064446, 108.191488, 1, 'sender', 'standard', 'DN'),
(123, 'DN-782926', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 2', '0822457789', 'Mỹ phẩm dưỡng da', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 200000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:26', '2026-05-02 22:08:26', 16.055327, 108.206976, 16.066937, 108.183349, 1, 'sender', 'fast', 'DN'),
(124, 'DN-782927', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 3', '0408523375', 'Mỹ phẩm dưỡng da', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 350000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 16.068288, 108.201309, 16.069982, 108.194955, 1, 'sender', 'fast', 'DN'),
(125, 'DN-782928', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 4', '0816939356', 'Ốp lưng điện thoại', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 0.00, 50000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 16.035933, 108.222845, 16.022363, 108.197320, 1, 'sender', 'fast', 'DN'),
(126, 'DN-782929', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 5', '0543394324', 'Mỹ phẩm dưỡng da', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 370000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.060440, 108.184644, 16.065332, 108.210975, 1, 'sender', 'standard', 'DN'),
(127, 'HN-782930', 10, 'Phạm Hương', '0422886964', 'Khách nhận 6', '0169411373', 'Cáp sạc Type-C', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 110000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-19 22:08:27', '2026-05-02 22:08:27', 21.019634, 105.841573, 21.016617, 105.853053, 1, 'sender', 'standard', 'HN'),
(128, 'HCM-782931', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 7', '0973110746', 'Ốp lưng điện thoại', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 180000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 10.827904, 106.645979, 10.818826, 106.623215, 1, 'sender', 'fast', 'HCM'),
(129, 'DN-782932', 10, 'Phạm Hương', '0422886964', 'Khách nhận 8', '0454407788', 'Cáp sạc Type-C', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 240000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-19 22:08:27', '2026-05-02 22:08:27', 16.043903, 108.220844, 16.054392, 108.198360, 1, 'sender', 'standard', 'DN'),
(130, 'HCM-782933', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 9', '0464135830', 'Vitamin Omega 3', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 330000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:25', '2026-05-02 22:08:25', 10.845796, 106.652035, 10.839879, 106.629167, 1, 'sender', 'fast', 'HCM'),
(131, 'HN-782934', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 10', '0743345949', 'Vợt cầu lông', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 490000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-19 22:08:26', '2026-05-02 22:08:26', 21.029836, 105.835258, 21.009354, 105.868436, 1, 'sender', 'standard', 'HN'),
(132, 'HCM-782935', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 11', '0229517204', 'Cáp sạc Type-C', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 440000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-22 22:08:25', '2026-05-02 22:08:25', 10.801815, 106.627196, 10.799588, 106.635427, 1, 'sender', 'fast', 'HCM'),
(133, 'DN-782936', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 12', '0771102257', 'Laptop Dell', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 70000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-22 22:08:25', '2026-05-02 22:08:25', 16.036759, 108.192495, 16.036078, 108.228871, 1, 'sender', 'standard', 'DN'),
(134, 'DN-782937', 10, 'Phạm Hương', '0422886964', 'Khách nhận 13', '0366194278', 'Laptop Dell', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 190000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:27', '2026-05-02 22:08:27', 16.031669, 108.230956, 16.026267, 108.213705, 1, 'sender', 'standard', 'DN'),
(135, 'DN-782938', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 14', '0242751292', 'Mỹ phẩm dưỡng da', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 470000.00, 40000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-02-17 22:08:27', '2026-05-02 22:08:27', 16.036500, 108.217267, 16.037460, 108.186703, 1, 'sender', 'fast', 'DN'),
(136, 'HCM-782939', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 15', '0737992374', 'Quần áo trẻ em', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 470000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-12 22:08:27', '2026-05-02 22:08:27', 10.841857, 106.654462, 10.847697, 106.605420, 1, 'sender', 'standard', 'HCM'),
(137, 'HN-782940', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 16', '0912994749', 'Vợt cầu lông', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 330000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-27 22:08:25', '2026-05-02 22:08:25', 21.048926, 105.872873, 21.034610, 105.867074, 1, 'sender', 'standard', 'HN');
INSERT INTO `shipments` (`id`, `tracking_code`, `customer_id`, `sender_name`, `sender_phone`, `receiver_name`, `receiver_phone`, `item_name`, `pickup_address`, `delivery_address`, `weight_kg`, `cod_amount`, `shipping_fee`, `payment_method`, `status`, `failure_note`, `fail_count`, `scheduled_date`, `current_location`, `created_at`, `updated_at`, `pickup_lat`, `pickup_lng`, `delivery_lat`, `delivery_lng`, `quantity`, `pickup_option`, `service_type`, `region_id`) VALUES
(138, 'HN-782941', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 17', '0651596261', 'Tai nghe Bluetooth', '12 Thái Hà, Đống Đa, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 480000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-19 22:08:25', '2026-05-02 22:08:25', 21.005538, 105.843445, 21.046574, 105.830235, 1, 'sender', 'standard', 'HN'),
(139, 'HCM-782942', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 18', '0220551167', 'Tai nghe Bluetooth', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 280000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-05-02 22:08:27', '2026-05-02 23:26:00', 10.805955, 106.626950, 10.821726, 106.645294, 1, 'sender', 'fast', 'HCM'),
(140, 'HCM-782943', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 19', '0983665322', 'Sách tiểu thuyết', '789 CMT8, Tân Bình, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 350000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:27', '2026-05-02 22:08:27', 10.801658, 106.633416, 10.813126, 106.617791, 1, 'sender', 'standard', 'HCM'),
(141, 'HCM-782944', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 20', '0795439628', 'Ốp lưng điện thoại', '11 Lê Duẩn, Quận 1, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 210000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 10.808823, 106.654356, 10.845527, 106.649232, 1, 'sender', 'fast', 'HCM'),
(142, 'DN-782945', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 21', '0939040190', 'Quần áo trẻ em', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 380000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-29 22:08:26', '2026-05-02 22:08:26', 16.027985, 108.224640, 16.040572, 108.216406, 1, 'sender', 'fast', 'DN'),
(143, 'HCM-782946', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 22', '0597606529', 'Quần áo trẻ em', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 450000.00, 30000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 22:08:25', 10.804736, 106.636047, 10.818814, 106.642952, 1, 'sender', 'fast', 'HCM'),
(144, 'HCM-782947', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 23', '0560736000', 'Sách tiểu thuyết', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 10000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-28 22:08:25', '2026-05-02 22:08:25', 10.834955, 106.625103, 10.822307, 106.653975, 1, 'sender', 'fast', 'HCM'),
(145, 'HN-782948', 10, 'Phạm Hương', '0422886964', 'Khách nhận 24', '0843789488', 'Vợt cầu lông', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 380000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-22 22:08:27', '2026-05-02 22:08:27', 21.012877, 105.851748, 21.037348, 105.850992, 1, 'sender', 'fast', 'HN'),
(146, 'HN-782949', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 25', '0206447611', 'Laptop Dell', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 270000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-02-21 22:08:26', '2026-05-02 22:08:26', 21.021859, 105.848538, 21.045359, 105.830415, 1, 'sender', 'fast', 'HN'),
(147, 'HN-782950', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 26', '0903122832', 'Laptop Dell', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 70000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 21.034495, 105.833486, 21.014056, 105.853410, 1, 'sender', 'standard', 'HN'),
(148, 'DN-782951', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 27', '0306849161', 'Laptop Dell', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 460000.00, 50000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.023990, 108.210413, 16.071079, 108.209311, 1, 'sender', 'standard', 'DN'),
(149, 'DN-782952', 10, 'Phạm Hương', '0422886964', 'Khách nhận 28', '0917672756', 'Quần áo trẻ em', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 30000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:27', '2026-05-02 22:08:27', 16.037415, 108.183203, 16.026682, 108.212433, 1, 'sender', 'fast', 'DN'),
(150, 'DN-782953', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 29', '0918156686', 'Vitamin Omega 3', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 490000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 16.071816, 108.226000, 16.070796, 108.192695, 1, 'sender', 'fast', 'DN'),
(151, 'HN-782954', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 30', '0725905299', 'Tai nghe Bluetooth', '45 Cầu Giấy, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 410000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-02-21 22:08:25', '2026-05-02 22:08:25', 21.009406, 105.852784, 21.010321, 105.867747, 1, 'sender', 'fast', 'HN'),
(152, 'HCM-782955', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 31', '0222410018', 'Laptop Dell', '11 Lê Duẩn, Quận 1, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 310000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 10.847481, 106.619069, 10.836512, 106.631938, 1, 'sender', 'fast', 'HCM'),
(153, 'HCM-782956', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 32', '0306151161', 'Quần áo trẻ em', '11 Lê Duẩn, Quận 1, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 220000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-05 22:08:27', '2026-05-02 22:08:27', 10.834209, 106.619951, 10.811004, 106.643614, 1, 'sender', 'standard', 'HCM'),
(154, 'HCM-782957', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 33', '0859260530', 'Ốp lưng điện thoại', '11 Lê Duẩn, Quận 1, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 90000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-28 22:08:25', '2026-05-02 22:08:25', 10.824856, 106.636970, 10.826454, 106.609577, 1, 'sender', 'fast', 'HCM'),
(155, 'DN-782958', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 34', '0569805236', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 70000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-24 22:08:25', '2026-05-02 23:24:23', 16.057758, 108.211272, 16.036440, 108.191059, 1, 'sender', 'fast', 'DN'),
(156, 'HCM-782959', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 35', '0140819398', 'Sách tiểu thuyết', '789 CMT8, Tân Bình, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 220000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 10.798986, 106.634794, 10.843833, 106.616234, 1, 'sender', 'fast', 'HCM'),
(157, 'DN-782960', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 36', '0847712394', 'Vợt cầu lông', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 100000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 16.043444, 108.186910, 16.061972, 108.197167, 1, 'sender', 'standard', 'DN'),
(158, 'DN-782961', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 37', '0322738105', 'Sách tiểu thuyết', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 340000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-21 22:08:26', '2026-05-02 22:08:26', 16.046471, 108.183557, 16.029087, 108.229129, 1, 'sender', 'standard', 'DN'),
(159, 'DN-782962', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 38', '0143453031', 'Sách tiểu thuyết', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 350000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-25 22:08:27', '2026-05-02 22:08:27', 16.066746, 108.183345, 16.058255, 108.198566, 1, 'sender', 'standard', 'DN'),
(160, 'HN-782963', 10, 'Phạm Hương', '0422886964', 'Khách nhận 39', '0236007481', 'Cáp sạc Type-C', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 340000.00, 40000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-03-09 22:08:27', '2026-05-02 22:08:27', 21.045332, 105.862820, 21.017449, 105.863754, 1, 'sender', 'standard', 'HN'),
(161, 'HCM-782964', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 40', '0215708642', 'Tai nghe Bluetooth', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 380000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 10.839092, 106.642592, 10.839159, 106.636178, 1, 'sender', 'standard', 'HCM'),
(162, 'DN-782965', 10, 'Phạm Hương', '0422886964', 'Khách nhận 41', '0592047328', 'Vitamin Omega 3', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 130000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2025-12-29 22:08:27', '2026-05-02 22:08:27', 16.063849, 108.193697, 16.034700, 108.230995, 1, 'sender', 'standard', 'DN'),
(163, 'HCM-782966', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 42', '0888141610', 'Sách tiểu thuyết', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 110000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-18 22:08:27', '2026-05-02 22:08:27', 10.822630, 106.606603, 10.808214, 106.628637, 1, 'sender', 'standard', 'HCM'),
(164, 'DN-782967', 10, 'Phạm Hương', '0422886964', 'Khách nhận 43', '0366729996', 'Laptop Dell', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 330000.00, 20000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-02-23 22:08:27', '2026-05-02 22:08:27', 16.048259, 108.200142, 16.039840, 108.217871, 1, 'sender', 'fast', 'DN'),
(165, 'HCM-782968', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 44', '0756379410', 'Ốp lưng điện thoại', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 110000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 10.807066, 106.643782, 10.802702, 106.653510, 1, 'sender', 'fast', 'HCM'),
(166, 'HCM-782969', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 45', '0587142316', 'Quần áo trẻ em', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 480000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-06 22:08:27', '2026-05-02 22:08:27', 10.830665, 106.633490, 10.815314, 106.648954, 1, 'sender', 'standard', 'HCM'),
(167, 'DN-782970', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 46', '0394625360', 'Laptop Dell', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 80000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 16.047170, 108.230500, 16.058951, 108.228508, 1, 'sender', 'standard', 'DN'),
(168, 'DN-782971', 10, 'Phạm Hương', '0422886964', 'Khách nhận 47', '0254406590', 'Mỹ phẩm dưỡng da', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 280000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-04 22:08:27', '2026-05-02 22:08:27', 16.028380, 108.227912, 16.060319, 108.189297, 1, 'sender', 'standard', 'DN'),
(169, 'HCM-782972', 10, 'Phạm Hương', '0422886964', 'Khách nhận 48', '0951965289', 'Tai nghe Bluetooth', '789 CMT8, Tân Bình, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 230000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-27 22:08:27', '2026-05-02 22:08:27', 10.826995, 106.636945, 10.831855, 106.620849, 1, 'sender', 'standard', 'HCM'),
(170, 'HCM-782973', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 49', '0270105679', 'Tai nghe Bluetooth', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 280000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 10.832579, 106.612991, 10.812581, 106.621176, 1, 'sender', 'fast', 'HCM'),
(171, 'HCM-782974', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 50', '0164834589', 'Mỹ phẩm dưỡng da', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 50000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-31 22:08:27', '2026-05-02 23:24:21', 10.832920, 106.619774, 10.811141, 106.621911, 1, 'sender', 'fast', 'HCM'),
(172, 'HN-782975', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 51', '0557938742', 'Tai nghe Bluetooth', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 360000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-12 22:08:25', '2026-05-02 22:08:25', 21.014771, 105.847531, 21.044178, 105.858837, 1, 'sender', 'fast', 'HN'),
(173, 'HCM-782976', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 52', '0607839645', 'Vợt cầu lông', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 50000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-14 22:08:26', '2026-05-02 22:08:26', 10.829250, 106.630588, 10.841995, 106.633330, 1, 'sender', 'standard', 'HCM'),
(174, 'DN-782977', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 53', '0284884227', 'Mỹ phẩm dưỡng da', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 20000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-31 22:08:26', '2026-05-02 22:08:26', 16.064226, 108.189757, 16.025310, 108.203943, 1, 'sender', 'fast', 'DN'),
(175, 'DN-782978', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 54', '0826321163', 'Laptop Dell', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 190000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 16.062523, 108.212453, 16.061090, 108.215271, 1, 'sender', 'standard', 'DN'),
(176, 'DN-782979', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 55', '0947364148', 'Sách tiểu thuyết', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 50000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-06 22:08:25', '2026-05-02 22:08:25', 16.071814, 108.214342, 16.059366, 108.204493, 1, 'sender', 'standard', 'DN'),
(177, 'HCM-782980', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 56', '0460190972', 'Mỹ phẩm dưỡng da', '11 Lê Duẩn, Quận 1, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 380000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:27', '2026-05-02 22:08:27', 10.813869, 106.633512, 10.814564, 106.631658, 1, 'sender', 'fast', 'HCM'),
(178, 'HN-782981', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 57', '0636227890', 'Vitamin Omega 3', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 160000.00, 20000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-02-04 22:08:25', '2026-05-02 22:08:25', 21.045965, 105.862956, 21.023206, 105.876212, 1, 'sender', 'fast', 'HN'),
(179, 'HN-782982', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 58', '0503119179', 'Cáp sạc Type-C', '12 Thái Hà, Đống Đa, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 90000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:25', '2026-05-02 22:08:25', 21.039591, 105.858704, 21.021117, 105.857478, 1, 'sender', 'fast', 'HN'),
(180, 'HCM-782983', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 59', '0512145052', 'Vitamin Omega 3', '789 CMT8, Tân Bình, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 490000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 10.837840, 106.614219, 10.832620, 106.618007, 1, 'sender', 'standard', 'HCM'),
(181, 'HCM-782984', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 60', '0435813122', 'Laptop Dell', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 400000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-09 22:08:25', '2026-05-02 22:08:25', 10.821393, 106.644885, 10.837815, 106.644601, 1, 'sender', 'standard', 'HCM'),
(182, 'HN-782985', 10, 'Phạm Hương', '0422886964', 'Khách nhận 61', '0985055752', 'Quần áo trẻ em', '45 Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 10000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-14 22:08:27', '2026-05-02 22:08:27', 21.049264, 105.861602, 21.005118, 105.851320, 1, 'sender', 'standard', 'HN'),
(183, 'HN-782986', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 62', '0644423279', 'Laptop Dell', '45 Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 230000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-23 22:08:27', '2026-05-02 22:08:27', 21.042015, 105.838584, 21.039461, 105.861039, 1, 'sender', 'standard', 'HN'),
(184, 'HN-782987', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 63', '0323799357', 'Sách tiểu thuyết', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 200000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-23 22:08:27', '2026-05-02 22:08:27', 21.047489, 105.834459, 21.046505, 105.847334, 1, 'sender', 'standard', 'HN'),
(185, 'HN-782988', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 64', '0684772444', 'Mỹ phẩm dưỡng da', '45 Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 390000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-25 22:08:26', '2026-05-02 22:08:26', 21.007574, 105.868883, 21.027031, 105.856319, 1, 'sender', 'fast', 'HN'),
(186, 'DN-782989', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 65', '0251626240', 'Ốp lưng điện thoại', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 270000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-01 22:08:25', '2026-05-02 22:08:25', 16.027493, 108.210493, 16.050837, 108.185946, 1, 'sender', 'standard', 'DN'),
(187, 'DN-782990', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 66', '0985350784', 'Quần áo trẻ em', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 80000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 16.026818, 108.208481, 16.055351, 108.214901, 1, 'sender', 'standard', 'DN'),
(188, 'DN-782991', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 67', '0809128682', 'Laptop Dell', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 470000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 22:08:25', 16.042745, 108.214404, 16.054846, 108.195695, 1, 'sender', 'standard', 'DN'),
(189, 'HCM-782992', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 68', '0850002798', 'Laptop Dell', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 380000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-28 22:08:26', '2026-05-02 22:08:26', 10.799186, 106.620776, 10.821362, 106.635152, 1, 'sender', 'standard', 'HCM'),
(190, 'HCM-782993', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 69', '0746358786', 'Quần áo trẻ em', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 80000.00, 20000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-02 22:08:26', '2026-05-02 22:08:26', 10.827763, 106.640141, 10.837458, 106.614781, 1, 'sender', 'standard', 'HCM'),
(191, 'HCM-782994', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 70', '0531090237', 'Tai nghe Bluetooth', '789 CMT8, Tân Bình, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 130000.00, 30000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-03-04 22:08:25', '2026-05-02 22:08:25', 10.826072, 106.616148, 10.800604, 106.616582, 1, 'sender', 'standard', 'HCM'),
(192, 'HCM-782995', 10, 'Phạm Hương', '0422886964', 'Khách nhận 71', '0830553853', 'Ốp lưng điện thoại', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 200000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:27', '2026-05-02 22:08:27', 10.803292, 106.616626, 10.838276, 106.649757, 1, 'sender', 'standard', 'HCM'),
(193, 'DN-782996', 10, 'Phạm Hương', '0422886964', 'Khách nhận 72', '0939253304', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 90000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-02-23 22:08:27', '2026-05-02 22:08:27', 16.055595, 108.219368, 16.023628, 108.218533, 1, 'sender', 'fast', 'DN'),
(194, 'HCM-782997', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 73', '0664577984', 'Vợt cầu lông', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 240000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-28 22:08:25', '2026-05-02 22:08:25', 10.803012, 106.608716, 10.817844, 106.607616, 1, 'sender', 'fast', 'HCM'),
(195, 'HN-782998', 10, 'Phạm Hương', '0422886964', 'Khách nhận 74', '0544825294', 'Laptop Dell', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 330000.00, 30000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-18 22:08:27', '2026-05-02 22:08:27', 21.030896, 105.857890, 21.005826, 105.844601, 1, 'sender', 'standard', 'HN'),
(196, 'HCM-782999', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 75', '0727540991', 'Quần áo trẻ em', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 170000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:25', '2026-05-02 22:08:25', 10.820010, 106.639393, 10.822681, 106.627341, 1, 'sender', 'standard', 'HCM'),
(197, 'DN-783000', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 76', '0363956167', 'Vitamin Omega 3', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 120000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-20 22:08:25', '2026-05-02 22:08:25', 16.032298, 108.205630, 16.049970, 108.227240, 1, 'sender', 'standard', 'DN'),
(198, 'HN-783001', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 77', '0772211975', 'Quần áo trẻ em', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 420000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-24 22:08:26', '2026-05-02 22:08:26', 21.022298, 105.858041, 21.029995, 105.876143, 1, 'sender', 'fast', 'HN'),
(199, 'HN-783002', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 78', '0419564148', 'Sách tiểu thuyết', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 140000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 21.005168, 105.879140, 21.041536, 105.847188, 1, 'sender', 'standard', 'HN'),
(200, 'DN-783003', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 79', '0528625307', 'Mỹ phẩm dưỡng da', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 20000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 23:24:24', 16.042502, 108.193952, 16.064944, 108.199357, 1, 'sender', 'fast', 'DN'),
(201, 'HN-783004', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 80', '0297133589', 'Tai nghe Bluetooth', '45 Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 10000.00, 20000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-20 22:08:25', '2026-05-02 22:08:25', 21.005408, 105.853769, 21.031767, 105.876973, 1, 'sender', 'standard', 'HN'),
(202, 'HN-783005', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 81', '0819691745', 'Quần áo trẻ em', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 210000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-14 22:08:27', '2026-05-02 22:08:27', 21.010241, 105.830358, 21.051119, 105.851527, 1, 'sender', 'standard', 'HN'),
(203, 'DN-783006', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 82', '0725877022', 'Tai nghe Bluetooth', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 420000.00, 30000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-03-11 22:08:25', '2026-05-02 22:08:25', 16.055966, 108.203868, 16.035389, 108.216542, 1, 'sender', 'standard', 'DN'),
(204, 'HCM-783007', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 83', '0942586151', 'Vitamin Omega 3', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 150000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-28 22:08:27', '2026-05-02 22:08:27', 10.844267, 106.634977, 10.835044, 106.611695, 1, 'sender', 'fast', 'HCM'),
(205, 'HN-783008', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 84', '0233476779', 'Sách tiểu thuyết', '45 Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 100000.00, 30000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 21.034573, 105.838692, 21.046072, 105.873725, 1, 'sender', 'fast', 'HN'),
(206, 'HN-783009', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 85', '0361344007', 'Quần áo trẻ em', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 50000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-01 22:08:25', '2026-05-02 22:08:25', 21.005839, 105.854948, 21.009415, 105.842197, 1, 'sender', 'fast', 'HN'),
(207, 'HN-783010', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 86', '0334080971', 'Vitamin Omega 3', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 480000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-01 22:08:25', '2026-05-02 22:08:25', 21.019249, 105.854628, 21.011595, 105.862240, 1, 'sender', 'fast', 'HN'),
(208, 'HCM-783011', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 87', '0209578002', 'Vitamin Omega 3', '11 Lê Duẩn, Quận 1, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 10000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-01 22:08:26', '2026-05-02 22:08:26', 10.821828, 106.604923, 10.830586, 106.623332, 1, 'sender', 'fast', 'HCM'),
(209, 'HN-783012', 10, 'Phạm Hương', '0422886964', 'Khách nhận 88', '0814079099', 'Ốp lưng điện thoại', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 380000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-04 22:08:27', '2026-05-02 22:08:27', 21.013444, 105.869696, 21.052914, 105.836962, 1, 'sender', 'standard', 'HN'),
(210, 'HN-783013', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 89', '0984635869', 'Vitamin Omega 3', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 380000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 21.030596, 105.861432, 21.044010, 105.875961, 1, 'sender', 'fast', 'HN'),
(211, 'HN-783014', 10, 'Phạm Hương', '0422886964', 'Khách nhận 90', '0581898638', 'Vợt cầu lông', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 450000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-21 22:08:27', '2026-05-02 22:08:27', 21.045299, 105.849694, 21.025632, 105.834130, 1, 'sender', 'fast', 'HN'),
(212, 'HCM-783015', 10, 'Phạm Hương', '0422886964', 'Khách nhận 91', '0633106374', 'Vitamin Omega 3', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 220000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-19 22:08:27', '2026-05-02 22:08:27', 10.819663, 106.620992, 10.846207, 106.640713, 1, 'sender', 'fast', 'HCM'),
(213, 'HCM-783016', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 92', '0962251281', 'Ốp lưng điện thoại', '11 Lê Duẩn, Quận 1, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 330000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 10.802305, 106.615099, 10.836619, 106.630976, 1, 'sender', 'standard', 'HCM'),
(214, 'HN-783017', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 93', '0915501895', 'Ốp lưng điện thoại', '45 Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 420000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:25', '2026-05-02 22:08:25', 21.043879, 105.836491, 21.034613, 105.833955, 1, 'sender', 'fast', 'HN'),
(215, 'DN-783018', 10, 'Phạm Hương', '0422886964', 'Khách nhận 94', '0844572373', 'Ốp lưng điện thoại', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 50000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-27 22:08:27', '2026-05-02 23:02:42', 16.051654, 108.211285, 16.047185, 108.211265, 1, 'sender', 'fast', 'DN'),
(216, 'HN-783019', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 95', '0479629295', 'Mỹ phẩm dưỡng da', '45 Cầu Giấy, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 340000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 21.004581, 105.864602, 21.034377, 105.863756, 1, 'sender', 'fast', 'HN'),
(217, 'HCM-783020', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 96', '0292632242', 'Sách tiểu thuyết', '789 CMT8, Tân Bình, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 490000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-20 22:08:25', '2026-05-02 22:08:25', 10.832668, 106.634769, 10.806735, 106.633352, 1, 'sender', 'standard', 'HCM'),
(218, 'HCM-783021', 10, 'Phạm Hương', '0422886964', 'Khách nhận 97', '0462850553', 'Tai nghe Bluetooth', '11 Lê Duẩn, Quận 1, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 50000.00, 30000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-01-20 22:08:27', '2026-05-02 22:08:27', 10.820223, 106.606894, 10.808952, 106.620525, 1, 'sender', 'standard', 'HCM'),
(219, 'HN-783022', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 98', '0876798090', 'Quần áo trẻ em', '45 Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 150000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-18 22:08:26', '2026-05-02 22:08:26', 21.037285, 105.865672, 21.033703, 105.876416, 1, 'sender', 'fast', 'HN'),
(220, 'HCM-783023', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 99', '0485394507', 'Tai nghe Bluetooth', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 340000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-07 22:08:26', '2026-05-02 22:08:26', 10.804791, 106.610666, 10.834301, 106.631670, 1, 'sender', 'fast', 'HCM'),
(221, 'HCM-783024', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 100', '0651655043', 'Cáp sạc Type-C', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 20000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-30 22:08:27', '2026-05-02 22:08:27', 10.830286, 106.605633, 10.847048, 106.617419, 1, 'sender', 'fast', 'HCM'),
(222, 'HN-783025', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 101', '0874601739', 'Mỹ phẩm dưỡng da', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 30000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-17 22:08:27', '2026-05-02 22:08:27', 21.036782, 105.849583, 21.010650, 105.860393, 1, 'sender', 'fast', 'HN'),
(223, 'DN-783026', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 102', '0592907141', 'Cáp sạc Type-C', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 120000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 16.026335, 108.211691, 16.032303, 108.225312, 1, 'sender', 'fast', 'DN'),
(224, 'DN-783027', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 103', '0759317057', 'Mỹ phẩm dưỡng da', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 360000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-27 22:08:26', '2026-05-02 22:08:26', 16.037191, 108.186480, 16.058356, 108.221405, 1, 'sender', 'standard', 'DN'),
(225, 'HN-783028', 10, 'Phạm Hương', '0422886964', 'Khách nhận 104', '0108340203', 'Cáp sạc Type-C', '12 Thái Hà, Đống Đa, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 240000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 21.024635, 105.869286, 21.030973, 105.864091, 1, 'sender', 'fast', 'HN'),
(226, 'HN-783029', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 105', '0291986232', 'Laptop Dell', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 480000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-25 22:08:26', '2026-05-02 22:08:26', 21.045647, 105.875269, 21.048373, 105.856071, 1, 'sender', 'standard', 'HN'),
(227, 'HN-783030', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 106', '0549944788', 'Vitamin Omega 3', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 370000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-10 22:08:26', '2026-05-02 22:08:26', 21.036294, 105.838764, 21.022188, 105.874348, 1, 'sender', 'standard', 'HN'),
(228, 'HN-783031', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 107', '0191193599', 'Sách tiểu thuyết', '45 Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 210000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-19 22:08:25', '2026-05-02 22:08:25', 21.051036, 105.870967, 21.005213, 105.872230, 1, 'sender', 'standard', 'HN'),
(229, 'HCM-783032', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 108', '0981980489', 'Vitamin Omega 3', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 410000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 10.803583, 106.636624, 10.837358, 106.611968, 1, 'sender', 'standard', 'HCM'),
(230, 'DN-783033', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 109', '0337208443', 'Tai nghe Bluetooth', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 460000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 16.056098, 108.226414, 16.063577, 108.228335, 1, 'sender', 'standard', 'DN'),
(231, 'DN-783034', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 110', '0761383407', 'Quần áo trẻ em', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 170000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-28 22:08:26', '2026-05-02 22:08:26', 16.040144, 108.183295, 16.058661, 108.187552, 1, 'sender', 'fast', 'DN'),
(232, 'HCM-783035', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 111', '0190266376', 'Mỹ phẩm dưỡng da', '11 Lê Duẩn, Quận 1, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 260000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-26 22:08:25', '2026-05-02 22:08:25', 10.798247, 106.643980, 10.827637, 106.630804, 1, 'sender', 'fast', 'HCM'),
(233, 'DN-783036', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 112', '0640393351', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 40000.00, 40000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-03-26 22:08:26', '2026-05-02 22:08:26', 16.067798, 108.185582, 16.059414, 108.227365, 1, 'sender', 'standard', 'DN'),
(234, 'HN-783037', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 113', '0436230060', 'Cáp sạc Type-C', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 400000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-30 22:08:27', '2026-05-02 22:08:27', 21.040604, 105.851503, 21.013780, 105.871054, 1, 'sender', 'standard', 'HN'),
(235, 'HCM-783038', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 114', '0577145338', 'Laptop Dell', '789 CMT8, Tân Bình, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 230000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-18 22:08:25', '2026-05-02 22:08:25', 10.817767, 106.653378, 10.842878, 106.611070, 1, 'sender', 'standard', 'HCM'),
(236, 'DN-783039', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 115', '0730976759', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 480000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-02 22:08:26', '2026-05-02 22:08:26', 16.067799, 108.218944, 16.062174, 108.208770, 1, 'sender', 'standard', 'DN'),
(237, 'DN-783040', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 116', '0983188196', 'Quần áo trẻ em', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 450000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-30 22:08:25', '2026-05-02 22:08:25', 16.068116, 108.227841, 16.022152, 108.223635, 1, 'sender', 'standard', 'DN'),
(238, 'HCM-783041', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 117', '0941355130', 'Sách tiểu thuyết', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 110000.00, 40000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-03-23 22:08:26', '2026-05-02 22:08:26', 10.829071, 106.609882, 10.803625, 106.639296, 1, 'sender', 'standard', 'HCM'),
(239, 'HCM-783042', 10, 'Phạm Hương', '0422886964', 'Khách nhận 118', '0202644202', 'Laptop Dell', '789 CMT8, Tân Bình, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 210000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-01 22:08:27', '2026-05-02 22:08:27', 10.844836, 106.611606, 10.814874, 106.633933, 1, 'sender', 'standard', 'HCM'),
(240, 'DN-783043', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 119', '0596896516', 'Vợt cầu lông', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 490000.00, 20000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-04-09 22:08:27', '2026-05-02 22:08:27', 16.023074, 108.227931, 16.031060, 108.201266, 1, 'sender', 'fast', 'DN'),
(241, 'HCM-783044', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 120', '0979172567', 'Sách tiểu thuyết', '789 CMT8, Tân Bình, TP.HCM', '789 CMT8, Tân Bình, TP.HCM', 2.50, 370000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:25', '2026-05-02 22:08:25', 10.833730, 106.640670, 10.804478, 106.633447, 1, 'sender', 'fast', 'HCM'),
(242, 'HCM-783045', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 121', '0344916134', 'Cáp sạc Type-C', '11 Lê Duẩn, Quận 1, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 60000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 22:08:25', 10.837792, 106.627703, 10.807285, 106.612053, 1, 'sender', 'fast', 'HCM'),
(243, 'DN-783046', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 122', '0796785409', 'Mỹ phẩm dưỡng da', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 40000.00, 30000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-03-06 22:08:26', '2026-05-02 22:08:26', 16.059381, 108.188405, 16.070190, 108.220039, 1, 'sender', 'standard', 'DN'),
(244, 'HN-783047', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 123', '0947319490', 'Tai nghe Bluetooth', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 410000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-22 22:08:26', '2026-05-02 22:08:26', 21.013008, 105.845397, 21.053138, 105.832858, 1, 'sender', 'standard', 'HN'),
(245, 'DN-783048', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 124', '0235475708', 'Mỹ phẩm dưỡng da', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 200000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-26 22:08:26', '2026-05-02 22:08:26', 16.058628, 108.189421, 16.068192, 108.222551, 1, 'sender', 'fast', 'DN'),
(246, 'DN-783049', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 125', '0479374916', 'Vợt cầu lông', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 170000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-21 22:08:26', '2026-05-02 22:08:26', 16.051249, 108.203122, 16.062616, 108.186219, 1, 'sender', 'standard', 'DN'),
(247, 'DN-783050', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 126', '0592436408', 'Sách tiểu thuyết', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 110000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-28 22:08:27', '2026-05-02 22:08:27', 16.025186, 108.184582, 16.066755, 108.199855, 1, 'sender', 'standard', 'DN'),
(248, 'HN-783051', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 127', '0383760959', 'Vitamin Omega 3', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 60000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-01 22:08:25', '2026-05-02 22:08:25', 21.050759, 105.856549, 21.036292, 105.848558, 1, 'sender', 'fast', 'HN'),
(249, 'HN-783052', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 128', '0262047779', 'Tai nghe Bluetooth', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 430000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 21.044056, 105.866293, 21.018562, 105.869114, 1, 'sender', 'fast', 'HN'),
(250, 'HCM-783053', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 129', '0226434316', 'Vợt cầu lông', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 460000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-14 22:08:25', '2026-05-02 22:08:25', 10.838516, 106.605227, 10.818707, 106.625871, 1, 'sender', 'standard', 'HCM'),
(251, 'DN-783054', 10, 'Phạm Hương', '0422886964', 'Khách nhận 130', '0176762292', 'Vợt cầu lông', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 380000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-09 22:08:27', '2026-05-02 22:08:27', 16.069004, 108.183373, 16.060145, 108.212500, 1, 'sender', 'fast', 'DN'),
(252, 'DN-783055', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 131', '0770482268', 'Ốp lưng điện thoại', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 70000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-24 22:08:25', '2026-05-02 22:08:25', 16.043971, 108.229847, 16.049320, 108.190071, 1, 'sender', 'standard', 'DN'),
(253, 'HN-783056', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 132', '0997271526', 'Vitamin Omega 3', '12 Thái Hà, Đống Đa, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 80000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-19 22:08:25', '2026-05-02 23:24:38', 21.041391, 105.848531, 21.018972, 105.838127, 1, 'sender', 'fast', 'HN'),
(254, 'HN-783057', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 133', '0485684334', 'Vợt cầu lông', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 160000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-09 22:08:25', '2026-05-02 22:08:25', 21.012488, 105.851041, 21.028907, 105.875060, 1, 'sender', 'fast', 'HN'),
(255, 'HN-783058', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 134', '0681149279', 'Tai nghe Bluetooth', '45 Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 90000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 21.024956, 105.845905, 21.016595, 105.833051, 1, 'sender', 'fast', 'HN'),
(256, 'HCM-783059', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 135', '0925010486', 'Ốp lưng điện thoại', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 300000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-24 22:08:27', '2026-05-02 22:08:27', 10.814800, 106.645826, 10.811958, 106.650723, 1, 'sender', 'standard', 'HCM'),
(257, 'HN-783060', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 136', '0181304371', 'Vitamin Omega 3', '12 Thái Hà, Đống Đa, Hà Nội', '45 Cầu Giấy, Hà Nội', 2.50, 320000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-11 22:08:27', '2026-05-02 22:08:27', 21.052880, 105.838779, 21.008228, 105.868614, 1, 'sender', 'standard', 'HN'),
(258, 'HCM-783061', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 137', '0912510902', 'Sách tiểu thuyết', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 410000.00, 30000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-29 22:08:25', '2026-05-02 22:08:25', 10.838727, 106.653906, 10.846255, 106.616849, 1, 'sender', 'standard', 'HCM'),
(259, 'DN-783062', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 138', '0832467102', 'Vitamin Omega 3', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', 2.50, 60000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-31 22:08:26', '2026-05-02 22:08:26', 16.064723, 108.195478, 16.051941, 108.211929, 1, 'sender', 'standard', 'DN'),
(260, 'DN-783063', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 139', '0467334025', 'Quần áo trẻ em', '45 Lê Duẩn, Hải Châu, Đà Nẵng', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', 2.50, 230000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 16.023582, 108.231243, 16.053697, 108.213105, 1, 'sender', 'standard', 'DN'),
(261, 'HN-783064', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 140', '0633554156', 'Ốp lưng điện thoại', '45 Cầu Giấy, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 440000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 21.043509, 105.875867, 21.052174, 105.844784, 1, 'sender', 'standard', 'HN'),
(262, 'HN-783065', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 141', '0222117645', 'Laptop Dell', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', 2.50, 180000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:26', '2026-05-02 22:08:26', 21.053273, 105.830973, 21.007909, 105.860395, 1, 'sender', 'standard', 'HN'),
(263, 'DN-783066', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 142', '0243263775', 'Tai nghe Bluetooth', '12 Hoàng Sa, Sơn Trà, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 200000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-20 22:08:26', '2026-05-02 22:08:26', 16.062583, 108.185224, 16.051581, 108.200263, 1, 'sender', 'standard', 'DN'),
(264, 'HCM-783067', 10, 'Phạm Hương', '0422886964', 'Khách nhận 143', '0840853286', 'Sách tiểu thuyết', '11 Lê Duẩn, Quận 1, TP.HCM', '11 Lê Duẩn, Quận 1, TP.HCM', 2.50, 150000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-08 22:08:27', '2026-05-02 22:08:27', 10.834732, 106.614036, 10.805041, 106.644965, 1, 'sender', 'fast', 'HCM'),
(265, 'HN-783068', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 144', '0808047636', 'Tai nghe Bluetooth', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', '12 Thái Hà, Đống Đa, Hà Nội', 2.50, 50000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:26', '2026-05-02 22:08:26', 21.035070, 105.829463, 21.038801, 105.830709, 1, 'sender', 'standard', 'HN'),
(266, 'DN-783069', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách nhận 145', '0350381609', 'Ốp lưng điện thoại', '78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng', '45 Lê Duẩn, Hải Châu, Đà Nẵng', 2.50, 230000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-18 22:08:27', '2026-05-02 22:08:27', 16.069236, 108.183859, 16.035080, 108.208103, 1, 'sender', 'standard', 'DN'),
(267, 'HCM-783070', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách nhận 146', '0521762702', 'Tai nghe Bluetooth', '789 CMT8, Tân Bình, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 460000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-18 22:08:25', '2026-05-02 22:08:25', 10.813403, 106.627515, 10.802459, 106.622382, 1, 'sender', 'fast', 'HCM'),
(268, 'HN-783071', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách nhận 147', '0906457217', 'Vợt cầu lông', '112 Trần Duy Hưng, Cầu Giấy, Hà Nội', '25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', 2.50, 480000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 21.051959, 105.841967, 21.023931, 105.835859, 1, 'sender', 'standard', 'HN'),
(269, 'HCM-783072', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách nhận 148', '0354405055', 'Ốp lưng điện thoại', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', '123 Điện Biên Phủ, Bình Thạnh, TP.HCM', 2.50, 200000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-26 22:08:26', '2026-05-02 22:08:26', 10.835116, 106.630496, 10.833429, 106.627359, 1, 'sender', 'fast', 'HCM'),
(270, 'HCM-783073', 5, 'Mai Phương Thúy', '0427745274', 'Khách nhận 149', '0651017729', 'Ốp lưng điện thoại', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '456 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 2.50, 270000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-22 22:08:25', '2026-05-02 22:08:25', 10.833873, 106.643873, 10.841192, 106.605050, 1, 'sender', 'fast', 'HCM'),
(271, 'DN-491585', 5, 'Ngọc Trường', '0909123456', 'Tô Ngọc Huy', '0909666777', 'Máy Tính', '99, Đường Nguyễn Huy Tưởng, Hòa Minh, Phường Hòa Khánh, Thành phố Đà Nẵng, 84236, Việt Nam', '81, Đường Yên Thế, Hòa An, Phường An Khê, Thành phố Đà Nẵng, 84236, Việt Nam', 4.00, 800000.00, 38500.00, 'WALLET', 'assigned', NULL, 0, NULL, NULL, '2026-02-03 22:08:25', '2026-05-02 22:08:25', 16.052435, 108.169715, 16.053579, 108.177532, 1, 'sender', 'fast', 'DN'),
(272, 'DN-683134', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 0', '0185443154', 'Quần áo thời trang', 'Cẩm Lệ, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 460000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.038837, 108.237610, 16.012727, 108.175128, 1, 'sender', 'standard', 'DN'),
(273, 'DN-683135', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 1', '0114347801', 'Mỹ phẩm', 'Phú Lộc, Thừa Thiên Huế', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 230000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-25 22:08:27', '2026-05-02 22:08:27', 16.068897, 108.178786, 16.033842, 108.174097, 1, 'sender', 'standard', 'DN'),
(274, 'DN-683136', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 2', '0431535789', 'Sách giáo khoa', 'Hội An, Quảng Nam', 'Hải Châu, Đà Nẵng', 1.50, 30000.00, 20000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-17 22:08:26', '2026-05-02 22:08:26', 16.022783, 108.245620, 16.025634, 108.171511, 1, 'sender', 'standard', 'DN');
INSERT INTO `shipments` (`id`, `tracking_code`, `customer_id`, `sender_name`, `sender_phone`, `receiver_name`, `receiver_phone`, `item_name`, `pickup_address`, `delivery_address`, `weight_kg`, `cod_amount`, `shipping_fee`, `payment_method`, `status`, `failure_note`, `fail_count`, `scheduled_date`, `current_location`, `created_at`, `updated_at`, `pickup_lat`, `pickup_lng`, `delivery_lat`, `delivery_lng`, `quantity`, `pickup_option`, `service_type`, `region_id`) VALUES
(275, 'DN-683137', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 3', '0280164323', 'Laptop Dell', 'Ngũ Hành Sơn, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 140000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-07 22:08:25', '2026-05-02 22:08:25', 16.058583, 108.186806, 16.079202, 108.208212, 1, 'sender', 'standard', 'DN'),
(276, 'DN-683138', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 4', '0352951536', 'Đặc sản Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 300000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:26', '2026-05-02 22:08:26', 16.025596, 108.208902, 16.041236, 108.189041, 1, 'sender', 'standard', 'DN'),
(277, 'DN-683139', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 5', '0222948891', 'Mỹ phẩm', 'Hòa Vang, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 340000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-04 22:08:27', '2026-05-02 22:08:27', 16.011862, 108.230166, 16.051860, 108.187105, 1, 'sender', 'fast', 'DN'),
(278, 'DN-683140', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 6', '0976736402', 'Quần áo thời trang', 'Điện Bàn, Quảng Nam', 'Phú Lộc, Thừa Thiên Huế', 1.50, 490000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.054120, 108.192505, 16.062232, 108.209900, 1, 'sender', 'fast', 'DN'),
(279, 'DN-683141', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 7', '0242350744', 'Đặc sản Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 370000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:27', '2026-05-02 22:08:27', 16.060931, 108.211410, 16.012662, 108.181729, 1, 'sender', 'standard', 'DN'),
(280, 'DN-683142', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 8', '0197190015', 'Hải sản sấy khô', 'Bình Sơn, Quảng Ngãi', 'Bình Sơn, Quảng Ngãi', 1.50, 80000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-27 22:08:25', '2026-05-02 22:08:25', 16.014494, 108.170907, 16.016689, 108.188177, 1, 'sender', 'standard', 'DN'),
(281, 'DN-683143', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 9', '0819453757', 'Linh kiện điện tử', 'Hội An, Quảng Nam', 'Tam Kỳ, Quảng Nam', 1.50, 310000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 16.016464, 108.178301, 16.010380, 108.224618, 1, 'sender', 'standard', 'DN'),
(282, 'DN-683144', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 10', '0626206639', 'Sách giáo khoa', 'Hòa Vang, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 200000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-22 22:08:25', '2026-05-02 22:08:25', 16.030513, 108.245186, 16.063734, 108.196195, 1, 'sender', 'standard', 'DN'),
(283, 'DN-683145', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 11', '0215512619', 'Mỹ phẩm', 'Điện Bàn, Quảng Nam', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 380000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-08 22:08:25', '2026-05-02 22:08:25', 16.026171, 108.203192, 16.015997, 108.225834, 1, 'sender', 'standard', 'DN'),
(284, 'DN-683146', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 12', '0835373659', 'Sách giáo khoa', 'Bình Sơn, Quảng Ngãi', 'Tam Kỳ, Quảng Nam', 1.50, 300000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-07 22:08:27', '2026-05-02 22:08:27', 16.047845, 108.198232, 16.048374, 108.245207, 1, 'sender', 'standard', 'DN'),
(285, 'DN-683147', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 13', '0927301766', 'Linh kiện điện tử', 'Ngũ Hành Sơn, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 70000.00, 40000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-10 22:08:26', '2026-05-02 22:08:26', 16.086666, 108.167660, 16.054047, 108.241090, 1, 'sender', 'fast', 'DN'),
(286, 'DN-683148', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 14', '0473846464', 'Linh kiện điện tử', 'Sơn Trà, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 160000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-28 22:08:26', '2026-05-02 22:08:26', 16.011449, 108.232751, 16.082514, 108.169782, 1, 'sender', 'standard', 'DN'),
(287, 'DN-683149', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 15', '0118224452', 'Laptop Dell', 'Hòa Vang, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 0.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:26', '2026-05-02 22:08:26', 16.021913, 108.210009, 16.069285, 108.212086, 1, 'sender', 'standard', 'DN'),
(288, 'DN-683150', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 16', '0197212035', 'Đặc sản Đà Nẵng', 'Hải Châu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 100000.00, 50000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-03-01 22:08:25', '2026-05-02 22:08:25', 16.012120, 108.188250, 16.016632, 108.171322, 1, 'sender', 'fast', 'DN'),
(289, 'DN-683151', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 17', '0385665176', 'Laptop Dell', 'Điện Bàn, Quảng Nam', 'Tam Kỳ, Quảng Nam', 1.50, 60000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:25', '2026-05-02 22:08:25', 16.065082, 108.217615, 16.021295, 108.196176, 1, 'sender', 'standard', 'DN'),
(290, 'DN-683152', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 18', '0488000811', 'Hải sản sấy khô', 'Ngũ Hành Sơn, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 270000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 23:02:36', 16.029371, 108.199375, 16.034664, 108.197633, 1, 'sender', 'standard', 'DN'),
(291, 'DN-683153', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 19', '0646526968', 'Hải sản sấy khô', 'Hội An, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 240000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-24 22:08:25', '2026-05-02 22:08:25', 16.023769, 108.192537, 16.032148, 108.229115, 1, 'sender', 'standard', 'DN'),
(292, 'DN-683154', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 20', '0383516922', 'Mỹ phẩm', 'Lăng Cô, Thừa Thiên Huế', 'Bình Sơn, Quảng Ngãi', 1.50, 40000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:25', '2026-05-02 22:08:25', 16.037981, 108.233098, 16.069719, 108.208099, 1, 'sender', 'fast', 'DN'),
(293, 'DN-683155', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 21', '0411397446', 'Mỹ phẩm', 'Liên Chiểu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 460000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-06 22:08:27', '2026-05-02 22:08:27', 16.068667, 108.236322, 16.018880, 108.167859, 1, 'sender', 'standard', 'DN'),
(294, 'DN-683156', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 22', '0564005296', 'Sách giáo khoa', 'Liên Chiểu, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 90000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-25 22:08:26', '2026-05-02 22:08:26', 16.026344, 108.199055, 16.010527, 108.211204, 1, 'sender', 'standard', 'DN'),
(295, 'DN-683157', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 23', '0386632128', 'Sách giáo khoa', 'Ngũ Hành Sơn, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 130000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:25', 16.075586, 108.189887, 16.030473, 108.233929, 1, 'sender', 'standard', 'DN'),
(296, 'DN-683158', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 24', '0642461956', 'Đặc sản Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 10000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-04 22:08:27', '2026-05-02 22:08:27', 16.027927, 108.241521, 16.029851, 108.176052, 1, 'sender', 'standard', 'DN'),
(297, 'DN-683159', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 25', '0328266358', 'Hải sản sấy khô', 'Liên Chiểu, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 390000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-20 22:08:27', '2026-05-02 22:08:27', 16.012776, 108.180848, 16.014740, 108.168466, 1, 'sender', 'standard', 'DN'),
(298, 'DN-683160', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 26', '0400433369', 'Linh kiện điện tử', 'Bình Sơn, Quảng Ngãi', 'Phú Lộc, Thừa Thiên Huế', 1.50, 0.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-15 22:08:27', '2026-05-02 22:08:27', 16.082626, 108.194005, 16.049730, 108.181558, 1, 'sender', 'fast', 'DN'),
(299, 'DN-683161', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 27', '0995843860', 'Hải sản sấy khô', 'Thanh Khê, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 480000.00, 20000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-12 22:08:25', '2026-05-02 22:08:25', 16.070205, 108.214830, 16.040315, 108.203237, 1, 'sender', 'fast', 'DN'),
(300, 'DN-683162', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 28', '0802291999', 'Mỹ phẩm', 'Phú Lộc, Thừa Thiên Huế', 'Phú Lộc, Thừa Thiên Huế', 1.50, 150000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-19 22:08:25', '2026-05-02 22:08:25', 16.031046, 108.171687, 16.069887, 108.183170, 1, 'sender', 'fast', 'DN'),
(301, 'DN-683163', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 29', '0131146472', 'Đặc sản Đà Nẵng', 'Hải Châu, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 440000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 23:02:36', 16.042831, 108.185803, 16.049822, 108.205539, 1, 'sender', 'standard', 'DN'),
(302, 'DN-683164', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 30', '0135718991', 'Linh kiện điện tử', 'Hải Châu, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 200000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 16.017905, 108.190698, 16.065714, 108.204148, 1, 'sender', 'standard', 'DN'),
(303, 'DN-683165', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 31', '0866973293', 'Linh kiện điện tử', 'Bình Sơn, Quảng Ngãi', 'Liên Chiểu, Đà Nẵng', 1.50, 150000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-25 22:08:26', '2026-05-02 22:08:26', 16.007880, 108.170394, 16.017347, 108.196484, 1, 'sender', 'fast', 'DN'),
(304, 'DN-683166', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 32', '0815266467', 'Sách giáo khoa', 'Ngũ Hành Sơn, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 490000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-17 22:08:25', '2026-05-02 22:08:25', 16.075010, 108.232851, 16.063845, 108.185635, 1, 'sender', 'standard', 'DN'),
(305, 'DN-683167', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 33', '0597116839', 'Laptop Dell', 'Phú Lộc, Thừa Thiên Huế', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 370000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.043848, 108.240516, 16.012034, 108.200856, 1, 'sender', 'fast', 'DN'),
(306, 'DN-683168', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 34', '0111556380', 'Mỹ phẩm', 'Hội An, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 360000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.038660, 108.224225, 16.010542, 108.204736, 1, 'sender', 'fast', 'DN'),
(307, 'DN-683169', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 35', '0988173613', 'Mỹ phẩm', 'Bình Sơn, Quảng Ngãi', 'Phú Lộc, Thừa Thiên Huế', 1.50, 50000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-19 22:08:25', '2026-05-02 22:08:25', 16.086508, 108.210386, 16.049172, 108.220342, 1, 'sender', 'standard', 'DN'),
(308, 'DN-683170', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 36', '0419600413', 'Bàn phím cơ', 'Sơn Trà, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 480000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.050178, 108.185928, 16.034090, 108.212116, 1, 'sender', 'fast', 'DN'),
(309, 'DN-683171', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 37', '0288219200', 'Đặc sản Đà Nẵng', 'Hội An, Quảng Nam', 'Sơn Trà, Đà Nẵng', 1.50, 140000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:27', '2026-05-02 22:08:27', 16.026783, 108.215976, 16.044928, 108.175998, 1, 'sender', 'standard', 'DN'),
(310, 'DN-683172', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 38', '0131705805', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 250000.00, 30000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-03-17 22:08:27', '2026-05-02 22:08:27', 16.062590, 108.224225, 16.009858, 108.208153, 1, 'sender', 'standard', 'DN'),
(311, 'DN-683173', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 39', '0239643004', 'Bàn phím cơ', 'Điện Bàn, Quảng Nam', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 70000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-05 22:08:25', '2026-05-02 22:08:25', 16.034010, 108.197495, 16.083380, 108.170223, 1, 'sender', 'standard', 'DN'),
(312, 'DN-683174', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 40', '0593858742', 'Sách giáo khoa', 'Phú Lộc, Thừa Thiên Huế', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 360000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-30 22:08:25', '2026-05-02 22:08:25', 16.043200, 108.181673, 16.065901, 108.235288, 1, 'sender', 'fast', 'DN'),
(313, 'DN-683175', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 41', '0804225747', 'Đặc sản Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 80000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 16.029614, 108.194431, 16.062092, 108.242131, 1, 'sender', 'standard', 'DN'),
(314, 'DN-683176', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 42', '0709984300', 'Bàn phím cơ', 'Hội An, Quảng Nam', 'Phú Lộc, Thừa Thiên Huế', 1.50, 300000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-18 22:08:27', '2026-05-02 22:08:27', 16.061090, 108.198496, 16.013022, 108.242475, 1, 'sender', 'standard', 'DN'),
(315, 'DN-683177', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 43', '0734076404', 'Laptop Dell', 'Lăng Cô, Thừa Thiên Huế', 'Hòa Vang, Đà Nẵng', 1.50, 110000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-07 22:08:26', '2026-05-02 22:08:26', 16.077948, 108.217632, 16.039571, 108.226876, 1, 'sender', 'standard', 'DN'),
(316, 'DN-683178', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 44', '0843835688', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 180000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-17 22:08:27', '2026-05-02 22:08:27', 16.018377, 108.178574, 16.076351, 108.176637, 1, 'sender', 'standard', 'DN'),
(317, 'DN-683179', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 45', '0901941934', 'Hải sản sấy khô', 'Điện Bàn, Quảng Nam', 'Lăng Cô, Thừa Thiên Huế', 1.50, 270000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-13 22:08:26', '2026-05-02 22:08:26', 16.042517, 108.238209, 16.017963, 108.208274, 1, 'sender', 'fast', 'DN'),
(318, 'DN-683180', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 46', '0365315483', 'Quần áo thời trang', 'Phú Lộc, Thừa Thiên Huế', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 50000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:27', '2026-05-02 22:08:27', 16.056705, 108.227115, 16.043008, 108.213492, 1, 'sender', 'standard', 'DN'),
(319, 'DN-683181', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 47', '0428161642', 'Đặc sản Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 30000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-27 22:08:25', '2026-05-02 22:08:25', 16.040536, 108.212065, 16.085676, 108.215156, 1, 'sender', 'fast', 'DN'),
(320, 'DN-683182', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 48', '0530033615', 'Hải sản sấy khô', 'Hòa Vang, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 270000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 16.038514, 108.180360, 16.038916, 108.237637, 1, 'sender', 'standard', 'DN'),
(321, 'DN-683183', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 49', '0868711031', 'Linh kiện điện tử', 'Sơn Trà, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 90000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:25', 16.034755, 108.209333, 16.042796, 108.184468, 1, 'sender', 'fast', 'DN'),
(322, 'DN-683184', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 50', '0696450515', 'Quần áo thời trang', 'Cẩm Lệ, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 310000.00, 20000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-03-01 22:08:25', '2026-05-02 22:08:25', 16.014080, 108.208274, 16.009003, 108.191905, 1, 'sender', 'fast', 'DN'),
(323, 'DN-683185', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 51', '0692224663', 'Bàn phím cơ', 'Tam Kỳ, Quảng Nam', 'Bình Sơn, Quảng Ngãi', 1.50, 370000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:26', '2026-05-02 22:08:26', 16.028795, 108.177866, 16.029341, 108.209973, 1, 'sender', 'fast', 'DN'),
(324, 'DN-683186', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 52', '0645297053', 'Mỹ phẩm', 'Điện Bàn, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 190000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-08 22:08:27', '2026-05-02 22:08:27', 16.066212, 108.233737, 16.064592, 108.228966, 1, 'sender', 'standard', 'DN'),
(325, 'DN-683187', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 53', '0138656798', 'Hải sản sấy khô', 'Bình Sơn, Quảng Ngãi', 'Bình Sơn, Quảng Ngãi', 1.50, 260000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:25', 16.077375, 108.215245, 16.035392, 108.187021, 1, 'sender', 'standard', 'DN'),
(326, 'DN-683188', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 54', '0509857551', 'Hải sản sấy khô', 'Điện Bàn, Quảng Nam', 'Hải Châu, Đà Nẵng', 1.50, 270000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.061695, 108.208487, 16.073852, 108.236443, 1, 'sender', 'standard', 'DN'),
(327, 'DN-683189', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 55', '0908557053', 'Linh kiện điện tử', 'Ngũ Hành Sơn, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 270000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-01-23 22:08:25', '2026-05-02 22:08:25', 16.015188, 108.229110, 16.049015, 108.173514, 1, 'sender', 'fast', 'DN'),
(328, 'DN-683190', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 56', '0363652759', 'Sách giáo khoa', 'Ngũ Hành Sơn, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 250000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 16.078414, 108.210892, 16.036631, 108.201349, 1, 'sender', 'standard', 'DN'),
(329, 'DN-683191', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 57', '0323633913', 'Sách giáo khoa', 'Cẩm Lệ, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 330000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-28 22:08:25', '2026-05-02 22:08:25', 16.032636, 108.206102, 16.025309, 108.238559, 1, 'sender', 'fast', 'DN'),
(330, 'DN-683192', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 58', '0939280452', 'Đặc sản Đà Nẵng', 'Thanh Khê, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 260000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 16.028353, 108.200942, 16.032460, 108.242739, 1, 'sender', 'fast', 'DN'),
(331, 'DN-683193', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 59', '0772583119', 'Bàn phím cơ', 'Ngũ Hành Sơn, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 110000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 16.044896, 108.221377, 16.048607, 108.238988, 1, 'sender', 'standard', 'DN'),
(332, 'DN-683194', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 60', '0811517113', 'Hải sản sấy khô', 'Cẩm Lệ, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 460000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 23:02:36', 16.042333, 108.217204, 16.007882, 108.184664, 1, 'sender', 'standard', 'DN'),
(333, 'DN-683195', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 61', '0913884277', 'Mỹ phẩm', 'Bình Sơn, Quảng Ngãi', 'Hòa Vang, Đà Nẵng', 1.50, 110000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 16.061002, 108.226230, 16.070955, 108.169839, 1, 'sender', 'fast', 'DN'),
(334, 'DN-683196', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 62', '0326784963', 'Hải sản sấy khô', 'Phú Lộc, Thừa Thiên Huế', 'Cẩm Lệ, Đà Nẵng', 1.50, 300000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 16.075410, 108.197630, 16.083977, 108.177060, 1, 'sender', 'fast', 'DN'),
(335, 'DN-683197', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 63', '0390211804', 'Sách giáo khoa', 'Phú Lộc, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 460000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-21 22:08:27', '2026-05-02 22:08:27', 16.062369, 108.188368, 16.086443, 108.245161, 1, 'sender', 'standard', 'DN'),
(336, 'DN-683198', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 64', '0632436575', 'Quần áo thời trang', 'Điện Bàn, Quảng Nam', 'Điện Bàn, Quảng Nam', 1.50, 180000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-13 22:08:26', '2026-05-02 22:08:26', 16.060933, 108.167887, 16.032499, 108.215441, 1, 'sender', 'fast', 'DN'),
(337, 'DN-683199', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 65', '0887689716', 'Laptop Dell', 'Hòa Vang, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 30000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-10 22:08:27', '2026-05-02 22:08:27', 16.062680, 108.174874, 16.050529, 108.177828, 1, 'sender', 'standard', 'DN'),
(338, 'DN-683200', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 66', '0867755119', 'Laptop Dell', 'Thanh Khê, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 410000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-30 22:08:27', '2026-05-02 22:08:27', 16.010108, 108.171087, 16.066739, 108.239594, 1, 'sender', 'standard', 'DN'),
(339, 'DN-683201', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 67', '0302802955', 'Mỹ phẩm', 'Điện Bàn, Quảng Nam', 'Thanh Khê, Đà Nẵng', 1.50, 160000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 16.021605, 108.226938, 16.042412, 108.191435, 1, 'sender', 'standard', 'DN'),
(340, 'DN-683202', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 68', '0961047734', 'Đặc sản Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 400000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-01-17 22:08:26', '2026-05-02 22:08:26', 16.046083, 108.211075, 16.055631, 108.241730, 1, 'sender', 'standard', 'DN'),
(341, 'DN-683203', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 69', '0120639707', 'Quần áo thời trang', 'Sơn Trà, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 90000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-07 22:08:27', '2026-05-02 22:08:27', 16.033480, 108.231652, 16.073865, 108.189346, 1, 'sender', 'standard', 'DN'),
(342, 'DN-683204', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 70', '0586307131', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Điện Bàn, Quảng Nam', 1.50, 440000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-15 22:08:27', '2026-05-02 22:08:27', 16.056225, 108.235150, 16.061009, 108.225804, 1, 'sender', 'fast', 'DN'),
(343, 'DN-683205', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 71', '0708923449', 'Linh kiện điện tử', 'Liên Chiểu, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 160000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 16.034419, 108.228913, 16.078046, 108.169450, 1, 'sender', 'standard', 'DN'),
(344, 'DN-683206', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 72', '0388067187', 'Bàn phím cơ', 'Hòa Vang, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 210000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-27 22:08:26', '2026-05-02 22:08:26', 16.026420, 108.181889, 16.035742, 108.194839, 1, 'sender', 'fast', 'DN'),
(345, 'DN-683207', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 73', '0980961351', 'Quần áo thời trang', 'Cẩm Lệ, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 490000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-03-27 22:08:27', '2026-05-02 22:08:27', 16.023499, 108.183689, 16.079284, 108.204850, 1, 'sender', 'standard', 'DN'),
(346, 'DN-683208', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 74', '0967557759', 'Quần áo thời trang', 'Bình Sơn, Quảng Ngãi', 'Hải Châu, Đà Nẵng', 1.50, 110000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 16.042337, 108.235304, 16.069266, 108.242978, 1, 'sender', 'fast', 'DN'),
(347, 'DN-683209', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 75', '0252118835', 'Sách giáo khoa', 'Lăng Cô, Thừa Thiên Huế', 'Hòa Vang, Đà Nẵng', 1.50, 260000.00, 40000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-21 22:08:26', '2026-05-02 22:08:26', 16.047506, 108.167400, 16.032084, 108.189516, 1, 'sender', 'standard', 'DN'),
(348, 'DN-683210', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 76', '0595496388', 'Bàn phím cơ', 'Thanh Khê, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 450000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-25 22:08:26', '2026-05-02 22:08:26', 16.078817, 108.233442, 16.048060, 108.168484, 1, 'sender', 'fast', 'DN'),
(349, 'DN-683211', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 77', '0749036353', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 270000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-11 22:08:25', '2026-05-02 22:08:25', 16.023048, 108.199111, 16.035457, 108.214041, 1, 'sender', 'standard', 'DN'),
(350, 'DN-683212', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 78', '0402362931', 'Bàn phím cơ', 'Sơn Trà, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 150000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-04 22:08:27', '2026-05-02 22:08:27', 16.052912, 108.207786, 16.018728, 108.211606, 1, 'sender', 'standard', 'DN'),
(351, 'DN-683213', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 79', '0881768071', 'Laptop Dell', 'Thanh Khê, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 490000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-05-02 22:08:27', '2026-05-02 23:02:36', 16.030576, 108.212182, 16.032655, 108.239777, 1, 'sender', 'standard', 'DN'),
(352, 'DN-683214', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 80', '0724581853', 'Bàn phím cơ', 'Phú Lộc, Thừa Thiên Huế', 'Điện Bàn, Quảng Nam', 1.50, 410000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-28 22:08:25', '2026-05-02 22:08:25', 16.032459, 108.243910, 16.014165, 108.235984, 1, 'sender', 'standard', 'DN'),
(353, 'DN-683215', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 81', '0186093580', 'Laptop Dell', 'Phú Lộc, Thừa Thiên Huế', 'Hải Châu, Đà Nẵng', 1.50, 280000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-23 22:08:27', '2026-05-02 23:02:36', 16.086650, 108.214126, 16.085347, 108.230755, 1, 'sender', 'fast', 'DN'),
(354, 'DN-683216', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 82', '0851036132', 'Quần áo thời trang', 'Ngũ Hành Sơn, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 30000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-10 22:08:26', '2026-05-02 22:08:26', 16.033035, 108.239193, 16.052194, 108.230552, 1, 'sender', 'fast', 'DN'),
(355, 'DN-683217', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 83', '0566582600', 'Quần áo thời trang', 'Phú Lộc, Thừa Thiên Huế', 'Hòa Vang, Đà Nẵng', 1.50, 380000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-27 22:08:27', '2026-05-02 22:08:27', 16.063328, 108.231872, 16.028190, 108.206323, 1, 'sender', 'standard', 'DN'),
(356, 'DN-683218', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 84', '0190092279', 'Bàn phím cơ', 'Tam Kỳ, Quảng Nam', 'Sơn Trà, Đà Nẵng', 1.50, 140000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-15 22:08:25', '2026-05-02 22:08:25', 16.024192, 108.226839, 16.039366, 108.217998, 1, 'sender', 'fast', 'DN'),
(357, 'DN-683219', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 85', '0181528906', 'Mỹ phẩm', 'Điện Bàn, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 50000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.020555, 108.190448, 16.035048, 108.196664, 1, 'sender', 'standard', 'DN'),
(358, 'DN-683220', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 86', '0671640121', 'Sách giáo khoa', 'Hòa Vang, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 260000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 16.083274, 108.188719, 16.010114, 108.169820, 1, 'sender', 'standard', 'DN'),
(359, 'DN-683221', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 87', '0511012544', 'Bàn phím cơ', 'Lăng Cô, Thừa Thiên Huế', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 460000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-29 22:08:25', '2026-05-02 22:08:25', 16.053138, 108.170783, 16.063080, 108.237263, 1, 'sender', 'standard', 'DN'),
(360, 'DN-683222', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 88', '0121285154', 'Laptop Dell', 'Liên Chiểu, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 10000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 16.008894, 108.223053, 16.080216, 108.174941, 1, 'sender', 'standard', 'DN'),
(361, 'DN-683223', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 89', '0353045530', 'Bàn phím cơ', 'Cẩm Lệ, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 210000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:25', '2026-05-02 22:08:25', 16.024843, 108.243122, 16.072474, 108.245621, 1, 'sender', 'standard', 'DN'),
(362, 'DN-683224', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 90', '0813128962', 'Sách giáo khoa', 'Phú Lộc, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 40000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-30 22:08:27', '2026-05-02 22:08:27', 16.030223, 108.203286, 16.025616, 108.186401, 1, 'sender', 'standard', 'DN'),
(363, 'DN-683225', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 91', '0771400020', 'Quần áo thời trang', 'Hòa Vang, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 260000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:26', 16.029130, 108.233264, 16.050602, 108.182272, 1, 'sender', 'standard', 'DN'),
(364, 'DN-683226', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 92', '0372982388', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Lăng Cô, Thừa Thiên Huế', 1.50, 490000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.053710, 108.195852, 16.051012, 108.185054, 1, 'sender', 'standard', 'DN'),
(365, 'DN-683227', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 93', '0822040679', 'Hải sản sấy khô', 'Tam Kỳ, Quảng Nam', 'Bình Sơn, Quảng Ngãi', 1.50, 340000.00, 20000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-18 22:08:26', '2026-05-02 22:08:26', 16.064151, 108.175689, 16.084633, 108.170893, 1, 'sender', 'fast', 'DN'),
(366, 'DN-683228', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 94', '0145647170', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 410000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-30 22:08:25', '2026-05-02 22:08:25', 16.057371, 108.201001, 16.032962, 108.223647, 1, 'sender', 'standard', 'DN'),
(367, 'DN-683229', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 95', '0841212939', 'Hải sản sấy khô', 'Phú Lộc, Thừa Thiên Huế', 'Cẩm Lệ, Đà Nẵng', 1.50, 50000.00, 40000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.051299, 108.172621, 16.030203, 108.185711, 1, 'sender', 'fast', 'DN'),
(368, 'DN-683230', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 96', '0205474497', 'Bàn phím cơ', 'Phú Lộc, Thừa Thiên Huế', 'Tam Kỳ, Quảng Nam', 1.50, 460000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-22 22:08:25', '2026-05-02 22:08:25', 16.026325, 108.167366, 16.010675, 108.201635, 1, 'sender', 'standard', 'DN'),
(369, 'DN-683231', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 97', '0779627166', 'Sách giáo khoa', 'Sơn Trà, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 200000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-01 22:08:26', '2026-05-02 22:08:26', 16.078668, 108.182396, 16.068516, 108.198487, 1, 'sender', 'standard', 'DN'),
(370, 'DN-683232', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 98', '0658309192', 'Đặc sản Đà Nẵng', 'Tam Kỳ, Quảng Nam', 'Bình Sơn, Quảng Ngãi', 1.50, 130000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-28 22:08:26', '2026-05-02 22:08:26', 16.046899, 108.213847, 16.083901, 108.184498, 1, 'sender', 'standard', 'DN'),
(371, 'DN-683233', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 99', '0148789653', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 310000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-01 22:08:25', '2026-05-02 22:08:25', 16.054536, 108.226923, 16.030653, 108.223198, 1, 'sender', 'standard', 'DN'),
(372, 'DN-683234', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 100', '0650798292', 'Mỹ phẩm', 'Liên Chiểu, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 140000.00, 20000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-05 22:08:27', '2026-05-02 22:08:27', 16.054788, 108.237870, 16.061215, 108.189532, 1, 'sender', 'standard', 'DN'),
(373, 'DN-683235', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 101', '0914694699', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Cẩm Lệ, Đà Nẵng', 1.50, 420000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-28 22:08:27', '2026-05-02 22:08:27', 16.080073, 108.202910, 16.084457, 108.176736, 1, 'sender', 'fast', 'DN'),
(374, 'DN-683236', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 102', '0858162056', 'Bàn phím cơ', 'Phú Lộc, Thừa Thiên Huế', 'Lăng Cô, Thừa Thiên Huế', 1.50, 220000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-23 22:08:25', '2026-05-02 22:08:25', 16.047682, 108.178139, 16.050558, 108.218425, 1, 'sender', 'standard', 'DN'),
(375, 'DN-683237', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 103', '0465556683', 'Hải sản sấy khô', 'Thanh Khê, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 300000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-06 22:08:27', '2026-05-02 22:08:27', 16.039088, 108.177408, 16.042903, 108.195104, 1, 'sender', 'standard', 'DN'),
(376, 'DN-683238', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 104', '0334199147', 'Đặc sản Đà Nẵng', 'Hải Châu, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 350000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:27', '2026-05-02 22:08:27', 16.033122, 108.236879, 16.062669, 108.204445, 1, 'sender', 'fast', 'DN'),
(377, 'DN-683239', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 105', '0701848774', 'Bàn phím cơ', 'Tam Kỳ, Quảng Nam', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 310000.00, 40000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.055833, 108.204828, 16.015994, 108.213979, 1, 'sender', 'fast', 'DN'),
(378, 'DN-683240', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 106', '0115584015', 'Bàn phím cơ', 'Tam Kỳ, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 30000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-13 22:08:25', '2026-05-02 22:08:25', 16.007800, 108.197709, 16.064182, 108.174395, 1, 'sender', 'fast', 'DN'),
(379, 'DN-683241', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 107', '0900674466', 'Sách giáo khoa', 'Hải Châu, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 250000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.080852, 108.199208, 16.024447, 108.202944, 1, 'sender', 'standard', 'DN'),
(380, 'DN-683242', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 108', '0470708989', 'Bàn phím cơ', 'Thanh Khê, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 430000.00, 50000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-17 22:08:27', '2026-05-02 22:08:27', 16.015273, 108.223848, 16.023996, 108.243884, 1, 'sender', 'standard', 'DN'),
(381, 'DN-683243', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 109', '0461011955', 'Laptop Dell', 'Phú Lộc, Thừa Thiên Huế', 'Cẩm Lệ, Đà Nẵng', 1.50, 130000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-08 22:08:26', '2026-05-02 22:08:26', 16.032088, 108.184019, 16.061870, 108.177530, 1, 'sender', 'standard', 'DN'),
(382, 'DN-683244', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 110', '0563520363', 'Hải sản sấy khô', 'Thanh Khê, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 50000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-05 22:08:27', '2026-05-02 22:08:27', 16.012096, 108.227892, 16.055937, 108.180012, 1, 'sender', 'standard', 'DN'),
(383, 'DN-683245', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 111', '0991076685', 'Mỹ phẩm', 'Sơn Trà, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 250000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.050158, 108.202598, 16.069097, 108.196135, 1, 'sender', 'standard', 'DN'),
(384, 'DN-683246', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 112', '0824377377', 'Hải sản sấy khô', 'Điện Bàn, Quảng Nam', 'Tam Kỳ, Quảng Nam', 1.50, 130000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-11 22:08:25', '2026-05-02 22:08:25', 16.011558, 108.233457, 16.080812, 108.171827, 1, 'sender', 'standard', 'DN'),
(385, 'DN-683247', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 113', '0984103430', 'Laptop Dell', 'Sơn Trà, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 350000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-31 22:08:26', '2026-05-02 22:08:26', 16.032992, 108.224677, 16.057800, 108.179536, 1, 'sender', 'fast', 'DN'),
(386, 'DN-683248', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 114', '0869251362', 'Quần áo thời trang', 'Điện Bàn, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 370000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-17 22:08:26', '2026-05-02 22:08:26', 16.026764, 108.189467, 16.058428, 108.181972, 1, 'sender', 'standard', 'DN'),
(387, 'DN-683249', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 115', '0170865528', 'Đặc sản Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 480000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:25', '2026-05-02 22:08:25', 16.073715, 108.225290, 16.032327, 108.194734, 1, 'sender', 'fast', 'DN'),
(388, 'DN-683250', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 116', '0809990446', 'Linh kiện điện tử', 'Hải Châu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 130000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-07 22:08:27', '2026-05-02 22:08:27', 16.054080, 108.239020, 16.054940, 108.240031, 1, 'sender', 'standard', 'DN'),
(389, 'DN-683251', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 117', '0209242262', 'Sách giáo khoa', 'Hải Châu, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 110000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:27', '2026-05-02 22:08:27', 16.007282, 108.182433, 16.021567, 108.245467, 1, 'sender', 'standard', 'DN'),
(390, 'DN-683252', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 118', '0841871821', 'Quần áo thời trang', 'Hội An, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 480000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-23 22:08:27', '2026-05-02 22:08:27', 16.079387, 108.185558, 16.030563, 108.201421, 1, 'sender', 'standard', 'DN'),
(391, 'DN-683253', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 119', '0287531146', 'Quần áo thời trang', 'Điện Bàn, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 160000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-01 22:08:25', '2026-05-02 22:08:25', 16.080619, 108.189603, 16.071294, 108.169961, 1, 'sender', 'standard', 'DN'),
(392, 'DN-683254', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 120', '0380136805', 'Bàn phím cơ', 'Liên Chiểu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 0.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2025-12-28 22:08:27', '2026-05-02 22:08:27', 16.022372, 108.202017, 16.033442, 108.223753, 1, 'sender', 'standard', 'DN'),
(393, 'DN-683255', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 121', '0159864295', 'Laptop Dell', 'Hòa Vang, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 430000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-23 22:08:25', '2026-05-02 22:08:25', 16.012410, 108.178257, 16.063050, 108.182227, 1, 'sender', 'standard', 'DN'),
(394, 'DN-683256', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 122', '0208533034', 'Sách giáo khoa', 'Ngũ Hành Sơn, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 100000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-03 22:08:27', '2026-05-02 22:08:27', 16.050175, 108.169780, 16.045716, 108.211052, 1, 'sender', 'fast', 'DN'),
(395, 'DN-683257', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 123', '0901065930', 'Hải sản sấy khô', 'Hội An, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 240000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.048922, 108.193974, 16.035615, 108.237936, 1, 'sender', 'standard', 'DN'),
(396, 'DN-683258', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 124', '0713728761', 'Linh kiện điện tử', 'Cẩm Lệ, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 240000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-07 22:08:26', '2026-05-02 22:08:26', 16.014871, 108.172223, 16.029250, 108.194559, 1, 'sender', 'standard', 'DN'),
(397, 'DN-683259', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 125', '0790053656', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Phú Lộc, Thừa Thiên Huế', 1.50, 90000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-05 22:08:26', '2026-05-02 22:08:26', 16.064500, 108.189198, 16.071029, 108.214378, 1, 'sender', 'standard', 'DN'),
(398, 'DN-683260', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 126', '0376932940', 'Mỹ phẩm', 'Phú Lộc, Thừa Thiên Huế', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 340000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-01 22:08:27', '2026-05-02 22:08:27', 16.049168, 108.244447, 16.066360, 108.243682, 1, 'sender', 'fast', 'DN'),
(399, 'DN-683261', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 127', '0534716253', 'Hải sản sấy khô', 'Hòa Vang, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 220000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 16.068897, 108.169558, 16.060370, 108.181639, 1, 'sender', 'standard', 'DN'),
(400, 'DN-683262', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 128', '0641684150', 'Đặc sản Đà Nẵng', 'Tam Kỳ, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 70000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 23:15:44', 16.075230, 108.233456, 16.041913, 108.242911, 1, 'sender', 'fast', 'DN'),
(401, 'DN-683263', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 129', '0910366985', 'Quần áo thời trang', 'Ngũ Hành Sơn, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 280000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-21 22:08:27', '2026-05-02 22:08:27', 16.013717, 108.243193, 16.035296, 108.185098, 1, 'sender', 'standard', 'DN'),
(402, 'DN-683264', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 130', '0190262912', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 30000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-02 22:08:27', '2026-05-02 22:08:27', 16.067250, 108.206737, 16.046752, 108.187619, 1, 'sender', 'standard', 'DN'),
(403, 'DN-683265', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 131', '0343365792', 'Đặc sản Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 80000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-07 22:08:26', '2026-05-02 22:08:26', 16.081505, 108.226272, 16.049610, 108.212562, 1, 'sender', 'standard', 'DN'),
(404, 'DN-683266', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 132', '0847083635', 'Mỹ phẩm', 'Phú Lộc, Thừa Thiên Huế', 'Hội An, Quảng Nam', 1.50, 210000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-18 22:08:26', '2026-05-02 22:08:26', 16.049783, 108.213098, 16.084492, 108.222227, 1, 'sender', 'standard', 'DN'),
(405, 'DN-683267', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 133', '0885958431', 'Linh kiện điện tử', 'Tam Kỳ, Quảng Nam', 'Phú Lộc, Thừa Thiên Huế', 1.50, 90000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-01 22:08:26', '2026-05-02 22:08:26', 16.049188, 108.225087, 16.044106, 108.180223, 1, 'sender', 'fast', 'DN'),
(406, 'DN-683268', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 134', '0225550371', 'Sách giáo khoa', 'Thanh Khê, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 60000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 16.045612, 108.179256, 16.040432, 108.179691, 1, 'sender', 'standard', 'DN'),
(407, 'DN-683269', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 135', '0648090356', 'Sách giáo khoa', 'Điện Bàn, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 420000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-21 22:08:27', '2026-05-02 22:08:27', 16.014485, 108.206379, 16.022551, 108.223924, 1, 'sender', 'fast', 'DN'),
(408, 'DN-683270', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 136', '0846420140', 'Sách giáo khoa', 'Hòa Vang, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 0.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-28 22:08:26', '2026-05-02 23:15:46', 16.033742, 108.168107, 16.054428, 108.207030, 1, 'sender', 'fast', 'DN'),
(409, 'DN-683271', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 137', '0858375687', 'Sách giáo khoa', 'Lăng Cô, Thừa Thiên Huế', 'Bình Sơn, Quảng Ngãi', 1.50, 290000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-17 22:08:26', '2026-05-02 22:08:26', 16.048209, 108.200400, 16.031357, 108.201614, 1, 'sender', 'standard', 'DN'),
(410, 'DN-683272', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 138', '0555044701', 'Mỹ phẩm', 'Hòa Vang, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 130000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-15 22:08:26', '2026-05-02 22:08:26', 16.054619, 108.174849, 16.040581, 108.205295, 1, 'sender', 'standard', 'DN'),
(411, 'DN-683273', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 139', '0853770439', 'Linh kiện điện tử', 'Lăng Cô, Thừa Thiên Huế', 'Phú Lộc, Thừa Thiên Huế', 1.50, 460000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:25', 16.068678, 108.208800, 16.017794, 108.176306, 1, 'sender', 'standard', 'DN'),
(412, 'DN-683274', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 140', '0526462111', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Thanh Khê, Đà Nẵng', 1.50, 450000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-01-15 22:08:27', '2026-05-02 22:08:27', 16.028779, 108.204300, 16.043574, 108.229507, 1, 'sender', 'standard', 'DN'),
(413, 'DN-683275', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 141', '0914788529', 'Quần áo thời trang', 'Tam Kỳ, Quảng Nam', 'Phú Lộc, Thừa Thiên Huế', 1.50, 440000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-27 22:08:27', '2026-05-02 22:08:27', 16.032029, 108.190987, 16.056279, 108.185901, 1, 'sender', 'standard', 'DN'),
(414, 'DN-683276', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 142', '0286595569', 'Laptop Dell', 'Bình Sơn, Quảng Ngãi', 'Bình Sơn, Quảng Ngãi', 1.50, 330000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-21 22:08:26', '2026-05-02 22:08:26', 16.029010, 108.168007, 16.049530, 108.192896, 1, 'sender', 'fast', 'DN'),
(415, 'DN-683277', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 143', '0156520126', 'Đặc sản Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 120000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 16.008624, 108.198638, 16.056110, 108.170278, 1, 'sender', 'fast', 'DN'),
(416, 'DN-683278', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 144', '0695082895', 'Bàn phím cơ', 'Sơn Trà, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 470000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.018368, 108.227913, 16.061964, 108.231340, 1, 'sender', 'standard', 'DN'),
(417, 'DN-683279', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 145', '0972153423', 'Laptop Dell', 'Điện Bàn, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 340000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:27', '2026-05-02 22:08:27', 16.068421, 108.189507, 16.086291, 108.172109, 1, 'sender', 'standard', 'DN'),
(418, 'DN-683280', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 146', '0195463040', 'Laptop Dell', 'Sơn Trà, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 150000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-28 22:08:26', '2026-05-02 22:08:26', 16.053584, 108.218420, 16.018253, 108.174119, 1, 'sender', 'standard', 'DN'),
(419, 'DN-683281', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 147', '0893708967', 'Quần áo thời trang', 'Ngũ Hành Sơn, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 430000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 16.053247, 108.236580, 16.008771, 108.234083, 1, 'sender', 'fast', 'DN');
INSERT INTO `shipments` (`id`, `tracking_code`, `customer_id`, `sender_name`, `sender_phone`, `receiver_name`, `receiver_phone`, `item_name`, `pickup_address`, `delivery_address`, `weight_kg`, `cod_amount`, `shipping_fee`, `payment_method`, `status`, `failure_note`, `fail_count`, `scheduled_date`, `current_location`, `created_at`, `updated_at`, `pickup_lat`, `pickup_lng`, `delivery_lat`, `delivery_lng`, `quantity`, `pickup_option`, `service_type`, `region_id`) VALUES
(420, 'DN-683282', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 148', '0534580492', 'Quần áo thời trang', 'Hòa Vang, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 90000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 16.008026, 108.216832, 16.079464, 108.183853, 1, 'sender', 'standard', 'DN'),
(421, 'DN-683283', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 149', '0363487765', 'Hải sản sấy khô', 'Ngũ Hành Sơn, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 40000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.080106, 108.203062, 16.042069, 108.225275, 1, 'sender', 'fast', 'DN'),
(422, 'DN-705099', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 0', '0113362319', 'Đặc sản Đà Nẵng', 'Hòa Vang, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 250000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-04 22:08:26', '2026-05-02 22:08:26', 16.036687, 108.226078, 16.038922, 108.220079, 1, 'sender', 'standard', 'DN'),
(423, 'DN-705100', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 1', '0535570860', 'Quần áo thời trang', 'Hải Châu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 300000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-01 22:08:26', '2026-05-02 22:08:26', 16.054815, 108.178358, 16.081075, 108.169891, 1, 'sender', 'fast', 'DN'),
(424, 'DN-705101', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 2', '0661872340', 'Mỹ phẩm', 'Lăng Cô, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 200000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.056664, 108.203184, 16.054958, 108.216183, 1, 'sender', 'standard', 'DN'),
(425, 'DN-705102', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 3', '0378485271', 'Laptop Dell', 'Cẩm Lệ, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 230000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-20 22:08:26', '2026-05-02 22:08:26', 16.014972, 108.184760, 16.077732, 108.237457, 1, 'sender', 'standard', 'DN'),
(426, 'DN-705103', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 4', '0605782693', 'Quần áo thời trang', 'Hải Châu, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 140000.00, 50000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 16.048995, 108.220672, 16.085402, 108.197075, 1, 'sender', 'fast', 'DN'),
(427, 'DN-705104', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 5', '0955155150', 'Hải sản sấy khô', 'Bình Sơn, Quảng Ngãi', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 10000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-18 22:08:27', '2026-05-02 22:08:27', 16.045846, 108.203873, 16.011955, 108.202059, 1, 'sender', 'standard', 'DN'),
(428, 'DN-705105', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 6', '0273731073', 'Sách giáo khoa', 'Thanh Khê, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 210000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-26 22:08:25', '2026-05-02 22:08:25', 16.059096, 108.168164, 16.032383, 108.169379, 1, 'sender', 'standard', 'DN'),
(429, 'DN-705106', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 7', '0139866773', 'Linh kiện điện tử', 'Hải Châu, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 180000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-30 22:08:26', '2026-05-02 22:08:26', 16.015437, 108.244773, 16.026291, 108.182892, 1, 'sender', 'standard', 'DN'),
(430, 'DN-705107', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 8', '0396275604', 'Quần áo thời trang', 'Thanh Khê, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 80000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 16.083496, 108.176067, 16.041258, 108.193936, 1, 'sender', 'standard', 'DN'),
(431, 'DN-705108', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 9', '0429578653', 'Bàn phím cơ', 'Hải Châu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 260000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-23 22:08:25', '2026-05-02 22:08:25', 16.042033, 108.239120, 16.029895, 108.186857, 1, 'sender', 'fast', 'DN'),
(432, 'DN-705109', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 10', '0632425576', 'Đặc sản Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 160000.00, 40000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 23:02:42', 16.033812, 108.191715, 16.077153, 108.207941, 1, 'sender', 'fast', 'DN'),
(433, 'DN-705110', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 11', '0101126043', 'Linh kiện điện tử', 'Ngũ Hành Sơn, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 380000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-07 22:08:26', '2026-05-02 22:08:26', 16.083984, 108.202551, 16.044177, 108.167872, 1, 'sender', 'standard', 'DN'),
(434, 'DN-705111', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 12', '0873041747', 'Linh kiện điện tử', 'Hải Châu, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 160000.00, 20000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 16.070753, 108.233192, 16.028604, 108.192620, 1, 'sender', 'standard', 'DN'),
(435, 'DN-705112', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 13', '0566800312', 'Linh kiện điện tử', 'Thanh Khê, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 10000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-23 22:08:26', '2026-05-02 22:08:26', 16.041992, 108.224412, 16.020388, 108.213045, 1, 'sender', 'standard', 'DN'),
(436, 'DN-705113', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 14', '0522643602', 'Hải sản sấy khô', 'Ngũ Hành Sơn, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 90000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-01-01 22:08:25', '2026-05-02 22:08:25', 16.027993, 108.232406, 16.066100, 108.207297, 1, 'sender', 'standard', 'DN'),
(437, 'DN-705114', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 15', '0707375633', 'Bàn phím cơ', 'Cẩm Lệ, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 380000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.039634, 108.211216, 16.033752, 108.185252, 1, 'sender', 'standard', 'DN'),
(438, 'DN-705115', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 16', '0390197748', 'Sách giáo khoa', 'Hòa Vang, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 360000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.038183, 108.213250, 16.028432, 108.232518, 1, 'sender', 'fast', 'DN'),
(439, 'DN-705116', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 17', '0399305653', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Bình Sơn, Quảng Ngãi', 1.50, 150000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:27', '2026-05-02 22:08:27', 16.040963, 108.170353, 16.075330, 108.177147, 1, 'sender', 'standard', 'DN'),
(440, 'DN-705117', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 18', '0537128803', 'Hải sản sấy khô', 'Thanh Khê, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 30000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-15 22:08:27', '2026-05-02 22:08:27', 16.044390, 108.228684, 16.011573, 108.216568, 1, 'sender', 'fast', 'DN'),
(441, 'DN-705118', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 19', '0398167877', 'Sách giáo khoa', 'Liên Chiểu, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 260000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-17 22:08:27', '2026-05-02 22:08:27', 16.024934, 108.184723, 16.050897, 108.241957, 1, 'sender', 'standard', 'DN'),
(442, 'DN-705119', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 20', '0320209790', 'Hải sản sấy khô', 'Ngũ Hành Sơn, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 250000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-20 22:08:27', '2026-05-02 22:08:27', 16.027131, 108.190225, 16.059793, 108.188412, 1, 'sender', 'standard', 'DN'),
(443, 'DN-705120', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 21', '0429879622', 'Hải sản sấy khô', 'Cẩm Lệ, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 410000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-24 22:08:26', '2026-05-02 22:08:26', 16.081343, 108.231074, 16.052106, 108.209010, 1, 'sender', 'standard', 'DN'),
(444, 'DN-705121', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 22', '0853936127', 'Sách giáo khoa', 'Cẩm Lệ, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 210000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.076687, 108.213815, 16.061028, 108.185397, 1, 'sender', 'standard', 'DN'),
(445, 'DN-705122', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 23', '0538997161', 'Mỹ phẩm', 'Lăng Cô, Thừa Thiên Huế', 'Bình Sơn, Quảng Ngãi', 1.50, 390000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:26', '2026-05-02 22:08:26', 16.040701, 108.225040, 16.048098, 108.194895, 1, 'sender', 'standard', 'DN'),
(446, 'DN-705123', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 24', '0110577716', 'Linh kiện điện tử', 'Điện Bàn, Quảng Nam', 'Điện Bàn, Quảng Nam', 1.50, 260000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 16.079998, 108.199841, 16.028504, 108.218719, 1, 'sender', 'standard', 'DN'),
(447, 'DN-705124', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 25', '0838928425', 'Quần áo thời trang', 'Lăng Cô, Thừa Thiên Huế', 'Lăng Cô, Thừa Thiên Huế', 1.50, 490000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-13 22:08:27', '2026-05-02 22:08:27', 16.011691, 108.183261, 16.011962, 108.188624, 1, 'sender', 'standard', 'DN'),
(448, 'DN-705125', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 26', '0319835565', 'Sách giáo khoa', 'Thanh Khê, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 0.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-09 22:08:27', '2026-05-02 22:08:27', 16.017732, 108.171670, 16.073906, 108.204353, 1, 'sender', 'fast', 'DN'),
(449, 'DN-705126', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 27', '0515318884', 'Laptop Dell', 'Bình Sơn, Quảng Ngãi', 'Liên Chiểu, Đà Nẵng', 1.50, 310000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-22 22:08:25', '2026-05-02 22:08:25', 16.063818, 108.190999, 16.027416, 108.214219, 1, 'sender', 'standard', 'DN'),
(450, 'DN-705127', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 28', '0410207344', 'Hải sản sấy khô', 'Cẩm Lệ, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 480000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-05-02 22:08:27', '2026-05-02 22:08:27', 16.028742, 108.197623, 16.053471, 108.220669, 1, 'sender', 'fast', 'DN'),
(451, 'DN-705128', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 29', '0613827808', 'Quần áo thời trang', 'Cẩm Lệ, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 170000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-21 22:08:27', '2026-05-02 23:15:47', 16.012749, 108.238572, 16.085955, 108.238393, 1, 'sender', 'fast', 'DN'),
(452, 'DN-705129', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 30', '0286548539', 'Mỹ phẩm', 'Điện Bàn, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 200000.00, 20000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-17 22:08:26', '2026-05-02 22:08:26', 16.061560, 108.233774, 16.011405, 108.193711, 1, 'sender', 'standard', 'DN'),
(453, 'DN-705130', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 31', '0415520399', 'Bàn phím cơ', 'Tam Kỳ, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 100000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-01 22:08:25', '2026-05-02 22:08:25', 16.026254, 108.234618, 16.086353, 108.176244, 1, 'sender', 'fast', 'DN'),
(454, 'DN-705131', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 32', '0109037926', 'Đặc sản Đà Nẵng', 'Hòa Vang, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 450000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-03 22:08:27', '2026-05-02 22:08:27', 16.051712, 108.184178, 16.044873, 108.202699, 1, 'sender', 'standard', 'DN'),
(455, 'DN-705132', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 33', '0810171509', 'Quần áo thời trang', 'Ngũ Hành Sơn, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 290000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-23 22:08:26', '2026-05-02 22:08:26', 16.018673, 108.166926, 16.074134, 108.178416, 1, 'sender', 'standard', 'DN'),
(456, 'DN-705133', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 34', '0269879140', 'Sách giáo khoa', 'Tam Kỳ, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 190000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-28 22:08:26', '2026-05-02 22:08:26', 16.021431, 108.207706, 16.022903, 108.188712, 1, 'sender', 'standard', 'DN'),
(457, 'DN-705134', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 35', '0882486316', 'Hải sản sấy khô', 'Thanh Khê, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 380000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 16.038925, 108.176536, 16.059547, 108.177248, 1, 'sender', 'standard', 'DN'),
(458, 'DN-705135', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 36', '0692345980', 'Quần áo thời trang', 'Liên Chiểu, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 380000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-23 22:08:27', '2026-05-02 22:08:27', 16.050266, 108.222306, 16.008010, 108.233016, 1, 'sender', 'standard', 'DN'),
(459, 'DN-705136', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 37', '0587903777', 'Đặc sản Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 'Tam Kỳ, Quảng Nam', 1.50, 400000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-29 22:08:25', '2026-05-02 23:02:42', 16.039607, 108.179333, 16.043142, 108.232084, 1, 'sender', 'fast', 'DN'),
(460, 'DN-705137', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 38', '0917514094', 'Mỹ phẩm', 'Thanh Khê, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 180000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-05 22:08:27', '2026-05-02 22:08:27', 16.034825, 108.182655, 16.079973, 108.238748, 1, 'sender', 'standard', 'DN'),
(461, 'DN-705138', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 39', '0489393433', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 10000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-27 22:08:25', '2026-05-02 22:08:25', 16.016332, 108.201338, 16.072628, 108.196074, 1, 'sender', 'fast', 'DN'),
(462, 'DN-705139', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 40', '0845645740', 'Đặc sản Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 210000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-12 22:08:26', '2026-05-02 22:08:26', 16.053190, 108.229442, 16.085276, 108.215686, 1, 'sender', 'standard', 'DN'),
(463, 'DN-705140', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 41', '0260254662', 'Laptop Dell', 'Liên Chiểu, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 370000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-12 22:08:26', '2026-05-02 22:08:26', 16.033474, 108.219409, 16.081816, 108.198569, 1, 'sender', 'standard', 'DN'),
(464, 'DN-705141', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 42', '0357795567', 'Laptop Dell', 'Hội An, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 310000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-04 22:08:25', '2026-05-02 22:08:25', 16.036543, 108.184095, 16.053651, 108.171984, 1, 'sender', 'standard', 'DN'),
(465, 'DN-705142', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 43', '0125618725', 'Mỹ phẩm', 'Thanh Khê, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 100000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 16.081980, 108.238352, 16.058115, 108.169801, 1, 'sender', 'standard', 'DN'),
(466, 'DN-705143', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 44', '0676019129', 'Bàn phím cơ', 'Cẩm Lệ, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 380000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 16.030808, 108.219178, 16.029837, 108.171679, 1, 'sender', 'standard', 'DN'),
(467, 'DN-705144', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 45', '0277774969', 'Đặc sản Đà Nẵng', 'Thanh Khê, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 100000.00, 20000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-03-17 22:08:26', '2026-05-02 22:08:26', 16.068773, 108.172515, 16.022492, 108.233791, 1, 'sender', 'standard', 'DN'),
(468, 'DN-705145', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 46', '0698808053', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Thanh Khê, Đà Nẵng', 1.50, 270000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.024148, 108.171606, 16.085025, 108.202506, 1, 'sender', 'standard', 'DN'),
(469, 'DN-705146', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 47', '0180967167', 'Bàn phím cơ', 'Ngũ Hành Sơn, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 210000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-28 22:08:27', '2026-05-02 22:08:27', 16.053852, 108.228201, 16.013992, 108.197798, 1, 'sender', 'fast', 'DN'),
(470, 'DN-705147', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 48', '0331029719', 'Laptop Dell', 'Điện Bàn, Quảng Nam', 'Cẩm Lệ, Đà Nẵng', 1.50, 160000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.050882, 108.203231, 16.014223, 108.177826, 1, 'sender', 'standard', 'DN'),
(471, 'DN-705148', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 49', '0309742729', 'Quần áo thời trang', 'Phú Lộc, Thừa Thiên Huế', 'Điện Bàn, Quảng Nam', 1.50, 10000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:27', '2026-05-02 22:08:27', 16.046233, 108.185725, 16.046188, 108.232440, 1, 'sender', 'fast', 'DN'),
(472, 'DN-705149', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 50', '0526667559', 'Sách giáo khoa', 'Hội An, Quảng Nam', 'Hải Châu, Đà Nẵng', 1.50, 310000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 16.027385, 108.208531, 16.051230, 108.199503, 1, 'sender', 'standard', 'DN'),
(473, 'DN-705150', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 51', '0252586453', 'Laptop Dell', 'Sơn Trà, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 50000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-25 22:08:27', '2026-05-02 22:08:27', 16.043771, 108.167037, 16.053389, 108.176178, 1, 'sender', 'standard', 'DN'),
(474, 'DN-705151', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 52', '0628409154', 'Quần áo thời trang', 'Bình Sơn, Quảng Ngãi', 'Lăng Cô, Thừa Thiên Huế', 1.50, 100000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 23:15:50', 16.019969, 108.239525, 16.036128, 108.234089, 1, 'sender', 'fast', 'DN'),
(475, 'DN-705152', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 53', '0573769570', 'Sách giáo khoa', 'Cẩm Lệ, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 410000.00, 30000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-04-17 22:08:27', '2026-05-02 22:08:27', 16.028023, 108.167142, 16.080182, 108.213089, 1, 'sender', 'standard', 'DN'),
(476, 'DN-705153', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 54', '0681635019', 'Linh kiện điện tử', 'Cẩm Lệ, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 310000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-28 22:08:26', '2026-05-02 22:08:26', 16.027741, 108.219180, 16.045562, 108.224965, 1, 'sender', 'standard', 'DN'),
(477, 'DN-705154', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 55', '0190274163', 'Laptop Dell', 'Hải Châu, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 330000.00, 30000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-03-06 22:08:26', '2026-05-02 22:08:26', 16.046178, 108.219967, 16.015211, 108.189795, 1, 'sender', 'standard', 'DN'),
(478, 'DN-705155', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 56', '0776314567', 'Bàn phím cơ', 'Điện Bàn, Quảng Nam', 'Lăng Cô, Thừa Thiên Huế', 1.50, 350000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.041402, 108.211007, 16.046457, 108.243405, 1, 'sender', 'fast', 'DN'),
(479, 'DN-705156', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 57', '0391475404', 'Linh kiện điện tử', 'Hội An, Quảng Nam', 'Bình Sơn, Quảng Ngãi', 1.50, 350000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.025378, 108.205411, 16.062927, 108.181591, 1, 'sender', 'standard', 'DN'),
(480, 'DN-705157', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 58', '0111792888', 'Bàn phím cơ', 'Thanh Khê, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 330000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-02-25 22:08:27', '2026-05-02 22:08:27', 16.035062, 108.218026, 16.045637, 108.231642, 1, 'sender', 'standard', 'DN'),
(481, 'DN-705158', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 59', '0774325127', 'Mỹ phẩm', 'Liên Chiểu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 10000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-22 22:08:26', '2026-05-02 23:15:51', 16.047243, 108.175237, 16.053530, 108.172611, 1, 'sender', 'fast', 'DN'),
(482, 'DN-705159', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 60', '0980318882', 'Quần áo thời trang', 'Liên Chiểu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 230000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-25 22:08:25', '2026-05-02 22:08:25', 16.010269, 108.212886, 16.040478, 108.201355, 1, 'sender', 'standard', 'DN'),
(483, 'DN-705160', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 61', '0187510579', 'Linh kiện điện tử', 'Điện Bàn, Quảng Nam', 'Thanh Khê, Đà Nẵng', 1.50, 80000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-03 22:08:25', '2026-05-02 22:08:25', 16.076093, 108.218518, 16.059270, 108.179588, 1, 'sender', 'fast', 'DN'),
(484, 'DN-705161', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 62', '0813904040', 'Đặc sản Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 240000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-18 22:08:25', '2026-05-02 22:08:25', 16.055422, 108.193820, 16.054298, 108.188031, 1, 'sender', 'standard', 'DN'),
(485, 'DN-705162', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 63', '0235751235', 'Hải sản sấy khô', 'Ngũ Hành Sơn, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 330000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.054102, 108.168380, 16.083750, 108.244602, 1, 'sender', 'standard', 'DN'),
(486, 'DN-705163', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 64', '0484062283', 'Hải sản sấy khô', 'Phú Lộc, Thừa Thiên Huế', 'Hòa Vang, Đà Nẵng', 1.50, 410000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-26 22:08:26', '2026-05-02 22:08:26', 16.056908, 108.191246, 16.068287, 108.189102, 1, 'sender', 'standard', 'DN'),
(487, 'DN-705164', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 65', '0838052499', 'Hải sản sấy khô', 'Ngũ Hành Sơn, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 400000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-30 22:08:27', '2026-05-02 22:08:27', 16.052520, 108.178595, 16.072125, 108.200438, 1, 'sender', 'standard', 'DN'),
(488, 'DN-705165', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 66', '0367676759', 'Sách giáo khoa', 'Liên Chiểu, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 180000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-20 22:08:25', '2026-05-02 22:08:25', 16.072602, 108.239527, 16.021614, 108.216289, 1, 'sender', 'fast', 'DN'),
(489, 'DN-705166', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 67', '0952840296', 'Laptop Dell', 'Thanh Khê, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 320000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-20 22:08:26', '2026-05-02 22:08:26', 16.049796, 108.169675, 16.015349, 108.200014, 1, 'sender', 'fast', 'DN'),
(490, 'DN-705167', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 68', '0198762449', 'Sách giáo khoa', 'Hội An, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 100000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-21 22:08:25', '2026-05-02 22:08:25', 16.049003, 108.188179, 16.019491, 108.236697, 1, 'sender', 'standard', 'DN'),
(491, 'DN-705168', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 69', '0576020388', 'Sách giáo khoa', 'Tam Kỳ, Quảng Nam', 'Hội An, Quảng Nam', 1.50, 240000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-23 22:08:26', '2026-05-02 22:08:26', 16.016353, 108.172413, 16.059421, 108.200608, 1, 'sender', 'standard', 'DN'),
(492, 'DN-705169', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 70', '0138925643', 'Mỹ phẩm', 'Hòa Vang, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 360000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-03-11 22:08:26', '2026-05-02 22:08:26', 16.013030, 108.176272, 16.047189, 108.225679, 1, 'sender', 'standard', 'DN'),
(493, 'DN-705170', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 71', '0734354241', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Lăng Cô, Thừa Thiên Huế', 1.50, 90000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-02 22:08:25', '2026-05-02 22:08:25', 16.085584, 108.186059, 16.053904, 108.213214, 1, 'sender', 'standard', 'DN'),
(494, 'DN-705171', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 72', '0143929397', 'Sách giáo khoa', 'Ngũ Hành Sơn, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 160000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:25', '2026-05-02 22:08:25', 16.047170, 108.199539, 16.052089, 108.189632, 1, 'sender', 'standard', 'DN'),
(495, 'DN-705172', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 73', '0997424774', 'Đặc sản Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 210000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-03 22:08:26', '2026-05-02 22:08:26', 16.021788, 108.192427, 16.011502, 108.221581, 1, 'sender', 'fast', 'DN'),
(496, 'DN-705173', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 74', '0964153740', 'Laptop Dell', 'Liên Chiểu, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 30000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-16 22:08:27', '2026-05-02 22:08:27', 16.076174, 108.190597, 16.063127, 108.197725, 1, 'sender', 'standard', 'DN'),
(497, 'DN-705174', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 75', '0526658429', 'Đặc sản Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 190000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-29 22:08:26', '2026-05-02 22:08:26', 16.070942, 108.192582, 16.082457, 108.222277, 1, 'sender', 'standard', 'DN'),
(498, 'DN-705175', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 76', '0136519978', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 370000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-20 22:08:27', '2026-05-02 22:08:27', 16.044337, 108.184240, 16.084615, 108.218747, 1, 'sender', 'standard', 'DN'),
(499, 'DN-705176', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 77', '0139586166', 'Sách giáo khoa', 'Liên Chiểu, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 350000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-20 22:08:27', '2026-05-02 22:08:27', 16.076877, 108.235110, 16.020365, 108.242870, 1, 'sender', 'standard', 'DN'),
(500, 'DN-705177', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 78', '0430914874', 'Hải sản sấy khô', 'Hội An, Quảng Nam', 'Sơn Trà, Đà Nẵng', 1.50, 400000.00, 40000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 16.038775, 108.200090, 16.071479, 108.200535, 1, 'sender', 'standard', 'DN'),
(501, 'DN-705178', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 79', '0362390711', 'Sách giáo khoa', 'Hải Châu, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 340000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-02 22:08:25', '2026-05-02 22:08:25', 16.084067, 108.178706, 16.052101, 108.169347, 1, 'sender', 'standard', 'DN'),
(502, 'DN-705179', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 80', '0185653665', 'Laptop Dell', 'Thanh Khê, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 120000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-15 22:08:25', '2026-05-02 22:08:25', 16.028268, 108.196171, 16.040079, 108.198526, 1, 'sender', 'standard', 'DN'),
(503, 'DN-705180', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 81', '0612438159', 'Đặc sản Đà Nẵng', 'Điện Bàn, Quảng Nam', 'Cẩm Lệ, Đà Nẵng', 1.50, 100000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-01 22:08:26', '2026-05-02 22:08:26', 16.074279, 108.180069, 16.038242, 108.207344, 1, 'sender', 'standard', 'DN'),
(504, 'DN-705181', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 82', '0414261797', 'Quần áo thời trang', 'Lăng Cô, Thừa Thiên Huế', 'Tam Kỳ, Quảng Nam', 1.50, 310000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-22 22:08:26', '2026-05-02 22:08:26', 16.072936, 108.209412, 16.020931, 108.173086, 1, 'sender', 'standard', 'DN'),
(505, 'DN-705182', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 83', '0789155458', 'Quần áo thời trang', 'Thanh Khê, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 0.00, 50000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-04-26 22:08:27', '2026-05-02 22:08:27', 16.067543, 108.209845, 16.024964, 108.218274, 1, 'sender', 'standard', 'DN'),
(506, 'DN-705183', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 84', '0742088400', 'Linh kiện điện tử', 'Sơn Trà, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 270000.00, 40000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-19 22:08:25', '2026-05-02 22:08:25', 16.033683, 108.225860, 16.059648, 108.171309, 1, 'sender', 'standard', 'DN'),
(507, 'DN-705184', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 85', '0379580837', 'Sách giáo khoa', 'Thanh Khê, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 320000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-23 22:08:26', '2026-05-02 22:08:26', 16.078135, 108.240853, 16.070798, 108.238060, 1, 'sender', 'standard', 'DN'),
(508, 'DN-705185', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 86', '0460017815', 'Linh kiện điện tử', 'Điện Bàn, Quảng Nam', 'Điện Bàn, Quảng Nam', 1.50, 430000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-22 22:08:26', '2026-05-02 22:08:26', 16.065222, 108.231770, 16.071581, 108.212324, 1, 'sender', 'standard', 'DN'),
(509, 'DN-705186', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 87', '0616925983', 'Sách giáo khoa', 'Lăng Cô, Thừa Thiên Huế', 'Phú Lộc, Thừa Thiên Huế', 1.50, 430000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.080434, 108.230994, 16.007855, 108.198064, 1, 'sender', 'standard', 'DN'),
(510, 'DN-705187', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 88', '0246857683', 'Bàn phím cơ', 'Cẩm Lệ, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 200000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.070754, 108.224338, 16.029777, 108.182883, 1, 'sender', 'standard', 'DN'),
(511, 'DN-705188', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 89', '0237426940', 'Linh kiện điện tử', 'Bình Sơn, Quảng Ngãi', 'Hội An, Quảng Nam', 1.50, 130000.00, 30000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-02-07 22:08:26', '2026-05-02 22:08:26', 16.064269, 108.187924, 16.076281, 108.166946, 1, 'sender', 'standard', 'DN'),
(512, 'DN-705189', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 90', '0449479604', 'Đặc sản Đà Nẵng', 'Hội An, Quảng Nam', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 460000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-15 22:08:27', '2026-05-02 22:08:27', 16.016254, 108.199908, 16.057766, 108.206606, 1, 'sender', 'standard', 'DN'),
(513, 'DN-705190', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 91', '0610120987', 'Đặc sản Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 490000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-01 22:08:26', '2026-05-02 22:08:26', 16.037372, 108.176669, 16.027376, 108.178432, 1, 'sender', 'standard', 'DN'),
(514, 'DN-705191', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 92', '0595402650', 'Linh kiện điện tử', 'Ngũ Hành Sơn, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 130000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.077326, 108.242987, 16.053800, 108.184901, 1, 'sender', 'fast', 'DN'),
(515, 'DN-705192', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 93', '0351121879', 'Bàn phím cơ', 'Phú Lộc, Thừa Thiên Huế', 'Thanh Khê, Đà Nẵng', 1.50, 290000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-19 22:08:27', '2026-05-02 22:08:27', 16.084879, 108.191503, 16.038904, 108.201127, 1, 'sender', 'standard', 'DN'),
(516, 'DN-705193', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 94', '0443747274', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Sơn Trà, Đà Nẵng', 1.50, 230000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-05-02 22:08:27', '2026-05-02 22:08:27', 16.024927, 108.192251, 16.017583, 108.223884, 1, 'sender', 'standard', 'DN'),
(517, 'DN-705194', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 95', '0529766487', 'Laptop Dell', 'Phú Lộc, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 0.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-12 22:08:26', '2026-05-02 23:24:15', 16.067734, 108.170802, 16.064545, 108.166916, 1, 'sender', 'fast', 'DN'),
(518, 'DN-705195', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 96', '0328778983', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 480000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 22:08:27', 16.019230, 108.221035, 16.039163, 108.185286, 1, 'sender', 'standard', 'DN'),
(519, 'DN-705196', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 97', '0208773872', 'Đặc sản Đà Nẵng', 'Tam Kỳ, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 80000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-27 22:08:27', '2026-05-02 22:08:27', 16.074501, 108.227454, 16.018988, 108.214887, 1, 'sender', 'standard', 'DN'),
(520, 'DN-705197', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 98', '0880390728', 'Quần áo thời trang', 'Hòa Vang, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 180000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-11 22:08:27', '2026-05-02 22:08:27', 16.054492, 108.173169, 16.034248, 108.191388, 1, 'sender', 'standard', 'DN'),
(521, 'DN-705198', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 99', '0822281802', 'Linh kiện điện tử', 'Cẩm Lệ, Đà Nẵng', 'Hội An, Quảng Nam', 1.50, 160000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.046114, 108.200639, 16.041854, 108.196758, 1, 'sender', 'fast', 'DN'),
(522, 'DN-705199', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 100', '0241043336', 'Đặc sản Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 'Hải Châu, Đà Nẵng', 1.50, 120000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.070517, 108.182767, 16.063294, 108.197964, 1, 'sender', 'standard', 'DN'),
(523, 'DN-705200', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 101', '0764113602', 'Laptop Dell', 'Sơn Trà, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 310000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-05 22:08:25', '2026-05-02 22:08:25', 16.068632, 108.175666, 16.009982, 108.229165, 1, 'sender', 'fast', 'DN'),
(524, 'DN-705201', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 102', '0639801439', 'Quần áo thời trang', 'Liên Chiểu, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 100000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-24 22:08:27', '2026-05-02 23:15:49', 16.013415, 108.180728, 16.084450, 108.230881, 1, 'sender', 'fast', 'DN'),
(525, 'DN-705202', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 103', '0203988497', 'Laptop Dell', 'Cẩm Lệ, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 140000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-18 22:08:26', '2026-05-02 22:08:26', 16.072331, 108.232421, 16.066895, 108.228722, 1, 'sender', 'standard', 'DN'),
(526, 'DN-705203', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 104', '0776279351', 'Mỹ phẩm', 'Liên Chiểu, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 210000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-03-16 22:08:26', '2026-05-02 22:08:26', 16.057259, 108.186548, 16.073062, 108.171715, 1, 'sender', 'standard', 'DN'),
(527, 'DN-705204', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 105', '0376592446', 'Đặc sản Đà Nẵng', 'Sơn Trà, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 290000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-13 22:08:26', '2026-05-02 22:08:26', 16.062724, 108.198515, 16.038977, 108.229719, 1, 'sender', 'standard', 'DN'),
(528, 'DN-705205', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 106', '0832755760', 'Linh kiện điện tử', 'Lăng Cô, Thừa Thiên Huế', 'Hội An, Quảng Nam', 1.50, 240000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-17 22:08:26', '2026-05-02 23:15:53', 16.080104, 108.242617, 16.022195, 108.223079, 1, 'sender', 'fast', 'DN'),
(529, 'DN-705206', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 107', '0320688144', 'Bàn phím cơ', 'Bình Sơn, Quảng Ngãi', 'Cẩm Lệ, Đà Nẵng', 1.50, 210000.00, 30000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.050449, 108.176315, 16.047704, 108.184251, 1, 'sender', 'standard', 'DN'),
(530, 'DN-705207', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 108', '0210304009', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 240000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.031699, 108.191067, 16.031453, 108.242036, 1, 'sender', 'fast', 'DN'),
(531, 'DN-705208', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 109', '0207644746', 'Laptop Dell', 'Hội An, Quảng Nam', 'Phú Lộc, Thừa Thiên Huế', 1.50, 340000.00, 50000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-18 22:08:26', '2026-05-02 22:08:26', 16.064097, 108.186295, 16.080509, 108.245729, 1, 'sender', 'fast', 'DN'),
(532, 'DN-705209', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 110', '0434023948', 'Mỹ phẩm', 'Hòa Vang, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 320000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-29 22:08:27', '2026-05-02 22:08:27', 16.081985, 108.238051, 16.029599, 108.182069, 1, 'sender', 'fast', 'DN'),
(533, 'DN-705210', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 111', '0784441927', 'Hải sản sấy khô', 'Bình Sơn, Quảng Ngãi', 'Điện Bàn, Quảng Nam', 1.50, 0.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-27 22:08:26', '2026-05-02 22:08:26', 16.055136, 108.195712, 16.044601, 108.196176, 1, 'sender', 'standard', 'DN'),
(534, 'DN-705211', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 112', '0165513149', 'Linh kiện điện tử', 'Tam Kỳ, Quảng Nam', 'Lăng Cô, Thừa Thiên Huế', 1.50, 470000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-24 22:08:26', '2026-05-02 22:08:26', 16.008640, 108.213154, 16.080594, 108.232198, 1, 'sender', 'fast', 'DN'),
(535, 'DN-705212', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 113', '0236676350', 'Bàn phím cơ', 'Phú Lộc, Thừa Thiên Huế', 'Lăng Cô, Thừa Thiên Huế', 1.50, 70000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-17 22:08:26', '2026-05-02 22:08:26', 16.016639, 108.201158, 16.026371, 108.186575, 1, 'sender', 'fast', 'DN'),
(536, 'DN-705213', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 114', '0351963934', 'Đặc sản Đà Nẵng', 'Tam Kỳ, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 70000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-03-26 22:08:27', '2026-05-02 22:08:27', 16.032288, 108.172091, 16.081516, 108.190202, 1, 'sender', 'standard', 'DN'),
(537, 'DN-705214', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 115', '0797664797', 'Hải sản sấy khô', 'Hải Châu, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 70000.00, 40000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-03-30 22:08:26', '2026-05-02 22:08:26', 16.073264, 108.175497, 16.052326, 108.197566, 1, 'sender', 'standard', 'DN'),
(538, 'DN-705215', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 116', '0265869623', 'Đặc sản Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 310000.00, 20000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-04-27 22:08:27', '2026-05-02 22:08:27', 16.050431, 108.211091, 16.084023, 108.230294, 1, 'sender', 'standard', 'DN'),
(539, 'DN-705216', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 117', '0759006643', 'Sách giáo khoa', 'Sơn Trà, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 110000.00, 50000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.050769, 108.203239, 16.063014, 108.215799, 1, 'sender', 'standard', 'DN'),
(540, 'DN-705217', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 118', '0290940758', 'Mỹ phẩm', 'Hội An, Quảng Nam', 'Hòa Vang, Đà Nẵng', 1.50, 60000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.016310, 108.233934, 16.036099, 108.205619, 1, 'sender', 'standard', 'DN'),
(541, 'DN-705218', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 119', '0269884042', 'Đặc sản Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 120000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-29 22:08:27', '2026-05-02 22:08:27', 16.007957, 108.214471, 16.078578, 108.189904, 1, 'sender', 'fast', 'DN'),
(542, 'DN-705219', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 120', '0892572360', 'Laptop Dell', 'Liên Chiểu, Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 1.50, 20000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 22:08:26', 16.035615, 108.203140, 16.081541, 108.169671, 1, 'sender', 'standard', 'DN'),
(543, 'DN-705220', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 121', '0581521613', 'Sách giáo khoa', 'Hòa Vang, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 70000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:26', '2026-05-02 22:08:26', 16.051111, 108.245681, 16.055888, 108.232878, 1, 'sender', 'standard', 'DN'),
(544, 'DN-705221', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 122', '0297859144', 'Bàn phím cơ', 'Lăng Cô, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 330000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-26 22:08:25', '2026-05-02 22:08:25', 16.080927, 108.200782, 16.073898, 108.215774, 1, 'sender', 'fast', 'DN'),
(545, 'DN-705222', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 123', '0806366911', 'Đặc sản Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 430000.00, 30000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-15 22:08:26', '2026-05-02 22:08:26', 16.071260, 108.186064, 16.017215, 108.238770, 1, 'sender', 'standard', 'DN'),
(546, 'DN-705223', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 124', '0633851813', 'Linh kiện điện tử', 'Phú Lộc, Thừa Thiên Huế', 'Thanh Khê, Đà Nẵng', 1.50, 20000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-17 22:08:25', '2026-05-02 22:08:25', 16.054836, 108.194154, 16.023820, 108.172031, 1, 'sender', 'standard', 'DN'),
(547, 'DN-705224', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 125', '0913596584', 'Laptop Dell', 'Cẩm Lệ, Đà Nẵng', 'Cẩm Lệ, Đà Nẵng', 1.50, 190000.00, 20000.00, 'COD', 'canceled', NULL, 0, NULL, NULL, '2026-04-05 22:08:26', '2026-05-02 22:08:26', 16.066061, 108.174719, 16.068623, 108.233182, 1, 'sender', 'fast', 'DN'),
(548, 'DN-705225', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 126', '0715695884', 'Đặc sản Đà Nẵng', 'Bình Sơn, Quảng Ngãi', 'Tam Kỳ, Quảng Nam', 1.50, 50000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.069657, 108.218781, 16.054969, 108.176763, 1, 'sender', 'standard', 'DN'),
(549, 'DN-705226', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 127', '0812712713', 'Hải sản sấy khô', 'Tam Kỳ, Quảng Nam', 'Tam Kỳ, Quảng Nam', 1.50, 320000.00, 50000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-03-08 22:08:26', '2026-05-02 22:08:26', 16.015714, 108.171669, 16.078842, 108.226470, 1, 'sender', 'standard', 'DN'),
(550, 'DN-705227', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 128', '0884409355', 'Bàn phím cơ', 'Cẩm Lệ, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 380000.00, 50000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 23:15:54', 16.047104, 108.221935, 16.044671, 108.168701, 1, 'sender', 'fast', 'DN'),
(551, 'DN-705228', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 129', '0339656357', 'Laptop Dell', 'Cẩm Lệ, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 210000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-03 22:08:27', '2026-05-02 22:08:27', 16.061029, 108.234020, 16.039110, 108.245520, 1, 'sender', 'fast', 'DN'),
(552, 'DN-705229', 6, 'Lý Nhã Kỳ', '0265919622', 'Khách miền Trung 130', '0810789930', 'Mỹ phẩm', 'Cẩm Lệ, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 100000.00, 20000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-30 22:08:26', '2026-05-02 22:08:26', 16.070173, 108.244766, 16.030116, 108.183935, 1, 'sender', 'standard', 'DN'),
(553, 'DN-705230', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 131', '0238877330', 'Linh kiện điện tử', 'Hòa Vang, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 100000.00, 40000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-02-26 22:08:25', '2026-05-02 23:24:17', 16.060138, 108.210298, 16.032454, 108.217140, 1, 'sender', 'fast', 'DN'),
(554, 'DN-705231', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 132', '0355478915', 'Linh kiện điện tử', 'Cẩm Lệ, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 430000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-01 22:08:25', '2026-05-02 22:08:25', 16.064702, 108.189086, 16.011714, 108.214450, 1, 'sender', 'standard', 'DN'),
(555, 'DN-705232', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 133', '0546002007', 'Hải sản sấy khô', 'Cẩm Lệ, Đà Nẵng', 'Sơn Trà, Đà Nẵng', 1.50, 330000.00, 40000.00, 'COD', 'failed', NULL, 0, NULL, NULL, '2026-03-27 22:08:25', '2026-05-02 22:08:25', 16.037718, 108.243551, 16.042374, 108.185516, 1, 'sender', 'standard', 'DN'),
(556, 'DN-705233', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 134', '0722049668', 'Hải sản sấy khô', 'Bình Sơn, Quảng Ngãi', 'Lăng Cô, Thừa Thiên Huế', 1.50, 260000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-16 22:08:26', '2026-05-02 22:08:26', 16.011592, 108.195137, 16.007288, 108.230567, 1, 'sender', 'standard', 'DN'),
(557, 'DN-705234', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 135', '0561486177', 'Mỹ phẩm', 'Thanh Khê, Đà Nẵng', 'Liên Chiểu, Đà Nẵng', 1.50, 0.00, 30000.00, 'COD', 'picking', NULL, 0, NULL, NULL, '2026-04-24 22:08:26', '2026-05-02 22:08:26', 16.054462, 108.184254, 16.022066, 108.183358, 1, 'sender', 'fast', 'DN'),
(558, 'DN-705235', 7, 'Hồ Ngọc Hà', '0784330191', 'Khách miền Trung 136', '0713723026', 'Bàn phím cơ', 'Hải Châu, Đà Nẵng', 'Hải Châu, Đà Nẵng', 1.50, 340000.00, 50000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-02-01 22:08:26', '2026-05-02 22:08:26', 16.054148, 108.226995, 16.037300, 108.243801, 1, 'sender', 'standard', 'DN'),
(559, 'DN-705236', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 137', '0375971091', 'Đặc sản Đà Nẵng', 'Sơn Trà, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 490000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-02 22:08:26', '2026-05-02 23:15:55', 16.047901, 108.231577, 16.019368, 108.205191, 1, 'sender', 'fast', 'DN'),
(560, 'DN-705237', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 138', '0865764945', 'Laptop Dell', 'Lăng Cô, Thừa Thiên Huế', 'Liên Chiểu, Đà Nẵng', 1.50, 210000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-22 22:08:27', '2026-05-02 22:08:27', 16.026460, 108.193965, 16.027062, 108.215111, 1, 'sender', 'fast', 'DN'),
(561, 'DN-705238', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 139', '0645716669', 'Laptop Dell', 'Bình Sơn, Quảng Ngãi', 'Cẩm Lệ, Đà Nẵng', 1.50, 450000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-19 22:08:26', '2026-05-02 22:08:26', 16.030202, 108.179372, 16.085542, 108.185015, 1, 'sender', 'standard', 'DN'),
(562, 'DN-705239', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 140', '0705936946', 'Laptop Dell', 'Hòa Vang, Đà Nẵng', 'Hòa Vang, Đà Nẵng', 1.50, 480000.00, 30000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-25 22:08:27', '2026-05-02 22:08:27', 16.060503, 108.177447, 16.038618, 108.235605, 1, 'sender', 'standard', 'DN'),
(563, 'DN-705240', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 141', '0773892467', 'Laptop Dell', 'Sơn Trà, Đà Nẵng', 'Thanh Khê, Đà Nẵng', 1.50, 470000.00, 30000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-04-25 22:08:25', '2026-05-02 22:08:25', 16.061108, 108.203760, 16.081748, 108.190505, 1, 'sender', 'standard', 'DN'),
(564, 'DN-705241', 10, 'Phạm Hương', '0422886964', 'Khách miền Trung 142', '0841575580', 'Mỹ phẩm', 'Tam Kỳ, Quảng Nam', 'Liên Chiểu, Đà Nẵng', 1.50, 440000.00, 20000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-02-02 22:08:27', '2026-05-02 22:08:27', 16.076152, 108.229196, 16.062280, 108.215958, 1, 'sender', 'standard', 'DN');
INSERT INTO `shipments` (`id`, `tracking_code`, `customer_id`, `sender_name`, `sender_phone`, `receiver_name`, `receiver_phone`, `item_name`, `pickup_address`, `delivery_address`, `weight_kg`, `cod_amount`, `shipping_fee`, `payment_method`, `status`, `failure_note`, `fail_count`, `scheduled_date`, `current_location`, `created_at`, `updated_at`, `pickup_lat`, `pickup_lng`, `delivery_lat`, `delivery_lng`, `quantity`, `pickup_option`, `service_type`, `region_id`) VALUES
(565, 'DN-705242', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 143', '0595501924', 'Bàn phím cơ', 'Liên Chiểu, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 310000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-04-27 22:08:25', '2026-05-02 22:08:25', 16.013586, 108.189512, 16.031324, 108.169381, 1, 'sender', 'standard', 'DN'),
(566, 'DN-705243', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 144', '0446852814', 'Bàn phím cơ', 'Sơn Trà, Đà Nẵng', 'Tam Kỳ, Quảng Nam', 1.50, 20000.00, 50000.00, 'COD', 'pending', NULL, 0, NULL, NULL, '2026-02-28 22:08:25', '2026-05-02 22:08:25', 16.034894, 108.179056, 16.077304, 108.211894, 1, 'sender', 'fast', 'DN'),
(567, 'DN-705244', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 145', '0117177355', 'Bàn phím cơ', 'Sơn Trà, Đà Nẵng', 'Điện Bàn, Quảng Nam', 1.50, 310000.00, 30000.00, 'COD', 'assigned', NULL, 0, NULL, NULL, '2026-03-01 22:08:27', '2026-05-02 22:08:27', 16.050120, 108.184468, 16.067580, 108.217630, 1, 'sender', 'standard', 'DN'),
(568, 'DN-705245', 5, 'Mai Phương Thúy', '0427745274', 'Khách miền Trung 146', '0614507520', 'Mỹ phẩm', 'Hải Châu, Đà Nẵng', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 460000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-03-09 22:08:25', '2026-05-02 22:08:25', 16.065900, 108.189908, 16.048593, 108.186337, 1, 'sender', 'fast', 'DN'),
(569, 'DN-705246', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 147', '0411034169', 'Đặc sản Đà Nẵng', 'Sơn Trà, Đà Nẵng', 'Lăng Cô, Thừa Thiên Huế', 1.50, 170000.00, 40000.00, 'COD', 'delivered', NULL, 0, NULL, NULL, '2026-03-29 22:08:26', '2026-05-02 22:08:26', 16.057632, 108.222096, 16.077054, 108.183639, 1, 'sender', 'standard', 'DN'),
(570, 'DN-705247', 8, 'Nguyễn Thúc Thùy Tiên', '0167180215', 'Khách miền Trung 148', '0891766585', 'Mỹ phẩm', 'Điện Bàn, Quảng Nam', 'Ngũ Hành Sơn, Đà Nẵng', 1.50, 160000.00, 20000.00, 'COD', 'completed', NULL, 0, NULL, NULL, '2026-05-01 22:08:26', '2026-05-02 22:08:26', 16.021491, 108.204480, 16.029987, 108.193939, 1, 'sender', 'standard', 'DN'),
(571, 'DN-705248', 9, 'Đỗ Mỹ Linh', '0923617686', 'Khách miền Trung 149', '0444914114', 'Quần áo thời trang', 'Cẩm Lệ, Đà Nẵng', 'Phú Lộc, Thừa Thiên Huế', 1.50, 70000.00, 20000.00, 'COD', 'delivering', NULL, 0, NULL, NULL, '2026-01-11 22:08:27', '2026-05-02 22:08:27', 16.068321, 108.213130, 16.057028, 108.197381, 1, 'sender', 'standard', 'DN');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `wallet_id` int NOT NULL,
  `type` enum('deposit','withdraw','payment','refund') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `wallet_id`, `type`, `amount`, `description`, `status`, `created_at`) VALUES
(1, NULL, 1, 'deposit', 5000000.00, 'Nạp tiền vào ví', 'success', '2026-04-27 21:38:17'),
(2, NULL, 2, 'deposit', 5000000.00, 'Nạp tiền vào ví', 'success', '2026-04-27 21:38:17'),
(3, NULL, 3, 'deposit', 5000000.00, 'Nạp tiền vào ví', 'success', '2026-04-27 21:38:18'),
(4, NULL, 4, 'deposit', 5000000.00, 'Nạp tiền vào ví', 'success', '2026-04-27 21:38:18'),
(5, NULL, 5, 'deposit', 5000000.00, 'Nạp tiền vào ví', 'success', '2026-04-27 21:38:18'),
(6, NULL, 6, 'deposit', 5000000.00, 'Nạp tiền vào ví', 'success', '2026-04-27 21:38:18'),
(7, 'HN-897641', 1, 'payment', 35000.00, 'Thanh toán cước đơn HN-897641', 'success', '2026-05-02 21:38:18'),
(8, 'DN-897644', 1, 'payment', 35000.00, 'Thanh toán cước đơn DN-897644', 'success', '2026-05-02 21:38:18'),
(9, 'HCM-897654', 1, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897654', 'success', '2026-05-02 21:38:18'),
(10, 'HCM-897659', 1, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897659', 'success', '2026-05-02 21:38:18'),
(11, 'HN-897668', 2, 'payment', 35000.00, 'Thanh toán cước đơn HN-897668', 'success', '2026-05-02 21:38:18'),
(12, 'HCM-897669', 2, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897669', 'success', '2026-05-02 21:38:18'),
(13, 'HCM-897685', 3, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897685', 'success', '2026-05-02 21:38:18'),
(14, 'DN-897689', 3, 'payment', 35000.00, 'Thanh toán cước đơn DN-897689', 'success', '2026-05-02 21:38:18'),
(15, 'DN-897693', 3, 'payment', 35000.00, 'Thanh toán cước đơn DN-897693', 'success', '2026-05-02 21:38:18'),
(16, 'HCM-897715', 4, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897715', 'success', '2026-05-02 21:38:18'),
(17, 'HCM-897734', 5, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897734', 'success', '2026-05-02 21:38:18'),
(18, 'HN-897745', 6, 'payment', 35000.00, 'Thanh toán cước đơn HN-897745', 'success', '2026-05-02 21:38:18'),
(19, 'HN-897758', 6, 'payment', 35000.00, 'Thanh toán cước đơn HN-897758', 'success', '2026-05-02 21:38:18'),
(20, 'HCM-897759', 6, 'payment', 35000.00, 'Thanh toán cước đơn HCM-897759', 'success', '2026-05-02 21:38:18'),
(21, 'TRANS1777759496152', 1, 'payment', 38500.00, 'Thanh toán đơn hàng #271', 'success', '2026-05-02 22:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','dispatcher','driver','customer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `status` enum('active','inactive','blocked') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int DEFAULT '4',
  `avatar` longtext COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `region_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `role`, `status`, `created_at`, `role_id`, `avatar`, `address`, `region_id`) VALUES
(1, 'Admin', 'admin2@speedyship.vn', '$2a$10$JrzpIDRcrjB2XrQYMvBUsejZH0PSvVIb.XG2SAmUVrT4d7PEgWj32', '232312321', 'admin', 'active', '2026-05-02 21:38:17', 1, NULL, NULL, NULL),
(2, 'Điều phối HN', 'dieuphoi.hn@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0168448623', 'dispatcher', 'active', '2026-05-02 21:38:17', 2, NULL, NULL, 'HN'),
(3, 'Điều phối HCM', 'dieuphoi.hcm@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0569733690', 'dispatcher', 'active', '2026-05-02 21:38:17', 2, NULL, NULL, 'HCM'),
(4, 'Điều phối DN', 'dieuphoi.dn@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0568698974', 'dispatcher', 'active', '2026-05-02 21:38:17', 2, NULL, NULL, 'DN'),
(5, 'Ngọc Trường', 'khachhang.demo1@gmail.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0363337081', 'customer', 'active', '2026-05-02 21:38:17', 4, 'https://api.dicebear.com/9.x/avataaars/svg?seed=Mai Phương Thúy', 'Kiệt 62 Nguyễn Huy Tưởng, Hòa Minh, Phường Hòa Khánh, Thành phố Đà Nẵng, 84236, Việt Nam', NULL),
(6, 'Lý Nhã Kỳ', 'khachhang.demo2@gmail.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0265919622', 'customer', 'active', '2026-05-02 21:38:17', 4, NULL, NULL, NULL),
(7, 'Hồ Ngọc Hà', 'khachhang.demo3@gmail.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0784330191', 'customer', 'active', '2026-05-02 21:38:17', 4, NULL, NULL, NULL),
(8, 'Nguyễn Thúc Thùy Tiên', 'khachhang.demo4@gmail.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0167180215', 'customer', 'active', '2026-05-02 21:38:17', 4, NULL, NULL, NULL),
(9, 'Đỗ Mỹ Linh', 'khachhang.demo5@gmail.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0923617686', 'customer', 'active', '2026-05-02 21:38:17', 4, NULL, NULL, NULL),
(10, 'Phạm Hương', 'khachhang.demo6@gmail.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0422886964', 'customer', 'active', '2026-05-02 21:38:17', 4, NULL, NULL, NULL),
(11, 'Hoàng Văn Nghĩa', 'tx.caugiay1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0547637060', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HN'),
(12, 'Lê Thanh Hùng', 'tx.dongda1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0562042775', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HN'),
(13, 'Phạm Trọng Đạt', 'tx.hoankiem1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0856970500', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HN'),
(14, 'Tài xế Demo (HN)', 'tx.demo.hn@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0152516318', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HN'),
(15, 'Nguyễn Minh Tuấn', 'tx.govap1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0433199646', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HCM'),
(16, 'Trần Đình Bảo', 'tx.quan11@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0484761127', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HCM'),
(17, 'Vũ Xuân Tiến', 'tx.binhthanh1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0873039159', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HCM'),
(18, 'Tài xế Demo (HCM)', 'tx.demo.hcm@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0221872466', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'HCM'),
(19, 'Phan Anh Kiệt', 'tx.lienchieu1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0639775312', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'DN'),
(20, 'Bùi Quốc Anh', 'tx.haichau1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0812621036', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'DN'),
(21, 'Hoàng Văn Nghĩa', 'tx.sontra1@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0748007045', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'DN'),
(22, 'Tài xế Demo (DN)', 'tx.demo.dn@speedyship.com', '$2a$10$gR9SkxxOHBwToIq7E9bwwOcBYGTuKe5ZbmKdYn9P32B3O2RRSHQem', '0108764284', 'driver', 'active', '2026-05-02 21:38:17', 3, NULL, NULL, 'DN'),
(23, 'Nguyễn Hoàng', 'hoang@gmail.com', '$2a$10$FDHWZk0s.9exFFplMD4exeTJMjR5QnpsDI9t3QMZzi5BnDiGPKSeO', '0909001122', 'driver', 'active', '2026-05-02 21:47:49', 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int NOT NULL,
  `plate_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity_kg` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `status` enum('available','maintenance','busy') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'available',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `plate_no`, `type`, `capacity_kg`, `driver_id`, `status`, `created_at`) VALUES
(1, '21C-48993', 'Xe tải nhỏ', 1000, 1, 'available', '2026-05-03 04:38:17'),
(2, '58C-25821', 'Xe tải nhỏ', 1000, 2, 'available', '2026-05-03 04:38:17'),
(3, '41C-79072', 'Xe tải nhỏ', 1000, 3, 'available', '2026-05-03 04:38:17'),
(4, '88C-50383', 'Xe tải nhỏ', 1000, 4, 'available', '2026-05-03 04:38:17'),
(5, '81C-10382', 'Xe tải nhỏ', 1000, 5, 'available', '2026-05-03 04:38:17'),
(6, '22C-82371', 'Xe tải nhỏ', 1000, 6, 'available', '2026-05-03 04:38:17'),
(7, '38C-81137', 'Xe tải nhỏ', 1000, 7, 'available', '2026-05-03 04:38:17'),
(8, '58C-55818', 'Xe tải nhỏ', 1000, 8, 'available', '2026-05-03 04:38:17'),
(9, '20C-71398', 'Xe tải nhỏ', 1000, 9, 'available', '2026-05-03 04:38:17'),
(10, '38C-56696', 'Xe tải nhỏ', 1000, 10, 'available', '2026-05-03 04:38:17'),
(11, '50C-53894', 'Xe tải nhỏ', 1000, 11, 'available', '2026-05-03 04:38:17'),
(12, '43C-14279', 'Xe tải nhỏ', 1000, 12, 'available', '2026-05-03 04:38:17'),
(13, '51C-12345', 'Xe tải', 150, 13, 'available', '2026-05-03 04:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `currency` varchar(10) DEFAULT 'VND',
  `status` enum('active','locked') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 4961500.00, 'VND', 'active', '2026-05-02 21:38:17', '2026-05-02 22:04:56'),
(2, 6, 5000000.00, 'VND', 'active', '2026-05-02 21:38:17', '2026-05-02 21:38:17'),
(3, 7, 5000000.00, 'VND', 'active', '2026-05-02 21:38:18', '2026-05-02 21:38:18'),
(4, 8, 5000000.00, 'VND', 'active', '2026-05-02 21:38:18', '2026-05-02 21:38:18'),
(5, 9, 5000000.00, 'VND', 'active', '2026-05-02 21:38:18', '2026-05-02 21:38:18'),
(6, 10, 5000000.00, 'VND', 'active', '2026-05-02 21:38:18', '2026-05-02 21:38:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_id` (`shipment_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_driver_vehicle` (`vehicle_id`);

--
-- Indexes for table `driver_applications`
--
ALTER TABLE `driver_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `shipment_id` (`shipment_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notif_driver` (`receiver_id`),
  ADD KEY `fk_notif_shipment` (`shipment_id`);

--
-- Indexes for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_shipment` (`shipment_id`),
  ADD KEY `fk_payment_customer` (`customer_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_code` (`tracking_code`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_id` (`wallet_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate_no` (`plate_no`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `driver_applications`
--
ALTER TABLE `driver_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `otp_codes`
--
ALTER TABLE `otp_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `fk_address_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_driver_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedbacks_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_shipment` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payment_shipment` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
