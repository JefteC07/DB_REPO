CREATE TABLE IF NOT EXISTS `Usuarios` (
	`id_usuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nombre` varchar(50) NOT NULL,
	`apellido` varchar(50) NOT NULL,
	`correo` varchar(50) NOT NULL,
	`telefono` varchar(50) NOT NULL,
	`contraseña` varchar(40) NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE IF NOT EXISTS `categoria` (
	`id_categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nombre` varchar(100) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);

CREATE TABLE IF NOT EXISTS `solicitud` (
	`id_solicitud` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_agendaalumno` int NOT NULL,
	`id_categoria` int NOT NULL,
	`fecha_creacion` datetime NOT NULL,
	`estado` varchar(20) NOT NULL,
	PRIMARY KEY (`id_solicitud`)
);

CREATE TABLE IF NOT EXISTS `tutor` (
	`id_tutor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nombre` varchar(50) NOT NULL,
	`apellido` varchar(50) NOT NULL,
	`correo` varchar(50) NOT NULL,
	`telefono` varchar(50) NOT NULL,
	`id_especialidad` int NOT NULL,
	PRIMARY KEY (`id_tutor`)
);

CREATE TABLE IF NOT EXISTS `especialidad` (
	`id_especialidad` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`id_especialidad`)
);

CREATE TABLE IF NOT EXISTS `asignaciones_tutor` (
	`id_asignacion` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_solicitud` int NOT NULL,
	`id_agendatutor` int NOT NULL,
	`fecha_asignacion` datetime NOT NULL,
	`estatus_aceptacion` varchar(20) NOT NULL,
	PRIMARY KEY (`id_asignacion`)
);

CREATE TABLE IF NOT EXISTS `sesionasesoria` (
	`id_sesion` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_solicitud` int NOT NULL,
	`fecha` date NOT NULL,
	`duracion` time NOT NULL,
	`observaciones` text NOT NULL,
	`id_tutor` int NOT NULL,
	PRIMARY KEY (`id_sesion`)
);

CREATE TABLE IF NOT EXISTS `agendaalumno` (
	`id_agendaalumno` int AUTO_INCREMENT NOT NULL UNIQUE,
	`fecha` datetime NOT NULL,
	`finfecha` datetime NOT NULL,
	`id_usuario` int NOT NULL,
	PRIMARY KEY (`id_agendaalumno`)
);

CREATE TABLE IF NOT EXISTS `agendatutor` (
	`id_agendatutor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`fecha` datetime NOT NULL,
	`fechafin` datetime NOT NULL,
	`id_tutor` int NOT NULL,
	PRIMARY KEY (`id_agendatutor`)
);



ALTER TABLE `solicitud` ADD CONSTRAINT `solicitud_fk1` FOREIGN KEY (`id_agendaalumno`) REFERENCES `agendaalumno`(`id_agendaalumno`);

ALTER TABLE `solicitud` ADD CONSTRAINT `solicitud_fk2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria`(`id_categoria`);
ALTER TABLE `tutor` ADD CONSTRAINT `tutor_fk5` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad`(`id_especialidad`);

ALTER TABLE `asignaciones_tutor` ADD CONSTRAINT `asignaciones_tutor_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud`(`id_solicitud`);

ALTER TABLE `asignaciones_tutor` ADD CONSTRAINT `asignaciones_tutor_fk2` FOREIGN KEY (`id_agendatutor`) REFERENCES `agendatutor`(`id_agendatutor`);
ALTER TABLE `sesionasesoria` ADD CONSTRAINT `sesionasesoria_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud`(`id_solicitud`);

ALTER TABLE `sesionasesoria` ADD CONSTRAINT `sesionasesoria_fk5` FOREIGN KEY (`id_tutor`) REFERENCES `tutor`(`id_tutor`);
ALTER TABLE `agendaalumno` ADD CONSTRAINT `agendaalumno_fk3` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios`(`id_usuario`);
ALTER TABLE `agendatutor` ADD CONSTRAINT `agendatutor_fk3` FOREIGN KEY (`id_tutor`) REFERENCES `tutor`(`id_tutor`);