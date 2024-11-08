CREATE DATABASE DW_Vuelos

use DW_Vuelos

create table DIM_origen(
    id_origen INT IDENTITY(1,1) PRIMARY KEY,
    nombre_origen VARCHAR(100)
)
create table DIM_destino(
    id_destino INT IDENTITY(1,1) PRIMARY KEY,
    nombre_destino VARCHAR(100)
)
create table DIM_aeronave(
    id_aeronave INT IDENTITY(1,1) PRIMARY KEY,
    nombre_aeronave VARCHAR(100)
)
create table DIM_aerolinea(
    id_aerolinea INT IDENTITY(1,1) PRIMARY KEY,
    nombre_aerolinea VARCHAR(100)
)
create table DIM_tipo_vuelo(
    id_tipo_vuelo INT IDENTITY(1,1) PRIMARY KEY,
    tipo_vuelo VARCHAR(100)
)
create table DIM_fecha(
    id_fecha DATE PRIMARY KEY,
    dia varchar(100),
    mes varchar(100),
    ano varchar(100),
    trimestre varchar(100),
    semestre varchar(100)
)
create table DIM_duracion_vuelo(
    id_duracion_vuelo INT IDENTITY (1,1) PRIMARY KEY,
    duracion_vuelo INT
)
create table FACT_vuelos(
    id_vuelos INT IDENTITY(1,1) PRIMARY KEY,
    id_origen INT,
    id_destino INT,
    id_aeronave INT,
    id_aerolinea INT,
    id_tipo_vuelo INT,
    id_fecha DATE,
    id_duracion_vuelo INT,
    FOREIGN KEY (id_origen) REFERENCES DIM_origen(id_origen),
    FOREIGN KEY (id_destino) REFERENCES DIM_destino(id_destino),
    FOREIGN KEY (id_aeronave) REFERENCES DIM_aeronave(id_aeronave),
    FOREIGN KEY (id_aerolinea) REFERENCES DIM_aerolinea(id_aerolinea),
    FOREIGN KEY (id_tipo_vuelo) REFERENCES DIM_tipo_vuelo(id_tipo_vuelo),
    FOREIGN KEY (id_fecha) REFERENCES DIM_fecha(id_fecha),
    FOREIGN KEY (id_duracion_vuelo) REFERENCES DIM_duracion_vuelo(id_duracion_vuelo)
)