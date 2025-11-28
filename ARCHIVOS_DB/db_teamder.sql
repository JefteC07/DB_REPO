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

 Date: 27/11/2025 22:24:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agendas_tutores
-- ----------------------------
DROP TABLE IF EXISTS `agendas_tutores`;
CREATE TABLE `agendas_tutores`  (
  `id_agendatutor` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `fechafin` datetime NOT NULL,
  `id_tutor` int NOT NULL,
  PRIMARY KEY (`id_agendatutor`) USING BTREE,
  UNIQUE INDEX `id_agendatutor`(`id_agendatutor` ASC) USING BTREE,
  INDEX `agendas_tutores_fk3`(`id_tutor` ASC) USING BTREE,
  CONSTRAINT `agendas_tutores_fk3` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agendas_tutores
-- ----------------------------

-- ----------------------------
-- Table structure for agendas_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `agendas_usuarios`;
CREATE TABLE `agendas_usuarios`  (
  `id_agendaalumno` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `finfecha` datetime NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_agendaalumno`) USING BTREE,
  UNIQUE INDEX `id_agendaalumno`(`id_agendaalumno` ASC) USING BTREE,
  INDEX `agendas_usuarios_fk3`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `agendas_usuarios_fk3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agendas_usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for asignaciones_tutores
-- ----------------------------
DROP TABLE IF EXISTS `asignaciones_tutores`;
CREATE TABLE `asignaciones_tutores`  (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_solicitud` int NOT NULL,
  `id_agendatutor` int NOT NULL,
  `fecha_asignacion` datetime NOT NULL,
  `estatus_aceptacion` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_asignacion`) USING BTREE,
  UNIQUE INDEX `id_asignacion`(`id_asignacion` ASC) USING BTREE,
  INDEX `asignaciones_tutores_fk1`(`id_solicitud` ASC) USING BTREE,
  INDEX `asignaciones_tutores_fk2`(`id_agendatutor` ASC) USING BTREE,
  CONSTRAINT `asignaciones_tutores_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `asignaciones_tutores_fk2` FOREIGN KEY (`id_agendatutor`) REFERENCES `agendas_tutores` (`id_agendatutor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asignaciones_tutores
-- ----------------------------

-- ----------------------------
-- Table structure for carreras
-- ----------------------------
DROP TABLE IF EXISTS `carreras`;
CREATE TABLE `carreras`  (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_carrera`) USING BTREE,
  UNIQUE INDEX `id_carrera`(`id_carrera` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carreras
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_categoria`) USING BTREE,
  UNIQUE INDEX `id_categoria`(`id_categoria` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------

-- ----------------------------
-- Table structure for especialidades
-- ----------------------------
DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE `especialidades`  (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_especialidad`) USING BTREE,
  UNIQUE INDEX `id_especialidad`(`id_especialidad` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of especialidades
-- ----------------------------

-- ----------------------------
-- Table structure for sesiones_asesoria
-- ----------------------------
DROP TABLE IF EXISTS `sesiones_asesoria`;
CREATE TABLE `sesiones_asesoria`  (
  `id_sesion` int NOT NULL AUTO_INCREMENT,
  `id_solicitud` int NOT NULL,
  `fecha` date NOT NULL,
  `duracion` time NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_tutor` int NOT NULL,
  PRIMARY KEY (`id_sesion`) USING BTREE,
  UNIQUE INDEX `id_sesion`(`id_sesion` ASC) USING BTREE,
  INDEX `sesiones_asesoria_fk1`(`id_solicitud` ASC) USING BTREE,
  INDEX `sesiones_asesoria_fk5`(`id_tutor` ASC) USING BTREE,
  CONSTRAINT `sesiones_asesoria_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sesiones_asesoria_fk5` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sesiones_asesoria
-- ----------------------------

-- ----------------------------
-- Table structure for solicitudes
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE `solicitudes`  (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_agendaalumno` int NOT NULL,
  `id_categoria` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_solicitud`) USING BTREE,
  UNIQUE INDEX `id_solicitud`(`id_solicitud` ASC) USING BTREE,
  INDEX `solicitudes_fk1`(`id_agendaalumno` ASC) USING BTREE,
  INDEX `solicitudes_fk2`(`id_categoria` ASC) USING BTREE,
  CONSTRAINT `solicitudes_fk1` FOREIGN KEY (`id_agendaalumno`) REFERENCES `agendas_usuarios` (`id_agendaalumno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `solicitudes_fk2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitudes
-- ----------------------------

-- ----------------------------
-- Table structure for tutores
-- ----------------------------
DROP TABLE IF EXISTS `tutores`;
CREATE TABLE `tutores`  (
  `id_tutor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_especialidad` int NOT NULL,
  PRIMARY KEY (`id_tutor`) USING BTREE,
  UNIQUE INDEX `id_tutor`(`id_tutor` ASC) USING BTREE,
  INDEX `tutores_fk5`(`id_especialidad` ASC) USING BTREE,
  CONSTRAINT `tutores_fk5` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tutores
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_carrera` int NOT NULL,
  `contraseña` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  UNIQUE INDEX `id_usuario`(`id_usuario` ASC) USING BTREE,
  INDEX `Usuarios_fk3`(`id_carrera` ASC) USING BTREE,
  CONSTRAINT `Usuarios_fk3` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
