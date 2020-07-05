-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2020 a las 03:21:26
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id_categoria` int(5) NOT NULL,
  `num_categoria` varchar(50) NOT NULL,
  `estado_categoria` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_categoria`
--

INSERT INTO `tb_categoria` (`id_categoria`, `num_categoria`, `estado_categoria`) VALUES
(35, 'Frutas', 1),
(36, 'Verduras', 1),
(37, 'Lacteos', 1),
(38, 'Bebidas ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `id_producto` int(9) NOT NULL,
  `nom_producto` varchar(50) NOT NULL,
  `stock` decimal(7,2) DEFAULT NULL,
  `precio` decimal(7,2) DEFAULT NULL,
  `unidadmedida` varchar(20) DEFAULT NULL,
  `estado_producto` tinyint(1) DEFAULT NULL,
  `categoria` int(5) DEFAULT NULL,
  `fecha_entreda` timestamp NOT NULL DEFAULT current_timestamp(),
  `des_producto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_producto`
--

INSERT INTO `tb_producto` (`id_producto`, `nom_producto`, `stock`, `precio`, `unidadmedida`, `estado_producto`, `categoria`, `fecha_entreda`, `des_producto`) VALUES
(59, 'Fresas', '100.00', '1.50', 'libras', 1, 35, '2020-07-01 19:25:57', 'es buena'),
(60, 'Uvas', '1000.00', '1.25', 'libra', 1, 35, '2020-07-02 22:55:08', 'Uva fresca '),
(61, 'Tomate', '100.00', '1.00', 'Dolares', 1, 36, '2020-07-02 22:56:35', 'Tomate fresco '),
(62, 'Chile guaco', '100.00', '0.35', 'unidad', 1, 36, '2020-07-02 22:57:27', 'es de color verde '),
(63, 'Queso duro', '40.00', '1.50', 'libra', 1, 37, '2020-07-02 22:58:31', 'Queso duro '),
(64, 'Chorizo de tusa', '100.00', '0.35', 'Dolares', 1, 37, '2020-07-02 23:04:37', 'es de cerdo '),
(65, 'Coca cola 2.5 litros', '100.00', '1.85', 'Unidad', 1, 38, '2020-07-02 23:06:46', 'Es buena'),
(66, 'Gaseosa Fanta 2.5', '100.00', '1.85', 'Unidad', 1, 38, '2020-07-02 23:08:13', 'Es buena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `pregunta` varchar(60) NOT NULL,
  `respuesta` varchar(35) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_usuario`
--

INSERT INTO `tb_usuario` (`id`, `nombre`, `apellido`, `correo`, `usuario`, `clave`, `tipo`, `estado`, `pregunta`, `respuesta`, `fecha_registro`) VALUES
(1, 'Walmer', 'Martinez', 'walmermartinez168@gmail.com', 'walmer123', '12345', 1, 1, 'Tu fecha de nacimiento', '16112000', '2020-06-25 14:51:01'),
(2, 'Karla', 'Gomez', 'karlitafaustinog2000@gmail.com', 'karla20', '1234', 1, 1, 'El nombre de tu Perro', '16112000', '2020-06-25 21:04:42'),
(3, 'John Ali', 'Ramirez', 'johnaliramirezramirez@gmail.com', 'Ramirez10', '123456', 1, 1, 'El nombre de tu abuelita', 'Silvia de Ramirez', '2020-06-30 20:05:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  MODIFY `id_producto` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
