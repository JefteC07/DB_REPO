CREATE TABLE IF NOT EXISTS `usuarios` (
	`id_usuario` int AUTO_INCREMENT NOT NULL,
	`nombre` varchar(100) NOT NULL,
	`correo` varchar(100) NOT NULL,
	`id_carrera` int NOT NULL,
	`id_agendaUsuario` int NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE IF NOT EXISTS `especialidades` (
	`id_especialidad` int AUTO_INCREMENT NOT NULL,
	`especialidad` varchar(100) NOT NULL,
	PRIMARY KEY (`id_especialidad`)
);

CREATE TABLE IF NOT EXISTS `tutores` (
	`id_tutor` int AUTO_INCREMENT NOT NULL,
	`nombre` varchar(100) NOT NULL,
	`correo` varchar(100) NOT NULL,
	`id_especialidad` int NOT NULL,
	`id_agendaTutores` int NOT NULL,
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
	`fecha_asesoria_tutor` date NOT NULL,
	`id_temaAsesoria` int NOT NULL,
	PRIMARY KEY (`id_solicitud`)
);

CREATE TABLE IF NOT EXISTS `temasDeAsesoria` (
	`id_temaasesoria` int AUTO_INCREMENT NOT NULL,
	`tipo_tema` varchar(100) NOT NULL,
	PRIMARY KEY (`id_temaasesoria`)
);

CREATE TABLE IF NOT EXISTS `sesionesAsesoria` (
	`id_sesion` int AUTO_INCREMENT NOT NULL,
	`id_tutor` int NOT NULL,
	`id_solicitud` int NOT NULL,
	`fecha` date NOT NULL,
	`duracion` time NOT NULL,
	`observaciones_tutor` text NOT NULL,
	PRIMARY KEY (`id_sesion`)
);

CREATE TABLE IF NOT EXISTS `agendaUsuarios` (
	`id_agendausuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`fecha` date NOT NULL,
	`finfecha` date NOT NULL,
	PRIMARY KEY (`id_agendausuario`)
);

CREATE TABLE IF NOT EXISTS `agendaTutores` (
	`id_agendatutor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`fecha` date NOT NULL,
	`fechafin` date NOT NULL,
	PRIMARY KEY (`id_agendatutor`)
);

ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_fk3` FOREIGN KEY (`id_carrera`) REFERENCES `carreras`(`id_carrera`);

ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_fk4` FOREIGN KEY (`id_agendaUsuario`) REFERENCES `agendaUsuarios`(`id_agendausuario`);

ALTER TABLE `tutores` ADD CONSTRAINT `tutores_fk3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades`(`id_especialidad`);

ALTER TABLE `tutores` ADD CONSTRAINT `tutores_fk4` FOREIGN KEY (`id_agendaTutores`) REFERENCES `agendaTutores`(`id_agendatutor`);

ALTER TABLE `AgendarSolicitudes` ADD CONSTRAINT `AgendarSolicitudes_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id_usuario`);

ALTER TABLE `AgendarSolicitudes` ADD CONSTRAINT `AgendarSolicitudes_fk4` FOREIGN KEY (`id_temaAsesoria`) REFERENCES `temasDeAsesoria`(`id_temaasesoria`);

ALTER TABLE `sesionesAsesoria` ADD CONSTRAINT `sesionesAsesoria_fk1` FOREIGN KEY (`id_tutor`) REFERENCES `tutores`(`id_tutor`);

ALTER TABLE `sesionesAsesoria` ADD CONSTRAINT `sesionesAsesoria_fk2` FOREIGN KEY (`id_solicitud`) REFERENCES `AgendarSolicitudes`(`id_solicitud`);
ALTER TABLE `agendaUsuarios` ADD CONSTRAINT `agendaUsuarios_fk0` FOREIGN KEY (`id_agendausuario`) REFERENCES `usuarios`(`id_agendaalumno`);
ALTER TABLE `agendaTutores` ADD CONSTRAINT `agendaTutores_fk0` FOREIGN KEY (`id_agendatutor`) REFERENCES `tutores`(`id_agendatutor`);