-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2025 a las 15:54:32
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
DROP DATABASE IF EXISTS `lavadero_de_autos`;
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
  `Historial_Lavados` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id`, `Nombre`, `Patente`, `Teléfono`, `Historial_Lavados`) VALUES
(1, 'Juanceto', 'AB 123 CD', 54345678, 5),
(2, 'Demian', 'DR 623 PL', 54910111, 2),
(3, 'Agustin', 'JO 922 UI', 54121233, 4),
(4, 'Godespeche', 'LK 901 XD', 54911414, 3),
(5, 'Sapir', 'HA 291 JG', 54918738, 6),
(6, 'Chechon', 'IR 092 OK', 54628121, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(70) DEFAULT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `Horario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id`, `Nombre`, `Rol`, `Horario`) VALUES
(1, 'Frick', 'Pulidor/Lavado', '10:00 AM a 5:50 PM'),
(2, 'Alba', 'Lavado', '8:30 AM a 7:30 PM'),
(3, 'Thiago', 'Lavado', '9:00 AM a 7:30 PM'),
(4, 'Josué', 'Lavado', '11:00 AM a 8:00 PM'),
(5, 'Leodeidad', 'Lavado', '8:30 AM a 7:30 PM');

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
  `Hora` varchar(15) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`Id`, `Id_Cliente`, `Id_Servicios`, `Id_Empleados`, `Fecha`, `Hora`, `Estado`) VALUES
(1, 1, 2, 3, '2025-09-01', '9:00 AM', 'Completo'),
(2, 2, 4, 1, '2025-09-10', '12:00 AM', 'Pendiente'),
(3, 3, 3, 2, '2025-09-20', '14:00 PM', 'Pendiente'),
(4, 4, 1, 5, '2025-09-11', '18:00 PM', 'Pendiente'),
(5, 5, 1, 4, '2025-10-15', '14:00 PM', 'Cancelo'),
(6, 6, 1, 3, '2025-09-03', '10:00 AM', 'Pendiente'),
(7, 1, 2, 5, '2025-11-14', '16:00 PM', 'Pendiente');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
