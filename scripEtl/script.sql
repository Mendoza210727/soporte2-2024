-- Verificar si la base de datos existe y eliminarla si es así
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'aerolinea')
BEGIN
	use master
    DROP DATABASE aerolinea;
END
GO

-- Crear la base de datos
CREATE DATABASE aerolinea;
GO 

-- Usar la base de datos recién creada
USE aerolinea;
GO

create table country(
    id_country INT IDENTITY (1,1) PRIMARY KEY ,
    nombre_pais VARCHAR(100),
    nacionalidad VARCHAR(50),
)
create table city(
    id_city INT IDENTITY (1,1) PRIMARY KEY ,
    nombre_ciudad VARCHAR(100),
    id_country INT,
    FOREIGN KEY (id_country) REFERENCES country(id_country),
)
create table documentType(
    id_documentType INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50)
)
create table identityDocument(
    id_identityDocument INT IDENTITY (1,1) PRIMARY KEY ,
    numero_documento VARCHAR(50),
    fecha_nacimiento DATE,
    id_city INT,
    id_country INT,
    id_documentType INT,
    fecha_emision DATE,  -- Fecha de emisión del documento
    fecha_vencimiento DATE,  -- Fecha de vencimiento del documento
    FOREIGN KEY (id_city) REFERENCES city(id_city),
    FOREIGN KEY (id_country) REFERENCES country(id_country),
    FOREIGN KEY (id_documentType) REFERENCES documentType(id_documentType)
)
create table customerType(
    id_customerType INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
)
create table customer(
    id_customer INT IDENTITY (1,1) PRIMARY KEY ,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_identityDocument INT,
    id_customerType INT,
    telefono VARCHAR(20),
    sexo VARCHAR(1),
    FOREIGN KEY (id_identityDocument) REFERENCES identityDocument(id_identityDocument),
    FOREIGN KEY (id_customerType) REFERENCES customerType(id_customerType)
)
create table paymentType(
    id_paymentType INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
)
create table paymentChannel(
    id_paymentChannel INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    plataforma VARCHAR(50),  -- Plataforma utilizada (web, móvil, mostrador)
)
create table moneda(
    id_moneda INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    nombre_moneda VARCHAR(50)
)
create table payments(
     id_pago INT IDENTITY (1,1) PRIMARY KEY ,
    id_customer INT,
    id_paymentType INT,
    id_paymentChannel INT,
    id_moneda INT,
    monto DECIMAL(10, 2),
    fecha_pago DATE,
    estatus VARCHAR(20),  -- Estado del pago (completado, pendiente, fallido)
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_paymentType) REFERENCES paymentType(id_paymentType),
    FOREIGN KEY (id_paymentChannel) REFERENCES paymentChannel(id_paymentChannel),
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda)
)



