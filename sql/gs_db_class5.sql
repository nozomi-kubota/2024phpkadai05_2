-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-09-22 10:47:09
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gs_db_class5`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `clubs`
--

CREATE TABLE `clubs` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `clubs`
--

INSERT INTO `clubs` (`id`, `name`) VALUES
(1, 'サッカー部'),
(2, '野球'),
(3, 'テニス');

-- --------------------------------------------------------

--
-- テーブルの構造 `clubs_students`
--

CREATE TABLE `clubs_students` (
  `id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `clubs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `clubs_students`
--

INSERT INTO `clubs_students` (`id`, `students_id`, `clubs_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 1, 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `contents`
--

CREATE TABLE `contents` (
  `id` int(12) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `contents`
--

INSERT INTO `contents` (`id`, `user_id`, `content`, `created_at`, `updated_at`, `image`) VALUES
(1, 1, '教室ちょっと寒いです⇒9月更新：未だ大分暑いです。追記                                               ', '2020-09-22 07:28:23', '2024-09-19 19:59:51', 'img/66ec0427e2904.jpg'),
(2, 2, 'メモass編集画面から中華の画像を添付しました。           ', '2020-09-22 16:02:47', '2024-09-17 22:23:25', 'img/66e815509b80b.jpg'),
(3, 3, 'TEST ※編集画面から画像ファイルを追加         ', '2024-07-12 02:41:37', NULL, 'img/66e81717a8945.jpg'),
(26, 2, 'ddd ', '2024-07-13 13:20:41', NULL, 'img/66e83a33a957b.jpg'),
(29, 3, '8888', '2024-07-13 13:20:58', NULL, NULL),
(30, 1, 'aaaaa。添付画像も編集画面されています。', '2024-08-01 21:09:18', NULL, 'img/66ab7aee9a82a.png'),
(31, 1, '和食レシピイメージ映像  ⇒中華に変更→和食に戻します(編集3度目)                 ', '2024-09-16 13:58:57', '2024-09-22 15:39:43', 'img/66efbbafa67eb.jpg'),
(32, 1, '管理者による入力・ファイル添付テストです(テスト1管理者です)', '2024-09-16 15:10:00', NULL, 'img/66e7cbb82359f.jpg'),
(33, 1, 'TEST1/画像データを添付', '2024-09-16 17:08:28', NULL, 'img/66e7e77cb2f5e.jpg'),
(34, 2, 'ユーザー：テスト2でログインして編集テスト中。画像も添付。', '2024-09-16 18:48:06', '2024-09-19 20:24:19', 'img/66ec09e3744fe.jpg'),
(35, 1, 'テスト入力です(Byテスト1管理者）ファイルをシチューへ変更します。', '2024-09-16 22:39:39', NULL, 'img/66e8356204139.jpg');

-- --------------------------------------------------------

--
-- テーブルの構造 `departments`
--

CREATE TABLE `departments` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, '営業'),
(2, 'マーケティング'),
(3, '開発'),
(4, '経理');

-- --------------------------------------------------------

--
-- テーブルの構造 `employees`
--

CREATE TABLE `employees` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `dept_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `employees`
--

INSERT INTO `employees` (`id`, `name`, `dept_id`) VALUES
(1, '佐藤', 1),
(2, '高橋', 1),
(3, '小林', 1),
(4, '金子', 2),
(5, '小林', 2),
(6, '柴田', 3);

-- --------------------------------------------------------

--
-- テーブルの構造 `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `students`
--

INSERT INTO `students` (`id`, `name`) VALUES
(1, '佐藤'),
(2, '鈴木'),
(3, '福島');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `name` varchar(64) NOT NULL,
  `lid` varchar(128) NOT NULL,
  `lpw` varchar(64) NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `life_flg` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `lid`, `lpw`, `kanri_flg`, `life_flg`) VALUES
(1, 'テスト１管理者', 'test1', '$2y$10$RmMJ4aYB/6lZ4ALtSHisg.2w5IFz3wMXbMBMPIn2DHOsmcY7334gK', 1, 0),
(2, 'テスト2一般', 'test2', '$2y$10$8IJCRX8SbXc3puczdfp3tueKEv//ao2bdiFk3Ur5lDEcrkXLjYhgO', 0, 0),
(3, 'テスト３', 'test3', '$2y$10$csjf0adIDFXYCyEXgvAnKuX/udCuHUL0gOP0wm.pW6W.bzfTxr5hy', 0, 0);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `clubs_students`
--
ALTER TABLE `clubs_students`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `clubs_students`
--
ALTER TABLE `clubs_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- テーブルの AUTO_INCREMENT `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
