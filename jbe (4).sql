-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2025 a las 22:39:34
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
-- Estructura de tabla para la tabla `aspirante`
--

CREATE TABLE `aspirante` (
  `id_aspirante` int(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contraseña` varchar(40) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aspirante`
--

INSERT INTO `aspirante` (`id_aspirante`, `Nombre`, `Apellido`, `Email`, `Contraseña`, `Telefono`) VALUES
(12, 'Bautista', 'Mañan', 'aypuniformes@gmail.com', '12345678900', 91280697),
(13, 'Bautista', 'manan', 'jbesssssaves@gmail.com', '$2y$10$UzK9vE6lhoAv1ImMJgt/k.Mmiu4jKXR/Q', 3210548),
(14, 'Bautista', 'erewrwerwr', 'ewrerewrer@eafdada', '$2y$10$tQiSwjUYcugM0Bm0bEWGr.qXYUomo4NNJ', 2147483647),
(15, 'joaco', 'rabiru', 'joacorb@gmail.com', '$2y$10$hGopCXGLIKFTKKNdyhC3CeWfDreeYhzkI', 455788895),
(17, 'joaco', 'rabiru', 'joooooooacorb@gmail.com', '$2y$10$XErCPNidG1JBHkeQjC9dQuF48gBn45ofN', 99868555),
(18, 'Tomas', 'Femenias', 'tutyfeme22@gmail.com', '$2y$10$gCcB8g9wGteTyY2MDOgVKu71RZPMd8aJ4', 99568463),
(19, 'joaco', 'Femenias', 'joaco443@gmail.com', '$2y$10$Mjwvqj59EXbaJcFg5CSIHeSrotR/maU5V', 2147483647),
(20, 'asd', 'asd', 'asd@gmail.com', '$2y$10$2wi.YhQlG3sLcKjb0X/F8O386euqwh.X4', 123),
(21, 'popo', 'mrpopo', 'mcpopo@gmail.com', 'mcpopo', 99895456);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `id_oferta` int(45) NOT NULL,
  `descripcion_de_trabajo` text NOT NULL,
  `Salario` varchar(45) NOT NULL,
  `fecha_fin` varchar(45) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id_oferta`, `descripcion_de_trabajo`, `Salario`, `fecha_fin`, `id_empresa`) VALUES
(1, 'Se busca carpintero/a\r\nCon experiencia. Jornada completa. Buen sueldo.', 'Carpintero', '17/02/2025', 1),
(2, 'Se busca reponedor/a\r\nTurno rotativo. Responsable y puntual.', 'Reponedor', '31/12/2025', 2),
(3, 'eqwawaweadw', '2', 'wswawdadw', 1),
(4, 'fdffefefefefe', '2323232', 'feffesfefes', 1),
(5, 'fessefsfesfe', '323232', 'fdsfsefse', 1),
(6, 'dwaawddawwad', '222', 'adwsadwdw', 1),
(7, 'sefsfsesef', '76766776', 'sefsefsefse', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aspirante`
--
ALTER TABLE `aspirante`
  ADD PRIMARY KEY (`id_aspirante`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_oferta`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aspirante`
--
ALTER TABLE `aspirante`
  MODIFY `id_aspirante` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_oferta` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD CONSTRAINT `oferta_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
