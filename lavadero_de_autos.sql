-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2025 a las 16:03:08
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lavadero_de_autos`
--
CREATE DATABASE IF NOT EXISTS `lavadero_de_autos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lavadero_de_autos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Patente` varchar(10) DEFAULT NULL,
  `Teléfono` int(11) DEFAULT NULL,
  `historial_lavados` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id`, `Nombre`, `Patente`, `Teléfono`, `historial_lavados`) VALUES
(1, 'Juanceto', 'AB 123 CD', 54345678, 1),
(2, 'Demian', 'DR 623 PL', 54910111, 1),
(3, 'Agustin', 'JO 922 UI', 54121233, 1),
(4, 'Godespeche', 'LK 901 XD', 54911414, 1),
(5, 'Sapir', 'HA 291 JG', 54918738, 1),
(6, 'Chechon', 'IR 092 OK', 54628121, 1),
(7, 'Godespeche', 'LK 901 XD', 54911414, 2),
(8, 'Juanceto', 'AB 123 CD', 54345678, 2),
(9, 'Demian', 'DR 623 PL', 54910111, 2),
(10, 'Demian', 'DR 623 PL', 54910111, 3),
(11, 'Godespeche', 'LK 901 XD', 54911414, 3),
(12, 'Agustin', 'JO 922 UI', 54121233, 2),
(13, 'Juanceto', 'AB 123 CD', 54345678, 3),
(14, 'Chechon', 'IR 092 OK', 54628121, 2),
(15, 'Godespeche', 'LK 901 XD', 54911414, 4),
(16, 'Demian', 'DR 623 PL', 54910111, 4),
(17, 'Sapir', 'HA 291 JG', 54918738, 2),
(18, 'Godespeche', 'LK 901 XD', 54911414, 5),
(19, 'Agustin', 'JO 922 UI', 54121233, 3),
(20, 'Godespeche', 'LK 901 XD', 54911414, 6),
(21, 'Demian', 'DR 623 PL', 54910111, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(70) DEFAULT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `Horario` varchar(100) DEFAULT NULL,
  `servicio` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id`, `Nombre`, `Rol`, `Horario`, `servicio`) VALUES
(1, 'Frick', 'Pulidor/Lavado', '10:00 a 17:50', 4),
(2, 'Alba', 'Lavado', '8:30 a 19:30', 4),
(3, 'Thiago', 'Lavado', '9:00 a 19:30 ', 5),
(4, 'Josué', 'Lavado', '11:00 a 20:00', 5),
(5, 'Leodeidad', 'Lavado', '8:30 a 19:30', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(70) DEFAULT NULL,
  `Duración` varchar(30) DEFAULT NULL,
  `Precio` int(40) DEFAULT NULL,
  `Demanda` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`Id`, `Nombre`, `Duración`, `Precio`, `Demanda`) VALUES
(1, 'Lavado Express', '45 Minutos', 5000, 'Alta'),
(2, 'Lavado Básico', '1 Hora', 10000, 'Media'),
(3, 'Lavado a Fondo', '2 Horas', 20000, 'Baja'),
(4, 'Púlido', '3 Horas', 25000, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

DROP TABLE IF EXISTS `turnos`;
CREATE TABLE `turnos` (
  `Id` int(11) NOT NULL,
  `Id_Cliente` int(11) DEFAULT NULL,
  `Id_Servicios` int(11) DEFAULT NULL,
  `Id_Empleados` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`Id`, `Id_Cliente`, `Id_Servicios`, `Id_Empleados`, `Fecha`, `Hora`, `Estado`) VALUES
(1, 1, 2, 3, '2025-09-01', '09:00:00', 'Completo'),
(2, 2, 4, 1, '2025-09-10', '12:00:00', 'Completo'),
(3, 3, 3, 2, '2025-09-20', '14:00:00', 'Completo'),
(4, 4, 1, 5, '2025-09-11', '18:00:00', 'Completo'),
(5, 5, 1, 4, '2025-12-15', '14:30:00', 'En espera'),
(6, 6, 1, 3, '2025-09-03', '10:00:00', 'Completo'),
(7, 7, 1, 1, '2025-04-15', '19:45:00', 'Completo'),
(8, 8, 1, 3, '2025-11-10', '17:30:00', 'Completo'),
(9, 9, 3, 2, '2025-08-19', '13:15:00', 'Completo'),
(10, 10, 4, 1, '2025-12-29', '09:45:00', 'En espera'),
(11, 11, 2, 4, '2025-12-23', '11:30:00', 'En espera'),
(12, 12, 3, 4, '2025-06-23', '16:45:00', 'Completo'),
(13, 13, 2, 5, '2025-05-18', '19:00:00', 'Completo'),
(14, 14, 2, 3, '2025-07-14', '15:30:00', 'Completo'),
(15, 15, 1, 3, '2025-07-30', '10:45:00', 'Completo'),
(16, 16, 1, 4, '2026-01-01', '13:45:00', 'En espera'),
(17, 17, 1, 2, '2025-12-31', '16:30:00', 'En espera'),
(18, 18, 2, 5, '2025-03-11', '18:15:00', 'Completo'),
(19, 19, 4, 1, '2025-12-14', '16:45:00', 'En espera'),
(20, 20, 2, 2, '2025-02-28', '12:45:00', 'Completo'),
(21, 21, 2, 4, '2025-03-01', '15:45:00', 'Completo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Cliente` (`Id_Cliente`),
  ADD KEY `Id_Servicios` (`Id_Servicios`),
  ADD KEY `Id_Empleados` (`Id_Empleados`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id`),
  ADD CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`Id_Servicios`) REFERENCES `servicios` (`Id`),
  ADD CONSTRAINT `turnos_ibfk_3` FOREIGN KEY (`Id_Empleados`) REFERENCES `empleados` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
