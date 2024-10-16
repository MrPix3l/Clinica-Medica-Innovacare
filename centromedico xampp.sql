-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2024 a las 14:24:53
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
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_doctor`, `fecha_hora`) VALUES
(4, 1, 2, '2024-09-11 16:30:00'),
(5, 2, 2, '2025-12-01 15:00:00'),
(6, 3, 1, '2024-11-10 18:15:00'),
(7, 4, 1, '2024-12-20 20:00:00');

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
(1, '12345453-3', '1w3r5y', 2),
(2, '111-1', 'jajaja', 1),
(3, '22384574-5', '123456', 3),
(21, '222-2', '$2y$10$2hC7MUmuOK2O2jlNylycX.5qer/dzduLV5DTKzYu5ystB73mjzG76', 0),
(22, '222-24', '$2y$10$UZ3iZu0S6jO.uSfKcH5Y1ufwjtKmYVXGE78fLafPffCZl7dqKjFSu', 0),
(23, '222-242', '$2y$10$oL0/ACEqth8O9kkpJd7Q/OSr86xOnVbNd.p/n/rEljVv3iZhO9Rui', 0),
(24, '333-3', '$2y$10$99P4qkGUwzEkjDjR3zgldeEYx.2J1H5TZ/p9Wo8K4xD4vmmPN8lnK', 0),
(25, '444-4', '$2y$10$RGFMzdJ4ALtH1WmhhBv8Rep7tcsfNGbiH2LIN3WtmXKyLuw.pI./a', 0),
(26, '555-5', '$2y$10$cM8lzY74eAIDf5TjBIO5bOn3JcJ..GdFGJgrtouxc3xuRYMxP3mn.', 0),
(27, '777-7', '$2y$10$QVlMPwNRY6d3RtFX1spkJ.lbp/BgS7uhXjRM5irO52tBp7InF6zDe', 0),
(28, '1-1', '$2y$10$rxK07ybXuuzsSd8sGBZAi..eVXNvdbaJNZvRLeIcFuZP4/pcG22pK', 0),
(29, '9-9', '$2y$10$ykVVyzYWugEq6uP.iFLyWO.w2FKAP9SA1REdUVrsLtDEyTWxCsbiy', 0),
(30, '6-7', '$2y$10$UdgfF1/FB45SYKWmHgGpL.ydrXoyqrCdAb0arbmu/PcIpm06ecT/e', 0),
(31, '5-6', '$2y$10$493RB7g7ppDHCF27Ur1be.P9YTI7H1YDQf3V/V6VQp8lmOS/vDTvS', 0),
(32, '22162239-1', '$2y$10$FkBklsBZttti09Dj1A0wrex/WwzhHuzWdqKkIoCUqSsN/pV4lfq8O', 0);

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
  MODIFY `id_cita` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

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
