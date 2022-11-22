-- Creacion base de datos
create database crud

use crud


-- Creacion tabla pcmods
create table pcmods(
id_pc int identity(1,1),
pcnombre varchar(max),
tematica varchar(max),
procesador varchar(max),
grafica varchar(max),
fecha_creacion date
)

-- Creacion tabla presupuesto
create table pcpresupuesto(
pcnombre varchar(max),
preciocpu int,
preciogpu int,
fecha_creacion date
)

/* Creacion procedimiento almacenado para mostrar
los ordenadores */
create procedure pc_load
as begin
select * from pcmods
End

/*Procedimientos almacenado para CRUD*/

--Create
create procedure pc_create
@Nombre varchar(max),
@Tematica varchar(max),
@Procesador varchar(max),
@Grafica varchar(max),
@Fecha date
as begin
insert into pcmods values(@Nombre, @Tematica, @Procesador, @Grafica, @Fecha)
end

--Read
create procedure pc_read
@Id int
as begin
select * from pcmods where id_pc = @Id
end

--Update
create procedure pc_update
@Id int,
@Nombre varchar(max),
@Tematica varchar(max),
@Procesador varchar(max),
@Grafica varchar(max),
@Fecha date
as begin
update pcmods set pcnombre=@Nombre, tematica=@Tematica, procesador=@Procesador, grafica=@Grafica, fecha_creacion=@Fecha
where id_pc=@Id
end

--Delete
create procedure pc_delete
@Id int
as begin
delete from pcmods where id_pc=@Id
end

select * from pcmods

/*Creacion tabla login*/
create table Usuarios(
id int identity(1000,1),
Usuario varchar(50),
Contrasenia varbinary(500)
)

create procedure LG_AddUser
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
insert into usuarios(Usuario, Contrasenia) values (@Usuario, ENCRYPTBYPASSPHRASE(@Patron,@Contrasenia))
End

create procedure LG_VaildateUser
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
select * from Usuarios where Usuario = @Usuario and CONVERT(varchar(50), DECRYPTBYPASSPHRASE(@Patron, Contrasenia)) = @Contrasenia
end

select*from Usuarios

LG_AddUser 'erik.caballeroh', 'qwerty123', 'programacionweb'