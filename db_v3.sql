CREATE TABLE `carreras` (
  `id_carrera` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(80)
);

CREATE TABLE `especialidades` (
  `id_especialidad` int PRIMARY KEY AUTO_INCREMENT,
  `especialidad` varchar(100)
);

CREATE TABLE `agendaUsuarios` (
  `id_agendausuario` int PRIMARY KEY AUTO_INCREMENT,
  `fecha` date,
  `finfecha` date
);

CREATE TABLE `agendaTutores` (
  `id_agendatutor` int PRIMARY KEY AUTO_INCREMENT,
  `fecha` date,
  `fechafin` date
);

CREATE TABLE `usuarios` (
  `id_usuario` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100),
  `correo` varchar(100),
  `id_carrera` int,
  `id_agendausuario` int
);

CREATE TABLE `tutores` (
  `id_tutor` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100),
  `correo` varchar(100),
  `id_especialidad` int,
  `id_agendaTutores` int
);

CREATE TABLE `temasDeAsesoria` (
  `id_temaasesoria` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_tema` varchar(100)
);

CREATE TABLE `AgendarSolicitudes` (
  `id_solicitud` int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int,
  `estatus_r_tutor` int,
  `fecha_asesoria_tutor` date,
  `id_temaAsesoria` int
);

CREATE TABLE `sesionesAsesoria` (
  `id_sesion` int PRIMARY KEY AUTO_INCREMENT,
  `id_tutor` int,
  `id_solicitud` int,
  `fecha` date,
  `duracion` time,
  `observaciones_tutor` text
);

ALTER TABLE `usuarios` ADD FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`);

ALTER TABLE `usuarios` ADD FOREIGN KEY (`id_agendausuario`) REFERENCES `agendaUsuarios` (`id_agendausuario`);

ALTER TABLE `tutores` ADD FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`);

ALTER TABLE `tutores` ADD FOREIGN KEY (`id_agendaTutores`) REFERENCES `agendaTutores` (`id_agendatutor`);

ALTER TABLE `AgendarSolicitudes` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `AgendarSolicitudes` ADD FOREIGN KEY (`id_temaAsesoria`) REFERENCES `temasDeAsesoria` (`id_temaasesoria`);

ALTER TABLE `sesionesAsesoria` ADD FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`);

ALTER TABLE `sesionesAsesoria` ADD FOREIGN KEY (`id_solicitud`) REFERENCES `AgendarSolicitudes` (`id_solicitud`);