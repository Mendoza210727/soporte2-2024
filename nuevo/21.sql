
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Airbus A320', 180);
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Boeing 737-800', 189);

INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Viento Libre', '2019-01-15', 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Cielo Azul', '2019-02-20', 2);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Estrella Fugaz', '2019-03-25', 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Horizonte Infinito', '2019-04-10', 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Espíritu Aventurero', '2019-05-30', 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Alas del Viento', '2019-06-15', 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Nave Dorada', '2019-07-20', 2);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Brisa Celestial', '2019-08-05', 2);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Cometa Plateado', '2019-09-17', 2);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave) VALUES ('Alas de Plata', '2019-10-24', 2);
--------------procedimiento almacenado --------------------



CREATE PROCEDURE PoblarAsientos
AS
BEGIN
    -- Insertar asientos para el modelo de aeronave con id 1 (210 asientos)
    DECLARE @fila INT
    SET @fila = 1

    WHILE @fila <= 35  -- 35 filas para el primer modelo
    BEGIN
        -- Insertar 6 asientos por fila para el primer modelo
        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaD', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'centroD', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloD', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloI', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'centroI', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaI', 1)

        SET @fila = @fila + 1
    END

    -- Insertar asientos para el modelo de aeronave con id 2 (102 asientos)
    SET @fila = 1
    WHILE @fila <= 17  -- 17 filas para el segundo modelo
    BEGIN
        -- Insertar 6 asientos por fila para el segundo modelo
        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaD', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'centroD', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloD', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloI', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'centroI', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaI', 2)

        SET @fila = @fila + 1
    END
END

------ejecutar el procedimiento ----
execute PoblarAsientos


select * from Asientos


--------------------------------------
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Estados Unidos', 'Estadounidense');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Francia', 'Francés');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Reino Unido', 'Británico');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('China', 'Chino');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Italia', 'Italiano');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('España', 'Español');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Turquía', 'Turco');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Emiratos Árabes Unidos', 'Emiratí');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Tailandia', 'Tailandés');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Japón', 'Japonés');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('México', 'Mexicano');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Alemania', 'Alemán');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Países Bajos', 'Holandés');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Australia', 'Australiano');
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Brasil', 'Brasileño');
-- Insertar el país Bolivia
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Bolivia', 'Boliviano');


-- Estados Unidos
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Nueva York', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Los Ángeles', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chicago', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Miami', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('San Francisco', 1);

-- Francia
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('París', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Marsella', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Lyon', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Toulouse', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Niza', 2);

-- Reino Unido
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Londres', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Manchester', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Edimburgo', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Birmingham', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Glasgow', 3);

-- China
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Pekín', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Shanghái', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Guangzhou', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Shenzhen', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chengdu', 4);

-- Italia
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Roma', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Milán', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Venecia', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Florencia', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Nápoles', 5);

-- España
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Madrid', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Barcelona', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Sevilla', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Valencia', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Bilbao', 6);

-- Turquía
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Estambul', 7);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Ankara', 7);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Izmir', 7);

-- Emiratos Árabes Unidos
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Dubái', 8);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Abu Dhabi', 8);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Sharjah', 8);

-- Tailandia
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Bangkok', 9);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chiang Mai', 9);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Phuket', 9);

-- Japón
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Tokio', 10);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Kioto', 10);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Osaka', 10);

-- México
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Ciudad de México', 11);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Cancún', 11);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Guadalajara', 11);

-- Alemania
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Berlín', 12);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Múnich', 12);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Fráncfort', 12);

-- Países Bajos
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Ámsterdam', 13);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Róterdam', 13);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('La Haya', 13);

-- Australia
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Sídney', 14);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Melbourne', 14);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Brisbane', 14);

-- Brasil
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Río de Janeiro', 15);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('São Paulo', 15);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Brasilia', 15);
--Bolivia
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('La Paz', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Cochabamba', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Santa Cruz', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Oruro', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Potosí', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chuquisaca', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Tarija', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Beni', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Pando', 16);

INSERT INTO TipoVuelo (descripcion) VALUES ('nacional');
INSERT INTO TipoVuelo (descripcion) VALUES ('internacional');
------procedimiento de aeropuerto





CREATE PROCEDURE InsertarAeropuertos
AS
BEGIN
    DECLARE @idCiudad INT = 1;

    -- Bucle para insertar aeropuertos desde id_Ciudad 1 hasta 59
    WHILE @idCiudad <= 66
    BEGIN
        INSERT INTO Aeropuerto (id_Ciudad)
        VALUES (@idCiudad);

        -- Incrementar el id_Ciudad en 1
        SET @idCiudad = @idCiudad + 1;
    END
END;
-------------------------------------
execute InsertarAeropuertos




CREATE PROCEDURE PoblarNumeroVueloYVuelo
AS
BEGIN
    DECLARE @contador INT = 0;
    DECLARE @hora_salida TIME;
    DECLARE @aerolinea VARCHAR(100);
    DECLARE @id_Aeropuerto INT;
    DECLARE @id_ModeloAeronave INT;
    DECLARE @hora_embarque TIME;
    DECLARE @fecha_vuelo DATE;
    DECLARE @numero_puerta INT;
    DECLARE @id_NumeroVuelo INT;
    DECLARE @id_TipoVuelo INT;
    
    -- Tabla temporal para aerolíneas
    DECLARE @aerolineas TABLE (nombre VARCHAR(100));
    INSERT INTO @aerolineas (nombre) VALUES 
        ('American Airlines'), 
        ('JetSmart'), 
        ('United Airlines');
    
    -- Total de registros a insertar
    DECLARE @totalRegistros INT = 5000;

    WHILE @contador < @totalRegistros
    BEGIN
        -- Generar hora de salida aleatoria entre las 00:00 y las 23:59
        SET @hora_salida = CAST(ABS(CHECKSUM(NEWID())) % 24 AS VARCHAR) + ':' + 
                           RIGHT('00' + CAST(ABS(CHECKSUM(NEWID())) % 60 AS VARCHAR), 2);

        -- Seleccionar aleatoriamente una aerolínea
        SELECT TOP 1 @aerolinea = nombre 
        FROM @aerolineas 
        ORDER BY NEWID();

        -- Seleccionar un id_Aeropuerto aleatorio de la tabla Aeropuerto
        SELECT TOP 1 @id_Aeropuerto = id_Aeropuerto
        FROM Aeropuerto
        ORDER BY NEWID();

        -- Seleccionar un id_ModeloAeronave aleatorio de la tabla ModeloAeronave
        SELECT TOP 1 @id_ModeloAeronave = id_ModeloAeronave
        FROM ModeloAeronave
        ORDER BY NEWID();

        -- Insertar en la tabla NumeroVuelo
        INSERT INTO NumeroVuelo (hora_salida, aerolinea, id_Aeropuerto, id_ModeloAeronave)
        VALUES (@hora_salida, @aerolinea, @id_Aeropuerto, @id_ModeloAeronave);

        -- Obtener el ID generado para NumeroVuelo
        SET @id_NumeroVuelo = SCOPE_IDENTITY();

        -- Establecer el id_TipoVuelo basado en id_Aeropuerto
        IF @id_Aeropuerto BETWEEN 58 AND 66
            SET @id_TipoVuelo = 1;
        ELSE
            SET @id_TipoVuelo = 2;

        -- Generar la fecha del vuelo aleatoria entre 2019 y 2022
        SET @fecha_vuelo = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 1461), '2019-01-01');  -- 1461 días para cubrir 4 años

        -- Generar hora de embarque, 1 hora antes de la hora_salida
        SET @hora_embarque = DATEADD(HOUR, -1, @hora_salida);

        -- Generar número de puerta aleatorio entre 1 y 15
        SET @numero_puerta = ABS(CHECKSUM(NEWID())) % 15 + 1;

        -- Insertar en la tabla Vuelo
        INSERT INTO Vuelo (hora_embarque, fecha_vuelo, nuemero_puerta, id_NumeroVuelo, id_TipoVuelo)
        VALUES (@hora_embarque, @fecha_vuelo, @numero_puerta, @id_NumeroVuelo, @id_TipoVuelo);

        -- Incrementar el contador
        SET @contador = @contador + 1;
    END
END;

 
 execute PoblarNumeroVueloYVuelo

 select * from Vuelo




---------------------------------------------

 CREATE PROCEDURE PoblarAsientoDisponible
AS
BEGIN
    DECLARE @id_Vuelo INT;
    DECLARE @id_NumeroVuelo INT;
    DECLARE @id_ModeloAeronave INT;
    DECLARE @cantidadAsientos INT;
    DECLARE @id_Asientos INT;
    DECLARE @estadoAsiento VARCHAR(1);
    DECLARE @contador INT;
    
    -- Cursor para recorrer cada vuelo en la tabla Vuelo
    DECLARE cursor_vuelos CURSOR FOR 
    SELECT V.id_Vuelo, NV.id_NumeroVuelo, NV.id_ModeloAeronave
    FROM Vuelo V
    INNER JOIN NumeroVuelo NV ON V.id_NumeroVuelo = NV.id_NumeroVuelo;

    OPEN cursor_vuelos;
    FETCH NEXT FROM cursor_vuelos INTO @id_Vuelo, @id_NumeroVuelo, @id_ModeloAeronave;

    -- Procesar cada vuelo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Determinar la cantidad de asientos según el modelo de aeronave
        IF @id_ModeloAeronave = 1
            SET @cantidadAsientos = 180; -- Suponiendo que el modelo 1 tiene 180 asientos
        ELSE IF @id_ModeloAeronave = 2
            SET @cantidadAsientos = 189; -- Suponiendo que el modelo 2 tiene 189 asientos

        SET @contador = 1;

        -- Insertar los registros de asientos disponibles para este vuelo
        WHILE @contador <= @cantidadAsientos
        BEGIN
            -- Obtener un id_Asientos correspondiente al modelo de aeronave
            SELECT TOP 1 @id_Asientos = id_Asientos
            FROM Asientos
            WHERE id_ModeloAeronave = @id_ModeloAeronave
            ORDER BY NEWID();

            -- Generar estado aleatorio para el asiento (disponible 'D' o ocupado 'O')
            SET @estadoAsiento = CASE WHEN ABS(CHECKSUM(NEWID()) % 2) = 0 THEN 'D' ELSE 'O' END;

            -- Insertar en AsientoDisponible
            INSERT INTO AsientoDisponible (estadoAsiento, id_Asientos, id_Vuelo)
            VALUES (@estadoAsiento, @id_Asientos, @id_Vuelo);

            SET @contador = @contador + 1;
        END

        -- Pasar al siguiente vuelo
        FETCH NEXT FROM cursor_vuelos INTO @id_Vuelo, @id_NumeroVuelo, @id_ModeloAeronave;
    END

    -- Cerrar y liberar el cursor
    CLOSE cursor_vuelos;
    DEALLOCATE cursor_vuelos;
END;

 execute PoblarAsientoDisponible

 select * from AsientoDisponible





INSERT INTO TipoCliente (descripcion) VALUES ('economico');
INSERT INTO TipoCliente (descripcion) VALUES ('ejecutivo');
INSERT INTO TipoCliente (descripcion) VALUES ('premiun');
INSERT INTO TipoCliente (descripcion) VALUES ('primera clase');

INSERT INTO TipoDocumento (descripcion) VALUES ('Pasaporte');
INSERT INTO TipoDocumento (descripcion) VALUES ('DNI');
INSERT INTO TipoDocumento (descripcion) VALUES ('Licencia de Conducir');
INSERT INTO TipoDocumento (descripcion) VALUES ('Tarjeta de Residencia');





CREATE PROCEDURE PopulateIdentityDocument
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 1;
    DECLARE @numero_documento VARCHAR(50);
    DECLARE @fecha_nacimiento DATE;
    DECLARE @id_city INT;
    DECLARE @id_country INT;
    DECLARE @id_documentType INT;
    DECLARE @fecha_emision DATE;
    DECLARE @fecha_vencimiento DATE;

    WHILE @i <= 1000
    BEGIN
        -- Generar un número de documento aleatorio
        SET @numero_documento = CAST(ABS(CHECKSUM(NEWID())) % 1000000000 AS VARCHAR(50));

        -- Generar una fecha de nacimiento aleatoria entre los años 1969 y 2009 con día y mes aleatorios
        DECLARE @anio_nacimiento INT = 1969 + (ABS(CHECKSUM(NEWID())) % 41);  -- Genera un año entre 1969 y 2009
        DECLARE @mes_nacimiento INT = 1 + (ABS(CHECKSUM(NEWID())) % 12);      -- Genera un mes entre 1 y 12
        DECLARE @dia_nacimiento INT = 1 + (ABS(CHECKSUM(NEWID())) % 28);      -- Genera un día entre 1 y 28

        SET @fecha_nacimiento = CAST(CONCAT(@anio_nacimiento, '-', @mes_nacimiento, '-', @dia_nacimiento) AS DATE);

        -- Seleccionar aleatoriamente un id_city existente
        SET @id_city = (SELECT TOP 1 id_Ciudad FROM Ciudad ORDER BY NEWID());

        -- Seleccionar aleatoriamente un id_country existente
        SET @id_country = (SELECT TOP 1 id_Pais FROM Pais ORDER BY NEWID());

        -- Seleccionar aleatoriamente un id_documentType existente
        SET @id_documentType = (SELECT TOP 1 id_TipoDocumento FROM TipoDocumento ORDER BY NEWID());

        -- Generar una fecha de emisión aleatoria entre los años 2019 y 2023 con día y mes aleatorios
        DECLARE @anio_emision INT = 2019 + (ABS(CHECKSUM(NEWID())) % 5);  -- Genera un año entre 2019 y 2023
        DECLARE @mes_emision INT = 1 + (ABS(CHECKSUM(NEWID())) % 12);     -- Genera un mes entre 1 y 12
        DECLARE @dia_emision INT = 1 + (ABS(CHECKSUM(NEWID())) % 28);     -- Genera un día entre 1 y 28

        SET @fecha_emision = CAST(CONCAT(@anio_emision, '-', @mes_emision, '-', @dia_emision) AS DATE);

        -- Generar la fecha de vencimiento exactamente 5 años después de la fecha de emisión
        SET @fecha_vencimiento = DATEADD(YEAR, 5, @fecha_emision);

        -- Insertar el registro en la tabla identityDocument
        INSERT INTO DocumentoIdentidad(numero_documento, fecha_nacimiento, id_ciudad, id_pais, id_TipoDocumento, fecha_emision, fecha_vencimiento)
        VALUES (@numero_documento, @fecha_nacimiento, @id_city, @id_country, @id_documentType, @fecha_emision, @fecha_vencimiento);

        -- Incrementar el contador
        SET @i = @i + 1;
    END
END;

execute PopulateIdentityDocument




BULK INSERT Cliente
FROM 'C:\Users\Lenovo\Downloads\clientes-aerolinea2.txt'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Ignorar el encabezado
    TABLOCK
);



INSERT INTO TipoPago(descripcion)
VALUES 
    ('Efectivo'),
    ('Tarjeta de Crédito'),
    ('Tarjeta de Débito'),
    ('Transferencia Bancaria'),
    ('Cheque'),
    ('PayPal'),
    ('Criptomoneda'),
    ('Pago Móvil');

INSERT INTO CanalPago(descripcion, plataforma)
VALUES 
    ('pago realizado', 'Mostrador'),
    ('pago realizado', 'Web'),
    ('pago realizado', 'Móvil');

INSERT INTO moneda (descripcion, nombre_moneda)
VALUES 
    ('Dólar Estadounidense', 'USD'),
    ('Euro', 'EUR'),
    ('Yen Japonés', 'JPY'),
    ('Libra Esterlina', 'GBP'),
    ('Peso Mexicano', 'MXN'),
    ('Real Brasileño', 'BRL'),
    ('Peso Argentino', 'ARS'),
    ('Franco Suizo', 'CHF'),
    ('Dólar Canadiense', 'CAD'),
    ('Rupia India', 'INR');

	




-----------------
CREATE PROCEDURE PoblarReservasYDetalleReserva
    @CantidadReservas INT = 1000
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_Cliente INT;
    DECLARE @fecha_reserva DATE;
    DECLARE @id_Reserva INT;
    DECLARE @id_Vuelo INT;
    DECLARE @fecha_vuelo DATE;
    DECLARE @id_AsientoDisponible INT;
    DECLARE @cantidadAsientosReserva INT;
    DECLARE @descripcion VARCHAR(100) = 'Asiento reservado';

    -- Cursor para recorrer cada vuelo y crear reservas correspondientes
    DECLARE VueloCursor CURSOR FOR
        SELECT id_Vuelo, fecha_vuelo
        FROM Vuelo;

    OPEN VueloCursor;
    FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @fecha_vuelo;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generar reservas para cada vuelo
        DECLARE @i INT = 1;
        
        WHILE @i <= @CantidadReservas
        BEGIN
            -- Selecciona un cliente aleatorio
            SELECT TOP 1 @id_Cliente = id_Cliente
            FROM Cliente
            ORDER BY NEWID();

            -- Genera la fecha de reserva entre 1 y 3 días antes de la fecha de vuelo
            SET @fecha_reserva = DATEADD(DAY, -1 * ABS(CHECKSUM(NEWID()) % 3 + 1), @fecha_vuelo);

            -- Inserta la reserva en la tabla Reservas
            INSERT INTO Reservas (id_Cliente, fecha_reserva)
            VALUES (@id_Cliente, @fecha_reserva);
            SET @id_Reserva = SCOPE_IDENTITY();

            -- Determina la cantidad de asientos a reservar (entre 1 y 4)
            SET @cantidadAsientosReserva = ABS(CHECKSUM(NEWID()) % 4) + 1;

            -- Inserta los detalles de reserva en DetalleReserva
            DECLARE AsientoCursor CURSOR FOR
                SELECT TOP (@cantidadAsientosReserva) id_AsientoDisponible
                FROM AsientoDisponible
                WHERE id_Vuelo = @id_Vuelo AND estadoAsiento = 'D'
                ORDER BY NEWID();

            OPEN AsientoCursor;
            FETCH NEXT FROM AsientoCursor INTO @id_AsientoDisponible;

            WHILE @@FETCH_STATUS = 0
            BEGIN
                -- Inserta cada asiento en DetalleReserva
                INSERT INTO DetalleReserva (id_AsientoDisponible, id_Reservas, descripcion)
                VALUES (@id_AsientoDisponible, @id_Reserva, @descripcion);

                FETCH NEXT FROM AsientoCursor INTO @id_AsientoDisponible;
            END;

            CLOSE AsientoCursor;
            DEALLOCATE AsientoCursor;

            SET @i = @i + 1;
        END;

        FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @fecha_vuelo;
    END;

    CLOSE VueloCursor;
    DEALLOCATE VueloCursor;
END;
GO

 execute PoblarReservasYDetalleReserva





 ---------------------------------------------------











 create database inicio2

use inicio2

use master 

drop database inicio2






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

create table PlanVuelo(
    id_PlanVuelo INT IDENTITY (1,1) PRIMARY KEY,
    id_origen INT,
    id_destino INT,
    descripcion VARCHAR(50),
    FOREIGN KEY (id_origen) REFERENCES Aeropuerto (id_Aeropuerto),
    FOREIGN KEY (id_destino) REFERENCES Aeropuerto (id_Aeropuerto)
)
create table Escala(
    id_Escala INT IDENTITY (1,1) PRIMARY KEY,
    escala INT,
    id_PlanVuelo INT,
    FOREIGN KEY (escala) REFERENCES Aeropuerto(id_Aeropuerto),
    FOREIGN KEY (id_PlanVuelo) REFERENCES PlanVuelo(id_PlanVuelo)
)


create table Vuelo(
    id_Vuelo INT IDENTITY(1,1) PRIMARY KEY,
    hora_embarque TIME,
    fecha_vuelo DATE,
    nuemero_puerta int,
    id_NumeroVuelo INT,
    id_TipoVuelo INT,
    FOREIGN KEY (id_NumeroVuelo) REFERENCES NumeroVuelo(id_NumeroVuelo),
    FOREIGN KEY (id_TipoVuelo) REFERENCES TipoVuelo(id_TipoVuelo)
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
    FOREIGN KEY (id_Cliente) REFERENCES Cliente (id_Cliente)
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

create table DetalleReserva(
    id_DetalleReserva INT IDENTITY (1,1) PRIMARY KEY,
    id_AsientoDisponible INT,
    id_Reservas INT,
    descripcion VARCHAR,
    FOREIGN KEY (id_Reservas) REFERENCES Reservas (id_Reservas),
    FOREIGN KEY (id_AsientoDisponible) REFERENCES AsientoDisponible(id_AsientoDisponible)
)


select * from Pago

select * from Reservas

select * from DetalleReserva



 select * from AsientoDisponible

create table DetalleReserva(
    id_DetalleReserva INT IDENTITY (1,1) PRIMARY KEY,
    id_AsientoDisponible INT,
    id_Reservas INT,
    descripcion VARCHAR,
    cantidad INT,
    FOREIGN KEY (id_Reservas) REFERENCES Reservas (id_Reservas),
    FOREIGN KEY (id_AsientoDisponible) REFERENCES AsientoDisponible(id_AsientoDisponible)
)

