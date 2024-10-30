USE Script_Soporte;
GO

-- Crear tabla Country (es referenciada por otras tablas)
IF OBJECT_ID('country', 'U') IS NULL
CREATE TABLE country(
    IdCountry int IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL
);
GO

-- Crear tabla City (depende de Country)
IF OBJECT_ID('city', 'U') IS NULL
CREATE TABLE city(
    IdCity int IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    IdCountry int, -- Relación con Country
    FOREIGN KEY (IdCountry) REFERENCES country(IdCountry)
);
GO

-- Crear tabla Customer (cliente) con relaciones a Country y City
IF OBJECT_ID('Customer', 'U') IS NULL
CREATE TABLE Customer(
    ID int NOT NULL PRIMARY KEY, -- carnet de cliente
    DateOfBirth date NOT NULL, -- fecha de nacimiento
    Name NVARCHAR(50) NOT NULL, -- nombre
    IdCountry int, -- Relación con Country
    IdCity int, -- Relación con City
    FOREIGN KEY (IdCountry) REFERENCES country(IdCountry),
    FOREIGN KEY (IdCity) REFERENCES city(IdCity)
);
GO

-- Crear tabla FrequentFlyerCard (tarjeta de viajero frecuente)
IF OBJECT_ID('FrequentFiyerCard', 'U') IS NULL
CREATE TABLE FrequentFiyerCard(
    FFC_Number int PRIMARY KEY, -- Número FFC
    Miles int NOT NULL, -- Millas
    MealCode NVARCHAR(10) NOT NULL, -- Código de comida
    ID_Customer int NOT NULL, -- Relación con Customer
    FOREIGN KEY (ID_Customer) REFERENCES Customer(ID) ON UPDATE CASCADE
);
GO

-- Crear tabla Ticket (ticket de vuelo)
IF OBJECT_ID('Ticket', 'U') IS NULL
CREATE TABLE Ticket(
    TicketingCode int NOT NULL PRIMARY KEY, -- Código de emisión de entradas
    Number int NOT NULL,
    ID_Customer int NOT NULL, -- Relación con Customer
    FOREIGN KEY (ID_Customer) REFERENCES Customer(ID) ON UPDATE CASCADE
);
GO

-- Crear tabla PlaneModel (modelo de avión)
IF OBJECT_ID('PlaneModel', 'U') IS NULL
CREATE TABLE PlaneModel(
    Description NVARCHAR(50) NOT NULL PRIMARY KEY, -- Descripción del modelo
    Graphic NVARCHAR(50) -- Gráfico
);
GO

-- Crear tabla Airport (aeropuerto)
IF OBJECT_ID('Airport', 'U') IS NULL
CREATE TABLE Airport(
    Name NVARCHAR(50) NOT NULL PRIMARY KEY, -- Nombre del aeropuerto
    IdCountry int, -- Relación con Country
    FOREIGN KEY (IdCountry) REFERENCES country(IdCountry)
);
GO

-- Crear tabla FlightNumber (número de vuelo)
IF OBJECT_ID('FlightNumber', 'U') IS NULL
CREATE TABLE FlightNumber(
    DepartureTime time NOT NULL PRIMARY KEY, -- Hora de salida
    Description NVARCHAR(50) NOT NULL, -- Descripción
    Type NVARCHAR(50) NOT NULL, -- Tipo de vuelo
    Airline NVARCHAR(50) NOT NULL, -- Aerolínea
    Name_Start NVARCHAR(50), -- Aeropuerto de salida
    Name_End NVARCHAR(50), -- Aeropuerto de llegada
    Description_PlaneModel NVARCHAR(50), -- Relación con PlaneModel
    FOREIGN KEY (Description_PlaneModel) REFERENCES PlaneModel(Description) ON UPDATE CASCADE,
    FOREIGN KEY (Name_Start) REFERENCES Airport(Name),
    FOREIGN KEY (Name_End) REFERENCES Airport(Name)
);
GO

-- Crear tabla Airplane (avión)
IF OBJECT_ID('Airplane', 'U') IS NULL
CREATE TABLE Airplane(
    RegistrationNumber NVARCHAR(50) NOT NULL PRIMARY KEY, -- Matrícula
    BeginOfOperation time NOT NULL, -- Inicio de operación
    Status NVARCHAR(50) NOT NULL, -- Estado
    Description_PlaneModel NVARCHAR(50) NOT NULL, -- Relación con PlaneModel
    FOREIGN KEY (Description_PlaneModel) REFERENCES PlaneModel(Description) ON UPDATE NO ACTION
);
GO

-- Crear tabla Seat (asiento)
IF OBJECT_ID('Seat', 'U') IS NULL
CREATE TABLE Seat(
    Size int NOT NULL PRIMARY KEY, -- Tamaño del asiento
    Number int NOT NULL, -- Número de asiento
    Location NVARCHAR(60) NOT NULL, -- Ubicación
    Description_PlaneModel NVARCHAR(50) NOT NULL, -- Relación con PlaneModel
    FOREIGN KEY (Description_PlaneModel) REFERENCES PlaneModel(Description) ON UPDATE NO ACTION
);
GO

-- Crear tabla Flight (vuelo)
IF OBJECT_ID('Flight', 'U') IS NULL
CREATE TABLE Flight(
    BoardingTime time NOT NULL PRIMARY KEY, -- Hora de embarque
    FlightData NVARCHAR(50), -- Datos del vuelo
    Gate NVARCHAR(50), -- Puerta
    CheckIn_Counter NVARCHAR(50), -- Comprobación
    DepartureTime_FlightNumber time NOT NULL, -- Relación con FlightNumber
    FOREIGN KEY (DepartureTime_FlightNumber) REFERENCES FlightNumber(DepartureTime) ON UPDATE NO ACTION
);
GO

-- Crear tabla Coupon (cupon)
IF OBJECT_ID('Coupon', 'U') IS NULL
CREATE TABLE Coupon(
    DateOfRedemption date NOT NULL PRIMARY KEY, -- Fecha de redención
    Class NVARCHAR(50) NOT NULL, -- Clase
    Standby time NOT NULL, -- Espera
    MealCode NVARCHAR(10) NOT NULL, -- Código de comida
    BoardingTime_Flight time NOT NULL, -- Relación con Flight
    FOREIGN KEY (BoardingTime_Flight) REFERENCES Flight(BoardingTime) ON UPDATE NO ACTION
);
GO

-- Crear tabla PiecesOfLuggage (piezas de equipaje)
IF OBJECT_ID('PiecesOfLuggage', 'U') IS NULL
CREATE TABLE PiecesOfLuggage(
    Number int NOT NULL, -- Número de pieza
    Weight int NOT NULL, -- Peso
    DateOfRedemption_Coupon date NOT NULL, -- Relación con Coupon
    FOREIGN KEY (DateOfRedemption_Coupon) REFERENCES Coupon(DateOfRedemption) ON UPDATE NO ACTION
);
GO

-- Crear tabla AvailableSeat (asiento disponible)
IF OBJECT_ID('AvailableSeat', 'U') IS NULL
CREATE TABLE AvailableSeat(
    Size_Seat int NOT NULL, -- Tamaño del asiento
    BoardingTime_Flight time NOT NULL, -- Hora de embarque
    DateOfRedemption_Coupon date NOT NULL, -- Relación con Coupon
    FOREIGN KEY (Size_Seat) REFERENCES Seat(Size),
    FOREIGN KEY (BoardingTime_Flight) REFERENCES Flight(BoardingTime),
    FOREIGN KEY (DateOfRedemption_Coupon) REFERENCES Coupon(DateOfRedemption)
);
GO

-- Crear tabla Cash (efectivo)
IF OBJECT_ID('cash', 'U') IS NULL
CREATE TABLE cash(
    IdCash int IDENTITY(1,1) PRIMARY KEY,
    dateOf date,
    CurrencyType NVARCHAR(50)
);
GO

-- Crear tabla CreditCard (tarjeta de crédito)
IF OBJECT_ID('CREDITCARD', 'U') IS NULL
CREATE TABLE CREDITCARD(
    cardNumber int IDENTITY(1,1) PRIMARY KEY,
    cardOfType NVARCHAR(50),
    cv smallint,
    expirationDate date
);
GO

-- Crear tabla PaymentType (tipo de pago)
IF OBJECT_ID('paymentType', 'U') IS NULL
CREATE TABLE paymentType(
    IdPaymentType int IDENTITY(1,1) PRIMARY KEY,
    description NVARCHAR(50),
    IdCash int, -- Relación con Cash (si es un pago en efectivo)
    cardNumber int, -- Relación con CreditCard (si es un pago con tarjeta)
    FOREIGN KEY (IdCash) REFERENCES cash(IdCash),
    FOREIGN KEY (cardNumber) REFERENCES CREDITCARD(cardNumber)
);
GO

-- Crear tabla Pasport (pasaporte)
IF OBJECT_ID('pasport', 'U') IS NULL
CREATE TABLE pasport(
    NumberPasport int IDENTITY(1,1) PRIMARY KEY,
    expirationOdDate date,
    cardNumber int,
    IdCountry int,
    IdCity int,
    FOREIGN KEY (IdCountry) REFERENCES country(IdCountry),
    FOREIGN KEY (IdCity) REFERENCES city(IdCity)
);
GO

-- Crear tabla IdentityCard (carnet de identidad)
IF OBJECT_ID('identityCard', 'U') IS NULL
CREATE TABLE identityCard(
    ci int IDENTITY(1,1) PRIMARY KEY,
    dateOfExpiration date,
    dateOfEmission date,
    IdCountry int,
    IdCity int,
    FOREIGN KEY (IdCountry) REFERENCES country(IdCountry),
    FOREIGN KEY (IdCity) REFERENCES city(IdCity)
);
GO

-- Crear tabla PurchaseDocument (documento de compra)
IF OBJECT_ID('purchaseDocument', 'U') IS NULL
CREATE TABLE purchaseDocument(
    IdDocuments int IDENTITY(1,1) PRIMARY KEY,
    details NVARCHAR(50),
    NumberPasport int,
    ci int,
    FOREIGN KEY (NumberPasport) REFERENCES pasport(NumberPasport),
    FOREIGN KEY (ci) REFERENCES identityCard(ci)
);
GO

-- Crear tabla Sales (ventas) con relación explícita a paymentType
IF OBJECT_ID('sales', 'U') IS NULL
CREATE TABLE sales(
    IdSale int IDENTITY(1,1) PRIMARY KEY,
    TotalAmount decimal(10,2), -- Importe total
    Totaldate date,
    IdDocuments int, -- Relación con el documento de compra
    IdPaymentType int, -- Relación con el tipo de pago
    FOREIGN KEY (IdDocuments) REFERENCES purchaseDocument(IdDocuments),
    FOREIGN KEY (IdPaymentType) REFERENCES paymentType(IdPaymentType)
);
GO
