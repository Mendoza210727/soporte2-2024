CREATE DATABASE DW_Mantenimientos

use DW_Mantenimientos

create table DIM_aeronave(
    id_aeronave INT IDENTITY(1,1) PRIMARY KEY,
    nombre_aeronave VARCHAR(100)
)
create table DIM_aerolinea(
    id_aerolinea INT IDENTITY(1,1) PRIMARY KEY,
    nombre_aerolinea VARCHAR(100)
)
create table DIM_repuesto(
    id_repuesto INT IDENTITY(1,1) PRIMARY KEY,
    nombre_repuesto VARCHAR(100)
)
create table DIM_tipo_mantenimiento(
    id_tipo_mantenimiento INT IDENTITY(1,1) PRIMARY KEY,
    tipo_mantenimiento VARCHAR(100)
)
create table DIM_empleado(
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre_empleado VARCHAR(100)
)
create table DIM_tiempo(
    id_tiempo INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    dia varchar(100),
    mes varchar(100),
    ano varchar(100),
    trimestre varchar(100),
    semestre varchar(100),
    duracio_mantenimiento INT
)
create table FACT_mantenimientos(
    id_mantenimientos INT IDENTITY(1,1) PRIMARY KEY,
    monto INT,
    id_aeronave INT,
    id_aerolinea INT,
    id_repuesto INT,
    id_tipo_mantenimiento INT,
    id_empleado INT,
    id_tiempo INT,
    FOREIGN KEY(id_aeronave) REFERENCES  DIM_aeronave(id_aeronave),
    FOREIGN KEY(id_aerolinea) REFERENCES DIM_aerolinea (id_aerolinea),
    FOREIGN KEY(id_repuesto) REFERENCES  DIM_repuesto(id_repuesto),
    FOREIGN KEY(id_tipo_mantenimiento) REFERENCES  DIM_tipo_mantenimiento(id_tipo_mantenimiento),
    FOREIGN KEY(id_empleado) REFERENCES  DIM_empleado(id_empleado),
    FOREIGN KEY(id_tiempo) REFERENCES  DIM_tiempo(id_tiempo)
)