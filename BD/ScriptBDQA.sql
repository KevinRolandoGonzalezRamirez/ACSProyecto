-- drop database bdFutbol;
-- Usuario
-- create user 'futbolAdmin' identified by 'futbol123';
-- grant alter,create,delete,drop,index,insert,select,update,trigger,alter routine,
-- create routine, execute, create temporary tables on bdFutbol.* to 'futbolAdmin';

drop database if exists bdFutbol;
create database bdFutbol;
use bdFutbol;

create table usuario(
	idUsuario int auto_increment,
    nomUsuario varchar(50),
    pass varchar(256),
    email varchar(50),
    estado tinyint,
    
    primary key(idUsuario)
);

create table Liga(
	idLiga int auto_increment,
    nombreLiga varchar(75),
    fechaCreacion date, -- nota guarda la fecha 
    fechaCierre date,-- nota guarda la fecha
    tipodeLiga tinyint, -- 0 apuesta, 1 diversión
    precioDeParticipacion float, -- 0 en caso de diversión
    sede varchar(75),
    estado tinyint,
    
    primary key(idLiga)
);

CREATE TABLE ligaUsuario (
    idRegistro INT,
    idLiga INT,
    idUsuario INT,
    punteo INT DEFAULT 0,
    PRIMARY KEY (idRegistro)
);

-- ********LLAVES FORANEAS LIGAUSUARIO**********

-- ********FORANEA A LA TABLA LIGA************
ALTER TABLE ligaUsuario ADD FOREIGN KEY(idLiga) REFERENCES Liga(idLiga);
-- ********FORANEA A LA TABLA USUARIO************
ALTER TABLE ligaUsuario ADD FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario);

create table ligaUsuarioPendienteDeAprobacion(
	idRegistro int auto_increment,
    idLiga int,
    idUsuario int,
    
    primary key(idRegistro)
);

-- ********LLAVES FORANEAS ligaUsuarioPendienteDeAprobacion**********

-- ********FORANEA A LA TABLA LIGA************
ALTER TABLE ligaUsuarioPendienteDeAprobacion ADD FOREIGN KEY(idLiga) REFERENCES Liga(idLiga);
-- ********FORANEA A LA TABLA USUARIO************
ALTER TABLE ligaUsuarioPendienteDeAprobacion ADD FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario);

create table estadio(
	idEstadio int auto_increment,
    nombre varchar(75),
    pais varchar(75), 
    estado tinyint, -- 0 inactivo , 1 activo

	primary key(idEstadio)
);

create table equipo(
	idEquipo int auto_increment,
    nombreEquipo varchar(75),
    pais varchar(75),
    estado tinyint,
    
    primary key(idEquipo)
);

create table partidos(
	idPartido int auto_increment,
    idLiga int,
    idEstadio int, -- foraneo
    idEquipo1 int, -- foranea
    idEquipo2 int, -- foranea
    fechaYHoraEncuentro datetime, -- nota aca guardar fecha y hora
    golesEquipo1 int,
    golesEquipo2 int,
    
    estado tinyint, -- 0 no iniciado, 1 finalizado y 2 cancelado
    
    primary key(idPartido)
);

-- ********LLAVES FORANEAS partidos**********
-- ********FORANEA A LA TABLA LIGA************
ALTER TABLE partidos ADD FOREIGN KEY(idLiga) REFERENCES Liga(idLiga);
-- ********FORANEA A LA TABLA Estadio************
ALTER TABLE partidos ADD FOREIGN KEY(idEstadio) REFERENCES estadio(idEstadio);
-- ********FORANEA A LA TABLA EQUIPO#1************
ALTER TABLE partidos ADD FOREIGN KEY(idEquipo1) REFERENCES equipo(idEquipo);
-- ********FORANEA A LA TABLA EQUIPO#2************
ALTER TABLE partidos ADD FOREIGN KEY(idEquipo2) REFERENCES equipo(idEquipo);

create table resultadoLiga(
	idRegistro int auto_increment,
    idLiga int, -- foranea
    idUsuario int , -- foranea
    puesto int,
    
    primary key (idRegistro)
);

/* Para empates -> Con formula
1ro y 2do - 75%/2
2do y 3ro - 35%/2
3ro y 4to - 20%/2
1ro, 2do y 3ro - 85%/3
1ro, 2do, 3ro y 4to - 95%/4
Más de 5 - 95% / X
O el % equivalente dividido entre los que empataron
*/

-- ********LLAVES FORANEAS resultadoLiga**********
-- ********FORANEA A LA TABLA LIGA************
ALTER TABLE resultadoLiga ADD FOREIGN KEY(idLiga) REFERENCES Liga(idLiga);
-- ********FORANEA A LA TABLA LIGA************
ALTER TABLE resultadoLiga ADD FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario);

create table prediccion(
	idPrediccion int auto_increment,
    idPartido int,
    idUsuario int,
    prediccionGol1 int,
    prediccionGol2 int,
    estado tinyint,
    
	primary key(idPrediccion)
);
-- ********LLAVES FORANEAS prediccion**********
-- ********FORANEA A LA TABLA PARTIDO************
ALTER TABLE prediccion ADD FOREIGN KEY(idPartido) REFERENCES partidos(idPartido);
-- ********FORANEA A LA TABLA USUARIO************
ALTER TABLE prediccion ADD FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario);


create table equipoClasificadoLiga(
	idRegistro int auto_increment,
    idEquipo int, -- foraneo
    idLiga int, -- foraneo
    fecha date,
    estado tinyint,
    
    primary key(idRegistro)
);
-- ********LLAVES FORANEAS equipoClasificadoLiga**********
-- ********FORANEA A LA TABLA Equipo************
ALTER TABLE equipoClasificadoLiga ADD FOREIGN KEY(idEquipo) REFERENCES equipo(idEquipo);
-- ********FORANEA A LA TABLA Equipo************
ALTER TABLE equipoClasificadoLiga ADD FOREIGN KEY(idLiga) REFERENCES liga(idLiga);


create table punteoEquipoLiga(
	idRegistro int auto_increment,
    idEquipo int,
    IdLiga int,
    puntuaje int,
    estado tinyint, -- 0 inactivo , 1 activo
    
    primary key(idRegistro)
);

-- ********LLAVES FORANEAS PunteoEquipoLiga**********
-- ********FORANEA A LA TABLA Equipo************
ALTER TABLE punteoEquipoLiga ADD FOREIGN KEY(idEquipo) REFERENCES equipo(idEquipo);
-- ********FORANEA A LA TABLA Liga************
ALTER TABLE punteoEquipoLiga ADD FOREIGN KEY(IdLiga) REFERENCES Liga(IdLiga);

create table tarjeta(
	idTarjeta int auto_increment,
    nombreEncargado varchar(75),
    numerodeTarjeta varchar(75),
    cvc varchar (4), -- solo son 3 digitos
    fechaDeCaducidad date,
    tipo varchar(75), -- Visa, Mastercad
    estado tinyint, -- 0 inactivo, 1 activo
    
    primary key(idTarjeta)
);

create table pago(
	idPago int auto_increment,
    idUsuario int,
    idTarjeta int , -- foraneo con tarjeta
    idLiga int,
    fechaDePago date,
    
    primary key(idPago)
    
);


-- ********LLAVES FORANEAS pago**********
-- ********FORANEA A LA TABLA Usuuario************
ALTER TABLE pago ADD FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario);
-- ********FORANEA A LA TABLA TARJETA************
ALTER TABLE pago ADD FOREIGN KEY(idTarjeta) REFERENCES tarjeta(idTarjeta);
-- insert into usuario (nomUsuario, pass, email, estado) values ('Usuario2','123456','Usuario@gmail.com',1);

-- select * from usuario;



-- use mysql;
-- select * from mysql.user;