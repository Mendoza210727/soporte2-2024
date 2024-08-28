-- Verificar si la base de datos existe y eliminarla si es así
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'soporte')
BEGIN
	use master
    DROP DATABASE soporte;
END
GO

-- Crear la base de datos
CREATE DATABASE soporte;
GO 

-- Usar la base de datos recién creada
USE soporte;
GO


-- creacon de las tabllas 

--tarjeta de viajero frecuente
CREATE TABLE FrequentFlyerCard(
    FFCNumber INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Miles INT NOT NULL,
    MealCode INT NOT NULL
);
-- pais
CREATE TABLE Country(
    IdCountry INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre NVARCHAR(100) NOT NULL, 
);
--ciudad
CREATE TABLE City(
    IdCity INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre NVARCHAR(100),
    IdCountry INT,
    CONSTRAINT FK_IdCountry FOREIGN KEY (IdCountry) REFERENCES Country(IdCountry) NOT NULL 
);
--cliente
CREATE TABLE Customer(
    IdCustomer INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateofBirth DATE DEFAULT GETDATE(),
    Name NVARCHAR(100),
    lastName NVARCHAR(100),
    FFCNumber INT,
    IdCity INT,
    CONSTRAINT FK_FrequentFlyerCard_Customer FOREIGN KEY (FFCNumber) REFERENCES FrequentFlyerCard(FFCNumber),
);
--pasport 
CREATE TABLE Pasport(
    NumberPasport INT IDENTITY(1,1) PRIMARY KEY
    ExpirationOfDate DATE NOT NULL,
    IdCountry INT NOT NULL,
    IdCity INT NOT NULL,
    CONSTRAINT FK_IdCountry FOREIGN KEY (IdCountry) REFERENCES Country(IdCountry),
    CONSTRAINT FK_IdCity FOREIGN KEY (IdCity) REFERENCES City(IdCity)

);

--boleto
CREATE TABLE Ticket(
    TicketingCode INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Number INT,
    IdCustomer INT,
    CONSTRAINT FK_IdCustomer_Ticket FOREIGN KEY (IdCustomer) REFERENCES Customer(IdCustomer)
);
--aeropuerto
CREATE TABLE Airport(
    IdAirport INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(100)
);
-- plan de vuelo 
CREATE TABLE PlaneModel(
    IdPlaneModel INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Description NVARCHAR(200),
    Graphic NVARCHAR(200)
);
-- nuemero de vuelo
CREATE TABLE FlightNumber(
    IdFlightNumber INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DepartureTime TIME,
    Description NVARCHAR(200),
    Type NVARCHAR(200),
    Airline NVARCHAR(200),
    IdAirport INT,
    IdPlaneModel INT,
    CONSTRAINT FK_IdAirport_FlightNumber FOREIGN KEY (IdAirport) REFERENCES Airport(IdAirport),
    CONSTRAINT FK_IdPlaneModel_FlightNumber FOREIGN KEY (IdPlaneModel) REFERENCES PlaneModel(IdPlaneModel)
);
-- aeropuerto
CREATE TABLE AirPlane(
    RegistrationNumber INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    BeginofOperation NVARCHAR(200),
    Status NVARCHAR(200),
    IdPlaneModel INT,
    CONSTRAINT FK_IdPlaneModel_AirPlane FOREIGN KEY (IdPlaneModel) REFERENCES PlaneModel(IdPlaneModel)
);
-- vuelo
CREATE TABLE Flight(
    IdFlight INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    BoardingTime TIME,
    FlightDate DATE DEFAULT GETDATE(),
    Gate NVARCHAR(50),
    CheckInCounter NVARCHAR(200),
    IdFlightNumber INT,
    CONSTRAINT FK_IdFlightNumber_Flight FOREIGN KEY (IdFlightNumber) REFERENCES FlightNumber(IdFlightNumber)
);
--asiento
CREATE TABLE Seat(
    IdSeat INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Size INT,
    Number INT,
    Location NVARCHAR(50),
    IdPlaneModel INT,
    CONSTRAINT FK_IdPlaneModel_Seat FOREIGN KEY (IdPlaneModel) REFERENCES PlaneModel(IdPlaneModel)
);
-- cupon
CREATE TABLE Cupon(
    IdCupon INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateofRedemption DATE DEFAULT GETDATE(),
    Class NVARCHAR(100),
    Standby NVARCHAR(100),
    MealCode NVARCHAR(100),
    TicketingCode INT,
    IdFlight INT,
    CONSTRAINT FK_TicketingCode_Cupon FOREIGN KEY (TicketingCode) REFERENCES Ticket(TicketingCode),
    CONSTRAINT FK_IdFlight_Cupon FOREIGN KEY (IdFlight) REFERENCES Flight(IdFlight)
);
-- cupon disponible
CREATE TABLE AvailableSeat(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateofRedemption DATE DEFAULT GETDATE(),
    IdSeat INT,
    IdFlight INT,
    IdCupon INT NULL,
    CONSTRAINT FK_IdSeat_AvailableSeat FOREIGN KEY (IdSeat) REFERENCES Seat(IdSeat),
    CONSTRAINT FK_IdFlight_AvailableSeat FOREIGN KEY (IdFlight) REFERENCES Flight(IdFlight),
    CONSTRAINT FK_IdCupon_AvailableSeat FOREIGN KEY (IdCupon) REFERENCES Cupon(IdCupon)
);
--pieza de equipage
CREATE TABLE PiecesofLuggage(
    Number INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Weigth FLOAT,
    IdCupon INT,
    CONSTRAINT FK_IdCupon_PricesofLuggage FOREIGN KEY (IdCupon) REFERENCES Cupon(IdCupon)
);

