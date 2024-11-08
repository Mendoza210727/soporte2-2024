CREATE DATABASE DW_Pago

use DW_Pago

create table DIM_canal_pago(
    id_canal_pago  INT IDENTITY(1,1) PRIMARY KEY,
    canal_pago varchar(100)
)
create table DIM_motivo_pago(
    id_motivo_pago  INT IDENTITY(1,1) PRIMARY KEY,
    motivo_pago varchar(100)
)
create table DIM_tipo_pago(
    id_tipo_pago  INT IDENTITY(1,1) PRIMARY KEY,
    tipo_pago varchar(100)
)
create table DIM_moneda(
    id_moneda  INT IDENTITY(1,1) PRIMARY KEY,
    moneda varchar(100)
)
create table DIM_cliente(
    id_cliente  INT IDENTITY(1,1) PRIMARY KEY,
    sexo varchar(100),
    tipo_cliente varchar(100)
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
create table FACT_pagos(
    id_pagos INT IDENTITY(1,1) PRIMARY KEY,
    monto int,
    id_canal_pago INT,
    id_motivo_pago INT,
    id_tipo_pago INT,
    id_moneda INT,
    id_cliente INT,
    id_fecha INT,
    FOREIGN KEY(id_canal_pago) REFERENCES DIM_canal_pago(id_canal_pago),
    FOREIGN KEY(id_motivo_pago) REFERENCES DIM_motivo_pago(id_motivo_pago),
    FOREIGN KEY(id_tipo_pago) REFERENCES DIM_tipo_pago(id_tipo_pago),
    FOREIGN KEY(id_moneda) REFERENCES DIM_moneda(id_moneda),
    FOREIGN KEY(id_cliente) REFERENCES DIM_cliente(id_cliente),
    FOREIGN KEY(id_fecha) REFERENCES DIM_fecha(id_fecha),    
)