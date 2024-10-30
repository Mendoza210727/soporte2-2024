USE master;
ALTER DATABASE Script_Soporte SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE Script_Soporte;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Script_Soporte')
BEGIN
    DROP DATABASE Script_Soporte;
END
GO

CREATE DATABASE Script_Soporte;
GO

USE Script_Soporte;
GO

IF OBJECT_ID('Customer', 'U') IS NOT NULL
    DROP TABLE Customer;

create table Customer( --Cliente
	ID int not null primary key, --carnet de cliente
	DateOfBirth date not null, --fecha de nacimiento 
	Name varchar (50) not null--nombre
);

CREATE INDEX idx_Customer ON Customer(Name);

create table FrequentFiyerCard( --tarjeta de fiyer frecuente
	FFC_Number int primary key, --Numero FFC
	Miles int not null, --Millas
	MealCode varchar(10) not null, --Codigo De Comida
	ID_Customer int not null,	--ID de usuario
	FOREIGN KEY (ID_Customer)  REFERENCES Customer(ID)
	on update cascade
);

CREATE INDEX idx_FrequentFiyerCard ON FrequentFiyerCard(MealCode);

create table Ticket(
	TicketingCode int not null primary key, --codigo de emision de entradas
	Number int not null,
	ID_Customer int not null,--numero
	FOREIGN KEY (ID_Customer)  REFERENCES Customer(ID)
	on update cascade
);

CREATE INDEX idx_Ticket ON Ticket(ID_Customer);

create table Airport( --Aeropuerto
	Name varchar(50) not null primary key
	IdCountry int,
	CONSTRAINT FK_IdCountry FOREIGN KEY (IdCountry) REFERENCES country(IdCountry),
);

create table PlaneModel(
	Description varchar(50) not null primary key, --descripcion
	Graphic varchar(50) --grafica
);

CREATE INDEX idx_PlaneModel ON PlaneModel(Graphic);

create table FlightNumber( --numero de vuelo
	DepartureTime time not null primary key,--hora de salida
	Description varchar(50) not null,--descripcion
	Type varchar(50) not null,--tipo
	Airline varchar(50) not null,--linea aerea

	Name_Start varchar(50),--nombre de inicio
	Name_End varchar(50),--nombre de fin

	Description_PlaneModel varchar(50)
	FOREIGN KEY (Description_PlaneModel)  REFERENCES PlaneModel(Description)
	on update cascade,

	FOREIGN KEY (Name_End )  REFERENCES Airport(Name)
	on update no action,
	FOREIGN KEY (Name_Start )  REFERENCES Airport(Name)
	on update no action,
);

CREATE INDEX idx_FlightNumber ON FlightNumber(type);

--DROP TABLE;

create table Airplane( --avion
	RegistrationNumber varchar(50) not null primary key, --matricula
	BeginOfOperation time not null,--inicio de la operacion
	Status varchar(50) not null,--estado

	Description_PlaneModel varchar(50) not null,
	FOREIGN KEY (Description_PlaneModel)  REFERENCES PlaneModel(Description)
	on update no action
);

CREATE INDEX idx_Airplane ON Airplane(BeginOfOperation);

create table seat(
	size int not null primary key,--dimension o tama�o
	number int not null,--numero
	location varchar(60) not null,--ubicacion

	Description_PlaneModel varchar(50) not null,
	FOREIGN KEY (Description_PlaneModel)  REFERENCES PlaneModel(Description)
	on update no action
);

CREATE INDEX idx_seat ON seat(number );

create table Flight( --vuelo
	BoardingTime time not null primary key, --hora de embarque
	FlightData varchar(50),--datos de vuelo
	Gate varchar(50),--puerta
	CheckIn_Counter varchar(50), --comprobacion 

	DepartureTime_FlightNumber time not null, 
	FOREIGN KEY (DepartureTime_FlightNumber)  REFERENCES FlightNumber(DepartureTime )
	on update no action
);

CREATE INDEX idx_Flight ON Flight(BoardingTime);

create table Coupon(--cupon
	DateOfRedemption date not null primary key,--fecha de redencion
	Class varchar(50) not null,--clase
	Standby time not null,--espera
	MealCode varchar(10) not null,--codigo de comida

	BoardingTime_Flight time not null,--hora de embarque
	FOREIGN KEY (BoardingTime_Flight)  REFERENCES Flight(BoardingTime)
	on update no action
);

CREATE INDEX idx_Coupon ON Coupon(DateOfRedemption);

create table PiecesOfLuggage( --Piezas de equipaje
	Number int not null,--peso numerico
	Weight int not null,--peso

	DateOfRedemption_Coupon date not null,
	FOREIGN KEY (DateOfRedemption_Coupon)  REFERENCES Coupon(DateOfRedemption)
	on update no action
);

CREATE INDEX idx_PiecesOfLuggage ON PiecesOfLuggage(Weight);

create table AvaliableSeat(
	Size_Seat int not null, --tama�o
	BoardingTime_Flight time not null,--hora de embarque
	DateOfRedemption_Coupon date not null,--fecha de canjeo
	
	FOREIGN KEY (DateOfRedemption_Coupon)  REFERENCES Coupon(DateOfRedemption)
	on update no action,
	FOREIGN KEY (BoardingTime_Flight)  REFERENCES Flight(BoardingTime)
	on update no action,
	FOREIGN KEY (Size_Seat)  REFERENCES seat(size)
);

CREATE INDEX idx_AvaliableSeat ON AvaliableSeat(BoardingTime_Flight );

---------------------------------------------------------------------
create table cash(
IdCash int identity PRIMARY KEY not NULL,
dateOf date,
CurrencyType NVAARCHAR
);

CREATE TABLE CREDITCARD(
cardNumber int identity PRIMARY KEY,
cardOfType NVARCHAR,
cv int,
expirationDate date
);

create table paymenType(
IdPaymentType int identity PRIMARY KEY,
description NVARCHAR,
IdCash int,
cardNumber int,
CONSTRAINT FK_IdCash FOREIGN KEY (IdCash) REFERENCES cash(IdCash),
CONSTRAINT FK_cardNumber FOREIGN KEY (cardNumber) REFERENCES CREDITCARD(cardNumber)
);

create table pasport(
NumberPasport int identity PRIMARY KEY,
expirationOdDate date,
cardNumber int,
IdCountry int,
IdCity int,
CONSTRAINT FK_IdCountry FOREIGN KEY (IdCountry) REFERENCES country(IdCountry),
CONSTRAINT FK_IdCity FOREIGN KEY (IdCity) REFERENCES city(IdCity)
);

create table identityCard(
ci int identity PRIMARY KEY,
dateOfExpiration date,
dateOfEmission date,
IdCountry int,
IdCity int,
CONSTRAINT FK_IdCountry FOREIGN KEY (IdCountry) REFERENCES country(IdCountry),
CONSTRAINT FK_IdCity FOREIGN KEY (IdCity) REFERENCES city(IdCity)
);

create table puchaseDocument(
IdDocuments int identity PRIMARYkey,
details NVARCHAR
NumberPasport int,
IdCi int,
CONSTRAINT FK_NumberPasport FOREIGN KEY (NumberPasport) REFERENCES pasport(NumberPasport),
CONSTRAINT FK_IdCi FOREIGN KEY (IdCi) REFERENCES identityCard(NumberciPasport)
);

create table sales (
Idsales int identity PRIMARY KEY,
salesDate date,
Totaldate int,
IdDocuments int,
IdPaymentType int,
CONSTRAINT FK_IdDocuments FOREIGN KEY (IdDocuments) REFERENCES puchaseDocument(IdDocuments),
CONSTRAINT FK_IdPaymentType FOREIGN KEY (IdPaymentType) REFERENCES paymenType(IdPaymentType),
);

create table salesDetails(
IdsalesDetails int identity PRIMARY KEY,
Idsales int,
TicketingCode int,
CONSTRAINT FK_Idsales FOREIGN KEY (Idsales) REFERENCES puchaseDocument(Idsales),
CONSTRAINT FK_TicketingCode FOREIGN KEY (TicketingCode) REFERENCES Ticket(TicketingCode),
)

create table TypeOfCustomer(
IdTypeOfCustomer int identity PRIMARY KEY,
details NVARCAHR,
);

create table reservation(
IdReservation int identity PRIMARY KEY,
bookinStaatus NVARCHAR
"quiero que esta tabla este realcionada con ticket y con la taba availableSeat"
);

-----------------------tablas  principales -----------------

CREATE TABLE country(
IdCountry int identity PRIMARY KEY,
name NVARCHAR
);

create table city(
IdCity int identity PRIMARY KEY,
name NVARCHAR,
);

