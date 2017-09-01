/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : localhost
 Source Database       : biblioteca

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 08/31/2017 21:50:23 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `autor`
-- ----------------------------
DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `bibliotecario`
-- ----------------------------
DROP TABLE IF EXISTS `bibliotecario`;
CREATE TABLE `bibliotecario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horario_entrada` datetime NOT NULL,
  `horario_salida` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ejemplar`
-- ----------------------------
DROP TABLE IF EXISTS `ejemplar`;
CREATE TABLE `ejemplar` (
  `id` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_libro` (`id_libro`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ejemplar_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `estado`
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `libro`
-- ----------------------------
DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `isbn` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `libro_autor`
-- ----------------------------
DROP TABLE IF EXISTS `libro_autor`;
CREATE TABLE `libro_autor` (
  `idLibro` int(11) NOT NULL,
  `idAutor` int(11) NOT NULL,
  KEY `idLibro` (`idLibro`),
  KEY `idAutor` (`idAutor`),
  CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `persona`
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `legajo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `domicilio` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `persona_bibliotecario`
-- ----------------------------
DROP TABLE IF EXISTS `persona_bibliotecario`;
CREATE TABLE `persona_bibliotecario` (
  `id_persona` int(11) NOT NULL,
  `id_bibliotecario` int(11) NOT NULL,
  KEY `id_persona` (`id_persona`),
  KEY `id_bibliotecario` (`id_bibliotecario`),
  CONSTRAINT `persona_bibliotecario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `persona_bibliotecario_ibfk_2` FOREIGN KEY (`id_bibliotecario`) REFERENCES `bibliotecario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `prestamo`
-- ----------------------------
DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE `prestamo` (
  `id` int(11) NOT NULL,
  `id_ejemplar` int(11) NOT NULL,
  `id_bibliotecario` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ejemplar` (`id_ejemplar`),
  KEY `id_bibliotecario` (`id_bibliotecario`),
  KEY `id_socio` (`id_socio`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`id_ejemplar`) REFERENCES `ejemplar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_bibliotecario`) REFERENCES `bibliotecario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prestamo_ibfk_3` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `socio`
-- ----------------------------
DROP TABLE IF EXISTS `socio`;
CREATE TABLE `socio` (
  `id` int(11) NOT NULL,
  `fecha_suscripcion` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `socio_persona`
-- ----------------------------
DROP TABLE IF EXISTS `socio_persona`;
CREATE TABLE `socio_persona` (
  `id_socio` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  KEY `id_socio` (`id_socio`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `socio_persona_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `socio_persona_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
