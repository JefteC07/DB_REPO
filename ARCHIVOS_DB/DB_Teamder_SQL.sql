/*
 Navicat Premium Dump SQL

 Source Server         : Base_Teamder
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_teamder

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 20/11/2025 20:30:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agendaalumno
-- ----------------------------
DROP TABLE IF EXISTS `agendaalumno`;
CREATE TABLE `agendaalumno`  (
  `id_agendaalumno` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `finfecha` datetime NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_agendaalumno`) USING BTREE,
  UNIQUE INDEX `id_agendaalumno`(`id_agendaalumno` ASC) USING BTREE,
  INDEX `agendaalumno_fk3`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `agendaalumno_fk3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agendaalumno
-- ----------------------------

-- ----------------------------
-- Table structure for agendatutor
-- ----------------------------
DROP TABLE IF EXISTS `agendatutor`;
CREATE TABLE `agendatutor`  (
  `id_agendatutor` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `fechafin` datetime NOT NULL,
  `id_tutor` int NOT NULL,
  PRIMARY KEY (`id_agendatutor`) USING BTREE,
  UNIQUE INDEX `id_agendatutor`(`id_agendatutor` ASC) USING BTREE,
  INDEX `agendatutor_fk3`(`id_tutor` ASC) USING BTREE,
  CONSTRAINT `agendatutor_fk3` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agendatutor
-- ----------------------------

-- ----------------------------
-- Table structure for asignaciones_tutor
-- ----------------------------
DROP TABLE IF EXISTS `asignaciones_tutor`;
CREATE TABLE `asignaciones_tutor`  (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_solicitud` int NOT NULL,
  `id_agendatutor` int NOT NULL,
  `fecha_asignacion` datetime NOT NULL,
  `estatus_aceptacion` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_asignacion`) USING BTREE,
  UNIQUE INDEX `id_asignacion`(`id_asignacion` ASC) USING BTREE,
  INDEX `asignaciones_tutor_fk1`(`id_solicitud` ASC) USING BTREE,
  INDEX `asignaciones_tutor_fk2`(`id_agendatutor` ASC) USING BTREE,
  CONSTRAINT `asignaciones_tutor_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `asignaciones_tutor_fk2` FOREIGN KEY (`id_agendatutor`) REFERENCES `agendatutor` (`id_agendatutor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asignaciones_tutor
-- ----------------------------

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_categoria`) USING BTREE,
  UNIQUE INDEX `id_categoria`(`id_categoria` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categoria
-- ----------------------------

-- ----------------------------
-- Table structure for especialidad
-- ----------------------------
DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE `especialidad`  (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_especialidad`) USING BTREE,
  UNIQUE INDEX `id_especialidad`(`id_especialidad` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of especialidad
-- ----------------------------

-- ----------------------------
-- Table structure for sesionasesoria
-- ----------------------------
DROP TABLE IF EXISTS `sesionasesoria`;
CREATE TABLE `sesionasesoria`  (
  `id_sesion` int NOT NULL AUTO_INCREMENT,
  `id_solicitud` int NOT NULL,
  `fecha` date NOT NULL,
  `duracion` time NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_tutor` int NOT NULL,
  PRIMARY KEY (`id_sesion`) USING BTREE,
  UNIQUE INDEX `id_sesion`(`id_sesion` ASC) USING BTREE,
  INDEX `sesionasesoria_fk1`(`id_solicitud` ASC) USING BTREE,
  INDEX `sesionasesoria_fk5`(`id_tutor` ASC) USING BTREE,
  CONSTRAINT `sesionasesoria_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sesionasesoria_fk5` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sesionasesoria
-- ----------------------------

-- ----------------------------
-- Table structure for solicitud
-- ----------------------------
DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE `solicitud`  (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_agendaalumno` int NOT NULL,
  `id_categoria` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_solicitud`) USING BTREE,
  UNIQUE INDEX `id_solicitud`(`id_solicitud` ASC) USING BTREE,
  INDEX `solicitud_fk1`(`id_agendaalumno` ASC) USING BTREE,
  INDEX `solicitud_fk2`(`id_categoria` ASC) USING BTREE,
  CONSTRAINT `solicitud_fk1` FOREIGN KEY (`id_agendaalumno`) REFERENCES `agendaalumno` (`id_agendaalumno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `solicitud_fk2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitud
-- ----------------------------

-- ----------------------------
-- Table structure for tutor
-- ----------------------------
DROP TABLE IF EXISTS `tutor`;
CREATE TABLE `tutor`  (
  `id_tutor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_especialidad` int NOT NULL,
  PRIMARY KEY (`id_tutor`) USING BTREE,
  UNIQUE INDEX `id_tutor`(`id_tutor` ASC) USING BTREE,
  INDEX `tutor_fk5`(`id_especialidad` ASC) USING BTREE,
  CONSTRAINT `tutor_fk5` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tutor
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `contraseña` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  UNIQUE INDEX `id_usuario`(`id_usuario` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
