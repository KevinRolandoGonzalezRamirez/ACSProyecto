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

-- insert into usuario (nomUsuario, pass, email, estado) values ('Usuario2','123456','Usuario@gmail.com',1);

-- select * from usuario;

-- Usuario
create user 'futbolAdmin' identified by 'futbol123';
grant alter,create,delete,drop,index,insert,select,update,trigger,alter routine,
create routine, execute, create temporary tables on bdFutbol.* to 'futbolAdmin';

-- use mysql;
-- select * from mysql.user;