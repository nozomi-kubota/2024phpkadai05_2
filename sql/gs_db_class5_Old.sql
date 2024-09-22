-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-09-16 13:47:40
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
(1, 1, '教室ちょっと寒いです⇒9月更新：未だ大分暑いです。                                                     ', '2020-09-22 07:28:23', '0000-00-00 00:00:00', NULL),
(2, 2, 'メモass編集画面から中華の画像を添付しました。           ', '2020-09-22 16:02:47', '0000-00-00 00:00:00', 'img/66e815509b80b.jpg'),
(3, 3, 'TEST ※編集画面から画像ファイルを追加         ', '2024-07-12 02:41:37', NULL, 'img/66e81717a8945.jpg'),
(26, 2, 'ddd', '2024-07-13 13:20:41', NULL, NULL),
(28, 3, '777/一部編集しました。                 ', '2024-07-13 13:20:55', NULL, NULL),
(29, 3, '8888', '2024-07-13 13:20:58', NULL, NULL),
(30, 1, 'aaaaa。添付画像も編集画面されています。', '2024-08-01 21:09:18', NULL, 'img/66ab7aee9a82a.png'),
(31, 1, '和食レシピイメージ映像  ⇒中華に変更                  ', '2024-09-16 13:58:57', NULL, 'img/66e816eaad405.jpg'),
(32, 1, '管理者による入力・ファイル添付テストです(テスト1管理者です)', '2024-09-16 15:10:00', NULL, 'img/66e7cbb82359f.jpg'),
(33, 1, 'TEST1/画像データを添付', '2024-09-16 17:08:28', NULL, 'img/66e7e77cb2f5e.jpg'),
(34, 2, 'ユーザー：テスト2でログインして編集テスト中。画像も添付。', '2024-09-16 18:48:06', NULL, 'img/66e7fed6740c7.jpg');

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
(1, 'テスト１管理者', 'test1', 'test1', 1, 0),
(2, 'テスト2一般', 'test2', 'test2', 0, 0),
(3, 'テスト３', 'test3', 'test3', 0, 0);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `contents`
--
ALTER TABLE `contents`
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
-- テーブルの AUTO_INCREMENT `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
