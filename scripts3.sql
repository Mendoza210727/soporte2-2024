IF EXISTS (SELECT * FROM sys.databases WHERE name = 'soporte')
BEGIN
    USE master;
    DROP DATABASE soporte;
END
GO

-- Crear la base de datos
CREATE DATABASE soporte;
GO 

-- Usar la base de datos recién creada
USE soporte;
GO

-- Tarjeta de viajero frecuente
CREATE TABLE FrequentFlyerCard(
    FFCNumber INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Miles INT NOT NULL CONSTRAINT CK_Miles_Positive CHECK (Miles >= 0),
    MealCode INT NOT NULL CONSTRAINT CK_MealCode_Positive CHECK (MealCode > 0)
);

-- País
CREATE TABLE Country(
    IdCountry INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre NVARCHAR(100) NOT NULL CONSTRAINT UQ_Country_Nombre UNIQUE
);

-- Ciudad
CREATE TABLE City(
    IdCity INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    IdCountry INT NOT NULL,
    CONSTRAINT FK_IdCountry FOREIGN KEY (IdCountry) REFERENCES Country(IdCountry) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT UQ_City_Name_Country UNIQUE (Nombre, IdCountry)
);

-- Tabla para clasificar a los clientes
CREATE TABLE CustomerType(
    IdCustomerType INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL CONSTRAINT UQ_CustomerType_TypeName UNIQUE
);

-- Cliente
CREATE TABLE Customer(
    IdCustomer INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateofBirth DATE NOT NULL CONSTRAINT CK_DateofBirth_Past CHECK (DateofBirth <= GETDATE()),
    Name NVARCHAR(100) NOT NULL,
    lastName NVARCHAR(100) NOT NULL,
    FFCNumber INT,
    IdCity INT,
    IdCustomerType INT,
    CONSTRAINT FK_FrequentFlyerCard FOREIGN KEY (FFCNumber) REFERENCES FrequentFlyerCard(FFCNumber)
        ON DELETE SET NULL,
    CONSTRAINT FK_City_Customer FOREIGN KEY (IdCity) REFERENCES City(IdCity)
        ON DELETE SET NULL,
    CONSTRAINT FK_IdCustomerType FOREIGN KEY (IdCustomerType) REFERENCES CustomerType(IdCustomerType)
        ON DELETE SET NULL
);

-- Pasaporte
CREATE TABLE Passport(
    NumberPassport INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ExpirationOfDate DATE NOT NULL CONSTRAINT CK_ExpirationOfDate_Future CHECK (ExpirationOfDate > GETDATE()),
    IdCountryPassport INT NOT NULL,
    IdCityPassport INT NOT NULL,
    CONSTRAINT FK_IdCountryPassport FOREIGN KEY (IdCountryPassport) REFERENCES Country(IdCountry),
    CONSTRAINT FK_IdCityPassport FOREIGN KEY (IdCityPassport) REFERENCES City(IdCity)
);

-- Boleto
CREATE TABLE Ticket(
    TicketingCode INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Number INT NOT NULL CONSTRAINT UQ_Ticket_Number UNIQUE,
    IdCustomer INT NOT NULL,
    CONSTRAINT FK_IdCustomer_Ticket FOREIGN KEY (IdCustomer) REFERENCES Customer(IdCustomer)
        ON DELETE CASCADE
);

-- Aeropuerto
CREATE TABLE Airport(
    IdAirport INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(100) NOT NULL CONSTRAINT UQ_Airport_Name UNIQUE,
    IdCountry INT NOT NULL,
    IdCity INT NOT NULL,
    CONSTRAINT FK_IdCountry_Airport FOREIGN KEY (IdCountry) REFERENCES Country(IdCountry),
    CONSTRAINT FK_IdCity_Airport FOREIGN KEY (IdCity) REFERENCES City(IdCity)
);

-- Modelo de avión
CREATE TABLE PlaneModel(
    IdPlaneModel INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Description NVARCHAR(200) NOT NULL,
    Graphic NVARCHAR(200)
);

-- Número de vuelo
CREATE TABLE FlightNumber(
    IdFlightNumber INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DepartureTime TIME NOT NULL,
    Description NVARCHAR(200),
    Type NVARCHAR(200),
    Airline NVARCHAR(200),
    IdAirport INT NOT NULL,
    IdPlaneModel INT NOT NULL,
    CONSTRAINT FK_IdAirport_FlightNumber FOREIGN KEY (IdAirport) REFERENCES Airport(IdAirport),
    CONSTRAINT FK_IdPlaneModel_FlightNumber FOREIGN KEY (IdPlaneModel) REFERENCES PlaneModel(IdPlaneModel),
    CONSTRAINT UQ_FlightNumber_Airline_DepartureTime UNIQUE (Airline, DepartureTime)
);

-- Avión
CREATE TABLE AirPlane(
    RegistrationNumber INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    BeginofOperation DATE NOT NULL CONSTRAINT CK_BeginofOperation_Past CHECK (BeginofOperation <= GETDATE()),
    Status NVARCHAR(200) CONSTRAINT CK_Status CHECK (Status IN ('Activo', 'Inactivo', 'Mantenimiento')),
    IdPlaneModel INT NOT NULL,
    CONSTRAINT FK_IdPlaneModel_AirPlane FOREIGN KEY (IdPlaneModel) REFERENCES PlaneModel(IdPlaneModel)
);

-- Tabla para clasificar los asientos
CREATE TABLE SeatClass(
    IdSeatClass INT IDENTITY(1,1) PRIMARY KEY,
    ClassName NVARCHAR(50) NOT NULL CONSTRAINT UQ_SeatClass_ClassName UNIQUE
);

-- Asiento
CREATE TABLE Seat(
    IdSeat INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Size INT CONSTRAINT CK_Size_Positive CHECK (Size > 0),
    Number INT NOT NULL,
    Location NVARCHAR(50) NOT NULL,
    IdPlaneModel INT NOT NULL,
    IdSeatClass INT,
    CONSTRAINT FK_IdPlaneModel_Seat FOREIGN KEY (IdPlaneModel) REFERENCES PlaneModel(IdPlaneModel)
        ON DELETE CASCADE,
    CONSTRAINT FK_SeatClass_Seat FOREIGN KEY (IdSeatClass) REFERENCES SeatClass(IdSeatClass)
        ON DELETE SET NULL,
    CONSTRAINT UQ_Seat_PlaneModel_Number UNIQUE (IdPlaneModel, Number)
);

-- Vuelo
CREATE TABLE Flight(
    IdFlight INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    BoardingTime TIME NOT NULL,
    FlightDate DATE NOT NULL CONSTRAINT CK_FlightDate_Future CHECK (FlightDate >= GETDATE()),
    Gate NVARCHAR(50),
    CheckInCounter NVARCHAR(200),
    IdFlightNumber INT NOT NULL,
    CONSTRAINT FK_IdFlightNumber_Flight FOREIGN KEY (IdFlightNumber) REFERENCES FlightNumber(IdFlightNumber),
    CONSTRAINT UQ_Flight_FlightNumber_Date UNIQUE (IdFlightNumber, FlightDate)
);

-- Cupón
CREATE TABLE Coupon(
    IdCoupon INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateofRedemption DATE NOT NULL CONSTRAINT CK_DateofRedemption_NotFuture CHECK (DateofRedemption <= GETDATE()),
    Class NVARCHAR(100) CONSTRAINT CK_Class CHECK (Class IN ('Economy', 'Business', 'First')),
    Standby NVARCHAR(100) CONSTRAINT CK_Standby CHECK (Standby IN ('Yes', 'No')),
    MealCode NVARCHAR(100) NOT NULL,
    TicketingCode INT NOT NULL,
    IdFlight INT NOT NULL,
    CONSTRAINT FK_TicketingCode_Coupon FOREIGN KEY (TicketingCode) REFERENCES Ticket(TicketingCode)
        ON DELETE CASCADE,
    CONSTRAINT FK_IdFlight_Coupon FOREIGN KEY (IdFlight) REFERENCES Flight(IdFlight)
);

-- Asiento disponible
CREATE TABLE AvailableSeat(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DateofRedemption DATE NOT NULL CONSTRAINT CK_AvailableSeat_DateofRedemption_NotPast CHECK (DateofRedemption >= GETDATE()),
    IdSeat INT NOT NULL,
    IdFlight INT NOT NULL,
    IdCoupon INT NULL,
    CONSTRAINT FK_IdSeat_AvailableSeat FOREIGN KEY (IdSeat) REFERENCES Seat(IdSeat),
    CONSTRAINT FK_IdFlight_AvailableSeat FOREIGN KEY (IdFlight) REFERENCES Flight(IdFlight),
    CONSTRAINT FK_IdCoupon_AvailableSeat FOREIGN KEY (IdCoupon) REFERENCES Coupon(IdCoupon),
    CONSTRAINT UQ_AvailableSeat_Seat_Flight UNIQUE (IdSeat, IdFlight)
);

-- Equipaje 
CREATE TABLE PiecesofLuggage(
    Number INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Weight FLOAT CONSTRAINT CK_Weight_Positive CHECK (Weight > 0),
    IdCoupon INT NOT NULL,
    CONSTRAINT FK_IdCoupon_PiecesofLuggage FOREIGN KEY (IdCoupon) REFERENCES Coupon(IdCoupon)
        ON DELETE CASCADE
);

-- poblando las tablas 


-- Insertar datos en FrequentFlyerCard
INSERT INTO FrequentFlyerCard (Miles, MealCode) VALUES
(1000, 1),
(2500, 2),
(5000, 3),
(7500, 4),
(10000, 5),
(15000, 6),
(20000, 7),
(25000, 8),
(30000, 9),
(35000, 10);

-- Insertar datos en Country
INSERT INTO Country (Nombre) VALUES
('United States'),
('Canada'),
('Mexico'),
('United Kingdom'),
('Germany'),
('France'),
('Spain'),
('Italy'),
('Japan'),
('Australia');

-- Insertar datos en City
INSERT INTO City (Nombre, IdCountry) VALUES
('New York', 1),
('Los Angeles', 1),
('Toronto', 2),
('Vancouver', 2),
('Mexico City', 3),
('Guadalajara', 3),
('London', 4),
('Manchester', 4),
('Berlin', 5),
('Munich', 5),
('Paris', 6),
('Marseille', 6),
('Madrid', 7),
('Barcelona', 7),
('Rome', 8),
('Milan', 8),
('Tokyo', 9),
('Osaka', 9),
('Sydney', 10),
('Melbourne', 10);

-- Insertar datos en CustomerType
INSERT INTO CustomerType (TypeName) VALUES
('Regular'),
('Silver'),
('Gold'),
('Platinum'),
('Diamond'),
('VIP');

-- Insertar datos en Customer
INSERT INTO Customer (DateofBirth, Name, lastName, FFCNumber, IdCity, IdCustomerType) VALUES
('1980-01-15', 'John', 'Doe', 1, 1, 1),
('1990-02-20', 'Jane', 'Smith', 2, 2, 2),
('1975-03-10', 'Michael', 'Johnson', 3, 3, 3),
('1985-04-25', 'Emily', 'Davis', 4, 4, 4),
('1995-05-30', 'William', 'Brown', 5, 5, 5),
('1965-06-05', 'Linda', 'Wilson', 6, 6, 6),
('1982-07-15', 'David', 'Taylor', 7, 7, 1),
('1998-08-20', 'Sophia', 'Anderson', 8, 8, 2),
('1970-09-10', 'James', 'Thomas', 9, 9, 3),
('1988-10-25', 'Olivia', 'Jackson', 10, 10, 4);

-- Insertar datos en Passport
INSERT INTO Passport (ExpirationOfDate, IdCountryPassport, IdCityPassport) VALUES
('2030-12-31', 1, 1),
('2031-12-31', 2, 2),
('2032-12-31', 3, 3),
('2033-12-31', 4, 4),
('2034-12-31', 5, 5),
('2035-12-31', 6, 6),
('2036-12-31', 7, 7),
('2037-12-31', 8, 8),
('2038-12-31', 9, 9),
('2039-12-31', 10, 10);

-- Insertar datos en Ticket
INSERT INTO Ticket (Number, IdCustomer) VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 5),
(1006, 6),
(1007, 7),
(1008, 8),
(1009, 9),
(1010, 10);

-- Insertar datos en Airport
INSERT INTO Airport (Name, IdCountry, IdCity) VALUES
('JFK International', 1, 1),
('LAX International', 1, 2),
('Toronto Pearson', 2, 3),
('Vancouver International', 2, 4),
('Mexico City Airport', 3, 5),
('Guadalajara Airport', 3, 6),
('Heathrow', 4, 7),
('Manchester Airport', 4, 8),
('Berlin Airport', 5, 9),
('Munich Airport', 5, 10);

-- Insertar datos en PlaneModel
INSERT INTO PlaneModel (Description, Graphic) VALUES
('Boeing 737', '737.png'),
('Airbus A320', 'A320.png'),
('Boeing 787', '787.png'),
('Airbus A380', 'A380.png'),
('Boeing 747', '747.png'),
('Airbus A350', 'A350.png'),
('Boeing 777', '777.png'),
('Embraer 190', '190.png'),
('Bombardier Q400', 'Q400.png'),
('Cessna 172', '172.png');

-- Insertar datos en SeatClass
INSERT INTO SeatClass (ClassName) VALUES
('Economy'),
('Business'),
('First'),
('Premium Economy'),
('Economy Comfort');

-- Insertar datos en Seat
INSERT INTO Seat (Size, Number, Location, IdPlaneModel, IdSeatClass) VALUES
(30, 1, 'A1', 1, 1),
(30, 2, 'A2', 1, 2),
(30, 3, 'B1', 2, 3),
(30, 4, 'B2', 2, 4),
(30, 5, 'C1', 3, 1),
(30, 6, 'C2', 3, 2),
(30, 7, 'D1', 4, 3),
(30, 8, 'D2', 4, 4),
(30, 9, 'E1', 5, 5),
(30, 10, 'E2', 5, 1);

-- Insertar datos en FlightNumber
INSERT INTO FlightNumber (DepartureTime, Description, Type, Airline, IdAirport, IdPlaneModel) VALUES
('08:00:00', 'Flight to LA', 'International', 'American Airlines', 1, 1),
('09:00:00', 'Flight to Toronto', 'International', 'Air Canada', 2, 2),
('10:00:00', 'Flight to Mexico City', 'International', 'Aeromexico', 3, 3),
('11:00:00', 'Flight to London', 'International', 'British Airways', 4, 4),
('12:00:00', 'Flight to Paris', 'International', 'Air France', 5, 5),
('13:00:00', 'Flight to Tokyo', 'International', 'Japan Airlines', 6, 6),
('14:00:00', 'Flight to Sydney', 'International', 'Qantas', 7, 7),
('15:00:00', 'Flight to Berlin', 'International', 'Lufthansa', 8, 8),
('16:00:00', 'Flight to Madrid', 'International', 'Iberia', 9, 9),
('17:00:00', 'Flight to Rome', 'International', 'Alitalia', 10, 10);

-- Insertar datos en AirPlane
INSERT INTO AirPlane (BeginofOperation, Status, IdPlaneModel) VALUES
('1990-01-01', 'Activo', 1),
('2000-05-05', 'Inactivo', 2),
('2010-10-10', 'Mantenimiento', 3),
('2015-12-15', 'Activo', 4),
('2020-08-20', 'Activo', 5),
('2021-03-15', 'Inactivo', 6),
('2022-07-30', 'Mantenimiento', 7),
('2023-06-15', 'Activo', 8),
('2024-01-01', 'Activo', 9),
('2024-05-05', 'Inactivo', 10);

-- Insertar datos en Flight
INSERT INTO Flight (BoardingTime, FlightDate, Gate, CheckInCounter, IdFlightNumber) VALUES
('08:30:00', '2024-09-01', 'A1', 'Counter 1', 1),
('09:30:00', '2024-09-02', 'B2', 'Counter 2', 2),
('10:30:00', '2024-09-03', 'C3', 'Counter 3', 3),
('11:30:00', '2024-09-04', 'D4', 'Counter 4', 4),
('12:30:00', '2024-09-05', 'E5', 'Counter 5', 5),
('13:30:00', '2024-09-06', 'F6', 'Counter 6', 6),
('14:30:00', '2024-09-07', 'G7', 'Counter 7', 7),
('15:30:00', '2024-09-08', 'H8', 'Counter 8', 8),
('16:30:00', '2024-09-09', 'I9', 'Counter 9', 9),
('17:30:00', '2024-09-10', 'J10', 'Counter 10', 10);


