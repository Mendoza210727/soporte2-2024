
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Airbus A320', 100);
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Boeing 737-800', 120);

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

    WHILE @fila <= 30  -- 35 filas para el primer modelo
    BEGIN
        -- Insertar 6 asientos por fila para el primer modelo
        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaD', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloD', 1)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloI', 1)


        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaI', 1)

        SET @fila = @fila + 1
    END

    -- Insertar asientos para el modelo de aeronave con id 2 (102 asientos)
    SET @fila = 1
    WHILE @fila <= 25  -- 17 filas para el segundo modelo
    BEGIN
        -- Insertar 6 asientos por fila para el segundo modelo
        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'ventanaD', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloD', 2)

        INSERT INTO Asientos (tamano, numero, ubicacion, id_ModeloAeronave)
        VALUES ('M', @fila, 'pasilloI', 2)

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
    SET NOCOUNT ON;

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
    DECLARE @escala INT;
    DECLARE @destino INT;
    DECLARE @randomValue INT;

    -- Tabla temporal para aerolíneas
    DECLARE @aerolineas TABLE (nombre VARCHAR(100));
    INSERT INTO @aerolineas (nombre) VALUES 
        ('American Airlines'), 
        ('JetSmart'), 
        ('United Airlines');
    
    -- Total de registros a insertar
    DECLARE @totalRegistros INT = 2160;

    WHILE @contador < @totalRegistros
    BEGIN
        -- Generar hora de salida aleatoria entre las 00:00 y las 23:59
        SET @hora_salida = CAST(ABS(CHECKSUM(NEWID())) % 24 AS VARCHAR) + ':' + 
                           RIGHT('00' + CAST(ABS(CHECKSUM(NEWID())) % 60 AS VARCHAR), 2);

        -- Seleccionar aleatoriamente una aerolínea
        SELECT TOP 1 @aerolinea = nombre 
        FROM @aerolineas 
        ORDER BY NEWID();

        -- Seleccionar un id_Aeropuerto aleatorio de la tabla Aeropuerto como aeropuerto de origen
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

        -- Seleccionar un destino aleatorio distinto del aeropuerto de origen
        SELECT TOP 1 @destino = id_Aeropuerto
        FROM Aeropuerto
        WHERE id_Aeropuerto <> @id_Aeropuerto
        ORDER BY NEWID();

        -- Generar la fecha del vuelo aleatoria entre 2019 y 2022
        SET @fecha_vuelo = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 730), '2020-01-01');  -- 1461 días para cubrir 4 años

        -- Generar hora de embarque, 1 hora antes de la hora_salida
        SET @hora_embarque = DATEADD(HOUR, -1, @hora_salida);

        -- Generar número de puerta aleatorio entre 1 y 15
        SET @numero_puerta = ABS(CHECKSUM(NEWID())) % 15 + 1;

        -- Asignar el valor de escala según las probabilidades definidas
        SET @randomValue = ABS(CHECKSUM(NEWID()) % 100);
        SET @escala = CASE 
                          WHEN @randomValue < 10 THEN 0  -- 10% probabilidad de 0
                          WHEN @randomValue < 80 THEN 1  -- 70% probabilidad de 1
                          ELSE 2                         -- 20% probabilidad de 2
                      END;

        -- Insertar en la tabla Vuelo con el valor de escala y destino
        INSERT INTO Vuelo (hora_embarque, fecha_vuelo, nuemero_puerta, id_NumeroVuelo, id_TipoVuelo, escala, destino)
        VALUES (@hora_embarque, @fecha_vuelo, @numero_puerta, @id_NumeroVuelo, @id_TipoVuelo, @escala, @destino);

        -- Incrementar el contador
        SET @contador = @contador + 1;
    END;
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
            SET @cantidadAsientos = 100; -- Suponiendo que el modelo 1 tiene 180 asientos
        ELSE IF @id_ModeloAeronave = 2
            SET @cantidadAsientos = 120; -- Suponiendo que el modelo 2 tiene 189 asientos

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
            SET @estadoAsiento = CASE WHEN ABS(CHECKSUM(NEWID()) % 2) = 0 THEN 'D' ELSE 'D' END;

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

	




CREATE PROCEDURE PoblarReservasYDetalleReserva
    @PorcentajeAsientosReservar INT = 90  -- Porcentaje de asientos a reservar
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_Cliente INT;
    DECLARE @fecha_reserva DATE;
    DECLARE @id_Reserva INT;
    DECLARE @id_Vuelo INT;
    DECLARE @fecha_vuelo DATE;
    DECLARE @id_AsientoDisponible INT;
    DECLARE @totalAsientos INT;
    DECLARE @cantidadAsientosReserva INT;
    DECLARE @asientosParaEstaReserva INT;
    DECLARE @descripcion VARCHAR(100) = 'Asiento reservado';
    DECLARE @PrecioUnitario INT;

    -- Cursor para recorrer cada vuelo y crear reservas correspondientes
    DECLARE VueloCursor CURSOR FOR
        SELECT id_Vuelo, fecha_vuelo
        FROM Vuelo;

    OPEN VueloCursor;
    FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @fecha_vuelo;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Obtener el número total de asientos disponibles para el vuelo actual
        SELECT @totalAsientos = COUNT(*)
        FROM AsientoDisponible
        WHERE id_Vuelo = @id_Vuelo AND estadoAsiento = 'D';

        -- Calcular el número de asientos a reservar (90% de los disponibles)
        SET @cantidadAsientosReserva = (@totalAsientos * @PorcentajeAsientosReservar) / 100;

        -- Crear reservas hasta que se cubra el 90% de los asientos disponibles
        WHILE @cantidadAsientosReserva > 0
        BEGIN
            -- Selecciona un cliente aleatorio
            SELECT TOP 1 @id_Cliente = id_Cliente
            FROM Cliente
            ORDER BY NEWID();

            -- Genera la fecha de reserva entre 1 y 3 días antes de la fecha de vuelo
            SET @fecha_reserva = DATEADD(DAY, -1 * ABS(CHECKSUM(NEWID()) % 3 + 1), @fecha_vuelo);

            -- Determina aleatoriamente la cantidad de asientos a reservar (entre 1 y 4, pero que no exceda los asientos restantes)
            SET @asientosParaEstaReserva = CASE 
                                               WHEN @cantidadAsientosReserva >= 4 THEN ABS(CHECKSUM(NEWID()) % 4) + 1 
                                               ELSE @cantidadAsientosReserva 
                                           END;

            -- Reducir la cantidad de asientos restantes por la cantidad reservada en esta transacción
            SET @cantidadAsientosReserva = @cantidadAsientosReserva - @asientosParaEstaReserva;

            -- Generar el PrecioUnitario aleatorio entre 100 y 500
            SET @PrecioUnitario = ABS(CHECKSUM(NEWID()) % 401) + 100;

            -- Inserta la reserva en la tabla Reservas
            INSERT INTO Reservas (id_Cliente, fecha_reserva, cantidad, PrecioUnitario)
            VALUES (@id_Cliente, @fecha_reserva, @asientosParaEstaReserva, @PrecioUnitario);
            SET @id_Reserva = SCOPE_IDENTITY();

            -- Cursor para seleccionar aleatoriamente los asientos disponibles para esta reserva
            DECLARE AsientoCursor CURSOR FOR
                SELECT TOP (@asientosParaEstaReserva) id_AsientoDisponible
                FROM AsientoDisponible
                WHERE id_Vuelo = @id_Vuelo AND estadoAsiento = 'D'
                ORDER BY NEWID();

            OPEN AsientoCursor;
            FETCH NEXT FROM AsientoCursor INTO @id_AsientoDisponible;

            -- Insertar cada asiento reservado en DetalleReserva
            WHILE @@FETCH_STATUS = 0
            BEGIN
                INSERT INTO DetalleReserva (id_AsientoDisponible, id_Reservas, descripcion)
                VALUES (@id_AsientoDisponible, @id_Reserva, @descripcion);

                -- Cambia el estado del asiento a ocupado en AsientoDisponible
                UPDATE AsientoDisponible 
                SET estadoAsiento = 'O'
                WHERE id_AsientoDisponible = @id_AsientoDisponible;

                FETCH NEXT FROM AsientoCursor INTO @id_AsientoDisponible;
            END;

            CLOSE AsientoCursor;
            DEALLOCATE AsientoCursor;
        END;

        FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @fecha_vuelo;
    END;

    CLOSE VueloCursor;
    DEALLOCATE VueloCursor;
END;



execute PoblarReservasYDetalleReserva






CREATE PROCEDURE PoblarPagos
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_Cliente INT;
    DECLARE @id_Reserva INT;
    DECLARE @cantidad INT;
    DECLARE @PrecioUnitario DECIMAL(10, 2);
    DECLARE @monto DECIMAL(10, 2);
    DECLARE @fecha_reserva DATE;
    DECLARE @fecha_pago DATE;
    DECLARE @id_TipoPago INT;
    DECLARE @id_CanalPago INT;
    DECLARE @id_Moneda INT;
    DECLARE @estatus VARCHAR(20);
    DECLARE @randomValue INT;

    -- Cursor para recorrer cada reserva y crear el pago correspondiente
    DECLARE ReservaCursor CURSOR FOR
        SELECT id_Reservas, id_Cliente, cantidad, PrecioUnitario, fecha_reserva
        FROM Reservas;

    OPEN ReservaCursor;
    FETCH NEXT FROM ReservaCursor INTO @id_Reserva, @id_Cliente, @cantidad, @PrecioUnitario, @fecha_reserva;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Calcular el monto como PrecioUnitario * cantidad
        SET @monto = @PrecioUnitario * @cantidad;

        -- Seleccionar aleatoriamente un tipo de pago, canal de pago y moneda
        SELECT TOP 1 @id_TipoPago = id_TipoPago FROM TipoPago ORDER BY NEWID();
        SELECT TOP 1 @id_CanalPago = id_CanalPago FROM CanalPago ORDER BY NEWID();
        SELECT TOP 1 @id_Moneda = id_Moneda FROM Moneda ORDER BY NEWID();

        -- Generar una fecha de pago dentro de 1 a 3 días después de la fecha de reserva
        SET @fecha_pago = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3 + 1), @fecha_reserva);

        -- Generar un valor aleatorio para establecer el estatus con la probabilidad deseada
        SET @randomValue = ABS(CHECKSUM(NEWID()) % 100);

        SET @estatus = CASE 
                          WHEN @randomValue < 94 THEN 'Completado'   -- 94% probabilidad de 'Completado'
                          WHEN @randomValue < 98 THEN 'Fallido'      -- 4% probabilidad de 'Fallido'
                          ELSE 'Pendiente'                           -- 2% probabilidad de 'Pendiente'
                       END;

        -- Insertar el pago en la tabla Pago
        INSERT INTO Pago (id_Cliente, id_TipoPago, id_CanalPago, id_Moneda, id_Reservas, monto, fecha_pago, estatus)
        VALUES (@id_Cliente, @id_TipoPago, @id_CanalPago, @id_Moneda, @id_Reserva, @monto, @fecha_pago, @estatus);

        FETCH NEXT FROM ReservaCursor INTO @id_Reserva, @id_Cliente, @cantidad, @PrecioUnitario, @fecha_reserva;
    END;

    CLOSE ReservaCursor;
    DEALLOCATE ReservaCursor;
END;


execute PoblarPagos



---------------------------------------------------------------------------------

CREATE PROCEDURE PoblarPlanVuelo
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_Vuelo INT;
    DECLARE @escala INT;
    DECLARE @id_Aeropuerto INT;

    -- Cursor para recorrer cada vuelo en la tabla Vuelo y obtener el número de escalas
    DECLARE VueloCursor CURSOR FOR
        SELECT id_Vuelo, escala
        FROM Vuelo
        WHERE escala > 0;  -- Solo considerar vuelos que tienen al menos una escala

    OPEN VueloCursor;
    FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @escala;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @i INT = 1;  -- Contador para el número de escalas insertadas

        -- Insertar escalas para cada vuelo según el valor en el campo 'escala'
        WHILE @i <= @escala
        BEGIN
            -- Seleccionar un aeropuerto aleatorio para la escala, excluyendo el aeropuerto de destino del vuelo
            SELECT TOP 1 @id_Aeropuerto = id_Aeropuerto
            FROM Aeropuerto
            ORDER BY NEWID();

            -- Insertar en la tabla PlanVuelo
            INSERT INTO PlanVuelo (id_Vuelo, escala)
            VALUES (@id_Vuelo, @id_Aeropuerto);

            SET @i = @i + 1;
        END;

        FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @escala;
    END;

    CLOSE VueloCursor;
    DEALLOCATE VueloCursor;
END;


execute PoblarPlanVuelo


select * from Vuelo
select * from PlanVuelo
