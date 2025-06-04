-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2025 at 03:33 AM
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
-- Database: `bd_proyecto_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `coleccion`
--

CREATE TABLE `coleccion` (
  `IDcoleccion` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `UsuarioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `IDpost` int(11) NOT NULL,
  `fechaPost` date NOT NULL,
  `UsuarioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postcoleccion`
--

CREATE TABLE `postcoleccion` (
  `IDpertenencia` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `ColeccionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID`, `Nombre`, `Contrasena`) VALUES
(1, 'Celia', 'cisco123'),
(2, 'Angie', 'cisco123'),
(3, 'Ian', 'cisco123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coleccion`
--
ALTER TABLE `coleccion`
  ADD PRIMARY KEY (`IDcoleccion`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`IDpost`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Indexes for table `postcoleccion`
--
ALTER TABLE `postcoleccion`
  ADD PRIMARY KEY (`IDpertenencia`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `ColeccionID` (`ColeccionID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coleccion`
--
ALTER TABLE `coleccion`
  MODIFY `IDcoleccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `IDpost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postcoleccion`
--
ALTER TABLE `postcoleccion`
  MODIFY `IDpertenencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coleccion`
--
ALTER TABLE `coleccion`
  ADD CONSTRAINT `coleccion_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `postcoleccion`
--
ALTER TABLE `postcoleccion`
  ADD CONSTRAINT `postcoleccion_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`IDpost`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postcoleccion_ibfk_2` FOREIGN KEY (`ColeccionID`) REFERENCES `coleccion` (`IDcoleccion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
