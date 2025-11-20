CREATE TABLE IF NOT EXISTS `usuarios` (
	`id_usuario` int AUTO_INCREMENT NOT NULL,
	`nombres` varchar(100) NOT NULL,
	`apellidos` varchar(255) NOT NULL,
	`correo` varchar(100) NOT NULL,
	`id_carrera` int NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE IF NOT EXISTS `especialidades` (
	`id_especialidad` int AUTO_INCREMENT NOT NULL,
	`especialidad` varchar(100) NOT NULL,
	PRIMARY KEY (`id_especialidad`)
);

CREATE TABLE IF NOT EXISTS `tutores` (
	`id_tutor` int AUTO_INCREMENT NOT NULL,
	`nombres` varchar(100) NOT NULL,
	`apellidos` varchar(255) NOT NULL,
	`correo` varchar(100) NOT NULL,
	`id_especialidad` int NOT NULL,
	PRIMARY KEY (`id_tutor`)
);

CREATE TABLE IF NOT EXISTS `carreras` (
	`id_carrera` int AUTO_INCREMENT NOT NULL,
	`nombre` varchar(80) NOT NULL,
	PRIMARY KEY (`id_carrera`)
);

CREATE TABLE IF NOT EXISTS `AgendarSolicitudes` (
	`id_solicitud` int AUTO_INCREMENT NOT NULL,
	`id_usuario` int NOT NULL,
	`estatus_r_tutor` int NOT NULL,
	`fecha_asesoria_tutor` datetime NOT NULL,
	`id_categoria` int NOT NULL,
	`tema_alumno` int NOT NULL,
	`id_tutor` int NOT NULL,
	PRIMARY KEY (`id_solicitud`)
);

CREATE TABLE IF NOT EXISTS `categorias` (
	`id_categoria` int AUTO_INCREMENT NOT NULL,
	`categoria` varchar(100) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);

CREATE TABLE IF NOT EXISTS `sesionesAsesoria` (
	`id_sesion` int AUTO_INCREMENT NOT NULL,
	`id_solicitud` int NOT NULL,
	`fecha` datetime NOT NULL,
	`duracion` time NOT NULL,
	`observaciones_tutor` text NOT NULL,
	PRIMARY KEY (`id_sesion`)
);

CREATE TABLE IF NOT EXISTS `agendaUsuarios` (
	`id_agendausuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_usuario` int NOT NULL,
	`fecha` datetime NOT NULL,
	`finfecha` datetime NOT NULL,
	PRIMARY KEY (`id_agendausuario`)
);

CREATE TABLE IF NOT EXISTS `agendaTutores` (
	`id_agendatutor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_tutor` int NOT NULL,
	`fecha` datetime NOT NULL,
	`fechafin` datetime NOT NULL,
	PRIMARY KEY (`id_agendatutor`)
);

ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_fk4` FOREIGN KEY (`id_carrera`) REFERENCES `carreras`(`id_carrera`);

ALTER TABLE `tutores` ADD CONSTRAINT `tutores_fk4` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades`(`id_especialidad`);

ALTER TABLE `AgendarSolicitudes` ADD CONSTRAINT `AgendarSolicitudes_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id_usuario`);

ALTER TABLE `AgendarSolicitudes` ADD CONSTRAINT `AgendarSolicitudes_fk4` FOREIGN KEY (`id_categoria`) REFERENCES `categorias`(`id_categoria`);

ALTER TABLE `AgendarSolicitudes` ADD CONSTRAINT `AgendarSolicitudes_fk6` FOREIGN KEY (`id_tutor`) REFERENCES `tutores`(`id_tutor`);

ALTER TABLE `sesionesAsesoria` ADD CONSTRAINT `sesionesAsesoria_fk1` FOREIGN KEY (`id_solicitud`) REFERENCES `AgendarSolicitudes`(`id_solicitud`);
ALTER TABLE `agendaUsuarios` ADD CONSTRAINT `agendaUsuarios_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE `agendaTutores` ADD CONSTRAINT `agendaTutores_fk1` FOREIGN KEY (`id_tutor`) REFERENCES `tutores`(`id_tutor`);