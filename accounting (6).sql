-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2024 at 01:11 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounting`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_t`
--

CREATE TABLE `account_t` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `code` float DEFAULT NULL,
  `parent` float DEFAULT NULL,
  `level_ac` float DEFAULT NULL,
  `Root_leav` float DEFAULT NULL,
  `detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_t`
--

INSERT INTO `account_t` (`id`, `name`, `code`, `parent`, `level_ac`, `Root_leav`, `detail`) VALUES
(1, 'الجامعة', 1, 0, 1, 1, NULL),
(2, 'كلية طب الاسنان', 11, 1, 2, 1, NULL),
(3, 'كلية الصيدلة', 12, 1, 2, 1, NULL),
(4, 'كلية الهندسة', 13, 1, 2, 1, NULL),
(5, 'كلية التقنيات الطبية و الصحيه', 14, 1, 2, 1, NULL),
(6, 'كلية التربية البدنيه و الرياضية', 15, 1, 2, 1, NULL),
(7, 'كلية هندسة النفط الصباحي', 131, 13, 3, 1, NULL),
(8, 'كلية هندسة النفط المسائي', 132, 13, 3, 1, NULL),
(9, 'كلية تقنيات التخدير الصباحي', 141, 14, 3, 1, NULL),
(10, 'كلية التربية البدنيه الصباحي', 151, 15, 3, 1, NULL),
(11, 'قسم التربية البدنية المسائي', 152, 15, 3, 1, NULL),
(12, 'قسم تقنيات التخدير مسائي', 142, 14, 3, 1, NULL),
(13, 'قسم تقنيات صناعة الاسنان صباحي', 143, 14, 3, 1, NULL),
(14, 'قسم تقنيات صناعة الاسنان مسائي', 144, 14, 3, 1, NULL),
(15, 'قسم تقنيات البصريات صباحي', 145, 14, 3, 1, NULL),
(16, 'قسم تقنيات البصريات مسائي', 146, 14, 3, 1, NULL),
(17, 'قسم المختبرات الصباحي', 149, 14, 3, 1, NULL),
(18, 'قسم المختبرات المسائي', 1410, 14, 3, 1, NULL),
(19, 'قسم الاشعة و السونار الصباحي', 147, 14, 3, 1, NULL),
(20, 'قسم الاشعة و السونار المسائي', 148, 14, 3, 1, NULL),
(21, 'كلية التقنيات الهندسية', 16, 1, 2, 1, NULL),
(22, 'هندسة تقنيات الاجهزة الطبية', 161, 16, 3, 1, NULL),
(23, 'هندسة تقنيات الحاسوب', 162, 16, 3, 1, NULL),
(24, 'كلية الطب البشري', 17, 1, 2, 1, '0'),
(25, 'هندسة تقنيات الحاسوب مسائي', 163, 16, 3, 1, '0'),
(1024, 'كلية هندسة الذكاء الاصطناعي صباحي', 133, 13, 2, 1, NULL),
(1025, 'كلية هندسة الطب الحياتي صباحي', 135, 13, 2, 1, NULL),
(2024, 'كلية التربية', 18, 1, 1, 1, NULL),
(2025, 'قسم اللغة الانكليزية', 181, 18, 2, 1, NULL),
(2026, 'قسم الكيمياء', 183, 18, 2, 1, NULL),
(2027, 'كلية القانون', 19, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `box_cost`
--

CREATE TABLE `box_cost` (
  `id` int(11) NOT NULL,
  `Credit` float DEFAULT NULL,
  `Debt` float DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `id_account` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `code` float DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `id_acc` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cost_acc`
--

CREATE TABLE `cost_acc` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `code` float DEFAULT NULL,
  `parent` float DEFAULT NULL,
  `level_ac` float DEFAULT NULL,
  `Root_leav` float DEFAULT NULL,
  `detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cost_acc`
--

INSERT INTO `cost_acc` (`id`, `name`, `code`, `parent`, `level_ac`, `Root_leav`, `detail`) VALUES
(1, 'الموجودات', 1, 0, 1, 0, NULL),
(2, 'المطلوبات', 2, 0, 1, 0, NULL),
(3, 'الأستخدامات', 3, 0, 1, 0, NULL),
(4, 'الموجودات الثابتة', 11, 1, 2, 1, NULL),
(5, 'رأس المال', 21, 2, 2, 1, NULL),
(6, 'الموارد', 4, 0, 1, 0, NULL),
(7, 'مباني و انشاءات و طرق', 112, 11, 3, 1, NULL),
(8, 'اثاث و اجهزة مكاتب', 116, 11, 3, 1, NULL),
(9, 'اثاث', 1161, 116, 4, 2, NULL),
(10, 'مباني', 1121, 112, 4, 1, NULL),
(11, 'مباني خدمية', 11213, 1121, 5, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_record`
--

CREATE TABLE `daily_record` (
  `id_dc` int(11) NOT NULL,
  `number` float DEFAULT NULL,
  `money` float DEFAULT NULL,
  `data_in` datetime DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date_ac` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `from_per` text DEFAULT NULL,
  `write_mo` text DEFAULT NULL,
  `id_u` float DEFAULT NULL,
  `name` text DEFAULT NULL,
  `id_col` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `e_number` text DEFAULT NULL,
  `e_date` varchar(255) DEFAULT NULL,
  `type_of_receipt` int(11) DEFAULT NULL,
  `year_r` varchar(50) DEFAULT NULL,
  `in_number` varchar(50) DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `in_amount` varchar(50) DEFAULT NULL,
  `adder_name` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `updater_name` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_record`
--

INSERT INTO `daily_record` (`id_dc`, `number`, `money`, `data_in`, `type`, `date_ac`, `note`, `from_per`, `write_mo`, `id_u`, `name`, `id_col`, `id_s`, `e_number`, `e_date`, `type_of_receipt`, `year_r`, `in_number`, `in_date`, `in_amount`, `adder_name`, `added_date`, `updater_name`, `updated_date`) VALUES
(3, 0, 10000, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:09:08', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  عشرة آلاف   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:09:08', NULL, NULL),
(4, 0, 10000, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:13:56', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  عشرة آلاف   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:13:56', NULL, NULL),
(5, 0, 10000, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:15:27', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  عشرة آلاف   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:15:27', NULL, NULL),
(6, 0, 10000, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:16:18', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  عشرة آلاف   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:16:18', NULL, NULL),
(8, 0, 79, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:35:08', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' تسعة', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:35:08', NULL, NULL),
(9, 0, 5199, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 08:25:47', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' خمسة آلاف ومائة وتسعة وتسعون', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 08:25:47', NULL, NULL),
(10, 0, 30000, '0000-00-00 00:00:00', 'قسط سنوي', '2024-07-01 09:16:50', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  ثلاثون  الف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '', NULL, NULL, 'lol', '2024-07-01 09:16:50', NULL, NULL),
(11, 0, 30000, '0000-00-00 00:00:00', 'قسط سنوي', '2024-07-01 09:20:28', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  ثلاثون  الف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '', NULL, NULL, 'lol', '2024-07-01 09:20:28', NULL, NULL),
(13, 0, 30000, '2024-07-01 00:00:00', 'قسط سنوي', '2024-07-01 09:22:24', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  ثلاثون  الف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '', NULL, NULL, 'lol', '2024-07-01 09:22:24', NULL, NULL),
(14, 0, 30000, '2024-07-01 00:00:00', 'قسط سنوي', '2024-07-01 09:22:45', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', '  ثلاثون  الف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '9000', NULL, NULL, 'lol', '2024-07-01 09:22:45', NULL, NULL),
(15, 0, 4008010000, '2024-07-02 00:00:00', 'قسط سنوي', '2024-07-02 07:21:50', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ثمانية ملايين    الف  وتسعة    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '20', '2024-07-02 07:21:50', '', 'lol', '2024-07-02 07:21:50', NULL, NULL),
(16, 0, 100, '2024-08-12 00:00:00', 'قسط سنوي', '2024-08-12 08:18:01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2019-2020', 'a', ' مائة  ', 1, 'lol', 1, 0, '0', '2024-08-12', 0, '2019-2020', '0', NULL, NULL, 'lol', '2024-08-12 08:18:01', NULL, NULL),
(17, 0, 1100, '2024-08-12 00:00:00', 'قسط سنوي', '2024-08-12 09:59:12', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'a', ' ألف ومائة  ', 1, 'lol', 1, 0, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-08-12 09:59:12', NULL, NULL),
(18, 0, 11100, '2024-08-12 00:00:00', 'قسط سنوي', '2024-08-12 10:00:39', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'a', ' أحد عشر الفا  ومائة  ', 1, 'lol', 1, 0, '0', '2024-08-12', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-08-12 10:00:39', NULL, NULL),
(19, 0, 11100, '2024-08-12 00:00:00', 'قسط سنوي', '2024-08-12 13:13:10', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'g', ' أحد عشر الفا  ومائة  ', 1, 'lol', 1, 0, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-08-12 13:13:10', NULL, NULL),
(20, 0, 10000, '2024-10-01 00:00:00', 'قسط سنوي', '2024-10-01 10:26:29', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'aa', ' عشرة آلاف    ', 1, 'lol', 1, 104, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-01 10:26:29', NULL, NULL),
(21, 0, 111000, '2024-10-02 00:00:00', 'اجور تحميل', '2024-10-02 12:54:36', 'تسديد اجور تحميل كلية  الجامعة المرحلة الثالة للعام الدراسي 2026-2027', 'adfa', ' مائة  وأحد عشر الفا    ', 1, 'lol', 1, 0, '0', '', 0, '2026-2027', NULL, NULL, NULL, 'lol', '2024-10-02 12:54:36', NULL, NULL),
(22, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 08:48:52', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-05 08:48:52', NULL, NULL),
(23, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 08:49:56', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-05 08:49:56', NULL, NULL),
(24, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 08:53:42', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-05 08:53:42', NULL, NULL),
(25, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 08:54:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-05 08:54:00', NULL, NULL),
(26, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 08:54:21', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-05 08:54:21', NULL, NULL),
(27, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 08:55:26', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', '0', NULL, NULL, 'lol', '2024-10-05 08:55:26', NULL, NULL),
(28, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 09:30:08', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'a', ' عشرة آلاف    ', 1, 'lol', 1, 0, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-10-05 09:30:08', NULL, NULL),
(29, 0, 20000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 09:31:52', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'a', ' عشرون  الف     ', 1, 'lol', 1, 0, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-10-05 09:31:52', NULL, NULL),
(30, 0, 20000, '2024-10-05 00:00:00', 'قسط سنوي', '2024-10-05 09:32:12', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'a', ' عشرون  الف     ', 1, 'lol', 1, 0, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-10-05 09:32:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_record_detal`
--

CREATE TABLE `daily_record_detal` (
  `id_dd` int(11) NOT NULL,
  `money` float DEFAULT NULL,
  `type` text DEFAULT NULL,
  `number_acc` float DEFAULT NULL,
  `number_ber` float DEFAULT NULL,
  `id_cost` float DEFAULT NULL,
  `id_dc` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_record_detal`
--

INSERT INTO `daily_record_detal` (`id_dd`, `money`, `type`, `number_acc`, `number_ber`, `id_cost`, `id_dc`) VALUES
(1, 10000, 'spent', 182, NULL, NULL, 0),
(2, 10000, 'paid', 435, NULL, NULL, 0),
(3, 10000, 'spent', 182, NULL, NULL, 0),
(4, 10000, 'paid', 435, NULL, NULL, 0),
(5, 0, 'spent', 182, NULL, NULL, 0),
(6, 0, 'paid', 435, NULL, NULL, 0),
(7, 10000, 'spent', 182, NULL, NULL, 0),
(8, 10000, 'paid', 435, NULL, NULL, 0),
(9, 9, 'spent', 182, NULL, NULL, 0),
(10, 9, 'paid', 435, NULL, NULL, 0),
(11, 79, 'spent', 182, NULL, NULL, 8),
(12, 79, 'paid', 435, NULL, NULL, 8),
(13, 0, 'spent', 182, NULL, NULL, 8),
(14, 0, 'paid', 435, NULL, NULL, 8),
(15, 0, 'spent', 182, NULL, NULL, 8),
(16, 0, 'paid', 435, NULL, NULL, 8),
(17, 199, 'spent', 182, NULL, NULL, 9),
(18, 199, 'paid', 435, NULL, NULL, 9),
(19, 2000, 'spent', 182, NULL, NULL, 9),
(20, 2000, 'paid', 435, NULL, NULL, 9),
(21, 3000, 'spent', 182, NULL, NULL, 9),
(22, 3000, 'spent', 435, NULL, NULL, 9),
(23, 10000, 'spent', 182, NULL, NULL, 10),
(24, 10000, 'paid', 435, NULL, NULL, 10),
(25, 10000, 'spent', 181, NULL, NULL, 10),
(26, 10000, 'paid', 435, NULL, NULL, 10),
(27, 10000, 'spent', 182, NULL, NULL, 10),
(28, 10000, 'paid', 435, NULL, NULL, 10),
(29, 10000, 'spent', 182, NULL, NULL, 11),
(30, 10000, 'paid', 435, NULL, NULL, 11),
(31, 10000, 'spent', 182, NULL, NULL, 11),
(32, 10000, 'paid', 435, NULL, NULL, 11),
(33, 10000, 'spent', 182, NULL, NULL, 11),
(34, 10000, 'paid', 435, NULL, NULL, 11),
(35, 0, 'spent', 182, NULL, NULL, 11),
(36, 0, 'paid', 435, NULL, NULL, 11),
(37, 10000, 'spent', 182, NULL, NULL, 12),
(38, 10000, 'paid', 435, NULL, NULL, 12),
(39, 10000, 'spent', 182, NULL, NULL, 12),
(40, 10000, 'paid', 435, NULL, NULL, 12),
(41, 10000, 'spent', 182, NULL, NULL, 12),
(42, 10000, 'paid', 435, NULL, NULL, 12),
(43, 0, 'spent', 182, NULL, NULL, 12),
(44, 0, 'paid', 435, NULL, NULL, 12),
(45, 0, 'spent', 182, NULL, NULL, 12),
(46, 0, 'paid', 435, NULL, NULL, 12),
(47, 10000, 'spent', 182, NULL, NULL, 13),
(48, 10000, 'paid', 435, NULL, NULL, 13),
(49, 10000, 'spent', 182, NULL, NULL, 13),
(50, 10000, 'paid', 435, NULL, NULL, 13),
(51, 10000, 'spent', 182, NULL, NULL, 13),
(52, 10000, 'paid', 435, NULL, NULL, 13),
(53, 0, 'spent', 182, NULL, NULL, 13),
(54, 0, 'paid', 435, NULL, NULL, 13),
(55, 0, 'spent', 182, NULL, NULL, 13),
(56, 0, 'paid', 435, NULL, NULL, 13),
(57, 0, 'spent', 182, NULL, NULL, 13),
(58, 0, 'paid', 435, NULL, NULL, 13),
(59, 10000, 'spent', 182, NULL, NULL, 14),
(60, 10000, 'paid', 435, NULL, NULL, 14),
(61, 10000, 'spent', 182, NULL, NULL, 14),
(62, 10000, 'paid', 435, NULL, NULL, 14),
(63, 10000, 'spent', 1121, NULL, NULL, 14),
(64, 10000, 'paid', 1121, NULL, NULL, 14),
(65, 0, 'spent', 182, NULL, NULL, 14),
(66, 0, 'paid', 435, NULL, NULL, 14),
(67, 0, 'spent', 182, NULL, NULL, 14),
(68, 0, 'paid', 435, NULL, NULL, 14),
(69, 0, 'spent', 182, NULL, NULL, 14),
(70, 0, 'paid', 435, NULL, NULL, 14),
(71, 0, 'spent', 182, NULL, NULL, 14),
(72, 0, 'paid', 1121, NULL, NULL, 14),
(73, 9000, 'spent', 182, NULL, NULL, 15),
(74, 9000, 'paid', 435, NULL, NULL, 15),
(75, 8000000, 'spent', 182, NULL, NULL, 15),
(76, 8000000, 'paid', 435, NULL, NULL, 15),
(77, 1000000000, 'spent', 182, NULL, NULL, 15),
(78, 1000000000, 'paid', 435, NULL, NULL, 15),
(79, 1000000000, 'spent', 182, NULL, NULL, 15),
(80, 1000000000, 'paid', 435, NULL, NULL, 15),
(81, 1000000000, 'spent', 182, NULL, NULL, 15),
(82, 1000000000, 'paid', 435, NULL, NULL, 15),
(83, 1000000000, 'spent', 4, NULL, NULL, 15),
(84, 1000000000, 'paid', 181, NULL, NULL, 15),
(85, 100, 'spent', 182, NULL, NULL, 16),
(86, 100, 'paid', 435, NULL, NULL, 16),
(87, 100, 'spent', 182, NULL, NULL, 17),
(88, 100, 'paid', 435, NULL, NULL, 17),
(89, 0, 'spent', 182, NULL, NULL, 17),
(90, 0, 'paid', 435, NULL, NULL, 17),
(91, 1000, 'spent', 182, NULL, NULL, 17),
(92, 1000, 'paid', 435, NULL, NULL, 17),
(93, 100, 'spent', 182, NULL, NULL, 18),
(94, 100, 'paid', 435, NULL, NULL, 18),
(95, 0, 'spent', 182, NULL, NULL, 18),
(96, 0, 'paid', 435, NULL, NULL, 18),
(97, 1000, 'spent', 182, NULL, NULL, 18),
(98, 1000, 'paid', 435, NULL, NULL, 18),
(99, 0, 'spent', 182, NULL, NULL, 18),
(100, 0, 'paid', 435, NULL, NULL, 18),
(101, 10000, 'spent', 182, NULL, NULL, 18),
(102, 10000, 'paid', 435, NULL, NULL, 18),
(103, 100, 'spent', 182, NULL, NULL, 19),
(104, 100, 'paid', 435, NULL, NULL, 19),
(105, 0, 'spent', 182, NULL, NULL, 19),
(106, 0, 'paid', 435, NULL, NULL, 19),
(107, 1000, 'spent', 182, NULL, NULL, 19),
(108, 1000, 'paid', 435, NULL, NULL, 19),
(109, 0, 'spent', 182, NULL, NULL, 19),
(110, 0, 'paid', 435, NULL, NULL, 19),
(111, 10000, 'spent', 182, NULL, NULL, 19),
(112, 10000, 'paid', 435, NULL, NULL, 19),
(113, 0, 'spent', 182, NULL, NULL, 19),
(114, 0, 'paid', 435, NULL, NULL, 19),
(115, 10000, 'spent', 182, NULL, NULL, 20),
(116, 10000, 'paid', 435, NULL, NULL, 20),
(117, 10000, 'spent', 182, NULL, NULL, 21),
(118, 10000, 'paid', 435, NULL, NULL, 21),
(119, 10000, 'spent', 182, NULL, NULL, 21),
(120, 10000, 'paid', 435, NULL, NULL, 21),
(121, 90000, 'spent', 182, NULL, NULL, 21),
(122, 90000, 'paid', 435, NULL, NULL, 21),
(123, 1000, 'spent', 182, NULL, NULL, 21),
(124, 1000, 'paid', 435, NULL, NULL, 21),
(125, 10000, 'spent', 183, NULL, NULL, 22),
(126, 10000, 'paid', 435, NULL, NULL, 22),
(127, 0, 'spent', 183, NULL, NULL, 22),
(128, 0, 'paid', 435, NULL, NULL, 22),
(129, 10000, 'spent', 183, NULL, NULL, 23),
(130, 10000, 'paid', 435, NULL, NULL, 23),
(131, 0, 'spent', 183, NULL, NULL, 23),
(132, 0, 'paid', 435, NULL, NULL, 23),
(133, 0, 'spent', 182, NULL, NULL, 23),
(134, 0, 'paid', 435, NULL, NULL, 23),
(135, 10000, 'spent', 183, NULL, NULL, 24),
(136, 10000, 'paid', 435, NULL, NULL, 24),
(137, 0, 'spent', 183, NULL, NULL, 24),
(138, 0, 'paid', 435, NULL, NULL, 24),
(139, 0, 'spent', 182, NULL, NULL, 24),
(140, 0, 'paid', 435, NULL, NULL, 24),
(141, 0, 'spent', 182, NULL, NULL, 24),
(142, 0, 'paid', 435, NULL, NULL, 24),
(143, 10000, 'spent', 183, NULL, NULL, 25),
(144, 10000, 'paid', 435, NULL, NULL, 25),
(145, 0, 'spent', 183, NULL, NULL, 25),
(146, 0, 'paid', 435, NULL, NULL, 25),
(147, 0, 'spent', 182, NULL, NULL, 25),
(148, 0, 'paid', 435, NULL, NULL, 25),
(149, 0, 'spent', 182, NULL, NULL, 25),
(150, 0, 'paid', 435, NULL, NULL, 25),
(151, 0, 'spent', 182, NULL, NULL, 25),
(152, 0, 'paid', 435, NULL, NULL, 25),
(153, 10000, 'spent', 183, NULL, NULL, 26),
(154, 10000, 'paid', 435, NULL, NULL, 26),
(155, 0, 'spent', 183, NULL, NULL, 26),
(156, 0, 'paid', 435, NULL, NULL, 26),
(157, 0, 'spent', 182, NULL, NULL, 26),
(158, 0, 'paid', 435, NULL, NULL, 26),
(159, 0, 'spent', 182, NULL, NULL, 26),
(160, 0, 'paid', 435, NULL, NULL, 26),
(161, 0, 'spent', 182, NULL, NULL, 26),
(162, 0, 'paid', 435, NULL, NULL, 26),
(163, 0, 'spent', 182, NULL, NULL, 26),
(164, 0, 'paid', 435, NULL, NULL, 26),
(165, 10000, 'spent', 183, NULL, NULL, 27),
(166, 10000, 'paid', 435, NULL, NULL, 27),
(167, 0, 'spent', 183, NULL, NULL, 27),
(168, 0, 'paid', 435, NULL, NULL, 27),
(169, 0, 'spent', 182, NULL, NULL, 27),
(170, 0, 'paid', 435, NULL, NULL, 27),
(171, 0, 'spent', 182, NULL, NULL, 27),
(172, 0, 'paid', 435, NULL, NULL, 27),
(173, 0, 'spent', 182, NULL, NULL, 27),
(174, 0, 'paid', 435, NULL, NULL, 27),
(175, 0, 'spent', 182, NULL, NULL, 27),
(176, 0, 'paid', 435, NULL, NULL, 27),
(177, 0, 'spent', 182, NULL, NULL, 27),
(178, 0, 'paid', 435, NULL, NULL, 27),
(179, 10000, 'spent', 183, NULL, NULL, 28),
(180, 10000, 'paid', 435, NULL, NULL, 28),
(181, 0, 'spent', 183, NULL, NULL, 28),
(182, 0, 'paid', 435, NULL, NULL, 28),
(183, 0, 'spent', 182, NULL, NULL, 28),
(184, 0, 'paid', 435, NULL, NULL, 28),
(185, 0, 'spent', 182, NULL, NULL, 28),
(186, 0, 'paid', 435, NULL, NULL, 28),
(187, 0, 'spent', 182, NULL, NULL, 28),
(188, 0, 'paid', 435, NULL, NULL, 28),
(189, 0, 'spent', 182, NULL, NULL, 28),
(190, 0, 'paid', 435, NULL, NULL, 28),
(191, 0, 'spent', 182, NULL, NULL, 28),
(192, 0, 'paid', 435, NULL, NULL, 28),
(193, 0, 'spent', 182, NULL, NULL, 28),
(194, 0, 'paid', 435, NULL, NULL, 28),
(195, 10000, 'spent', 183, NULL, NULL, 29),
(196, 10000, 'paid', 435, NULL, NULL, 29),
(197, 0, 'spent', 183, NULL, NULL, 29),
(198, 0, 'paid', 435, NULL, NULL, 29),
(199, 0, 'spent', 182, NULL, NULL, 29),
(200, 0, 'paid', 435, NULL, NULL, 29),
(201, 0, 'spent', 182, NULL, NULL, 29),
(202, 0, 'paid', 435, NULL, NULL, 29),
(203, 0, 'spent', 182, NULL, NULL, 29),
(204, 0, 'paid', 435, NULL, NULL, 29),
(205, 0, 'spent', 182, NULL, NULL, 29),
(206, 0, 'paid', 435, NULL, NULL, 29),
(207, 0, 'spent', 182, NULL, NULL, 29),
(208, 0, 'paid', 435, NULL, NULL, 29),
(209, 0, 'spent', 182, NULL, NULL, 29),
(210, 0, 'paid', 435, NULL, NULL, 29),
(211, 0, 'spent', 182, NULL, NULL, 29),
(212, 0, 'paid', 435, NULL, NULL, 29),
(213, 10000, 'spent', 182, NULL, NULL, 29),
(214, 10000, 'paid', 435, NULL, NULL, 29),
(215, 10000, 'spent', 183, NULL, NULL, 30),
(216, 10000, 'paid', 435, NULL, NULL, 30),
(217, 0, 'spent', 183, NULL, NULL, 30),
(218, 0, 'paid', 435, NULL, NULL, 30),
(219, 0, 'spent', 182, NULL, NULL, 30),
(220, 0, 'paid', 435, NULL, NULL, 30),
(221, 0, 'spent', 182, NULL, NULL, 30),
(222, 0, 'paid', 435, NULL, NULL, 30),
(223, 0, 'spent', 182, NULL, NULL, 30),
(224, 0, 'paid', 435, NULL, NULL, 30),
(225, 0, 'spent', 182, NULL, NULL, 30),
(226, 0, 'paid', 435, NULL, NULL, 30),
(227, 0, 'spent', 182, NULL, NULL, 30),
(228, 0, 'paid', 435, NULL, NULL, 30),
(229, 0, 'spent', 182, NULL, NULL, 30),
(230, 0, 'paid', 435, NULL, NULL, 30),
(231, 0, 'spent', 182, NULL, NULL, 30),
(232, 0, 'paid', 435, NULL, NULL, 30),
(233, 10000, 'spent', 182, NULL, NULL, 30),
(234, 10000, 'paid', 435, NULL, NULL, 30),
(235, 0, 'spent', 182, NULL, NULL, 30),
(236, 0, 'paid', 435, NULL, NULL, 30);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id_e` int(11) NOT NULL,
  `number` float DEFAULT NULL,
  `money` float DEFAULT NULL,
  `data_in` datetime DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date_ac` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `from_per` text DEFAULT NULL,
  `write_mo` text DEFAULT NULL,
  `id_u` float DEFAULT NULL,
  `name` text DEFAULT NULL,
  `id_col` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `d_number` text DEFAULT NULL,
  `d_date` varchar(255) DEFAULT NULL,
  `type_of_receipt` int(11) DEFAULT NULL,
  `year_r` varchar(50) DEFAULT NULL,
  `in_number` varchar(50) DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `in_amount` varchar(50) DEFAULT NULL,
  `adder_name` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `updater_name` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id_e`, `number`, `money`, `data_in`, `type`, `date_ac`, `note`, `from_per`, `write_mo`, `id_u`, `name`, `id_col`, `id_s`, `d_number`, `d_date`, `type_of_receipt`, `year_r`, `in_number`, `in_date`, `in_amount`, `adder_name`, `added_date`, `updater_name`, `updated_date`) VALUES
(4, 0, 2000, '2024-06-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألفان   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 16000, '2024-06-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ستة  عشر الفا   ', 1, 'lol', 1, 103, '0', '1970-01-01', 0, '2017-2018', '', '1970-01-01 00:00:00', '', 'lol', '0000-00-00 00:00:00', '', '2024-07-08 00:00:00'),
(6, 0, 16000, '2024-06-26 00:00:00', 'قسط سنوي', '2024-06-26 11:04:01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ستة  عشر الفا   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-26 11:04:01', NULL, NULL),
(7, 0, 79, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:24:43', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' تسعة', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:24:43', NULL, NULL),
(8, 0, 79, '2024-06-29 00:00:00', 'قسط سنوي', '2024-06-29 07:25:42', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' تسعة', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-06-29 07:25:42', NULL, NULL),
(9, 0, 9000, '2024-07-01 00:00:00', 'قسط سنوي', '2024-07-01 07:31:51', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'aa', ' تسعة آلاف    ', 1, 'lol', 1, 104, '0', '', 0, '2017-2018', NULL, NULL, NULL, 'lol', '2024-07-01 07:31:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_detal`
--

CREATE TABLE `expense_detal` (
  `id_d` int(11) NOT NULL,
  `money` float DEFAULT NULL,
  `type` text DEFAULT NULL,
  `number_acc` float DEFAULT NULL,
  `number_ber` float DEFAULT NULL,
  `id_cost` float DEFAULT NULL,
  `id_e` float DEFAULT NULL,
  `adder_name` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `updater_name` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_detal`
--

INSERT INTO `expense_detal` (`id_d`, `money`, `type`, `number_acc`, `number_ber`, `id_cost`, `id_e`, `adder_name`, `added_date`, `updater_name`, `updated_date`) VALUES
(2, 1000, 'spent', 182, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(3, 1000, 'spent', 182, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(4, 1000, 'paid', 435, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(5, 1000, 'spent', 182, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(6, 1000, 'paid', 435, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, 'spent', 182, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 'paid', 435, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 'spent', 182, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 'paid', 435, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 'spent', 182, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 'paid', 435, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1000, 'spent', 182, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(14, 1000, 'paid', 435, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(15, 1000, 'spent', 182, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(16, 1000, 'paid', 435, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(17, 0, 'spent', 182, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(18, 0, 'paid', 435, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(19, 0, 'spent', 182, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(20, 0, 'paid', 435, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(21, 0, 'spent', 182, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(22, 0, 'paid', 435, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(23, 0, 'spent', 182, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(24, 0, 'paid', 435, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(25, 1000, 'spent', 182, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(26, 1000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(27, 1000, 'spent', 182, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(28, 1000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(29, 10000, 'spent', 182, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(30, 10000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(31, 1000, 'spent', 182, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(32, 1000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(33, 1000, 'spent', 182, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(34, 1000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(35, 1000, 'spent', 182, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(36, 1000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(37, 1000, 'spent', 1822, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(38, 1000, 'paid', 435, 0, 0, 5, '', '1970-01-01 00:00:00', '', '2024-07-08 00:00:00'),
(39, 1000, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(40, 1000, 'paid', 435, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(41, 1000, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(42, 1000, 'paid', 435, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(43, 10000, 'spent', 21, NULL, NULL, 6, NULL, '2024-08-14 11:24:19', NULL, NULL),
(44, 10000, 'paid', 11, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(45, 1000, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(46, 1000, 'paid', 435, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(47, 1000, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(48, 1000, 'paid', 11, NULL, NULL, 6, NULL, '2024-08-14 11:24:19', NULL, NULL),
(49, 1000, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(50, 1000, 'paid', 435, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(51, 1000, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(52, 1000, 'paid', 435, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(53, 0, 'spent', 182, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(54, 0, 'paid', 435, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(55, 79, 'spent', 182, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(56, 79, 'paid', 435, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(57, 79, 'spent', 182, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(58, 79, 'paid', 435, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(59, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(60, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(61, 9000, 'spent', 182, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(62, 9000, 'paid', 435, NULL, NULL, 9, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_detal_records`
--

CREATE TABLE `expense_detal_records` (
  `id_d` int(11) NOT NULL,
  `money` float DEFAULT NULL,
  `type` text DEFAULT NULL,
  `number_acc` float DEFAULT NULL,
  `number_ber` float DEFAULT NULL,
  `id_cost` float DEFAULT NULL,
  `id_e` float DEFAULT NULL,
  `adder_name` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `updater_name` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_records`
--

CREATE TABLE `expense_records` (
  `id_e` int(11) NOT NULL,
  `number` float DEFAULT NULL,
  `money` float DEFAULT NULL,
  `data_in` datetime DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date_ac` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `from_per` text DEFAULT NULL,
  `write_mo` text DEFAULT NULL,
  `id_u` float DEFAULT NULL,
  `name` text DEFAULT NULL,
  `id_col` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `d_number` text DEFAULT NULL,
  `d_date` varchar(255) DEFAULT NULL,
  `type_of_receipt` int(11) DEFAULT NULL,
  `year_r` varchar(50) DEFAULT NULL,
  `in_number` varchar(50) DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `in_amount` varchar(50) DEFAULT NULL,
  `adder_name` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `updater_name` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_record`
--

CREATE TABLE `fund_record` (
  `id` int(11) NOT NULL,
  `number` float DEFAULT NULL,
  `Receipts` float DEFAULT NULL,
  `Payments` float DEFAULT NULL,
  `Deposits` float DEFAULT NULL,
  `Draws` float DEFAULT NULL,
  `name_Receipts` text DEFAULT NULL,
  `name_Payments` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `record_number` float DEFAULT NULL,
  `date` date NOT NULL,
  `Daily_sequence` float DEFAULT NULL,
  `c_number` float DEFAULT NULL,
  `c_date` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `id_m` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fund_record`
--

INSERT INTO `fund_record` (`id`, `number`, `Receipts`, `Payments`, `Deposits`, `Draws`, `name_Receipts`, `name_Payments`, `type`, `record_number`, `date`, `Daily_sequence`, `c_number`, `c_date`, `note`, `id_m`) VALUES
(1, 0, 0, 0, 0, 9000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(2, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(3, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(4, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(5, 0, 0, 0, 0, 9000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(6, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(7, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(8, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(9, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(10, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(11, 0, 0, 0, 0, 10000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 63, '2024-05-26', 63, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(12, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 63, '2024-05-26', 63, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(13, 0, 0, 0, 0, 1000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 64, '2024-05-26', 64, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(14, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 64, '2024-05-26', 64, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(15, 0, 0, 0, 0, 9000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(16, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(17, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(18, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(19, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(20, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(21, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(22, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(23, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 64, '2024-05-26', 64, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(24, 0, 0, 0, 0, 1000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(25, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(26, 0, 0, 0, 0, 1000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(27, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(28, 0, 0, 0, 0, 1000, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 68, '2024-06-01', 68, 0, '', 'تسديد اجور تحميل كلية  قسم المختبرات الصباحي المرحلة الاولى للعام الدراسي 2017-2018', 1),
(29, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'receipt', 68, '2024-06-01', 68, 0, '', 'تسديد اجور تحميل كلية  قسم المختبرات الصباحي المرحلة الاولى للعام الدراسي 2017-2018', 1),
(30, 0, 0, 0, 0, 90000, 'new', 'new', 'receipt', 69, '2024-06-03', 69, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2021-2022', 1),
(31, 0, 0, 0, 0, 0, 'new', 'new', 'receipt', 69, '2024-06-03', 69, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2021-2022', 1),
(32, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(33, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(34, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(35, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(36, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(37, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(38, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(39, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(40, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(41, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(42, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(43, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(44, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(45, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(46, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(47, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(48, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(49, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(50, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 73, '2024-06-23', 73, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(51, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 73, '2024-06-23', 73, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(52, 0, 0, 0, 0, 1000, 'A1', 'A1', 'receipt', 74, '2024-06-23', 74, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(53, 0, 0, 0, 0, 0, 'A1', 'A1', 'receipt', 74, '2024-06-23', 74, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(54, 0, 0, 0, 1000, 0, 'A1', 'A1', 'receipt', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(55, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(56, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(57, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(58, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(59, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(60, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(61, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(62, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(63, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(64, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(65, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(66, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(67, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(68, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(69, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(70, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(71, 0, 0, 0, 0, 10000, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(72, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(73, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(74, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(75, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(76, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(77, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(78, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(79, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(80, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(81, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(82, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(83, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(84, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(85, 0, 0, 0, 0, 10000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(86, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(87, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(88, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(89, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(90, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(91, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(92, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(93, 0, 0, 0, 0, 1000, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(94, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(95, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(96, 0, 0, 0, 0, 0, 'A1', 'A1', 'expense', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(97, 0, 0, 0, 0, 9000, 'aa', 'aa', 'expense', 9, '2024-07-01', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(98, 0, 0, 0, 0, 0, 'aa', 'aa', 'expense', 9, '2024-07-01', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(99, 0, 0, 0, 0, 79, 'A1', 'A1', 'daily record', 8, '2024-06-29', 8, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(100, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 8, '2024-06-29', 8, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(101, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 8, '2024-06-29', 8, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(102, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 8, '2024-06-29', 8, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(103, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 8, '2024-06-29', 8, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(104, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 8, '2024-06-29', 8, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(105, 0, 0, 0, 0, 199, 'A1', 'A1', 'daily record', 9, '2024-06-29', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(106, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 9, '2024-06-29', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(107, 0, 0, 0, 0, 2000, 'A1', 'A1', 'daily record', 9, '2024-06-29', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(108, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 9, '2024-06-29', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(109, 0, 0, 0, 0, 3000, 'A1', 'A1', 'daily record', 9, '2024-06-29', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(110, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 9, '2024-06-29', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(111, 0, 0, 0, 0, 10000, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(112, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(113, 0, 0, 0, 0, 10000, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(114, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(115, 0, 0, 0, 0, 10000, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(116, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(117, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(118, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(119, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(120, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(121, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(122, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 13, '2024-07-01', 13, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(123, 0, 0, 0, 0, 10000, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(124, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(125, 0, 0, 0, 0, 10000, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(126, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(127, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(128, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(129, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(130, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(131, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(132, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(133, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(134, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(135, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(136, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 14, '2024-07-01', 14, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(137, 0, 0, 0, 0, 9000, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(138, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(139, 0, 0, 0, 0, 8000000, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(140, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(141, 0, 0, 0, 0, 1000000000, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(142, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(143, 0, 0, 0, 0, 1000000000, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(144, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(145, 0, 0, 0, 0, 1000000000, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(146, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(147, 0, 0, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(148, 0, 1000000000, 0, 0, 0, 'A1', 'A1', 'daily record', 15, '2024-07-02', 15, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(149, 0, 0, 0, 9000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(150, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(151, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(152, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 61, '2024-05-25', 61, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(153, 0, 0, 0, 9000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(154, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(155, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(156, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(157, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(158, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 62, '2024-05-26', 62, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(159, 0, 0, 0, 10000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 63, '2024-05-26', 63, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(160, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 63, '2024-05-26', 63, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(161, 0, 0, 0, 1000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 64, '2024-05-26', 64, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(162, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 64, '2024-05-26', 64, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(163, 0, 0, 0, 9000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(164, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(165, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(166, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(167, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(168, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(169, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(170, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 65, '2024-05-27', 65, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(171, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 64, '2024-05-26', 64, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(172, 0, 0, 0, 1000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(173, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(174, 0, 0, 0, 1000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(175, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 66, '2024-05-27', 66, 0, '', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 1),
(176, 0, 0, 0, 1000, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'spent', 68, '2024-06-01', 68, 0, '', 'تسديد اجور تحميل كلية  قسم المختبرات الصباحي المرحلة الاولى للعام الدراسي 2017-2018', 1),
(177, 0, 0, 0, 0, 0, 'Ali Hussein Qasim Almufadhl', 'Ali Hussein Qasim Almufadhl', 'paid', 68, '2024-06-01', 68, 0, '', 'تسديد اجور تحميل كلية  قسم المختبرات الصباحي المرحلة الاولى للعام الدراسي 2017-2018', 1),
(178, 0, 0, 0, 90000, 0, 'new', 'new', 'spent', 69, '2024-06-03', 69, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2021-2022', 1),
(179, 0, 0, 0, 0, 0, 'new', 'new', 'paid', 69, '2024-06-03', 69, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2021-2022', 1),
(180, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(181, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(182, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(183, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(184, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(185, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(186, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(187, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(188, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(189, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 71, '2024-06-11', 71, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(190, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(191, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(192, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(193, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(194, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(195, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(196, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(197, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 72, '2024-06-11', 72, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(198, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 73, '2024-06-23', 73, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(199, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 73, '2024-06-23', 73, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(200, 0, 0, 0, 1000, 0, 'A1', 'A1', 'spent', 74, '2024-06-23', 74, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(201, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 74, '2024-06-23', 74, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(202, 0, 0, 0, 1000, 0, 'A1', 'A1', 'paid', 70, '2024-06-11', 70, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(203, 0, 0, 0, 0, 0, 'aa', 'aa', 'spent', 75, '2024-08-26', 75, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(204, 0, 0, 0, 0, 0, 'aa', 'aa', 'paid', 75, '2024-08-26', 75, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(205, 0, 0, 0, 0, 0, 'aa', 'aa', 'spent', 75, '2024-08-26', 75, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(206, 0, 0, 0, 0, 0, 'aa', 'aa', 'paid', 75, '2024-08-26', 75, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(207, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 76, '2024-10-01', 76, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(208, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 76, '2024-10-01', 76, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(209, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 77, '2024-10-05', 77, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(210, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 77, '2024-10-05', 77, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(211, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(212, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(213, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(214, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(215, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(216, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(217, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(218, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(219, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(220, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(221, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(222, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 4, '2024-06-11', 4, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(223, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(224, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(225, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(226, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(227, 0, 0, 0, 0, 10000, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(228, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(229, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(230, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(231, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(232, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(233, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(234, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(235, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(236, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 5, '2024-06-26', 5, 0, '1970-01-01', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(237, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(238, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(239, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(240, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(241, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(242, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(243, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(244, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(245, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(246, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(247, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(248, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(249, 0, 0, 0, 0, 1000, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(250, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(251, 0, 0, 0, 0, 0, 'A1', 'A1', 'spent', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(252, 0, 0, 0, 0, 0, 'A1', 'A1', 'paid', 6, '2024-06-26', 6, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(253, 0, 0, 0, 0, 9000, 'aa', 'aa', 'spent', 9, '2024-07-01', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1),
(254, 0, 0, 0, 0, 0, 'aa', 'aa', 'paid', 9, '2024-07-01', 9, 0, '', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 1);

-- --------------------------------------------------------

--
-- Table structure for table `level_col`
--

CREATE TABLE `level_col` (
  `id_l` int(11) NOT NULL,
  `level_name` text DEFAULT NULL,
  `level_number` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_record`
--

CREATE TABLE `pay_record` (
  `id_re` int(11) NOT NULL,
  `id_l` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `money` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `all_money` text DEFAULT NULL,
  `pay_money` text DEFAULT NULL,
  `pay_now` text DEFAULT NULL,
  `rec_no` float DEFAULT NULL,
  `last_date_pay` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `year` text DEFAULT NULL,
  `status` float DEFAULT NULL,
  `book` text DEFAULT NULL,
  `book_date` varchar(255) DEFAULT NULL,
  `book_type` text DEFAULT NULL,
  `book_dier` text DEFAULT NULL,
  `type_of_pay` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_record_r`
--

CREATE TABLE `pay_record_r` (
  `id_re` int(11) NOT NULL,
  `id_l` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `money` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `all_money` text DEFAULT NULL,
  `pay_money` text DEFAULT NULL,
  `pay_now` text DEFAULT NULL,
  `rec_no` float DEFAULT NULL,
  `last_date_pay` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `year` text DEFAULT NULL,
  `status` float DEFAULT NULL,
  `book` text DEFAULT NULL,
  `book_date` varchar(255) DEFAULT NULL,
  `book_type` text DEFAULT NULL,
  `book_dier` text DEFAULT NULL,
  `type_of_pay` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id_r` int(11) NOT NULL,
  `number` double DEFAULT NULL,
  `money` float DEFAULT NULL,
  `data_in` datetime DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date_ac` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `from_per` text DEFAULT NULL,
  `write_mo` text DEFAULT NULL,
  `id_u` float DEFAULT NULL,
  `name` text DEFAULT NULL,
  `id_col` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `c_number` text DEFAULT NULL,
  `c_date` varchar(255) DEFAULT NULL,
  `type_of_receipt` float DEFAULT NULL,
  `year_r` varchar(50) DEFAULT NULL,
  `editor_name` varchar(255) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `levels` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`id_r`, `number`, `money`, `data_in`, `type`, `date_ac`, `note`, `from_per`, `write_mo`, `id_u`, `name`, `id_col`, `id_s`, `c_number`, `c_date`, `type_of_receipt`, `year_r`, `editor_name`, `editor_id`, `levels`) VALUES
(61, 0, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '1900-01-18 09:22:43', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', NULL, NULL, 'الاولى'),
(62, 0, 9000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '0a', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(63, 0, 10000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(64, 0, 1000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 2, 2, '0', '', 1, '2017-2018', NULL, NULL, 'الاولى'),
(65, 0, 9000, '2024-05-27 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(66, 0, 2000, '2024-05-27 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألفان   ', 1, 'lol', 2, 2, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(68, 0, 1000, '2024-06-01 00:00:00', 'اجور تحميل', '0000-00-00 00:00:00', 'تسديد اجور تحميل كلية  قسم المختبرات الصباحي المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 149, 2, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(69, 0, 90000, '2024-06-03 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2021-2022', 'new', '  تسعون  الف    ', 1, 'lol', 1, 6, '0', '', 0, '2021-2022', NULL, NULL, 'الاولى'),
(70, 0, 2000, '2024-06-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألفان   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(71, 0, 2000, '2024-06-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألفان   ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(72, 0, 2000, '2024-06-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألفان   ', 1, 'lol', 1, 103, '0', '', 1, '2017-2018', NULL, NULL, 'الاولى'),
(73, 0, 1000, '2024-06-23 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألف   ', 1, 'lol', 1, 103, '0', '', 1, '2017-2018', NULL, NULL, 'الاولى'),
(74, 0, 1000, '2024-06-23 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألف   ', 1, 'lol', 1, 103, '0', '', 1, '2017-2018', NULL, NULL, 'الاولى'),
(75, 0, 3000, '2024-08-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'aa', ' ثلاثة آلاف   ', 1, 'lol', 1, 104, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(76, 0, 1000000, '2024-10-01 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' مليون    الف     ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى'),
(77, 0, 10000, '2024-10-05 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' عشرة آلاف    ', 1, 'lol', 1, 103, '0', '', 0, '2017-2018', NULL, NULL, 'الاولى');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_detail_records`
--

CREATE TABLE `receipt_detail_records` (
  `id_d` int(11) NOT NULL,
  `money` float DEFAULT NULL,
  `type` text DEFAULT NULL,
  `number_acc` float DEFAULT NULL,
  `number_ber` float DEFAULT NULL,
  `id_cost` float DEFAULT NULL,
  `id_r` float DEFAULT NULL,
  `editor_name` varchar(255) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `time_and_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `receipt_detail_records`
--

INSERT INTO `receipt_detail_records` (`id_d`, `money`, `type`, `number_acc`, `number_ber`, `id_cost`, `id_r`, `editor_name`, `editor_id`, `time_and_date`) VALUES
(172, 1000, 'spent', 182, 0, 0, NULL, NULL, NULL, NULL),
(173, 1000, 'paid', 435, 0, 0, NULL, NULL, NULL, NULL),
(174, 10000, 'paid', 182, 0, 0, NULL, NULL, NULL, NULL),
(175, 9000, 'spent', 435, 0, 0, NULL, NULL, NULL, NULL),
(176, 0, 'spent', 182, 0, 0, NULL, NULL, NULL, NULL),
(177, 0, 'paid', 435, 0, 0, NULL, NULL, NULL, NULL),
(172, 1000, 'spent', 182, 0, 0, NULL, '1', 0, NULL),
(173, 1000, 'paid', 435, 0, 0, NULL, '1', 0, NULL),
(174, 10000, 'paid', 182, 0, 0, NULL, '1', 0, NULL),
(175, 9000, 'spent', 435, 0, 0, NULL, '1', 0, NULL),
(176, 0, 'spent', 182, 0, 0, NULL, '1', 0, NULL),
(177, 0, 'paid', 435, 0, 0, NULL, '1', 0, NULL),
(172, 1000, 'spent', 182, 0, 0, NULL, 'lol', 1, NULL),
(173, 1000, 'paid', 435, 0, 0, NULL, 'lol', 1, NULL),
(174, 10000, 'paid', 182, 0, 0, NULL, 'lol', 1, NULL),
(175, 9000, 'spent', 435, 0, 0, NULL, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, NULL, 'lol', 1, NULL),
(177, 0, 'paid', 435, 0, 0, NULL, 'lol', 1, NULL),
(172, 1000, 'spent', 182, 0, 0, NULL, 'lol', 1, NULL),
(173, 1000, 'paid', 435, 0, 0, NULL, 'lol', 1, NULL),
(174, 10000, 'paid', 182, 0, 0, NULL, 'lol', 1, NULL),
(175, 9000, 'spent', 435, 0, 0, NULL, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, NULL, 'lol', 1, NULL),
(177, 0, 'paid', 435, 0, 0, NULL, 'lol', 1, NULL),
(172, 1000, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(173, 1000, 'paid', 435, 0, 0, 41, 'lol', 1, NULL),
(174, 10000, 'paid', 182, 0, 0, 41, 'lol', 1, NULL),
(175, 9000, 'spent', 435, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(177, 0, 'paid', 435, 0, 0, 41, 'lol', 1, NULL),
(172, 1000, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(173, 1000, 'paid', 435, 0, 0, 41, 'lol', 1, NULL),
(174, 10000, 'paid', 182, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(172, 1000, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(173, 1000, 'paid', 435, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(178, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(179, 9000, 'spent', 0, 0, 0, 41, 'lol', 1, NULL),
(172, 1000, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(180, 8888, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(172, 1000, 'paid', 182, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(180, 8888, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(180, 8888, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(181, 100, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(180, 8888, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(181, 100, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(182, 200, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(176, 0, 'spent', 182, 0, 0, 41, 'lol', 1, NULL),
(180, 8888, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(181, 100, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(182, 200, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(183, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(184, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(184, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(185, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(184, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(185, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(186, 2000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(187, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(187, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(196, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(196, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'spent', 0, 0, 0, 41, 'lol', 1, NULL),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(196, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, NULL),
(194, 1000, 'spent', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:24:16'),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:24:16'),
(196, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:24:16'),
(194, 1000, 'spent', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:30:35'),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:30:35'),
(196, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:30:35'),
(197, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:30:35'),
(194, 1000, 'spent', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(196, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(197, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(198, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(199, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(200, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 11:38:17'),
(194, 1000, 'spent', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(195, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(196, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(197, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(198, 9000, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(199, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(200, 0, 'paid', 0, 0, 0, 41, 'lol', 1, '2024-05-20 12:16:36'),
(98, 10000, 'spent', 182, 0, 0, 33, 'lol', 1, '2024-05-20 12:17:33'),
(99, 10000, 'paid', 435, 0, 0, 33, 'lol', 1, '2024-05-20 12:17:33'),
(126, 0, 'paid', 0, 0, 0, 33, 'lol', 1, '2024-05-20 12:17:33'),
(128, 0, 'paid', 0, 0, 0, 33, 'lol', 1, '2024-05-20 12:17:33'),
(163, 0, 'paid', 0, 0, 0, 33, 'lol', 1, '2024-05-20 12:17:33'),
(293, 1000, 'spent', 182, 0, 0, 64, 'lol', 1, '2024-05-27 12:42:23'),
(294, 1000, 'paid', 435, 0, 0, 64, 'lol', 1, '2024-05-27 12:42:23'),
(303, 0, 'paid', 0, 0, 0, 64, 'lol', 1, '2024-05-27 12:42:23'),
(293, 1000, 'spent', 182, 0, 0, 64, 'lol', 1, '2024-05-27 12:42:46'),
(294, 1000, 'paid', 435, 0, 0, 64, 'lol', 1, '2024-05-27 12:42:46'),
(303, 7000, 'paid', 0, 0, 0, 64, 'lol', 1, '2024-05-27 12:42:46'),
(304, 1000, 'spent', 182, 0, 0, 66, 'lol', 1, '2024-05-28 10:02:59'),
(305, 1000, 'paid', 435, 0, 0, 66, 'lol', 1, '2024-05-28 10:02:59'),
(306, 1000, 'spent', 182, 0, 0, 66, 'lol', 1, '2024-05-28 10:02:59'),
(307, 10000, 'paid', 435, 0, 0, 66, 'lol', 1, '2024-05-28 10:02:59'),
(308, 10000, 'spent', 182, 0, 0, 67, 'lol', 1, '2024-05-29 09:01:09'),
(309, 10000, 'paid', 435, 0, 0, 67, 'lol', 1, '2024-05-29 09:01:09'),
(310, 9000, 'paid', 0, 0, 0, 67, 'lol', 1, '2024-05-29 09:01:09'),
(311, 0, 'paid', 0, 0, 0, 67, 'lol', 1, '2024-05-29 09:01:09'),
(336, 1000, 'spent', 182, 0, 0, 74, 'lol', 1, '2024-06-23 12:22:01'),
(337, 1000, 'paid', 435, 0, 0, 74, 'lol', 1, '2024-06-23 12:22:01'),
(316, 1000, 'spent', 182, 0, 0, 70, 'lol', 1, '2024-06-26 09:00:56'),
(317, 1000, 'paid', 435, 0, 0, 70, 'lol', 1, '2024-06-26 09:00:56'),
(318, 1000, 'spent', 182, 0, 0, 70, 'lol', 1, '2024-06-26 09:00:56'),
(319, 1000, 'paid', 435, 0, 0, 70, 'lol', 1, '2024-06-26 09:00:56'),
(316, 1000, 'spent', 182, 0, 0, 70, 'lol', 1, '2024-06-26 09:01:47'),
(317, 1000, 'paid', 435, 0, 0, 70, 'lol', 1, '2024-06-26 09:01:47'),
(318, 1000, 'spent', 182, 0, 0, 70, 'lol', 1, '2024-06-26 09:01:47'),
(319, 1000, 'paid', 435, 0, 0, 70, 'lol', 1, '2024-06-26 09:01:47'),
(338, 1000, 'paid', 182, 0, 0, 70, 'lol', 1, '2024-06-26 09:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_detal`
--

CREATE TABLE `receipt_detal` (
  `id_d` int(11) NOT NULL,
  `money` float DEFAULT NULL,
  `type` text DEFAULT NULL,
  `number_acc` float DEFAULT NULL,
  `number_ber` float DEFAULT NULL,
  `id_cost` float DEFAULT NULL,
  `id_r` float DEFAULT NULL,
  `editor_name` varchar(255) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `receipt_detal`
--

INSERT INTO `receipt_detal` (`id_d`, `money`, `type`, `number_acc`, `number_ber`, `id_cost`, `id_r`, `editor_name`, `editor_id`) VALUES
(49, 10000, 'spent', 182, NULL, NULL, NULL, NULL, NULL),
(50, 10000, 'paid', 435, NULL, NULL, NULL, NULL, NULL),
(51, 1000, 'spent', 182, NULL, NULL, NULL, NULL, NULL),
(52, 1000, 'paid', 435, NULL, NULL, NULL, NULL, NULL),
(53, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(54, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(55, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(56, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(57, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(58, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(59, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(60, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(61, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(62, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(63, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(64, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(65, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(66, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(67, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(68, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(69, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(70, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(71, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(72, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(73, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(74, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(75, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(76, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(77, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(78, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(79, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(80, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(81, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(82, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(83, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(84, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(85, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(86, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(87, 0, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(88, 0, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(89, 0, 'paid', 10000, NULL, NULL, 0, NULL, NULL),
(90, 1000, 'spent', 182, NULL, NULL, 0, NULL, NULL),
(91, 1000, 'paid', 435, NULL, NULL, 0, NULL, NULL),
(92, 1000, 'spent', 182, 0, 0, 32, NULL, NULL),
(93, 1000, 'paid', 435, 0, 0, 32, NULL, NULL),
(94, 0, 'spent', 182, 0, 0, 32, NULL, NULL),
(95, 0, 'spent', 435, 0, 0, 32, NULL, NULL),
(98, 10000, 'spent', 182, 0, 0, 33, NULL, NULL),
(99, 10000, 'paid', 435, 0, 0, 33, NULL, NULL),
(102, 5000000, 'spent', 182, NULL, NULL, 35, NULL, NULL),
(103, 5000000, 'paid', 435, NULL, NULL, 35, NULL, NULL),
(104, 0, 'spent', 182, NULL, NULL, 35, NULL, NULL),
(105, 0, 'paid', 435, NULL, NULL, 35, NULL, NULL),
(106, 5000000, 'spent', 182, NULL, NULL, 36, NULL, NULL),
(107, 5000000, 'paid', 435, NULL, NULL, 36, NULL, NULL),
(108, 0, 'spent', 182, NULL, NULL, 36, NULL, NULL),
(109, 0, 'paid', 435, NULL, NULL, 36, NULL, NULL),
(110, 0, 'spent', 182, NULL, NULL, 36, NULL, NULL),
(111, 0, 'paid', 435, NULL, NULL, 36, NULL, NULL),
(112, 10000, 'spent', 182, NULL, NULL, 37, NULL, NULL),
(113, 10000, 'paid', 435, NULL, NULL, 37, NULL, NULL),
(114, 2000, 'paid', 182, 0, 0, 38, NULL, NULL),
(115, 2000, 'spent', 435, 0, 0, 38, NULL, NULL),
(116, 8888, 'paid', 435, 0, 0, 39, NULL, NULL),
(117, 0, 'spent', 435, 0, 0, 39, NULL, NULL),
(118, 0, 'paid', 435, 0, 0, 39, NULL, NULL),
(119, 0, 'spent', 435, 0, 0, 39, NULL, NULL),
(126, 0, 'paid', 0, 0, 0, 33, NULL, NULL),
(128, 0, 'paid', 0, 0, 0, 33, NULL, NULL),
(155, 0, 'spent', 9, 0, 0, 32, NULL, NULL),
(163, 0, 'paid', 0, 0, 0, 33, NULL, NULL),
(167, 1000, 'spent', 182, NULL, NULL, 40, NULL, NULL),
(168, 1000, 'paid', 435, NULL, NULL, 40, NULL, NULL),
(169, 10000, 'paid', 182, NULL, NULL, 40, NULL, NULL),
(170, 9000, 'spent', 435, NULL, NULL, 40, NULL, NULL),
(171, 2000, 'paid', 0, 0, 0, 38, NULL, NULL),
(194, 1000, 'spent', 0, 0, 0, 41, NULL, NULL),
(195, 0, 'paid', 0, 0, 0, 41, NULL, NULL),
(196, 9000, 'paid', 0, 0, 0, 41, NULL, NULL),
(197, 0, 'paid', 0, 0, 0, 41, NULL, NULL),
(198, 9000, 'paid', 0, 0, 0, 41, NULL, NULL),
(199, 0, 'paid', 0, 0, 0, 41, NULL, NULL),
(200, 0, 'paid', 0, 0, 0, 41, NULL, NULL),
(201, 9000, 'spent', 182, NULL, NULL, 42, NULL, NULL),
(202, 9000, 'paid', 435, NULL, NULL, 42, NULL, NULL),
(203, 9000, 'spent', 182, NULL, NULL, 43, NULL, NULL),
(204, 9000, 'paid', 435, NULL, NULL, 43, NULL, NULL),
(205, 0, 'spent', 182, NULL, NULL, 43, NULL, NULL),
(206, 0, 'paid', 435, NULL, NULL, 43, NULL, NULL),
(207, 9000, 'spent', 182, NULL, NULL, 44, NULL, NULL),
(208, 9000, 'paid', 435, NULL, NULL, 44, NULL, NULL),
(209, 0, 'spent', 182, NULL, NULL, 44, NULL, NULL),
(210, 0, 'paid', 435, NULL, NULL, 44, NULL, NULL),
(211, 0, 'spent', 182, NULL, NULL, 44, NULL, NULL),
(212, 0, 'paid', 435, NULL, NULL, 44, NULL, NULL),
(213, 9000, 'spent', 182, NULL, NULL, 45, NULL, NULL),
(214, 9000, 'paid', 435, NULL, NULL, 45, NULL, NULL),
(215, 9000, 'spent', 182, NULL, NULL, 46, NULL, NULL),
(216, 9000, 'paid', 435, NULL, NULL, 46, NULL, NULL),
(217, 0, 'spent', 182, NULL, NULL, 46, NULL, NULL),
(218, 0, 'paid', 435, NULL, NULL, 46, NULL, NULL),
(219, 9000, 'spent', 182, NULL, NULL, 47, NULL, NULL),
(220, 9000, 'paid', 435, NULL, NULL, 47, NULL, NULL),
(221, 0, 'spent', 182, NULL, NULL, 47, NULL, NULL),
(222, 0, 'paid', 435, NULL, NULL, 47, NULL, NULL),
(223, 9000, 'spent', 182, NULL, NULL, 48, NULL, NULL),
(224, 9000, 'paid', 435, NULL, NULL, 48, NULL, NULL),
(225, 0, 'spent', 182, NULL, NULL, 48, NULL, NULL),
(226, 0, 'paid', 435, NULL, NULL, 48, NULL, NULL),
(227, 9000, 'spent', 182, NULL, NULL, 49, NULL, NULL),
(228, 9000, 'paid', 435, NULL, NULL, 49, NULL, NULL),
(229, 0, 'spent', 182, NULL, NULL, 49, NULL, NULL),
(230, 0, 'paid', 435, NULL, NULL, 49, NULL, NULL),
(231, 9000, 'spent', 182, NULL, NULL, 50, NULL, NULL),
(232, 9000, 'paid', 435, NULL, NULL, 50, NULL, NULL),
(233, 0, 'spent', 182, NULL, NULL, 50, NULL, NULL),
(234, 0, 'paid', 435, NULL, NULL, 50, NULL, NULL),
(235, 6000000, 'spent', 182, NULL, NULL, 51, NULL, NULL),
(236, 6000000, 'paid', 435, NULL, NULL, 51, NULL, NULL),
(237, 6000000, 'spent', 182, NULL, NULL, 52, NULL, NULL),
(238, 6000000, 'paid', 435, NULL, NULL, 52, NULL, NULL),
(239, 6000000, 'spent', 182, NULL, NULL, 53, NULL, NULL),
(240, 6000000, 'paid', 435, NULL, NULL, 53, NULL, NULL),
(241, 0, 'spent', 182, NULL, NULL, 53, NULL, NULL),
(242, 0, 'paid', 435, NULL, NULL, 53, NULL, NULL),
(243, 6000000, 'spent', 182, NULL, NULL, 54, NULL, NULL),
(244, 6000000, 'paid', 435, NULL, NULL, 54, NULL, NULL),
(245, 0, 'spent', 182, NULL, NULL, 54, NULL, NULL),
(246, 0, 'paid', 435, NULL, NULL, 54, NULL, NULL),
(247, 0, 'spent', 182, NULL, NULL, 54, NULL, NULL),
(248, 0, 'paid', 435, NULL, NULL, 54, NULL, NULL),
(249, 6000000, 'spent', 182, NULL, NULL, 55, NULL, NULL),
(250, 6000000, 'paid', 435, NULL, NULL, 55, NULL, NULL),
(251, 0, 'spent', 182, NULL, NULL, 55, NULL, NULL),
(252, 0, 'paid', 435, NULL, NULL, 55, NULL, NULL),
(253, 0, 'spent', 182, NULL, NULL, 55, NULL, NULL),
(254, 0, 'paid', 435, NULL, NULL, 55, NULL, NULL),
(255, 0, 'spent', 182, NULL, NULL, 55, NULL, NULL),
(256, 0, 'paid', 435, NULL, NULL, 55, NULL, NULL),
(257, 6000000, 'spent', 182, NULL, NULL, 56, NULL, NULL),
(258, 6000000, 'paid', 435, NULL, NULL, 56, NULL, NULL),
(259, 0, 'spent', 182, NULL, NULL, 56, NULL, NULL),
(260, 0, 'paid', 435, NULL, NULL, 56, NULL, NULL),
(261, 0, 'spent', 182, NULL, NULL, 56, NULL, NULL),
(262, 0, 'paid', 435, NULL, NULL, 56, NULL, NULL),
(263, 0, 'spent', 182, NULL, NULL, 56, NULL, NULL),
(264, 0, 'paid', 435, NULL, NULL, 56, NULL, NULL),
(265, 0, 'spent', 182, NULL, NULL, 56, NULL, NULL),
(266, 0, 'paid', 435, NULL, NULL, 56, NULL, NULL),
(267, 1000, 'spent', 182, NULL, NULL, 57, NULL, NULL),
(268, 1000, 'paid', 435, NULL, NULL, 57, NULL, NULL),
(269, 1000, 'spent', 182, NULL, NULL, 58, NULL, NULL),
(270, 1000, 'paid', 435, NULL, NULL, 58, NULL, NULL),
(271, 0, 'spent', 182, NULL, NULL, 58, NULL, NULL),
(272, 0, 'paid', 435, NULL, NULL, 58, NULL, NULL),
(273, 1000, 'spent', 182, NULL, NULL, 59, NULL, NULL),
(274, 1000, 'paid', 435, NULL, NULL, 59, NULL, NULL),
(275, 0, 'spent', 182, NULL, NULL, 59, NULL, NULL),
(276, 0, 'paid', 435, NULL, NULL, 59, NULL, NULL),
(277, 0, 'spent', 182, NULL, NULL, 59, NULL, NULL),
(278, 0, 'paid', 435, NULL, NULL, 59, NULL, NULL),
(279, 10000, 'spent', 182, NULL, NULL, 60, NULL, NULL),
(280, 10000, 'paid', 435, NULL, NULL, 60, NULL, NULL),
(281, 9000, 'spent', 182, NULL, NULL, 61, NULL, NULL),
(282, 9000, 'paid', 435, NULL, NULL, 61, NULL, NULL),
(283, 0, 'spent', 182, NULL, NULL, 61, NULL, NULL),
(284, 0, 'paid', 435, NULL, NULL, 61, NULL, NULL),
(285, 9000, 'spent', 182, NULL, NULL, 62, NULL, NULL),
(286, 9000, 'paid', 435, NULL, NULL, 62, NULL, NULL),
(287, 0, 'spent', 182, NULL, NULL, 62, NULL, NULL),
(288, 0, 'paid', 435, NULL, NULL, 62, NULL, NULL),
(289, 0, 'spent', 182, NULL, NULL, 62, NULL, NULL),
(290, 0, 'paid', 435, NULL, NULL, 62, NULL, NULL),
(291, 10000, 'spent', 182, NULL, NULL, 63, NULL, NULL),
(292, 10000, 'paid', 435, NULL, NULL, 63, NULL, NULL),
(293, 1000, 'spent', 182, 0, 0, 64, NULL, NULL),
(294, 1000, 'paid', 435, 0, 0, 64, NULL, NULL),
(295, 9000, 'spent', 182, NULL, NULL, 65, NULL, NULL),
(296, 9000, 'paid', 435, NULL, NULL, 65, NULL, NULL),
(297, 0, 'spent', 182, NULL, NULL, 65, NULL, NULL),
(298, 0, 'paid', 435, NULL, NULL, 65, NULL, NULL),
(299, 0, 'spent', 182, NULL, NULL, 65, NULL, NULL),
(300, 0, 'paid', 435, NULL, NULL, 65, NULL, NULL),
(301, 0, 'spent', 182, NULL, NULL, 65, NULL, NULL),
(302, 0, 'paid', 435, NULL, NULL, 65, NULL, NULL),
(303, 7000, 'paid', 0, 0, 0, 64, NULL, NULL),
(304, 1000, 'spent', 182, 0, 0, 66, NULL, NULL),
(305, 1000, 'paid', 435, 0, 0, 66, NULL, NULL),
(306, 1000, 'spent', 182, 0, 0, 66, NULL, NULL),
(307, 10000, 'paid', 435, 0, 0, 66, NULL, NULL),
(308, 10000, 'spent', 182, 0, 0, 67, NULL, NULL),
(309, 10000, 'paid', 435, 0, 0, 67, NULL, NULL),
(310, 9000, 'paid', 0, 0, 0, 67, NULL, NULL),
(311, 0, 'paid', 0, 0, 0, 67, NULL, NULL),
(312, 1000, 'spent', 182, NULL, NULL, 68, NULL, NULL),
(313, 1000, 'paid', 435, NULL, NULL, 68, NULL, NULL),
(314, 90000, 'spent', 182, NULL, NULL, 69, NULL, NULL),
(315, 90000, 'paid', 435, NULL, NULL, 69, NULL, NULL),
(316, 1000, 'spent', 182, 0, 0, 70, NULL, NULL),
(317, 1000, 'paid', 435, 0, 0, 70, NULL, NULL),
(318, 1000, 'spent', 182, 0, 0, 70, NULL, NULL),
(319, 1000, 'paid', 435, 0, 0, 70, NULL, NULL),
(320, 1000, 'spent', 182, NULL, NULL, 71, NULL, NULL),
(321, 1000, 'paid', 435, NULL, NULL, 71, NULL, NULL),
(322, 1000, 'spent', 182, NULL, NULL, 71, NULL, NULL),
(323, 1000, 'paid', 435, NULL, NULL, 71, NULL, NULL),
(324, 0, 'spent', 182, NULL, NULL, 71, NULL, NULL),
(325, 0, 'paid', 435, NULL, NULL, 71, NULL, NULL),
(326, 1000, 'spent', 182, NULL, NULL, 72, NULL, NULL),
(327, 1000, 'paid', 435, NULL, NULL, 72, NULL, NULL),
(328, 1000, 'spent', 182, NULL, NULL, 72, NULL, NULL),
(329, 1000, 'paid', 435, NULL, NULL, 72, NULL, NULL),
(330, 0, 'spent', 182, NULL, NULL, 72, NULL, NULL),
(331, 0, 'paid', 435, NULL, NULL, 72, NULL, NULL),
(332, 0, 'spent', 182, NULL, NULL, 72, NULL, NULL),
(333, 0, 'paid', 435, NULL, NULL, 72, NULL, NULL),
(334, 1000, 'spent', 182, NULL, NULL, 73, NULL, NULL),
(335, 1000, 'paid', 435, NULL, NULL, 73, NULL, NULL),
(336, 1000, 'spent', 182, 0, 0, 74, NULL, NULL),
(337, 1000, 'paid', 435, 0, 0, 74, NULL, NULL),
(338, 1000, 'paid', 182, 0, 0, 70, NULL, NULL),
(339, 1000, 'spent', 183, NULL, NULL, 75, NULL, NULL),
(340, 1000, 'paid', 435, NULL, NULL, 75, NULL, NULL),
(341, 2000, 'spent', 183, NULL, NULL, 75, NULL, NULL),
(342, 2000, 'paid', 435, NULL, NULL, 75, NULL, NULL),
(343, 1000000, 'spent', 183, NULL, NULL, 76, NULL, NULL),
(344, 1000000, 'paid', 435, NULL, NULL, 76, NULL, NULL),
(345, 10000, 'spent', 183, NULL, NULL, 77, NULL, NULL),
(346, 10000, 'paid', 435, NULL, NULL, 77, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_records`
--

CREATE TABLE `receipt_records` (
  `id_r` int(11) NOT NULL,
  `number` double DEFAULT NULL,
  `money` float DEFAULT NULL,
  `data_in` datetime DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date_ac` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `from_per` text DEFAULT NULL,
  `write_mo` text DEFAULT NULL,
  `id_u` float DEFAULT NULL,
  `name` text DEFAULT NULL,
  `id_col` float DEFAULT NULL,
  `id_s` float DEFAULT NULL,
  `c_number` text DEFAULT NULL,
  `c_date` varchar(255) DEFAULT NULL,
  `type_of_receipt` float DEFAULT NULL,
  `year_r` varchar(50) DEFAULT NULL,
  `editor_name` varchar(255) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `id_rr` int(11) NOT NULL,
  `levels` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `receipt_records`
--

INSERT INTO `receipt_records` (`id_r`, `number`, `money`, `data_in`, `type`, `date_ac`, `note`, `from_per`, `write_mo`, `id_u`, `name`, `id_col`, `id_s`, `c_number`, `c_date`, `type_of_receipt`, `year_r`, `editor_name`, `editor_id`, `id_rr`, `levels`) VALUES
(0, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  أحد عشر الفا   ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2017-2018', 'lol', 1, 1, NULL),
(0, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'New stuff', '  أحد عشر الفا   ', 1, 'lol', 2, 102, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 2, NULL),
(0, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'New stuff', '  أحد عشر الفا   ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 3, NULL),
(0, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  أحد عشر الفا   ', 1, 'lol', 2, 2, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 4, NULL),
(0, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  أحد عشر الفا   ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 5, NULL),
(0, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  أحد عشر الفا   ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 6, NULL),
(41, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  أحد عشر الفا   ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 7, NULL),
(41, NULL, 11000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  أحد عشر الفا   ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 8, NULL),
(41, NULL, 9000, '2024-05-19 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'Payment for قسط سنوي college of 3 for the academic year 2024-2025', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 3, 0, '', '1970-01-01', 0, '2024-2025', 'lol', 1, 9, NULL),
(33, NULL, 10000, '0000-00-00 00:00:00', 'سنوي', '2024-04-08 00:00:00', 'تسديد سنوي كلية 0 للعام الدراسي 2027-2028', 'new', '  عشرة آلاف   ', 1, 'admin', 0, 0, '', '1970-01-01', 0, '2027-2028', 'lol', 1, 10, NULL),
(44, NULL, 9000, '2024-05-21 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية 2 للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2017-2018', 'lol', 1, 11, NULL),
(44, NULL, 9000, '2024-05-21 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية 2 للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2017-2018', 'lol', 1, 12, NULL),
(44, NULL, 9000, '2024-05-21 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية 2 للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2017-2018', 'lol', 1, 13, NULL),
(44, NULL, 9000, '2024-05-21 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية 2 للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 0, '', '1970-01-01', 0, '2017-2018', 'lol', 1, 14, 's'),
(50, NULL, 9000, '2024-05-22 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية 2 للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 0, '900011', '1970-01-01', 1, '2017-2018', 'lol', 1, 15, 'الاولى'),
(32, NULL, 1000, '0000-00-00 00:00:00', 'سنوي', '2024-04-08 00:00:00', 'لقد استلمنا من السيد a اجور قسطسنوي كلية  الصيدلة المرحلة الاولى the amount of  ألفان    for the study year of 2017-2018', 'x', ' ألف   ', 1, 'admin', 0, 0, '', '1970-01-01', 1, '2017-2018', '', 0, 16, NULL),
(39, NULL, 2000, '2024-05-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'Inactive', 'Ali Hussein Qasim Almufadhl', ' ألفان   ', 1, 'lol', 0, 1, '', '2024-05-11', 0, '2017-2018', NULL, NULL, 17, NULL),
(39, NULL, 2000, '2024-05-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'Inactive', 'Ali Hussein Qasim Almufadhl', ' ألفان   ', 1, 'lol', 0, 1, '', '2024-05-11', 1, '2017-2018', NULL, NULL, 18, NULL),
(42, NULL, 9000, '2024-05-21 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 19, 'الاولى'),
(33, NULL, 10000, '0000-00-00 00:00:00', 'سنوي', '2024-04-08 00:00:00', 'تسديد سنوي كلية 0 للعام الدراسي 2027-2028', 'new', '  عشرة آلاف   ', 1, 'admin', 0, 0, '', '1970-01-01', 1, '2027-2028', 'lol', 1, 20, NULL),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 21, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 22, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 23, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 24, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 25, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 26, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 27, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 28, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 29, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 30, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 31, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 32, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 33, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 34, 'الاولى'),
(60, NULL, 10000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', '  عشرة آلاف   ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 35, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 36, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 37, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 38, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 39, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 40, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 41, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 42, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 43, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 44, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 45, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 46, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 47, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 48, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 49, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 50, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 51, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 52, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 53, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 54, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 55, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 56, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 57, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 58, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 59, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 60, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 61, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 62, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 63, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 64, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 65, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 66, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 67, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 68, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 69, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 70, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 71, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 72, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 73, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 74, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 75, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 76, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 0, '2017-2018', 'lol', 1, 77, 'الاولى'),
(61, NULL, 9000, '2024-05-25 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '', '', 1, '2017-2018', 'lol', 1, 78, 'الاولى'),
(62, NULL, 9000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '0a', '', 1, '2017-2018', 'lol', 1, 79, 'الاولى'),
(62, NULL, 9000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' تسعة آلاف    ', 1, 'lol', 2, 2, '0a', '', 0, '2017-2018', 'lol', 1, 80, 'الاولى'),
(64, NULL, 1000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 2, 2, '0', '', 1, '2017-2018', 'lol', 1, 81, 'الاولى'),
(64, NULL, 1000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 2, 2, '0', '', 0, '2017-2018', 'lol', 1, 82, 'الاولى'),
(66, NULL, 2000, '2024-05-27 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألفان   ', 1, 'lol', 2, 2, '0', '', 1, '2017-2018', 'lol', 1, 83, 'الاولى'),
(66, NULL, 2000, '2024-05-27 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألفان   ', 1, 'lol', 2, 2, '0', '', 0, '2017-2018', 'lol', 1, 84, 'الاولى'),
(64, NULL, 1000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 2, 2, '0', '', 1, '2017-2018', 'lol', 1, 85, 'الاولى'),
(64, NULL, 1000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 2, 2, '0', '', 0, '2017-2018', 'lol', 1, 86, 'الاولى'),
(64, NULL, 1000, '2024-05-26 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  2 المرحلة الاولى للعام الدراسي 2017-2018', 'Ali Hussein Qasim Almufadhl', ' ألف   ', 1, 'lol', 2, 2, '0', '', 1, '2017-2018', 'lol', 1, 87, 'الاولى'),
(74, NULL, 1000, '2024-06-23 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألف   ', 1, 'lol', 1, 103, '0', '', 1, '2017-2018', 'lol', 1, 88, 'الاولى'),
(73, NULL, 1000, '2024-06-23 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألف   ', 1, 'lol', 1, 103, '0', '', 1, '2017-2018', 'lol', 1, 89, 'الاولى'),
(72, NULL, 2000, '2024-06-11 00:00:00', 'قسط سنوي', '0000-00-00 00:00:00', 'تسديد قسط سنوي كلية  الجامعة المرحلة الاولى للعام الدراسي 2017-2018', 'A1', ' ألفان   ', 1, 'lol', 1, 103, '0', '', 1, '2017-2018', 'lol', 1, 90, 'الاولى');

-- --------------------------------------------------------

--
-- Table structure for table `status_info`
--

CREATE TABLE `status_info` (
  `id_st` int(11) NOT NULL,
  `id_s` int(11) DEFAULT NULL,
  `id_l` int(11) DEFAULT NULL,
  `level_num` float DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `year` text DEFAULT NULL,
  `adder_name` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updater_user` text DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `status_info`
--

INSERT INTO `status_info` (`id_st`, `id_s`, `id_l`, `level_num`, `date`, `status`, `year`, `adder_name`, `create_date`, `updater_user`, `update_date`) VALUES
(6, 103, 2, 3, '2010-10-01', '0', '2017-2018', 'lol', '2024-06-05 00:00:00', NULL, NULL),
(76, 103, 2, 3, '2010-10-01', '0', '2017-2018', 'lol', '2024-06-05 00:00:00', NULL, NULL),
(77, 103, 3, 3, '2010-10-01', '0', '2017-2018', 'lol', '2024-06-05 00:00:00', 'lol', '2024-06-11 09:26:49'),
(78, NULL, 1, 1, '2024-06-23', '0', '2030-2031', 'lol', '2024-06-23 00:00:00', NULL, NULL),
(79, NULL, 1, 1, '2024-06-12', '0', '2030-2031', 'lol', '2024-06-24 00:00:00', NULL, NULL),
(80, NULL, 1, 1, '2024-05-29', '0', '2030-2031', 'lol', '2024-06-24 00:00:00', NULL, NULL),
(81, NULL, 1, NULL, '0433-03-31', '0', '2030-2031', 'lol', '2024-08-12 00:00:00', NULL, NULL),
(82, NULL, 1, NULL, '2024-08-12', '0', '2030-2031', 'lol', '2024-08-12 00:00:00', NULL, NULL),
(83, NULL, 1, 1, '0004-04-04', '0', '2030-2031', 'lol', '2024-08-26 00:00:00', NULL, NULL),
(84, NULL, 1, 1, '2024-10-28', '0', '2021-2022', 'lol', '2024-10-01 00:00:00', NULL, NULL),
(85, NULL, 1, 2, '2024-10-05', '0', '2021-2022', 'lol', '2024-10-03 00:00:00', NULL, NULL),
(86, NULL, 1, 1, '2024-10-09', '0', '2030-2031', 'lol', '2024-10-05 00:00:00', NULL, NULL),
(87, 111, 1, 1, '2024-10-02', '0', '2030-2031', 'lol', '2024-10-05 00:00:00', NULL, NULL),
(88, NULL, 0, 1, '2024-06-23', '1', '2030-2031', 'lol', '2024-06-23 00:00:00', 'lol', '2024-10-05 10:23:46'),
(89, NULL, 0, 1, '2024-06-12', '1', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:23:46'),
(90, NULL, 0, 1, '2024-05-29', '1', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:23:46'),
(91, NULL, 0, NULL, '0433-03-31', '1', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:23:46'),
(92, NULL, 0, NULL, '2024-08-12', '1', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:23:46'),
(93, NULL, 0, 1, '0004-04-04', '1', '2030-2031', 'lol', '2024-08-26 00:00:00', 'lol', '2024-10-05 10:23:46'),
(94, NULL, 0, 1, '2024-10-28', '1', '2021-2022', 'lol', '2024-10-01 00:00:00', 'lol', '2024-10-05 10:23:46'),
(95, NULL, 0, 2, '2024-10-05', '1', '2021-2022', 'lol', '2024-10-03 00:00:00', 'lol', '2024-10-05 10:23:46'),
(96, NULL, 0, 1, '2024-10-09', '1', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:23:46'),
(97, 111, 0, 1, '2024-10-02', '1', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:23:46'),
(103, NULL, 2, 1, '2024-06-23', '0', '2030-2031', 'lol', '2024-06-23 00:00:00', 'lol', '2024-10-05 10:25:14'),
(104, NULL, 2, 1, '2024-06-12', '0', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:25:14'),
(105, NULL, 2, 1, '2024-05-29', '0', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:25:14'),
(106, NULL, 2, NULL, '0433-03-31', '0', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:25:14'),
(107, NULL, 2, NULL, '2024-08-12', '0', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:25:14'),
(108, NULL, 2, 1, '0004-04-04', '0', '2030-2031', 'lol', '2024-08-26 00:00:00', 'lol', '2024-10-05 10:25:14'),
(109, NULL, 2, 1, '2024-10-28', '0', '2021-2022', 'lol', '2024-10-01 00:00:00', 'lol', '2024-10-05 10:25:14'),
(110, NULL, 2, 2, '2024-10-05', '0', '2021-2022', 'lol', '2024-10-03 00:00:00', 'lol', '2024-10-05 10:25:14'),
(111, NULL, 2, 1, '2024-10-09', '0', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:25:14'),
(112, 111, 2, 1, '2024-10-02', '0', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:25:14'),
(118, NULL, 3, 1, '2024-06-23', '0', '2030-2031', 'lol', '2024-06-23 00:00:00', 'lol', '2024-10-05 10:28:17'),
(119, NULL, 3, 1, '2024-06-12', '0', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:28:17'),
(120, NULL, 3, 1, '2024-05-29', '0', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:28:17'),
(121, NULL, 3, NULL, '0433-03-31', '0', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:28:17'),
(122, NULL, 3, NULL, '2024-08-12', '0', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:28:17'),
(123, NULL, 3, 1, '0004-04-04', '0', '2030-2031', 'lol', '2024-08-26 00:00:00', 'lol', '2024-10-05 10:28:17'),
(124, NULL, 3, 1, '2024-10-28', '0', '2021-2022', 'lol', '2024-10-01 00:00:00', 'lol', '2024-10-05 10:28:17'),
(125, NULL, 3, 2, '2024-10-05', '0', '2021-2022', 'lol', '2024-10-03 00:00:00', 'lol', '2024-10-05 10:28:17'),
(126, 110, 3, 1, '2024-10-09', '0', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:28:17'),
(127, 111, 3, 1, '2024-10-02', '0', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:28:17'),
(133, 103, 4, 3, '2010-10-01', '1', '2017-2018', 'lol', '2024-06-05 00:00:00', 'lol', '2024-10-05 10:29:11'),
(134, NULL, 4, 1, '2024-06-23', '1', '2030-2031', 'lol', '2024-06-23 00:00:00', 'lol', '2024-10-05 10:29:11'),
(135, NULL, 4, 1, '2024-06-12', '1', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:29:11'),
(136, NULL, 4, 1, '2024-05-29', '1', '2030-2031', 'lol', '2024-06-24 00:00:00', 'lol', '2024-10-05 10:29:11'),
(137, NULL, 4, NULL, '0433-03-31', '1', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:29:11'),
(138, NULL, 4, NULL, '2024-08-12', '1', '2030-2031', 'lol', '2024-08-12 00:00:00', 'lol', '2024-10-05 10:29:11'),
(139, NULL, 4, 1, '0004-04-04', '1', '2030-2031', 'lol', '2024-08-26 00:00:00', 'lol', '2024-10-05 10:29:11'),
(140, NULL, 4, 1, '2024-10-28', '1', '2021-2022', 'lol', '2024-10-01 00:00:00', 'lol', '2024-10-05 10:29:11'),
(141, NULL, 4, 2, '2024-10-05', '1', '2021-2022', 'lol', '2024-10-03 00:00:00', 'lol', '2024-10-05 10:29:11'),
(142, 110, 4, 1, '2024-10-09', '1', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:29:11'),
(143, 111, 4, 1, '2024-10-02', '1', '2030-2031', 'lol', '2024-10-05 00:00:00', 'lol', '2024-10-05 10:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `id_s` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `brithday` varchar(255) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `phone_p` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `id_col` varchar(255) DEFAULT NULL,
  `adder_name` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updater_user` text DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`id_s`, `name`, `brithday`, `code`, `phone`, `phone_p`, `email`, `id_col`, `adder_name`, `create_date`, `updater_user`, `update_date`) VALUES
(103, 'A1', '2024-06-04', '1', '078', '988', 'M@YJHY.I', '3', 'lol', '2024-06-05 00:00:00', NULL, NULL),
(104, 'aa', '2024-06-16', '1212', '233431', '141324', 'fewfe@efe.vd', '1', 'lol', '2024-06-23 00:00:00', NULL, NULL),
(105, 'asd', '2024-06-05', '4254', '233431', '141324', 'fewfe@efe.vd', '1', 'lol', '2024-06-24 00:00:00', NULL, NULL),
(106, 'asd', '2024-06-05', '4254', '233431', '141324', 'fewfe@efe.vd', '1', 'lol', '2024-06-24 00:00:00', NULL, NULL),
(107, '3243', '0003-03-31', '3424', '3424', '3424', 'aaa@emcd.com', '1', 'lol', '2024-08-26 00:00:00', NULL, NULL),
(108, 'qqqq', '2024-10-01', '324234', '07800000000', '928478', 'student@mail.com', '1', 'lol', '2024-10-01 00:00:00', NULL, NULL),
(109, 'ww', '2024-10-05', '324234', '07800000000', '928478', 'student@mail.com', '1', 'lol', '2024-10-03 00:00:00', NULL, NULL),
(110, 'wwa', '2024-10-03', '324234', '07800000000', '928478', 'student@mail.com', '1', 'lol', '2024-10-05 00:00:00', NULL, NULL),
(111, 'wwa', '2024-10-02', '324234', '07800000000', '928478', 'student@mail.com', '1', 'lol', '2024-10-05 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_type`) VALUES
(1, 'lol', 'password1', 'user1'),
(2, 'user2', 'password2', 'user2'),
(3, 'user3', 'password3', 'user3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_t`
--
ALTER TABLE `account_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `box_cost`
--
ALTER TABLE `box_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cost_acc`
--
ALTER TABLE `cost_acc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_record`
--
ALTER TABLE `daily_record`
  ADD PRIMARY KEY (`id_dc`);

--
-- Indexes for table `daily_record_detal`
--
ALTER TABLE `daily_record_detal`
  ADD PRIMARY KEY (`id_dd`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id_e`);

--
-- Indexes for table `expense_detal`
--
ALTER TABLE `expense_detal`
  ADD PRIMARY KEY (`id_d`);

--
-- Indexes for table `fund_record`
--
ALTER TABLE `fund_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_col`
--
ALTER TABLE `level_col`
  ADD PRIMARY KEY (`id_l`);

--
-- Indexes for table `pay_record`
--
ALTER TABLE `pay_record`
  ADD PRIMARY KEY (`id_re`);

--
-- Indexes for table `pay_record_r`
--
ALTER TABLE `pay_record_r`
  ADD PRIMARY KEY (`id_re`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id_r`);

--
-- Indexes for table `receipt_detal`
--
ALTER TABLE `receipt_detal`
  ADD PRIMARY KEY (`id_d`);

--
-- Indexes for table `receipt_records`
--
ALTER TABLE `receipt_records`
  ADD PRIMARY KEY (`id_rr`);

--
-- Indexes for table `status_info`
--
ALTER TABLE `status_info`
  ADD PRIMARY KEY (`id_st`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`id_s`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_t`
--
ALTER TABLE `account_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2028;

--
-- AUTO_INCREMENT for table `box_cost`
--
ALTER TABLE `box_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cost_acc`
--
ALTER TABLE `cost_acc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `daily_record`
--
ALTER TABLE `daily_record`
  MODIFY `id_dc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `daily_record_detal`
--
ALTER TABLE `daily_record_detal`
  MODIFY `id_dd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id_e` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `expense_detal`
--
ALTER TABLE `expense_detal`
  MODIFY `id_d` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `fund_record`
--
ALTER TABLE `fund_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `level_col`
--
ALTER TABLE `level_col`
  MODIFY `id_l` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_record`
--
ALTER TABLE `pay_record`
  MODIFY `id_re` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_record_r`
--
ALTER TABLE `pay_record_r`
  MODIFY `id_re` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id_r` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `receipt_detal`
--
ALTER TABLE `receipt_detal`
  MODIFY `id_d` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT for table `receipt_records`
--
ALTER TABLE `receipt_records`
  MODIFY `id_rr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `status_info`
--
ALTER TABLE `status_info`
  MODIFY `id_st` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `student_info`
--
ALTER TABLE `student_info`
  MODIFY `id_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
