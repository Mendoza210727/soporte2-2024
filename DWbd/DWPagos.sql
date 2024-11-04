create database DWPagos


create table DIMCliente(
    id_cliente INT IDENTITY(1,1)PRIMARY KEY ,
    edad INT,
    genero VARCHAR(100),
    nacionalida VARCHAR(100),
    tipo_cliente VARCHAR(100)
)

create table DIMFecha(
    id_fecha INT IDENTITY(1,1)PRIMARY KEY ,
    fecha DATE,
    dia varchar(100),
    mes varchar(100),
    ano varchar(100),
    trimestre varchar(100),
    semestre varchar(100)
)

create table DIMCanalPago(
    id_canal_pago INT IDENTITY(1,1)PRIMARY KEY ,
    canal_pago varchar(100)
)

create table DIMMoneda(
    id_moneda INT IDENTITY(1,1)PRIMARY KEY ,
    moneda varchar(100)
)

create table DIMTipoPago(
    id_tipo_pago INT IDENTITY(1,1)PRIMARY KEY ,
    tipo_pago varchar(100)
)

create table FACTPagos(
    id_pagos INT IDENTITY (1,1) PRIMARY KEY,
	monto int,
    id_cliente INT,
    id_fecha INT,
    id_canal_pago INT,
    id_moneda INT,
    id_tipo_pago INT,
    FOREIGN KEY (id_cliente) REFERENCES DIMCliente (id_cliente),
    FOREIGN KEY (id_fecha) REFERENCES DIMFecha (id_fecha),
    FOREIGN KEY (id_canal_pago) REFERENCES DIMCanalPago (id_canal_pago),
    FOREIGN KEY (id_moneda) REFERENCES DIMMoneda (id_moneda),
    FOREIGN KEY (id_tipo_pago) REFERENCES DIMTipoPago (id_tipo_pago)
)

--FACT RRESERVAS

create table DIMCliente(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    sexo varchar(100),
    nacionalidad varchar(100),
    edad int,
    documento_presentado varchar(100)
)

create table DIMTipoPago(
    id_tipo_pago INT IDENTITY(1,1) PRIMARY KEY,
    tipo_pago varchar(100)
)

create table DIMDestino(
    id_destino INT IDENTITY(1,1) PRIMARY KEY,
    destino varchar(100)
)

create table DIMTiempo(
    id_fecha INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    dia varchar(100),
    mes varchar(100),
    ano varchar(100),
    trimestre varchar(100),
    semestre varchar(100)
)

create table DIMEstadoReserva(
    id_estado_reserva INT IDENTITY(1,1) PRIMARY KEY,
    estado_reserva varchar(100)
)

create table FACTReservas(
    id_reservas INT IDENTITY(1,1) PRIMARY KEY,
	monto INT,
    id_cliente INT,
    id_tipo_pago INT,
    id_destino INT,
    id_fecha INT,
    id_estado_reserva INT,
    FOREIGN KEY (id_cliente) REFERENCES DIMCliente(id_cliente),
    FOREIGN KEY (id_tipo_pago) REFERENCES DIMTipoPago(id_tipo_pago),
    FOREIGN KEY (id_destino) REFERENCES DIMDestino(id_destino),
    FOREIGN KEY (id_fecha) REFERENCES DIMTiempo(id_fecha),
    FOREIGN KEY (id_estado_reserva) REFERENCES DIMEstadoReserva(id_estado_reserva)   
)
  





























SELECT 
    id_pago,
    fecha_pago,
    DATENAME(WEEKDAY, fecha_pago) AS dia,                       -- Nombre del día (ej., Monday, Tuesday)
    DATENAME(MONTH, fecha_pago) AS mes,                         -- Nombre del mes (ej., January, February)
    DATEPART(YEAR, fecha_pago) AS ano,                          -- Año en formato numérico
    'T' + CAST(DATEPART(QUARTER, fecha_pago) AS VARCHAR) + '-' + CAST(DATEPART(YEAR, fecha_pago) AS VARCHAR) AS trimestre, -- Trimestre en formato T1-ano
    CASE 
        WHEN DATEPART(QUARTER, fecha_pago) IN (1, 2) THEN 'S1-' + CAST(DATEPART(YEAR, fecha_pago) AS VARCHAR)  -- Semestre en formato S1-ano
        ELSE 'S2-' + CAST(DATEPART(YEAR, fecha_pago) AS VARCHAR)
    END AS semestre
FROM 
    Pago;


SELECT Cliente.id_Cliente, Cliente.sexo, Pais.nacionalidad, 
TipoDocumento.descripcion, TipoCliente.descripcion AS Expr1,DATEDIFF(YEAR, DocumentoIdentidad.fecha_nacimiento, '2024-01-01') - 
        CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, DocumentoIdentidad.fecha_nacimiento, '2024-01-01'), DocumentoIdentidad.fecha_nacimiento) > '2024-01-01' 
            THEN 1 
            ELSE 0 
        END AS edad
FROM     Ciudad INNER JOIN
                  DocumentoIdentidad ON Ciudad.id_Ciudad = DocumentoIdentidad.id_ciudad INNER JOIN
                  Cliente ON DocumentoIdentidad.id_DocumentoIdentidad = Cliente.id_DocumentoIdentidad INNER JOIN
                  Pais ON DocumentoIdentidad.id_pais = Pais.id_Pais INNER JOIN
                  TipoCliente ON Cliente.id_TipoCliente = TipoCliente.id_TipoCliente INNER JOIN
                  TipoDocumento ON DocumentoIdentidad.id_TipoDocumento = TipoDocumento.id_TipoDocumento