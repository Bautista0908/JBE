-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2025 a las 22:33:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jbe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `telefono` int(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `Nombre`, `telefono`, `Email`, `Contraseña`) VALUES
(1, 'Coca-Cola', 99522112, 'info@cocacola.com', ''),
(2, 'Lays-Pepsico', 45442323, 'rrhh@pepsico.com', ''),
(7, 'jbesaves', 99878215, 'jbesavesinformation@hotmail.com', '$2y$10$nyM3.0H4CagQTknqFGmCm.9.xWO0hDKpO2tEK8'),
(8, 'gbjhhgvhgv', 2147483647, 'kjhjkbghjhggvjgvgvghghgfhfg@swswsw', '$2y$10$LAfM/ER6wFYuWZoBx/PqWuFCt/iUvTfu/7iEb4'),
(9, 'gbjhhgvhgv', 2147483647, 'kjhjkbghjhggvjgvgvghghgfhfg@swsws', '$2y$10$Zxq4tIABjgKXamfPEEcVUuISh75g1Rdv3TJZir'),
(10, 'jbesaves', 2147483647, 'jbesavesinformation@gmail.com', '$2y$10$sdd6ptl9ObagZRqQEsZ3duNtH27mw.EJJU7T4W'),
(11, 'mcpopo', 456456456, 'mcpopo@gmail.com', '$2y$10$Sxtk8SAmHkLyuYu8g6j1VeOr0l.cxnMd0R8Yel'),
(12, 'jbeserver', 99999999, 'jbesavesvpi@gmail.com', '$2y$10$fWWmhT1/SdIAlv1zU3qNNOLUhFIN072UOAqa8I');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
