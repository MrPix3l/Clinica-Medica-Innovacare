-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 16:01:08
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
-- Base de datos: `centromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(10) UNSIGNED NOT NULL,
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `id_doctor` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_doctor`, `fecha`, `hora`) VALUES
(9, 38, 1, '2024-10-29', '13:15:00'),
(10, 38, 1, '2323-03-29', '13:15:00'),
(11, 38, 1, '2323-03-29', '13:15:00'),
(12, 38, 2, '2342-04-23', '23:43:00'),
(13, 38, 3, '2232-03-12', '12:32:00'),
(14, 38, 3, '2024-10-04', '12:50:00'),
(15, 38, 2, '2024-10-31', '08:38:00'),
(16, 39, 1, '2024-10-15', '09:31:00'),
(17, 39, 1, '2024-10-16', '10:32:00'),
(18, 39, 2, '2024-10-18', '11:32:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id_doctor` int(10) UNSIGNED NOT NULL,
  `nombre_doctor` varchar(100) NOT NULL,
  `especialidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id_doctor`, `nombre_doctor`, `especialidad`) VALUES
(1, 'Dr. José Martínez', 'Cardiología'),
(2, 'Dra. María Fernández', 'Pediatría'),
(3, 'Dr. Carlos Gómez', 'Dermatología'),
(4, 'Dra. Ana Sánchez', 'Ginecología'),
(5, 'Dr. Ricardo Pérez', 'Traumatología'),
(6, ' Dra. Laura Torres', 'Oftalmología'),
(7, 'Dr. Francisco López', 'Neurología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_especialidades`
--

CREATE TABLE `doctor_especialidades` (
  `id_doctor` int(11) UNSIGNED NOT NULL,
  `id_especialidad` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(10) UNSIGNED NOT NULL,
  `nombre_especialidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `nombre_especialidad`) VALUES
(1, 'Cardiología'),
(2, 'Pediatría'),
(3, 'Dermatología\r\n'),
(4, 'Ginecología'),
(5, 'Traumatología'),
(6, ' Oftalmología'),
(7, 'Neurología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombre_completo`, `fecha_nacimiento`, `telefono`) VALUES
(1, 'Alvaro Gonzalez', '2007-02-24', '937123415'),
(2, 'Marco Rifo', '2006-07-17', '964576891'),
(3, 'Luis Saez', '2006-05-28', '988743212'),
(4, 'Cristopher Mosqueira', '2006-10-01', '947252910');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `rut` varchar(12) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_rol` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `rut`, `password`, `id_rol`) VALUES
(37, '22.162.239-1', '$2y$10$/jTST/ZTR6t8b6LazccuH.7wzscps87EJHz9DnYtzOLcf8rUOLjbK', 0),
(38, '22139702-9', '$2y$10$nKmJrcO8I/MeRztDifyE.exkawWTsrnoIWOOy9nfRbbx/Phx8Q1JS', 0),
(39, '0-0', '$2y$10$ted5d9vxGUdW0Tfweo8YYubutqiXtjXOi4sD8MV99.ChJ4acwwmrq', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_doctor` (`id_doctor`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id_doctor`),
  ADD UNIQUE KEY `correo` (`especialidad`);

--
-- Indices de la tabla `doctor_especialidades`
--
ALTER TABLE `doctor_especialidades`
  ADD KEY `id_doctor` (`id_doctor`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`rut`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id_doctor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `doctor_especialidades`
--
ALTER TABLE `doctor_especialidades`
  ADD CONSTRAINT `doctor_especialidades_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `doctor_especialidades_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
