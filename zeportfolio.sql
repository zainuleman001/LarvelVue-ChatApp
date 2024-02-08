-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 05:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zeportfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_17_174611_adding_social_id_columns_in_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'user_token', '87d1fefde77911726769db14406a35930cb2d402dbed655e24d19bc50ecfe51f', '[\"*\"]', NULL, NULL, '2023-11-21 21:25:02', '2023-11-21 21:25:02'),
(2, 'App\\Models\\User', 4, 'user_token', '1184030cf04b63a809a692d5dcaaca79a6e5de92da39da6e76d4d5a5170a5c50', '[\"*\"]', NULL, NULL, '2023-11-21 21:26:40', '2023-11-21 21:26:40'),
(3, 'App\\Models\\User', 4, 'user_token', '42bf20473fa8d00b6416418223bb71498f5fe9f1d8335b81ef4fe9087a638f87', '[\"*\"]', NULL, NULL, '2023-11-21 21:27:38', '2023-11-21 21:27:38'),
(4, 'App\\Models\\User', 4, 'user_token', '0eb054283b2d92844bef25c1fe1ba368af6c151770089e8541734f24aee1bb5d', '[\"*\"]', NULL, NULL, '2023-11-21 21:28:00', '2023-11-21 21:28:00'),
(5, 'App\\Models\\User', 5, 'user_token', '68e46ee809d9598b431db803810680e1cc16e9b46cc3d5c953fae24651738291', '[\"*\"]', NULL, NULL, '2023-11-21 21:30:53', '2023-11-21 21:30:53'),
(6, 'App\\Models\\User', 6, 'user_token', 'd395ce8ab1faf3769d85955b087f300843821800b20be2263d0031440b92b657', '[\"*\"]', NULL, NULL, '2023-11-21 21:35:49', '2023-11-21 21:35:49'),
(7, 'App\\Models\\User', 7, 'user_token', '7a664e136198dc468ef0433244b6c198385205c00536dcc7104bf8e1cde38a36', '[\"*\"]', '2023-11-22 14:45:57', NULL, '2023-11-21 21:41:35', '2023-11-22 14:45:57'),
(8, 'App\\Models\\User', 7, 'user_token', '0ca1def1b88fa2615964eb2dabdbc4c5a7713b9d34d69ba1bb2029b86021168f', '[\"*\"]', NULL, NULL, '2023-11-22 14:26:28', '2023-11-22 14:26:28'),
(9, 'App\\Models\\User', 7, 'user_token', 'd0b7f6875552170f76bfaa51b2d382f92b07e4279736333449c50f8065a4d317', '[\"*\"]', NULL, NULL, '2023-11-22 14:26:33', '2023-11-22 14:26:33'),
(10, 'App\\Models\\User', 7, 'user_token', '6c98e8c1bca82764dc380f3a6338e5380fe309eb922d811f2dca72f94a0785a2', '[\"*\"]', NULL, NULL, '2023-11-22 14:26:37', '2023-11-22 14:26:37'),
(11, 'App\\Models\\User', 7, 'user_token', '8fd8b6a6355ab5c0744d69b05b9f214392856c2003a5e3c97ae2d7db81c9b0a8', '[\"*\"]', '2023-11-22 15:08:38', NULL, '2023-11-22 14:53:56', '2023-11-22 15:08:38'),
(12, 'App\\Models\\User', 7, 'user_token', 'b368b96e057860eb08abc37029b27ba981717f19a4891a788efb2a43fb7f06de', '[\"*\"]', '2023-11-22 15:12:48', NULL, '2023-11-22 15:10:04', '2023-11-22 15:12:48'),
(13, 'App\\Models\\User', 7, 'user_token', '243ade85c767523d88485fd432b4c87d9f2a81643ab4cd44efe4e9bd479ad508', '[\"*\"]', '2023-11-22 15:14:19', NULL, '2023-11-22 15:13:51', '2023-11-22 15:14:19'),
(14, 'App\\Models\\User', 7, 'user_token', '0a60ee93574bba25f589459540ec8b28c3cc878d04da7658705397eee12e4c32', '[\"*\"]', '2023-11-22 15:34:15', NULL, '2023-11-22 15:34:01', '2023-11-22 15:34:15'),
(15, 'App\\Models\\User', 7, 'user_token', 'bec25072591514a74bebf0eaccad215f3bba114910319fcb70225b7755c2969b', '[\"*\"]', '2023-11-26 05:41:28', NULL, '2023-11-22 15:36:18', '2023-11-26 05:41:28'),
(16, 'App\\Models\\User', 7, 'user_token', 'a81e6b8f2336e3a9f5ea0656dd513586661d68af1848ab586fd1a18c2591d2d0', '[\"*\"]', NULL, NULL, '2024-01-14 10:22:01', '2024-01-14 10:22:01'),
(17, 'App\\Models\\User', 7, 'user_token', 'da43f4f430009ad35b10e8c292243663df63bfb80eb19b6cf1a050669ed4b558', '[\"*\"]', NULL, NULL, '2024-01-17 09:39:34', '2024-01-17 09:39:34'),
(18, 'App\\Models\\User', 7, 'user_token', '5ed63e620ad7ecf0e83d71221a48344ab72d6ce167c07def01f10781c63dad50', '[\"*\"]', NULL, NULL, '2024-01-17 09:39:43', '2024-01-17 09:39:43'),
(19, 'App\\Models\\User', 7, 'user_token', 'e3a82edbef9efb5ee5defd07c9f6cbe84841e0d8aecf6310f91540e3e20365bc', '[\"*\"]', NULL, NULL, '2024-01-17 09:39:56', '2024-01-17 09:39:56'),
(20, 'App\\Models\\User', 7, 'user_token', '658e509c97696be083e311a69fb1dabbe25ae30db33924d5496dc7429301909d', '[\"*\"]', '2024-01-17 09:44:56', NULL, '2024-01-17 09:40:53', '2024-01-17 09:44:56'),
(21, 'App\\Models\\User', 7, 'user_token', '22a9e47c5a0f1eeb940a1949771f7b490e8b1431e65b0020c2b8a2c03fcb5373', '[\"*\"]', NULL, NULL, '2024-01-17 09:55:55', '2024-01-17 09:55:55'),
(22, 'App\\Models\\User', 7, 'user_token', 'd5e3c1a570535d712fdd49690937da3ddc6dc9d6b1a71f45a91ac52e645905dd', '[\"*\"]', '2024-01-17 09:58:04', NULL, '2024-01-17 09:57:14', '2024-01-17 09:58:04'),
(23, 'App\\Models\\User', 7, 'user_token', '943f54725b043fe3294429f0b98fd387d7e8e76edf7b9519a058ad01bbef923f', '[\"*\"]', '2024-01-17 09:58:45', NULL, '2024-01-17 09:58:14', '2024-01-17 09:58:45'),
(24, 'App\\Models\\User', 7, 'user_token', '22bc3391e73a2d7420afade9b4a66fbbed31af380da53285f1e5d157e2e31ef4', '[\"*\"]', NULL, NULL, '2024-01-17 09:58:57', '2024-01-17 09:58:57'),
(25, 'App\\Models\\User', 7, 'user_token', 'c1ca3ff9032a3076b0fe732951750823222600445ee666632f15fe37c2bcce03', '[\"*\"]', NULL, NULL, '2024-01-17 10:00:56', '2024-01-17 10:00:56'),
(26, 'App\\Models\\User', 7, 'user_token', '86a17dd7ef5a57c76c5975006a06192d13ecf63835ea15e8adb8d214b68ca58e', '[\"*\"]', NULL, NULL, '2024-01-17 10:01:42', '2024-01-17 10:01:42'),
(27, 'App\\Models\\User', 7, 'user_token', 'ac6e96bc9c066e0e6bc6aeca47b4b232312a6390374aaa24f72bd5b6169efb9b', '[\"*\"]', NULL, NULL, '2024-01-17 10:01:52', '2024-01-17 10:01:52'),
(28, 'App\\Models\\User', 7, 'user_token', '24b2d82be1652772ae92da3b9e35d7e861f71603280264f4b2f24985a1113fa2', '[\"*\"]', '2024-01-17 10:02:30', NULL, '2024-01-17 10:02:24', '2024-01-17 10:02:30'),
(29, 'App\\Models\\User', 7, 'user_token', '8be1e2e3a24250405e4bb89335eb7a328d7490092f64c4af0c597c9932b76ef6', '[\"*\"]', NULL, NULL, '2024-01-17 10:03:32', '2024-01-17 10:03:32'),
(30, 'App\\Models\\User', 7, 'user_token', 'e006b654e367e5e621e366050c2aa9700f8bd8a1d8aa3bac1ed3bbcb4a7ff1e1', '[\"*\"]', NULL, NULL, '2024-01-17 10:03:36', '2024-01-17 10:03:36'),
(31, 'App\\Models\\User', 7, 'user_token', 'c37672a98057a6ef71052d022d362296f3ce0634819a32743de247ade2c594f2', '[\"*\"]', NULL, NULL, '2024-01-17 10:03:40', '2024-01-17 10:03:40'),
(32, 'App\\Models\\User', 7, 'user_token', '91fd0979969713c4ccdc34a1948122e6e9f4cd5c984dda398f95590d6c032e40', '[\"*\"]', '2024-01-17 10:08:48', NULL, '2024-01-17 10:05:16', '2024-01-17 10:08:48'),
(33, 'App\\Models\\User', 7, 'user_token', '26d3fc6681e204ed0f78f4cdd57b542708275b15aeb8f32dc9d7671ff714d7bf', '[\"*\"]', NULL, NULL, '2024-01-17 10:09:29', '2024-01-17 10:09:29'),
(34, 'App\\Models\\User', 7, 'user_token', '0d8317b308865d6338f823553d484376511a019b8765165056d7c769fa5ee884', '[\"*\"]', NULL, NULL, '2024-01-17 10:10:27', '2024-01-17 10:10:27'),
(35, 'App\\Models\\User', 7, 'user_token', 'a05ea5fea871b08b39db3fea044f1c9550c9ff84c6d390b4f79d69c8901d23f8', '[\"*\"]', NULL, NULL, '2024-01-17 10:10:30', '2024-01-17 10:10:30'),
(36, 'App\\Models\\User', 7, 'user_token', 'ff3152bc362087b4d5c7d75d1ac646e8740e083dfd7ae414e61e5b8298a5fedd', '[\"*\"]', NULL, NULL, '2024-01-17 10:10:53', '2024-01-17 10:10:53'),
(37, 'App\\Models\\User', 7, 'user_token', '576e847167cf3a288fd01a9700466543aa52679e843b6b8b86d55a45cc741f77', '[\"*\"]', '2024-01-17 10:12:23', NULL, '2024-01-17 10:11:34', '2024-01-17 10:12:23'),
(38, 'App\\Models\\User', 7, 'user_token', '4e6a34dc0f7ba7f48b3ffebac55fb1fb0f8ef4b444626ace8f3776afbaafd969', '[\"*\"]', '2024-01-17 10:13:03', NULL, '2024-01-17 10:12:43', '2024-01-17 10:13:03'),
(39, 'App\\Models\\User', 7, 'user_token', 'fbce1149290bca9843fc24565c837b344d6085e41189ceffa0aa70fd0cee136f', '[\"*\"]', NULL, NULL, '2024-01-17 10:14:38', '2024-01-17 10:14:38'),
(40, 'App\\Models\\User', 7, 'user_token', 'aa6732d4bdfcf743fdc2ee9d3381f2e728a741d2d135d60dfe6382cd72bb54a1', '[\"*\"]', NULL, NULL, '2024-01-17 10:15:29', '2024-01-17 10:15:29'),
(41, 'App\\Models\\User', 7, 'user_token', '30d892a5b9d89a5dd43dac45d1fd5acc7d19b0e34f2f646a8ab2cf8adc4f6459', '[\"*\"]', '2024-01-17 10:16:34', NULL, '2024-01-17 10:16:17', '2024-01-17 10:16:34'),
(42, 'App\\Models\\User', 7, 'user_token', '328dd8a9e173e5b7b93e49e492700cea8ba06da8411fdc65290b1d077e5fc20c', '[\"*\"]', NULL, NULL, '2024-01-17 10:18:49', '2024-01-17 10:18:49'),
(43, 'App\\Models\\User', 7, 'user_token', '06ed545f61354c840761d3886ea9f1306d01d10dbe8fffece94b962ce134532d', '[\"*\"]', NULL, NULL, '2024-01-17 10:19:15', '2024-01-17 10:19:15'),
(44, 'App\\Models\\User', 7, 'user_token', '4c1acdb565267deeb884d4fe2162d4d51e0bf216da4d2a63bd8818000fe59e0d', '[\"*\"]', NULL, NULL, '2024-01-17 10:20:32', '2024-01-17 10:20:32'),
(45, 'App\\Models\\User', 8, 'bearerToken', '22e5c2c2bef0c999479da37e1d3b91a192d159b0f12d4cbaceb4d026239f209b', '[\"*\"]', NULL, NULL, '2024-01-17 13:27:35', '2024-01-17 13:27:35'),
(46, 'App\\Models\\User', 10, 'bearerToken', '11e8c82a04086f4549baf3a5d4607be6ab41cd723504d4882009cada1b6c207c', '[\"*\"]', NULL, NULL, '2024-01-21 05:14:19', '2024-01-21 05:14:19'),
(47, 'App\\Models\\User', 7, 'user_token', '86290cebe66a5306d8eddb503be54d5154a7e89658f1dfe62999a0f2e80837c5', '[\"*\"]', NULL, NULL, '2024-01-21 05:56:23', '2024-01-21 05:56:23'),
(48, 'App\\Models\\User', 7, 'user_token', '16e2ca7dae5b9c605d2b8bb20df727ba0de4a0d39d80d157318c017bbd91308c', '[\"*\"]', NULL, NULL, '2024-01-21 05:58:15', '2024-01-21 05:58:15'),
(49, 'App\\Models\\User', 13, 'user_token', '5d90e3290ac6102f9d304f011aa95049ad0a2b1001e7870f395edc59f7a9c888', '[\"*\"]', NULL, NULL, '2024-02-04 17:29:16', '2024-02-04 17:29:16'),
(50, 'App\\Models\\User', 13, 'user_token', '2a6891c8a0222ebdd47dcf54bf906bc5f5d612ed1876a554feca075734c136f4', '[\"*\"]', NULL, NULL, '2024-02-04 17:46:27', '2024-02-04 17:46:27'),
(51, 'App\\Models\\User', 13, 'user_token', 'db464f39c70ea6943dd3fb3e6b0360dedfb49f83aeed75f9704577e6f2145e82', '[\"*\"]', NULL, NULL, '2024-02-04 17:47:02', '2024-02-04 17:47:02'),
(52, 'App\\Models\\User', 13, 'user_token', 'ac04740107493aa5e1328b799c8decaa86f86d7c26c319d30c1eb4fc13a87154', '[\"*\"]', NULL, NULL, '2024-02-04 20:25:16', '2024-02-04 20:25:16'),
(53, 'App\\Models\\User', 13, 'user_token', '5669020f3e6fbbd4013f47865f9d1576ebf4b886fefc99d031a30758f9762d24', '[\"*\"]', NULL, NULL, '2024-02-04 20:26:15', '2024-02-04 20:26:15'),
(54, 'App\\Models\\User', 13, 'user_token', 'f59df9e117cbe45ce805e7178752b06f5cb62f3c932d09bc452240cdf1dfb1ab', '[\"*\"]', NULL, NULL, '2024-02-04 20:29:38', '2024-02-04 20:29:38'),
(55, 'App\\Models\\User', 13, 'user_token', 'a40d15e84bcec489109ba1e0aabb72b21e37261db4176f130e8c11bd8fb176f9', '[\"*\"]', NULL, NULL, '2024-02-04 20:30:34', '2024-02-04 20:30:34'),
(56, 'App\\Models\\User', 13, 'user_token', '63827dd76f876d3bbe2514b131d01041f637fcc8504fa7a7943226af32aa4ad7', '[\"*\"]', NULL, NULL, '2024-02-04 20:42:43', '2024-02-04 20:42:43'),
(57, 'App\\Models\\User', 13, 'user_token', '2f3de07bbf6512acc4725119fa76b52edd417a6f673b5cdc597be9bf3a0f6e7e', '[\"*\"]', NULL, NULL, '2024-02-04 20:43:11', '2024-02-04 20:43:11'),
(58, 'App\\Models\\User', 13, 'user_token', '5531a306823a887d19b0851a9344e6d4927c7bedcae34a02b27f843fb547eb73', '[\"*\"]', NULL, NULL, '2024-02-04 20:47:50', '2024-02-04 20:47:50'),
(59, 'App\\Models\\User', 13, 'user_token', 'c7452c3ede421e1c8bbb2d52a26688f2da251b06be8b1364ac8aa652cc8478f2', '[\"*\"]', NULL, NULL, '2024-02-04 20:55:43', '2024-02-04 20:55:43'),
(60, 'App\\Models\\User', 13, 'user_token', 'e5867ba39cdfb10301bab3be7dfba1264d417044b673817e48e2925e1bd17099', '[\"*\"]', NULL, NULL, '2024-02-04 20:55:57', '2024-02-04 20:55:57'),
(61, 'App\\Models\\User', 14, 'user_token', 'bda9103078fce0e181cd9521c8a6c6226af5c445287b7d3fdc22cf032ee34f26', '[\"*\"]', NULL, NULL, '2024-02-04 20:56:17', '2024-02-04 20:56:17'),
(62, 'App\\Models\\User', 13, 'user_token', '4feb0ee3a03bf8101d94f627e6b901aebfed3de6624ffc1772774d090040b59a', '[\"*\"]', '2024-02-05 14:21:50', NULL, '2024-02-04 21:07:34', '2024-02-05 14:21:50'),
(63, 'App\\Models\\User', 13, 'user_token', 'de63a343bbaf6239678d51593930d63529bdc3cc3d82a3b11f56e088791a4743', '[\"*\"]', NULL, NULL, '2024-02-04 22:13:31', '2024-02-04 22:13:31'),
(64, 'App\\Models\\User', 13, 'user_token', '26739d94bf0915ed9fd7b886f1cee759b63fb38d3e3e51fbb99a6d54fbc07348', '[\"*\"]', NULL, NULL, '2024-02-04 22:16:16', '2024-02-04 22:16:16'),
(65, 'App\\Models\\User', 13, 'user_token', '6973862e5a5ce0d762b9f3cdc5e751ea1cb702aedde1ef039e1a24772da76693', '[\"*\"]', NULL, NULL, '2024-02-04 22:36:56', '2024-02-04 22:36:56'),
(66, 'App\\Models\\User', 13, 'user_token', 'f71f7333209f97721b5b4027022c8c9976b11d38913bcbc6fc023c8f94346c3f', '[\"*\"]', NULL, NULL, '2024-02-04 22:37:54', '2024-02-04 22:37:54'),
(67, 'App\\Models\\User', 13, 'user_token', 'a8d21cdf8a75ca0ef3f6df339cf9ca8ff8d9d0d0d0dc80c535bae59ce98f238c', '[\"*\"]', NULL, NULL, '2024-02-04 22:46:11', '2024-02-04 22:46:11'),
(68, 'App\\Models\\User', 13, 'user_token', '21078e66d5a4c25d84bbeee88fdb6a79b18e4b404ca0be85b4a9c877a3c4c082', '[\"*\"]', NULL, NULL, '2024-02-04 22:47:35', '2024-02-04 22:47:35'),
(69, 'App\\Models\\User', 13, 'user_token', '45feb10039350540eda068614333a1b353f0fd1783a807cada0d6a340cbb59f6', '[\"*\"]', NULL, NULL, '2024-02-04 22:48:56', '2024-02-04 22:48:56'),
(70, 'App\\Models\\User', 13, 'user_token', '0002df5a78dcca9318557293f16e77bca5aef10cc738cd51fceeb82b9375a0fc', '[\"*\"]', NULL, NULL, '2024-02-04 22:57:47', '2024-02-04 22:57:47'),
(71, 'App\\Models\\User', 13, 'user_token', '4b253b0406716140aebd939ec500afde28dba2ed2b8d0cb08a237c982dfb2586', '[\"*\"]', NULL, NULL, '2024-02-04 23:00:50', '2024-02-04 23:00:50'),
(72, 'App\\Models\\User', 13, 'user_token', '0ef4424d299f60ff807d1662dec960fbae67766a8a02bf635e99bf7e12179996', '[\"*\"]', '2024-02-04 23:11:06', NULL, '2024-02-04 23:08:40', '2024-02-04 23:11:06'),
(73, 'App\\Models\\User', 14, 'user_token', '8645c8502299e544b47e17d6aaf352c76b34e9dea00f6e8ca03ac744b637a7c9', '[\"*\"]', '2024-02-04 23:13:45', NULL, '2024-02-04 23:13:41', '2024-02-04 23:13:45'),
(74, 'App\\Models\\User', 13, 'user_token', 'fa6d4a3da2749a52e7a400c334d7fe212fa169741bd2b71d6e03d37959a25600', '[\"*\"]', '2024-02-04 23:17:00', NULL, '2024-02-04 23:14:13', '2024-02-04 23:17:00'),
(75, 'App\\Models\\User', 10, 'user_token', '676606e1c5f90b41f3a08e7cdce3b3c85dcf129b4f1f43dc36c789a495adf38f', '[\"*\"]', '2024-02-04 23:14:51', NULL, '2024-02-04 23:14:44', '2024-02-04 23:14:51'),
(76, 'App\\Models\\User', 7, 'user_token', '1aa243fd7c21a9444f0e51c644756c64e2e1c1d02bed5f684928dc1c56fcbcbd', '[\"*\"]', NULL, NULL, '2024-02-04 23:15:05', '2024-02-04 23:15:05'),
(77, 'App\\Models\\User', 7, 'user_token', '41eacbcdb52097f20280bdaf39fc9cfa6f1c16477762fa1a69f2610fdcc4a64b', '[\"*\"]', '2024-02-04 23:15:16', NULL, '2024-02-04 23:15:13', '2024-02-04 23:15:16'),
(78, 'App\\Models\\User', 15, 'user_token', 'b48dc7244d43488662f2e73967966662e89e96256340d7652a8e4638f9b420d4', '[\"*\"]', '2024-02-04 23:22:51', NULL, '2024-02-04 23:22:41', '2024-02-04 23:22:51'),
(79, 'App\\Models\\User', 16, 'user_token', 'b61da6f0eb8734a7fefd82ce5d94e6d4a8ebe53c25fed657e6d729f9b9674228', '[\"*\"]', '2024-02-06 21:29:13', NULL, '2024-02-04 23:23:15', '2024-02-06 21:29:13'),
(80, 'App\\Models\\User', 227, 'user_token', '721c288a0f2b44f6b492dd430f1268522777cfea9536b9e11d80b11380c1f518', '[\"*\"]', '2024-02-06 21:31:58', NULL, '2024-02-06 21:29:32', '2024-02-06 21:31:58'),
(81, 'App\\Models\\User', 226, 'user_token', 'fd2e7ecb3f779b6d71daf0bcb45fd70a36e5e06ef8a5779aa978d36f7c9389dc', '[\"*\"]', '2024-02-06 21:35:58', NULL, '2024-02-06 21:33:10', '2024-02-06 21:35:58'),
(82, 'App\\Models\\User', 226, 'user_token', '37689844f7db89050599c7dfac7ec49a66b084e64bf068c6b3a7246438dd148f', '[\"*\"]', NULL, NULL, '2024-02-06 21:35:09', '2024-02-06 21:35:09'),
(83, 'App\\Models\\User', 13, 'user_token', 'a240591b8310320c493ae24e6c0ec49a3ea7ea2371139a49743ffcab77f649b0', '[\"*\"]', '2024-02-06 22:41:16', NULL, '2024-02-06 22:39:39', '2024-02-06 22:41:16'),
(84, 'App\\Models\\User', 13, 'user_token', 'd83b8ba94ec8f4959ece82351fe0cbe61ec44a2266d477343843a658cd7ff564', '[\"*\"]', NULL, NULL, '2024-02-06 22:41:29', '2024-02-06 22:41:29'),
(85, 'App\\Models\\User', 13, 'user_token', '9678b5813c2440df5834b89782b20c8525459835bdbd2ca214cabc4c28a9d6af', '[\"*\"]', NULL, NULL, '2024-02-06 22:41:44', '2024-02-06 22:41:44'),
(86, 'App\\Models\\User', 13, 'user_token', 'bfda1d2fd71f90e9846d9c30c83f6ae31a94f674167aff580aa4c01005732a8c', '[\"*\"]', '2024-02-06 22:43:53', NULL, '2024-02-06 22:43:40', '2024-02-06 22:43:53'),
(87, 'App\\Models\\User', 7, 'user_token', '6a02f86faff6d37cbb42e196de8ed65156e48e0f9da85002260249b5d128fb41', '[\"*\"]', '2024-02-06 22:45:08', NULL, '2024-02-06 22:44:49', '2024-02-06 22:45:08'),
(88, 'App\\Models\\User', 7, 'user_token', 'bdedb432c3c4e89903767c9071ac53d14f84c1775df2a4ebf8b76b9925093899', '[\"*\"]', '2024-02-06 22:45:48', NULL, '2024-02-06 22:45:17', '2024-02-06 22:45:48'),
(89, 'App\\Models\\User', 7, 'user_token', 'ffbaa63f528e8fb4fbb058019a032ef022ee683d820c88fd3bf5f4d9d3039ecb', '[\"*\"]', '2024-02-06 22:46:03', NULL, '2024-02-06 22:46:01', '2024-02-06 22:46:03'),
(90, 'App\\Models\\User', 228, 'user_token', '0568570eb351349b6980e78266d7ff401195536c79b3e3070d3c8385d9af219e', '[\"*\"]', '2024-02-06 22:46:56', NULL, '2024-02-06 22:46:45', '2024-02-06 22:46:56'),
(91, 'App\\Models\\User', 7, 'user_token', 'bac2d09ad01c30c708100f0c66eabada4ff8cfede0939c736a92dc51b735bf3a', '[\"*\"]', '2024-02-06 22:47:06', NULL, '2024-02-06 22:47:04', '2024-02-06 22:47:06'),
(92, 'App\\Models\\User', 13, 'user_token', '50d3d8ae9b3ae1805de0b7f09b1d4f79805120d748fe2b6612d2c668fe032d1c', '[\"*\"]', '2024-02-06 22:47:33', NULL, '2024-02-06 22:47:26', '2024-02-06 22:47:33'),
(93, 'App\\Models\\User', 13, 'user_token', 'b87a13997488e94f71305363b3297bccb0eb663fc0f1292f09ebb7283db192c1', '[\"*\"]', NULL, NULL, '2024-02-06 22:48:22', '2024-02-06 22:48:22'),
(94, 'App\\Models\\User', 7, 'user_token', '3bbf1f5e5e2da2d9ae4e7218ecfae3bb6d5343e7ccb18fe2f16a7e6b35d1c953', '[\"*\"]', '2024-02-06 22:48:42', NULL, '2024-02-06 22:48:39', '2024-02-06 22:48:42'),
(95, 'App\\Models\\User', 13, 'user_token', 'c1ff12cdeb141884cc6812143e2faef0f51695feeeff787026b0b24c7162d7d2', '[\"*\"]', '2024-02-06 22:50:17', NULL, '2024-02-06 22:50:10', '2024-02-06 22:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL,
  `google_user_id` text DEFAULT NULL,
  `facebook_user_id` text DEFAULT NULL,
  `twitter_user_id` text DEFAULT NULL,
  `github_user_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `code`, `type`, `remember_token`, `created_at`, `updated_at`, `image`, `google_user_id`, `facebook_user_id`, `twitter_user_id`, `github_user_id`) VALUES
(7, 'Zain ul Eman 001', 'zainuleman.001@gmail.com', '2024-02-06 22:44:49', '$2y$10$2lB9FYHBXAhlEj2Zj0kBCuJuGCKaxlIdhQXeR7DVxboMGAZ.WCng6', NULL, 'admin', NULL, '2023-11-21 21:41:24', '2024-02-06 22:45:48', 'profile_images/user_7_profile_65c060c9d984c.jpg', '110547786178396944302', '358014090343194', NULL, NULL),
(8, 'Zain ul Eman', 'zainuleman.official@gmail.com', NULL, '$2y$10$WxrC2mC4qT06hBEtuQZhzOXscn6RpjiBdisMhuWUFNwmCQqj3vYVm', NULL, 'user', NULL, '2024-01-17 13:27:35', '2024-01-17 13:27:35', NULL, NULL, NULL, NULL, NULL),
(10, 'Zain ul Eman 2', 'zainuleman.002@gmail.com', NULL, '$2y$10$TyWRM0nSP6dYpTXzH9JPXu2o1jRMQKbkiBCIc4kL6q8EZBKn7kumm', NULL, 'user', NULL, '2024-01-21 05:14:18', '2024-02-04 23:14:44', 'profile_images/user_10_profile_65c060b49cf2e.jpg', '104608215909371470868', NULL, NULL, NULL),
(12, 'Zain ul Eman 3', 'zainuleman.003@gmail.com', NULL, '$2y$10$NgZqTUAH8hpyJCWN5wjg6eF42vRRf7//kiZ2Ws1BFI8PHH2Kxw6Ca', NULL, 'user', NULL, '2024-01-21 05:28:41', '2024-01-21 05:29:17', NULL, NULL, NULL, NULL, NULL),
(13, 'Zain Balouch', 'zainuleman786@gmail.com', '2024-02-06 22:50:09', '$2y$10$GcZbP1mjbxtuxPlLEr/z4eNDCTftGXRNdgXfQEbmm/r2ue8Xhi.9K', NULL, 'user', NULL, '2024-01-22 06:44:22', '2024-02-06 22:50:10', 'profile_images/user_13_profile_65c2fdf2a2cb5.jpg', '109114008603426783210', '3637723613154711', NULL, NULL),
(15, 'Shani Khan', 'shanibalouch52@gmail.com', '2024-02-04 23:22:40', '$2y$10$f9eTrlwIiaRd0b8oyiq8He1kgBHEGZekNgAdH.50mEFy5tQVnPJDW', NULL, 'user', NULL, '2024-02-04 23:19:59', '2024-02-04 23:22:41', 'profile_images/user_15_profile_65c0629131221.jpg', '114784539092256300701', NULL, NULL, NULL),
(16, 'Talah Malghani', 'talhamalghani1@gmail.com', '2024-02-04 23:23:14', '$2y$10$TD/ZA/.n.VzuGR64KiZY6uRR4x2kn5gotxfKEopNdjdirdR8es8ta', NULL, 'user', NULL, '2024-02-04 23:23:14', '2024-02-06 21:13:21', 'profile_images/user_16_profile_65c062b3e3102.jpg', '101535678876631222921', NULL, NULL, NULL),
(226, 'unverified user', 'cefim43692@namewok.com', NULL, '$2y$10$ofi1EmVIj9d.7EXxWtvtq.ZdOJhVqNfEHiIJUxsqTjUZLdKrqtSCK', '937787', 'user', NULL, '2024-02-06 21:28:28', '2024-02-06 22:01:48', NULL, NULL, NULL, NULL, NULL),
(228, 'Zain Ul eman 6', 'zainuleman.0006@gmail.com', '2024-02-06 22:46:44', '$2y$10$QpSn2IidtBTW3U5uFhMwfeSy37ucZOP3nEPlMj/3BSZvlYOFgJN7O', NULL, 'user', NULL, '2024-02-06 22:46:44', '2024-02-06 22:46:45', 'profile_images/user_228_profile_65c2fd2580d6c.jpg', '114027529611340987635', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
