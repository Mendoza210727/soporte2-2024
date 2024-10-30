create DATABASE DWPagos 
use DWPagos

create table DIMcustomer(
    id_customer INT IDENTITY (1,1) PRIMARY KEY ,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    descripcionCustomer VARCHAR(50),
    telefono VARCHAR(20),
    sexo VARCHAR(1),
    descripcionDocuemtType VARCHAR(50),
    nombre_ciudad VARCHAR(100),
    nombre_pais VARCHAR(100),
    nacionalidad VARCHAR(50),
)
create table DIMpaymentType(
    id_paymentType INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
)
create table DIMpaymentChannel(
    id_paymentChannel INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    plataforma VARCHAR(50),  -- Plataforma utilizada (web, móvil, mostrador)
)
create table DIMmoneda(
    id_moneda INT IDENTITY (1,1) PRIMARY KEY ,
    descripcion VARCHAR(50),
    nombre_moneda VARCHAR(50)
)
create table FACTpayments(
     id_pago INT IDENTITY (1,1) PRIMARY KEY ,
    id_customer INT,
    id_paymentType INT,
    id_paymentChannel INT,
    id_moneda INT,
    monto DECIMAL(10, 2),
    fecha_pago DATE,
    estatus VARCHAR(20),  -- Estado del pago (completado, pendiente, fallido)
    FOREIGN KEY (id_customer) REFERENCES DIMcustomer(id_customer),
    FOREIGN KEY (id_paymentType) REFERENCES DIMpaymentType(id_paymentType),
    FOREIGN KEY (id_paymentChannel) REFERENCES DIMpaymentChannel(id_paymentChannel),
    FOREIGN KEY (id_moneda) REFERENCES DIMmoneda(id_moneda)
)



