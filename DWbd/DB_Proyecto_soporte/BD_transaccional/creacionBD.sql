create table ModeloAeronave(
    id_ModeloAeronave INT IDENTITY(1,1) PRIMARY KEY,
    modelo VARCHAR (100),
    cantidad_asientos int
)
create table Aerolinea(
    id_Aerolinea INT IDENTITY(1,1) PRIMARY KEY,
    nombre_aerolinea varchar (100)
)
create table Aeronave(
    id_Aeronave INT IDENTITY(1,1) PRIMARY KEY,
    nombre_comercial VARCHAR(100),
    fecha_inicio_operaciones DATE ,
    id_ModeloAeronave INT,
    id_Aerolinea INT,
    FOREIGN KEY (id_ModeloAeronave) REFERENCES ModeloAeronave (id_ModeloAeronave),
    FOREIGN KEY (id_Aerolinea) REFERENCES Aerolinea(id_Aerolinea)
)
create table TipoEmpleado(
    id_TipoEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    cargo varchar(100)
)
create table Empleados(
    id_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre varchar(50),
    apellidos varchar(100),
    fecha_contratacion DATE,
    saladrio INT ,
    id_TipoEmpleado INT,
    FOREIGN KEY (id_TipoEmpleado) REFERENCES TipoEmpleado(id_TipoEmpleado)
)
create table Proveedor (
    id_Proveedor INT IDENTITY(1,1)PRIMARY KEY,
    nombre_proveedor varchar(100)
)
create table Repuesto(
    id_Repuesto INT IDENTITY (1,1) PRIMARY KEY,
    nombre_repuesto varchar(100),
    precio INT,
    id_Proveedor INT,
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
)
create table TipoMantenimiento(
    id_TipoMantenimiento INT IDENTITY(1,1) PRIMARY KEY,
    tipo_mantenimiento varchar(100)
)
create table Mantenimientos(
    id_Mantenimiento INT IDENTITY (1,1) PRIMARY KEY,
    fecha_mantenimiento DATE, --valores entre 2019 al 2022
    fecha_entrega DATe,--valores entre 1 a 5 dias a partir de la fecha de manteniento
    id_Empleado INT,-- aleatorio entre los valores de 96 - 110
    id_Aeronave INT,  
    costo_mantenimiento INT,  --suma del precio de los repuestos que aparece en la tabla DetalleMantenimiento que pertenecen a cada mantenimiento
    id_TipoMantenimiento INT,--aleatorio de los valores de la tabla TipoMantenimiento
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (id_Aeronave) REFERENCES Aeronave(id_Aeronave),
    FOREIGN KEY (id_TipoMantenimiento)REFERENCES TipoMantenimiento(id_TipoMantenimiento)
)
create table DetalleMantenimiento(
    id_DetalleMantenimiento INT IDENTITY(1,1) PRIMARY KEY,
    cantidad INT,
    id_Repuesto INT,
    id_Mantenimiento INT,
    FOREIGN KEY (id_Repuesto) REFERENCES Repuesto(id_Repuesto),
    FOREIGN KEY (id_Mantenimiento) REFERENCES Mantenimientos(id_Mantenimiento)
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
    nacionalidad VARCHAR(50)
)
create table Ciudad(
    id_Ciudad INT IDENTITY (1,1) PRIMARY KEY ,
    nombre_ciudad VARCHAR(100),
    id_Pais INT,
    FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais)
)
create table Aeropuerto(
    id_Aeropuerto INT IDENTITY (1,1) PRIMARY KEY,
    id_Ciudad INT,
    nombre_aeropuerto varchar (100),
    FOREIGN KEY (id_Ciudad) REFERENCES Ciudad(id_Ciudad)
)
create table TipoVuelo(
    id_TipoVuelo INT IDENTITY (1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
)
create table NumeroVuelo(
    id_NumeroVuelo INT IDENTITY (1,1) PRIMARY KEY,--5500
    hora_salida TIME,
    id_Aeronave INT,
    origen INT,
    destino INT,
    numero_puerta INT,
    FOREIGN KEY (origen) REFERENCES Aeropuerto(id_Aeropuerto), --aleatorio de todas las ciudades que tienen id_Pais = 16
    FOREIGN KEY (destino) REFERENCES Aeropuerto(id_Aeropuerto),--alatorio diferente de origen
    FOREIGN KEY (id_Aeronave) REFERENCES Aeronave(id_Aeronave) --alatorio de todas las aeronnaves 
)
create table PlanVuelo(
    id_PlanVuelo INT IDENTITY (1,1) PRIMARY KEY,
    id_NumeroVuelo INT,
    cantidad_escala INT, --valores aleatorios entre 0 - 3 donde el 0 = 20%, 1 = 40%, 2 = 30%, 3 = 10% 
    FOREIGN KEY (id_NumeroVuelo) REFERENCES NumeroVuelo(id_NumeroVuelo)
)
create table Escalas(
    id_escala INT IDENTITY (1,1) PRIMARY KEY,
    hora_salida TIME,--valor aleatorio--
    hora_llegada TIME,--valores aleatorios entre 2 a 10 horas de diferencia con la hora de salida 
    duracion_escala INT,-- cantidad de horas entre la hora de salida y la hora de llegada--
    escala INT,-- valor aleatorio distinto al origen y destino  obtenido de la tabla aeropuerto, encaso de ser 0 cantidad_escala valor null
    id_PlanVuelo INT,
    FOREIGN KEY (escala) REFERENCES Aeropuerto(id_Aeropuerto),
    FOREIGN KEY (id_PlanVuelo) REFERENCES PlanVuelo(id_PlanVuelo)
)
create table Vuelo(
    id_Vuelo INT IDENTITY(1,1) PRIMARY KEY,
    hora_embarque TIME, -- valor es igual a 1 hora despues de la hora_salida de la tabla NumeroVuelo
    fecha_vuelo DATE,-- fecha de manera aleatoria entre los años 2019 al 2022  de tal forma que el dia y el mes  debende obtenerse de forma aleatoriaa
    duracion_vuelo TIME,--se obtiene de la suma de la duracion de las escalas que pertenecen a un mismo plan de vuelo
    id_NumeroVuelo INT,-- realacion de 1 a 1 con Numero de vuelo 
    id_TipoVuelo INT, -- 1 si  el destino es un valor entre "55 al 66" caso contrario 2
    FOREIGN KEY (id_NumeroVuelo) REFERENCES NumeroVuelo(id_NumeroVuelo),
    FOREIGN KEY (id_TipoVuelo) REFERENCES TipoVuelo(id_TipoVuelo)
)
create table Tripulacion(
    id_Tripulacion INT IDENTITY(1,1) PRIMARY KEY,
    id_Vuelo INT,--relacion de tripulacion con vuelo de 1 a 1 
    piloto INT,--valores aleatorios entre 1-25--
    copiloto INT,--valores aleatorios entre 26-45--
    tripulacion_cabina_1 INT,--valores aleatorios entre 46 - 95 estos valores no se deben de repetir en el mismo vuelo --
    tripulacion_cabina_2 INT,--valores aleatorios entre 46 - 95 estos valores no se deben de repetir en el mismo vuelo --
    tripulacion_cabina_3 INT,--valores aleatorios entre 46 - 95 estos valores no se deben de repetir en el mismo vuelo --
    tripulacion_cabina_4 INT,--valores aleatorios entre 46 - 95 estos valores no se deben de repetir en el mismo vuelo --
    tripulacion_cabina_5 INT,--valores aleatorios entre 46 - 95 estos valores no se deben de repetir en el mismo vuelo --
    tripulacion_cabina_6 INT,--valores aleatorios entre 46 - 95 estos valores no se deben de repetir en el mismo vuelo --
    mecanico INT, --valores aleatorios entre 96 - 110 --
    despachador_vuelo INT, --  valores aleatorios entre 61 - 66 --
    FOREIGN KEY (id_Vuelo) REFERENCES Vuelo(id_Vuelo),
    FOREIGN KEY (piloto) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (copiloto) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (tripulacion_cabina_1) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (tripulacion_cabina_2) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (tripulacion_cabina_3) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (tripulacion_cabina_4) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (tripulacion_cabina_5) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (tripulacion_cabina_6) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (mecanico) REFERENCES Empleados(id_Empleado),
    FOREIGN KEY (despachador_vuelo) REFERENCES Empleados(id_Empleado)
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
    descripcion VARCHAR(50)
)
create table CanalPago(
    id_CanalPago INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    plataforma VARCHAR(50)  -- Plataforma utilizada (web, móvil, mostrador)
)
create table Moneda(
    id_Moneda INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    nombre_moneda VARCHAR(50)
)
create table MotivoPago(
    id_MotivoPago INT IDENTITY (1,1) PRIMARY KEY ,
    motivo_pago VARCHAR(50) 
)

create table EstadoReserva(
    id_EstadoReserva INT IDENTITY(1,1) PRIMARY KEY,
    estado_reserva VARCHAR(100)
)
create table Reservas(
    id_Reservas INT IDENTITY(1,1) PRIMARY KEY,
    id_Cliente INT, --aleatorio de la tabla cliente
    fecha_reserva DATE, -- null
    cantidad_asientos INT, --aleatorio  valores entre 1 y 4
    monto INT, --null
    id_EstadoReserva INT, --aleatorio  dodone el 96% = 1 y el 4% =2
    FOREIGN KEY (id_Cliente) REFERENCES Cliente (id_Cliente),
    FOREIGN KEY (id_EstadoReserva) REFERENCES EstadoReserva(id_EstadoReserva)
)
create table DetalleReserva(
    id_DetalleReserva INT IDENTITY (1,1) PRIMARY KEY,
    id_AsientoDisponible INT,
    id_Reservas INT,
    PrecioUnitario INT ,
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
    id_MotivoPago INT,
    monto DECIMAL(10, 2),
    fecha_pago DATE,
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
    FOREIGN KEY (id_TipoPago) REFERENCES TipoPago(id_TipoPago),
    FOREIGN KEY (id_CanalPago) REFERENCES CanalPago(id_CanalPago),
    FOREIGN KEY (id_Moneda) REFERENCES Moneda(id_Moneda),
    FOREIGN KEY (id_MotivoPago) REFERENCES MotivoPago(id_MotivoPago)
)  




