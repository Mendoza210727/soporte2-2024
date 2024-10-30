create table ModeloAeronave(
    id_ModeloAeronave INT IDENTITY(1,1) PRIMARY KEY,
    modelo VARCHAR (100),
    cantidad_asientos int
)
create table Aeronave(
    id_Aeronave INT IDENTITY(1,1) PRIMARY KEY,
    nombre_comercial VARCHAR(100),
    fecha_inicio_operaciones DATE ,
    id_ModeloAeronave INT,
    FOREIGN KEY (id_ModeloAeronave) REFERENCES ModeloAeronave (id_ModeloAeronave)
)
create table Asientos(
    id_Asientos INT IDENTITY(1,1) PRIMARY KEY,
    tamano VARCHAR(2),
    numero INT,
    ubicacion VARCHAR (100),
    id_ModeloAeronave int,
    FOREIGN KEY (id_ModeloAeronave) REFERENCES  ModeloAeronave(id_ModeloAeronave)
)
create table Pais(
    id_Pais INT IDENTITY (1,1) PRIMARY KEY ,
    nombre_pais VARCHAR(100),
    nacionalidad VARCHAR(50),
)
create table Ciudad(
    id_Ciudad INT IDENTITY (1,1) PRIMARY KEY ,
    nombre_ciudad VARCHAR(100),
    id_Pais INT,
    FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais),
)
create table Aeropuerto(
    id_Aeropuerto INT IDENTITY (1,1) PRIMARY KEY,
    id_Ciudad INT,
    FOREIGN KEY (id_Ciudad) REFERENCES Ciudad(id_Ciudad)
)
create table NumeroVuelo(
    id_NumeroVuelo INT IDENTITY (1,1) PRIMARY KEY,
    hora_salida TIME,
    aerolinea VARCHAR(100),
    id_Aeropuerto INT,
    id_ModeloAeronave INT,
    FOREIGN KEY (id_Aeropuerto) REFERENCES Aeropuerto(id_Aeropuerto),
    FOREIGN KEY (id_ModeloAeronave) REFERENCES ModeloAeronave(id_ModeloAeronave)
)
create table TipoVuelo(
    id_TipoVuelo INT IDENTITY (1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
)

/* create table Escala(
    id_Escala INT IDENTITY (1,1) PRIMARY KEY,
    escala INT,
    id_PlanVuelo INT,
    FOREIGN KEY (escala) REFERENCES Aeropuerto(id_Aeropuerto),
    FOREIGN KEY (id_PlanVuelo) REFERENCES PlanVuelo(id_PlanVuelo)
) */
create table Vuelo(
    id_Vuelo INT IDENTITY(1,1) PRIMARY KEY,
    hora_embarque TIME,
    fecha_vuelo DATE,
    nuemero_puerta int,
    id_NumeroVuelo INT,
    id_TipoVuelo INT,
	escala INT,
	destino INT,
    FOREIGN KEY (id_NumeroVuelo) REFERENCES NumeroVuelo(id_NumeroVuelo),
    FOREIGN KEY (id_TipoVuelo) REFERENCES TipoVuelo(id_TipoVuelo),
	FOREIGN KEY (destino) REFERENCES Aeropuerto(id_Aeropuerto)
)
create table AsientoDisponible(
    id_AsientoDisponible INT IDENTITY(1,1) PRIMARY KEY,
    estadoAsiento VARCHAR(1),
    id_Asientos INT,
    id_Vuelo INT,
    FOREIGN KEY (id_Asientos) REFERENCES Asientos(id_Asientos),
    FOREIGN KEY (id_Vuelo) REFERENCES Vuelo(id_Vuelo)
)
create table TipoCliente(
    id_TipoCliente INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
)
create table TipoDocumento(
    id_TipoDocumento INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
)
create table DocumentoIdentidad(
    id_DocumentoIdentidad INT IDENTITY (1,1) PRIMARY KEY ,
    numero_documento VARCHAR(50),
    fecha_nacimiento DATE,
    id_ciudad INT,
    id_pais INT,
    id_TipoDocumento INT,
    fecha_emision DATE,  -- Fecha de emisión del documento
    fecha_vencimiento DATE,  -- Fecha de vencimiento del documento
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad),
    FOREIGN KEY (id_pais) REFERENCES Pais(id_pais),
    FOREIGN KEY (id_TipoDocumento) REFERENCES TipoDocumento(id_TipoDocumento)
)
create table Cliente(
    id_Cliente INT IDENTITY (1,1) PRIMARY KEY ,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_DocumentoIdentidad INT,
    id_TipoCliente INT,
    telefono VARCHAR(20),
    sexo VARCHAR(1),
    FOREIGN KEY (id_DocumentoIdentidad) REFERENCES DocumentoIdentidad(id_DocumentoIdentidad),
    FOREIGN KEY (id_TipoCliente) REFERENCES TipoCliente(id_TipoCliente)
)
create table TipoPago(
    id_TipoPago INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
)
create table CanalPago(
    id_CanalPago INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    plataforma VARCHAR(50),  -- Plataforma utilizada (web, móvil, mostrador)
)
create table Moneda(
    id_Moneda INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    nombre_moneda VARCHAR(50)
)
create table Reservas(
    id_Reservas INT IDENTITY(1,1) PRIMARY KEY,
    id_Cliente INT,
    fecha_reserva DATE,
    cantidad INT,
    PrecioUnitario INT ,--el precio es varia entre 100 y 500
    FOREIGN KEY (id_Cliente) REFERENCES Cliente (id_Cliente)
)

create table DetalleReserva(
    id_DetalleReserva INT IDENTITY (1,1) PRIMARY KEY,
    id_AsientoDisponible INT,
    id_Reservas INT,
    descripcion VARCHAR(100),
    FOREIGN KEY (id_Reservas) REFERENCES Reservas (id_Reservas),
    FOREIGN KEY (id_AsientoDisponible) REFERENCES AsientoDisponible(id_AsientoDisponible)
)
create table Pago(
    id_Pago INT IDENTITY (1,1) PRIMARY KEY ,
    id_Cliente INT,
    id_TipoPago INT,
    id_CanalPago INT,
    id_Moneda INT,
    id_Reservas INT,
    monto DECIMAL(10, 2),
    fecha_pago DATE,
    estatus VARCHAR(20),  -- Estado del pago (completado, pendiente, fallido)
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
    FOREIGN KEY (id_TipoPago) REFERENCES TipoPago(id_TipoPago),
    FOREIGN KEY (id_CanalPago) REFERENCES CanalPago(id_CanalPago),
    FOREIGN KEY (id_Moneda) REFERENCES Moneda(id_Moneda),
    FOREIGN KEY (id_Reservas) REFERENCES Reservas(id_Reservas)
)

create table PlanVuelo(
    id_PlanVuelo INT IDENTITY (1,1) PRIMARY KEY,
    id_Vuelo INT,
    escala INT,
    FOREIGN KEY (id_Vuelo) REFERENCES Vuelo(id_Vuelo),
    FOREIGN KEY (escala) REFERENCES Aeropuerto(id_Aeropuerto)
)

