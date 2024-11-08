CREATE DATABASE DW_Reservas

use DW_Reservas

create table DIM_estado_reserva(
    id_estado_reserva INT IDENTITY(1,1) PRIMARY KEY,
    estado_reserva varchar(100)
)
create table DIM_fecha(
    id_fecha  INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    dia varchar(100),
    mes varchar(100),
    ano varchar(100),
    trimestre varchar(100),
    semestre varchar(100)
)
create table DIM_cliente(
    id_cliente  INT IDENTITY(1,1) PRIMARY KEY,
    sexo varchar(100),
    tipo_documento varchar(100),
    tipo_cliente varchar(100), 
    nacionalidad varchar(100)
)
create table DIM_cantidad_asientos (
    id_cantidad_asientos INT IDENTITY (1,1) PRIMARY KEY,
    cantidad_asientos INT
)
create table FACT_reservas(
    id_reservas INT IDENTITY(1,1) PRIMARY KEY,
    monto INT,
    id_estado_reserva INT,
    id_fecha INT,
    id_cliente INT,
    id_cantidad_asientos INT,
    FOREIGN KEY (id_estado_reserva) REFERENCES DIM_estado_reserva(id_estado_reserva),
    FOREIGN KEY (id_fecha) REFERENCES DIM_fecha(id_fecha),
    FOREIGN KEY (id_cliente) REFERENCES DIM_cliente(id_cliente),
    FOREIGN KEY (id_cantidad_asientos) REFERENCES DIM_cantidad_asientos(id_cantidad_asientos)
)
