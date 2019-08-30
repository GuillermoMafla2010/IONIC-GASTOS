-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-08-2019 a las 13:19:02
-- Versión del servidor: 10.1.41-MariaDB-cll-lve
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuvxsd_gastospersonales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_gastos`
--

CREATE TABLE `categorias_gastos` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_gastos`
--

INSERT INTO `categorias_gastos` (`id`, `nombre_categoria`) VALUES
(1, 'Alimentacion'),
(4, 'Compras'),
(10, 'Cuidado Personal'),
(8, 'Entretenimiento'),
(5, 'Impuestos'),
(9, 'Medicinas'),
(3, 'Multas'),
(7, 'Otros'),
(6, 'Pago Tarjetas'),
(11, 'Ropa'),
(12, 'Tecnologia'),
(2, 'Transporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_ingresos`
--

CREATE TABLE `categorias_ingresos` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_ingresos`
--

INSERT INTO `categorias_ingresos` (`id`, `nombre_categoria`) VALUES
(5, 'Devolucion de Dinero'),
(12, 'Encuentro Dinero'),
(10, 'Liquidaciones'),
(9, 'Otros'),
(13, 'Regalo'),
(11, 'Retiro Bancario'),
(4, 'Sueldo Decimo Cuarto'),
(3, 'Sueldo Decimo Tercero'),
(2, 'Sueldo Mensual'),
(1, 'Sueldo Quincenal'),
(7, 'Transferencia'),
(6, 'Utilidades'),
(8, 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad_gasto` float(10,2) NOT NULL,
  `nombre_gasto` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `fecha`, `cantidad_gasto`, `nombre_gasto`, `user_id`, `categoria_id`) VALUES
(155, '2019-08-04', 0.25, 'Pasaje', 1, 2),
(157, '2019-08-04', 0.81, 'Pasajes Sur Recreo', 1, 2),
(158, '2019-08-04', 0.50, 'Pasaje regreso norte sur', 1, 2),
(159, '2019-08-04', 12.00, 'Pelicula hoobs y shaw', 1, 8),
(160, '2019-08-05', 0.30, 'Compra Pan', 1, 1),
(161, '2019-08-05', 0.50, 'Compra de Todito', 1, 1),
(162, '2019-08-07', 0.65, 'Pasaje Pablo Dinapen', 1, 2),
(163, '2019-08-08', 2.50, 'Desayuno Monkis', 1, 1),
(164, '2019-08-08', 0.25, 'Pasaje ida', 1, 2),
(165, '2019-08-08', 0.50, 'Pasajes', 1, 2),
(166, '2019-08-08', 0.50, 'Pasajes al sur', 1, 2),
(167, '2019-08-08', 12.50, 'Comidita costillitas american deli con mi caperusa', 1, 1),
(168, '2019-08-09', 1.25, 'maracuyas', 1, 4),
(169, '2019-08-09', 0.50, 'de todito', 1, 1),
(170, '2019-08-09', 0.50, 'De todito', 1, 4),
(171, '2019-08-10', 1.50, 'Pasaje ida casa michelle', 1, 2),
(172, '2019-08-10', 1.50, 'Pasaje vuelta michelle casa', 1, 2),
(173, '2019-08-11', 0.65, 'Compra Rapidito', 1, 1),
(174, '2019-08-12', 1.25, 'Pasaje entrevista kfc', 1, 2),
(175, '2019-08-12', 0.25, 'Compra Desodorante', 1, 10),
(176, '2019-08-14', 0.75, 'Pasajes', 1, 2),
(177, '2019-08-15', 1.25, 'Pasajes confirmacion trabajo', 1, 2),
(178, '2019-08-15', 7.25, 'Compras en fiestas d mira', 1, 4),
(179, '2019-08-15', 0.65, 'Empanada', 1, 1),
(180, '2019-08-16', 0.50, 'de todito', 1, 1),
(181, '2019-08-16', 1.88, 'compra desayuno michelle', 1, 1),
(182, '2019-08-16', 4.11, 'Compra aderezo y de todito', 1, 1),
(183, '2019-08-16', 6.00, 'compra cerveza pilsener', 1, 8),
(184, '2019-08-16', 8.00, 'Lasaña', 1, 1),
(185, '2019-08-16', 2.92, 'aderezo', 1, 4),
(186, '2019-08-16', 0.63, 'ruffles', 1, 1),
(187, '2019-08-17', 0.28, 'Pan', 1, 1),
(188, '2019-08-17', 0.25, 'Pasaje Recreo', 1, 2),
(189, '2019-08-17', 2.75, 'Pasajes recreo casa', 1, 2),
(190, '2019-08-17', 6.00, 'Cheves', 1, 8),
(191, '2019-08-18', 1.28, 'pan y mote', 1, 1),
(192, '2019-08-18', 3.29, 'Gran milanesa gus', 1, 1),
(193, '2019-08-18', 0.60, 'Coca Cola Personal', 1, 1),
(194, '2019-08-19', 3.50, 'Almuerzo', 1, 1),
(195, '2019-08-20', 3.00, 'Almuerzo Martes', 1, 1),
(196, '2019-08-20', 2.00, 'Pasaje de dolar lunes', 1, 2),
(197, '2019-08-20', 2.00, 'pasajes martes', 1, 2),
(198, '2019-08-21', 4.40, 'Almuerzo Miércoles', 1, 1),
(199, '2019-08-21', 2.00, 'Pasajes Miercoles', 1, 2),
(200, '2019-08-22', 2.50, 'almuerzo jueves', 1, 1),
(201, '2019-08-22', 2.00, 'Pasajes Jueves', 1, 2),
(202, '2019-08-23', 3.50, 'Almuerzo Viernes', 1, 1),
(203, '2019-08-23', 2.00, 'Pasajes viernes 23', 1, 2),
(204, '2019-08-23', 2.00, 'Corte Cabello', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL,
  `nombre_ingreso` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad_ingreso` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `nombre_ingreso`, `fecha`, `cantidad_ingreso`, `user_id`, `categoria_id`) VALUES
(3, 'Pago Febrero', '2019-07-26', 400, 3, 1),
(31, 'Retiro de Banco', '2019-08-04', 29.5, 1, 13),
(32, 'Encuentro Dinero en la calle', '2019-08-05', 0.19, 1, 9),
(34, 'deposito', '2019-08-07', 1.7, 1, 13),
(35, 'Diana Pasajes', '2019-08-07', 2, 1, 13),
(36, 'Vuelto', '2019-08-08', 0.2, 1, 9),
(37, 'Encuentro dinero', '2019-08-09', 0.1, 1, 12),
(38, 'Regalo mamá', '2019-08-10', 4.25, 1, 13),
(39, 'Regalo guillo', '2019-08-12', 2, 1, 13),
(40, 'Regalo mami', '2019-08-15', 11, 1, 13),
(41, 'Retiro Cajero Aki', '2019-08-16', 20, 1, 11),
(42, 'Regalo Michelle', '2019-08-16', 4, 1, 13),
(43, 'Retiro con tarjeta de crédito', '2019-08-17', 50, 1, 11),
(44, 'Encuentro dinero casa', '2019-08-22', 0.25, 1, 12),
(45, 'Vuelto', '2019-08-25', 0.2, 1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `celular` varchar(30) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `email`, `password`, `celular`, `foto`) VALUES
(1, 'Cristian Jativa', 'cjativa12@hotmail.com', '12345', '0983195552', ''),
(3, 'Michelle Davila', 'michelle@hotmail.com', '$2y$10$CHzIc62.lARV69XVefjhD.osJ31WzBGRMnHJuVlA3.KqCEYjdXAmK', '0992787200', 'micheu.jpg'),
(4, 'Diana Jativa', 'diana@hotmail.com', '$2y$10$iB37lqrufKw6hRFDqNdJx.rticsIRQS6vfmO.XluBSCyv4QKZeJsu', '0992787201', 'micheu.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_gastos`
--
ALTER TABLE `categorias_gastos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `categorias_ingresos`
--
ALTER TABLE `categorias_ingresos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `celular` (`celular`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_gastos`
--
ALTER TABLE `categorias_gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `categorias_ingresos`
--
ALTER TABLE `categorias_ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gastos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_gastos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_ingresos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
