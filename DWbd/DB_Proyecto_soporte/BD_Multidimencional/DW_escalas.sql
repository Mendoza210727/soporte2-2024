CREATE DATABASE DW_Escalas

use DW_Escalas

create table DIM_aerolinea(
    id_aerolinea INT IDENTITY (1,1) PRIMARY KEY,
    nombre_aerolinea VARCHAR(100)
)
create table DIM_aeronave(
    id_aeronave INT IDENTITY (1,1) PRIMARY KEY,
    nombre_aeronave VARCHAR(100)
)
create table DIM_ciudad(
    id_ciudad INT IDENTITY (1,1) PRIMARY KEY,
    nombre_ciudad VARCHAR(100)
)
create table DIM_aeropuerto(
    id_aeropuerto INT IDENTITY (1,1) PRIMARY KEY,
    nombre_aeropuerto VARCHAR(100)
)
create table DIM_tiempo(
    id_tiempo INT IDENTITY (1,1) PRIMARY KEY,
    hora_salida TIME,
    hora_llegada TIME,
)
create table FACT_escalas(
    id_ INT IDENTITY (1,1) PRIMARY KEY,
    duracion INT,
    id_aerolinea INT, 
    id_aeronave INT,
    id_ciudad INT,
    id_aeropuerto INT,
    id_tiempo INT,
    FOREIGN KEY (id_aerolinea) REFERENCES DIM_aerolinea (id_aerolinea),
    FOREIGN KEY (id_aeronave) REFERENCES  DIM_aeronave(id_aeronave),
    FOREIGN KEY (id_ciudad) REFERENCES  DIM_ciudad(id_ciudad),
    FOREIGN KEY (id_aeropuerto) REFERENCES  DIM_aeropuerto(id_aeropuerto),
    FOREIGN KEY (id_tiempo) REFERENCES  DIM_tiempo(id_tiempo)
)