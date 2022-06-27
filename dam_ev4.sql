-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 21:48:57
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dam_ev4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educadoras`
--

CREATE TABLE `educadoras` (
  `rut_educadora` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_nivel` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `educadoras`
--

INSERT INTO `educadoras` (`rut_educadora`, `nombre`, `apellido`, `deleted_at`, `id_nivel`) VALUES
(6343387, 'Gerrie', 'Garthland', NULL, NULL),
(13374777, 'Katina', 'Watt', NULL, NULL),
(13386883, 'Nappy', 'Lemerie', NULL, NULL),
(15405374, 'Jerrie', 'Tackle', NULL, NULL),
(20491958, 'Bell', 'Rubinek', NULL, NULL),
(25199252, 'Gery', 'Amiranda', NULL, NULL),
(25322616, 'Brok', 'Edmans', NULL, NULL),
(25874214, 'Bruis', 'Hawker', NULL, NULL),
(27203745, 'Domini', 'Wyldish', NULL, NULL),
(33873233, 'Yvette', 'Mathew', NULL, NULL),
(44820077, 'Marysa', 'Collomosse', NULL, NULL),
(50873110, 'Siward', 'Riccardi', NULL, NULL),
(52134914, 'Britteny', 'Hudspeth', NULL, NULL),
(57768522, 'Mei', 'Wattingham', NULL, NULL),
(81816118, 'Boy', 'Jore', NULL, NULL),
(82824552, 'Laurent', 'Grouse', NULL, NULL),
(86233632, 'Sean', 'Kingswold', NULL, NULL),
(87825515, 'Niko', 'Tallowin', NULL, NULL),
(88036530, 'Ree', 'Gainsford', NULL, NULL),
(97351672, 'Hammad', 'Sertin', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rut_nino` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `nombre`, `deleted_at`, `rut_nino`) VALUES
(1, 'Cambio nivel', NULL, 41758595),
(2, 'Retiro Temprano', NULL, 41758595),
(3, 'Anotacion negativa', NULL, 88535055);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_06_27_152412_create_ninos_table', 1),
(3, '2022_06_27_152839_create_educadoras_table', 1),
(4, '2022_06_27_152901_create_eventos_table', 1),
(5, '2022_06_27_152924_create_niveles_table', 1),
(6, '2022_06_27_161944_add_niveles_ninos', 1),
(7, '2022_06_27_162239_add_niveles_educadoras', 1),
(8, '2022_06_27_191424_add_eventos_ninos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `rut_nino` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_nivel` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`rut_nino`, `nombre`, `apellido`, `deleted_at`, `id_nivel`) VALUES
(40278178, 'Antonius', 'Lardez', NULL, NULL),
(41758595, 'Nap', 'Ingleson', NULL, NULL),
(47882741, 'Tito', 'Di Ruggiero', NULL, NULL),
(88535055, 'Verge', 'McMinn', NULL, NULL),
(97482132, 'Clyde', 'Mitchard', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `deleted_at`) VALUES
(1, 'Medio Menor', NULL),
(2, 'Medio Mayor', NULL),
(3, 'Playgroup', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `educadoras`
--
ALTER TABLE `educadoras`
  ADD PRIMARY KEY (`rut_educadora`),
  ADD KEY `educadoras_id_nivel_foreign` (`id_nivel`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventos_rut_nino_foreign` (`rut_nino`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`rut_nino`),
  ADD KEY `ninos_id_nivel_foreign` (`id_nivel`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educadoras`
--
ALTER TABLE `educadoras`
  ADD CONSTRAINT `educadoras_id_nivel_foreign` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_rut_nino_foreign` FOREIGN KEY (`rut_nino`) REFERENCES `ninos` (`rut_nino`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD CONSTRAINT `ninos_id_nivel_foreign` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
