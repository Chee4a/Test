-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 16 2025 г., 21:47
-- Версия сервера: 10.6.7-MariaDB-log
-- Версия PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testwork`
--

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE `application` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id`, `title`) VALUES
(1421444, 'Among Us');

-- --------------------------------------------------------

--
-- Структура таблицы `application_category`
--

CREATE TABLE `application_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `application_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `application_category`
--

INSERT INTO `application_category` (`id`, `application_id`, `category_id`) VALUES
(4, 1421444, 23),
(5, 1421444, 2),
(6, 1421444, 134);

-- --------------------------------------------------------

--
-- Структура таблицы `application_position`
--

CREATE TABLE `application_position` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_relations_id` int(10) UNSIGNED DEFAULT NULL,
  `application_id` int(10) UNSIGNED NOT NULL,
  `position_date` date NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `application_position`
--

INSERT INTO `application_position` (`id`, `category_relations_id`, `application_id`, `position_date`, `position`) VALUES
(1, 1, 1421444, '2025-08-05', 40),
(2, 1, 1421444, '2025-08-06', 41),
(3, 2, 1421444, '2025-08-05', 54),
(4, 2, 1421444, '2025-08-06', 156),
(5, 3, 1421444, '2025-08-05', 5),
(6, 3, 1421444, '2025-08-06', 5),
(7, 4, 1421444, '2025-08-05', 81),
(8, 4, 1421444, '2025-08-06', 80),
(9, 5, 1421444, '2025-08-05', 10),
(10, 5, 1421444, '2025-08-06', 25),
(11, 6, 1421444, '2025-08-05', 112),
(12, 6, 1421444, '2025-08-06', 112),
(13, 7, 1421444, '2025-08-05', 75),
(14, 7, 1421444, '2025-08-06', 259);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, '1 (name)'),
(2, '2 (name)'),
(3, '3 (name)'),
(9, '9 (name)'),
(23, '23 (name)'),
(134, '134 (name)');

-- --------------------------------------------------------

--
-- Структура таблицы `category_relations`
--

CREATE TABLE `category_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `child_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category_relations`
--

INSERT INTO `category_relations` (`id`, `parent_id`, `child_id`) VALUES
(1, 2, 1),
(2, 2, 9),
(3, 23, 1),
(4, 23, 3),
(5, 23, 9),
(6, 134, 1),
(7, 134, 9);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `application_category`
--
ALTER TABLE `application_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `application_position`
--
ALTER TABLE `application_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `application_position_ibfk_2` (`category_relations_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category_relations`
--
ALTER TABLE `category_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `application`
--
ALTER TABLE `application`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1421445;

--
-- AUTO_INCREMENT для таблицы `application_category`
--
ALTER TABLE `application_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `application_position`
--
ALTER TABLE `application_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT для таблицы `category_relations`
--
ALTER TABLE `category_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `application_category`
--
ALTER TABLE `application_category`
  ADD CONSTRAINT `application_category_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `application_position`
--
ALTER TABLE `application_position`
  ADD CONSTRAINT `application_position_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_position_ibfk_2` FOREIGN KEY (`category_relations_id`) REFERENCES `category_relations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `category_relations`
--
ALTER TABLE `category_relations`
  ADD CONSTRAINT `category_relations_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_relations_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
