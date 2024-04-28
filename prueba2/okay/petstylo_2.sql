-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 01:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petstylo_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `cita`
--

CREATE TABLE `cita` (
  `IDcita` varchar(10) NOT NULL,
  `fecha_hora_servicio` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `costo` varchar(10) DEFAULT NULL,
  `NUMservicio` varchar(15) DEFAULT NULL,
  `IDmascota` varchar(15) DEFAULT NULL,
  `IDproducto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codservicio`
--

CREATE TABLE `codservicio` (
  `NUMservicio` varchar(15) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mascota`
--

CREATE TABLE `mascota` (
  `IDmascota` varchar(15) NOT NULL,
  `IDusuario` varchar(20) DEFAULT NULL,
  `nombre_mascota` varchar(15) DEFAULT NULL,
  `especie` varchar(15) DEFAULT NULL,
  `raza` varchar(15) DEFAULT NULL,
  `edad_mascota` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mascota`
--

INSERT INTO `mascota` (`IDmascota`, `IDusuario`, `nombre_mascota`, `especie`, `raza`, `edad_mascota`) VALUES
('1', '1', 'chapulin', 'perro', 'labrador retrie', '7'),
('2', '2', 'goku', 'Perro', 'boxer', '11'),
('3', '3', 'heisenberg', 'gato', 'persa', '3'),
('4', '4', 'brayan', 'perro', 'chihuahua', '1'),
('5', '5', 'maxi', 'gato', 'siamese', '8'),
('6', '6', 'jumi', 'gato', 'siamese', '10'),
('7', '8', 'walter', 'gato', 'maine coon', '5');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `IDproducto` varchar(20) NOT NULL,
  `cantidad` varchar(10) DEFAULT NULL,
  `nombre_producto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`IDproducto`, `cantidad`, `nombre_producto`) VALUES
('1', '9', 'Champ? para perros'),
('2', '23', 'Peinilla para mascotas'),
('3', '9', 'Toallita de manchas'),
('4', '20', 'hueso de juguete'),
('5', '14', 'gel antibacterial de mascotas'),
('6', '6', 'talcos para patitas');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `IDusuario` varchar(20) NOT NULL,
  `contrasena` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`IDusuario`, `contrasena`) VALUES
('1', NULL),
('2', NULL),
('3', NULL),
('4', NULL),
('5', NULL),
('6', NULL),
('7', NULL),
('8', NULL),
('9', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `IDempleado` varchar(15) NOT NULL,
  `IDcita` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `IDusuario` varchar(20) DEFAULT NULL,
  `nombres` varchar(15) DEFAULT NULL,
  `apellidos` varchar(15) DEFAULT NULL,
  `numero_celular` varchar(15) DEFAULT NULL,
  `numero_documento` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`IDusuario`, `nombres`, `apellidos`, `numero_celular`, `numero_documento`) VALUES
('1', 'juan', 'perea', '310876452', '102356475'),
('2', 'Ana', 'Garc?a', '5551234567', '12345678'),
('3', 'Carlos', 'L?pez', '5559876543', '87654321'),
('4', 'Mar?a', 'Mart?nez', '5552223333', '45678901'),
('5', 'Juan', 'Rodr?guez', '5554445555', '23456789'),
('6', 'Laura', 'S?nchez', '5556667777', '34567890'),
('8', 'Sofia', 'D?az', '5551112222', '67890123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`IDcita`),
  ADD KEY `NUMservicio` (`NUMservicio`),
  ADD KEY `IDmascota` (`IDmascota`),
  ADD KEY `IDproducto` (`IDproducto`);

--
-- Indexes for table `codservicio`
--
ALTER TABLE `codservicio`
  ADD PRIMARY KEY (`NUMservicio`);

--
-- Indexes for table `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`IDmascota`),
  ADD KEY `IDusuario` (`IDusuario`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IDproducto`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IDusuario`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`IDempleado`),
  ADD KEY `IDcita` (`IDcita`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD KEY `IDusuario` (`IDusuario`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`NUMservicio`) REFERENCES `codservicio` (`NUMservicio`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`IDmascota`) REFERENCES `mascota` (`IDmascota`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`IDproducto`) REFERENCES `producto` (`IDproducto`);

--
-- Constraints for table `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`IDusuario`) REFERENCES `rol` (`IDusuario`);

--
-- Constraints for table `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`IDcita`) REFERENCES `cita` (`IDcita`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IDusuario`) REFERENCES `rol` (`IDusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
