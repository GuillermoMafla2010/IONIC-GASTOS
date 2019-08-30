-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2019 a las 19:31:16
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gastospersonales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id` int(11) NOT NULL,
  `nombre_banco` varchar(255) NOT NULL,
  `cuenta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `nombre_banco`, `cuenta_id`) VALUES
(1, 'Banco Pichincha', 1),
(2, 'Banco Internacional', 2),
(3, 'Cooperativa Atuntaqui', 3);

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
(5, 'Impuestos'),
(3, 'Multas'),
(7, 'Otros'),
(6, 'Pago Tarjetas'),
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
(10, 'Liquidaciones'),
(9, 'Otros'),
(4, 'Sueldo Decimo Cuarto'),
(3, 'Sueldo Decimo Tercero'),
(2, 'Sueldo Mensual'),
(1, 'Sueldo Quincenal'),
(7, 'Transferencia'),
(6, 'Utilidades'),
(8, 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cgastos`
--

CREATE TABLE `cgastos` (
  `id` int(11) NOT NULL,
  `nombre_gasto` varchar(255) NOT NULL,
  `cantidad` float NOT NULL,
  `cuentas_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cgastos`
--

INSERT INTO `cgastos` (`id`, `nombre_gasto`, `cantidad`, `cuentas_id`, `fecha`) VALUES
(5, 'gasto 1', 3.54, 3, '2019-08-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cingresos`
--

CREATE TABLE `cingresos` (
  `id` int(11) NOT NULL,
  `nombre_ingreso` varchar(100) NOT NULL,
  `cantidad` float NOT NULL,
  `cuentas_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cingresos`
--

INSERT INTO `cingresos` (`id`, `nombre_ingreso`, `cantidad`, `cuentas_id`, `fecha`) VALUES
(2, 'Deposito Sueldo', 10.87, 3, '2019-08-24'),
(3, 'Apertura', 20, 2, '2019-08-24'),
(9, 'a', 10, 3, '2019-08-25'),
(10, 'ads', 10.98, 2, '2019-08-24'),
(31, 'sad', 100, 1, '2019-08-25'),
(32, 'nuevo', 100, 1, '2019-08-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `numero_cuenta` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id`, `numero_cuenta`, `user_id`) VALUES
(1, '111111112', 1),
(2, '22222', 1),
(3, '33333', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad_gasto` float NOT NULL,
  `nombre_gasto` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `fecha`, `cantidad_gasto`, `nombre_gasto`, `user_id`, `categoria_id`) VALUES
(1, '2019-08-04', 23.65, 'COmpra parlantes', 4, 4),
(2, '2019-08-05', 65.21, 'Compra Secadora', 4, 4),
(3, '2019-08-06', 10, 'Viaje a Machala', 4, 2);

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
(41, 'Retiro del Cajero', '2019-08-06', 50.36, 1, 3),
(42, 'Cuentas Pendientes', '2019-08-04', 36.21, 1, 7);

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
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuenta_id` (`cuenta_id`);

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
-- Indices de la tabla `cgastos`
--
ALTER TABLE `cgastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentas_id` (`cuentas_id`);

--
-- Indices de la tabla `cingresos`
--
ALTER TABLE `cingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentas_id` (`cuentas_id`),
  ADD KEY `cuentas_id_2` (`cuentas_id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banco_id` (`user_id`);

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
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `categorias_gastos`
--
ALTER TABLE `categorias_gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `categorias_ingresos`
--
ALTER TABLE `categorias_ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `cgastos`
--
ALTER TABLE `cgastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `cingresos`
--
ALTER TABLE `cingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD CONSTRAINT `bancos_ibfk_1` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cgastos`
--
ALTER TABLE `cgastos`
  ADD CONSTRAINT `cgastos_ibfk_1` FOREIGN KEY (`cuentas_id`) REFERENCES `cuentas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cingresos`
--
ALTER TABLE `cingresos`
  ADD CONSTRAINT `cingresos_ibfk_1` FOREIGN KEY (`cuentas_id`) REFERENCES `cuentas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
