 -- ModeloAeronave *--

INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Airbus A320', 180);
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Boeing 737-800', 150);


 -- Aerolinea  *--

INSERT INTO Aerolinea(nombre_aerolinea) VALUES ('United Airlines');
INSERT INTO Aerolinea(nombre_aerolinea) VALUES ('JetSmart');
INSERT INTO Aerolinea(nombre_aerolinea) VALUES ('American Airlines');


 -- Aeronave   *--

INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Viento Libre', '2019-01-15', 1, 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Cielo Azul', '2019-02-20', 2, 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Estrella Fugaz', '2019-03-25', 1, 1);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Horizonte Infinito', '2019-04-10', 1, 2);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Espíritu Aventurero', '2019-05-30', 1, 2);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Alas del Viento', '2019-06-15', 1, 3);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Nave Dorada', '2019-07-20', 2, 3);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Brisa Celestial', '2019-08-05', 2, 3);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Cometa Plateado', '2019-09-17', 2, 3);
INSERT INTO Aeronave (nombre_comercial, fecha_inicio_operaciones, id_ModeloAeronave,id_Aerolinea) VALUES ('Alas de Plata', '2019-10-24', 2, 3);


 -- TipoEmpleado  *--

INSERT INTO TipoEmpleado (cargo) VALUES ('Piloto');
INSERT INTO TipoEmpleado (cargo) VALUES ('Copiloto');
INSERT INTO TipoEmpleado (cargo) VALUES ('Tripulación de Cabina');
INSERT INTO TipoEmpleado (cargo) VALUES ('Mecánico de Aeronaves');
INSERT INTO TipoEmpleado (cargo) VALUES ('Controlador de Tráfico Aéreo');
INSERT INTO TipoEmpleado (cargo) VALUES ('Agente de Puerta');
INSERT INTO TipoEmpleado (cargo) VALUES ('Agente de Reservas');
INSERT INTO TipoEmpleado (cargo) VALUES ('Personal de Carga');
INSERT INTO TipoEmpleado (cargo) VALUES ('Personal de Mantenimiento de Aeropuertos');
INSERT INTO TipoEmpleado (cargo) VALUES ('Despachador de Vuelo');
INSERT INTO TipoEmpleado (cargo) VALUES ('Personal de Seguridad Aeroportuaria');
INSERT INTO TipoEmpleado (cargo) VALUES ('Gerente de Operaciones');
INSERT INTO TipoEmpleado (cargo) VALUES ('Supervisor de Logística');
INSERT INTO TipoEmpleado (cargo) VALUES ('Especialista en Servicios de TI');
INSERT INTO TipoEmpleado (cargo) VALUES ('Entrenador de Vuelo');
INSERT INTO TipoEmpleado (cargo) VALUES ('Instructor de Tripulación');
INSERT INTO TipoEmpleado (cargo) VALUES ('Personal de Servicio al Cliente');
INSERT INTO TipoEmpleado (cargo) VALUES ('Analista Financiero');
INSERT INTO TipoEmpleado (cargo) VALUES ('Analista de Datos');


 -- Empleados  *----

BULK INSERT Empleados
FROM 'C:\Users\Lenovo\Downloads\empleados-aerolinea2.txt'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Ignorar el encabezado
    TABLOCK
);


 -- Proveedor  *--

INSERT INTO Proveedor(nombre_proveedor)VALUES('AeroParts Global');
INSERT INTO Proveedor(nombre_proveedor)VALUES('SkySupplies Aviation');
INSERT INTO Proveedor(nombre_proveedor)VALUES('FlyTech Components');
INSERT INTO Proveedor(nombre_proveedor)VALUES('JetSpare Solutions');
INSERT INTO Proveedor(nombre_proveedor)VALUES('AviaParts Express');


 -- Repuesto   *--

INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Alerón', 5000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Motor Turbofán', 150000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Turbina de escape', 30000, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Compresor de aire', 25000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Bujía de encendido', 200, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Filtro de aceite', 150, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Filtro de combustible', 180, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Asiento de cabina', 700, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de control de vuelo', 25000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Caja de herramientas', 300, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Unidad de potencia auxiliar', 80000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Caja de cambios', 20000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de frenos', 15000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Cámara de aire', 100, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema hidráulico', 12000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Neumático', 1200, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Hélice', 10000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de deshielo', 4000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Parabrisas', 5000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Pantalla de navegación', 8000, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Radar meteorológico', 15000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Antena de comunicación', 2000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de oxígeno', 4000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Iluminación de cabina', 1200, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Panel de control de vuelo', 9000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Actuador de flaps', 3000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Válvula de escape', 800, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Controlador de presión', 2000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Tubo de escape', 1500, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Filtro de aire', 200, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Tanque de combustible', 10000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Tornillo de fijación', 50, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Ala de repuesto', 200000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Turbina auxiliar', 70000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Paracaídas de emergencia', 3000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Ventana de cabina', 1200, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Equipo de navegación', 15000, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de detección de hielo', 5000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Cámara de aterrizaje', 2500, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Kit de emergencia', 1000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sensor de presión', 800, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de escape de emergencia', 7000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Dispositivo de iluminación de emergencia', 1200, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Palanca de mando', 3000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de radar', 20000, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Cinturón de seguridad', 150, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Módulo de comunicación', 6000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Refrigerador de cabina', 500, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Receptor de GPS', 4500, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de iluminación exterior', 3000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Kit de reparación de fuselaje', 2000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Panel de instrumentos', 12000, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Botón de control de cabina', 150, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de aviso de proximidad', 18000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Extintor de cabina', 500, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Cableado eléctrico', 250, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de monitoreo de combustible', 5000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Manguera hidráulica', 400, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Unidad de presurización', 7500, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de audio', 2000, 1);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Reemplazo de fusible', 30, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Pantalla de cabina', 7000, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Filtro de cabina', 300, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sensor de altitud', 4000, 5);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Batería de respaldo', 1500, 2);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Sistema de ventilación', 2000, 4);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Rueda de repuesto', 2500, 3);
INSERT INTO Repuesto (nombre_repuesto, precio, id_Proveedor) VALUES ('Repuesto de amortiguador', 1200, 1);



 -- TipoMantenimiento  *--

INSERT INTO TipoMantenimiento(tipo_mantenimiento) VALUES ('Preventivo');
INSERT INTO TipoMantenimiento(tipo_mantenimiento) VALUES ('Correctivo');
INSERT INTO TipoMantenimiento(tipo_mantenimiento) VALUES ('Rutinario');



 -- Mantenimientos y DetalleMantenimiento--

CREATE PROCEDURE PoblarMantenimientosYDetalle (
    @fechaInicio DATE = '2019-01-01', 
    @fechaFin DATE = '2022-12-31'
)
AS
BEGIN
    DECLARE @idAeronave INT;
    DECLARE @idEmpleado INT;
    DECLARE @idTipoMantenimiento INT;
    DECLARE @fechaMantenimiento DATE;
    DECLARE @fechaEntrega DATE;
    DECLARE @costoMantenimiento INT;
    DECLARE @idMantenimiento INT;
    DECLARE @cantidadMantenimientos INT;
    DECLARE @cantidad INT;
    DECLARE @idRepuesto INT;
    DECLARE @precioRepuesto INT;
    DECLARE @numRepuestos INT;
    DECLARE @i INT;
    -- Cursor para recorrer todas las aeronaves
    DECLARE cursorAeronaves CURSOR FOR 
    SELECT id_Aeronave FROM Aeronave;
    OPEN cursorAeronaves;
    FETCH NEXT FROM cursorAeronaves INTO @idAeronave;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Determinar la cantidad de mantenimientos para cada aeronave por año (entre 4 y 7)
        SET @cantidadMantenimientos = FLOOR(RAND() * 4) + 4;  -- Genera un número entre 4 y 7
        -- Ciclo de años
        DECLARE @anio INT = YEAR(@fechaInicio);
        WHILE @anio <= YEAR(@fechaFin)
        BEGIN
            DECLARE @contador INT = 0;
            WHILE @contador < @cantidadMantenimientos
            BEGIN
                -- Seleccionar empleado aleatorio para el mantenimiento
                SET @idEmpleado = FLOOR(RAND() * 15) + 96; -- Empleados entre 96 y 110
                -- Seleccionar tipo de mantenimiento aleatorio
                SELECT TOP 1 @idTipoMantenimiento = id_TipoMantenimiento FROM TipoMantenimiento ORDER BY NEWID();
                -- Generar fecha de mantenimiento aleatoria dentro del año
                SET @fechaMantenimiento = DATEADD(DAY, FLOOR(RAND() * 365), DATEFROMPARTS(@anio, 1, 1));
                -- Generar fecha de entrega (1-5 días después de la fecha de mantenimiento)
                SET @fechaEntrega = DATEADD(DAY, FLOOR(RAND() * 5) + 1, @fechaMantenimiento);
                -- Insertar registro en la tabla Mantenimientos
                INSERT INTO Mantenimientos (fecha_mantenimiento, fecha_entrega, id_Empleado, id_Aeronave, costo_mantenimiento, id_TipoMantenimiento)
                VALUES (@fechaMantenimiento, @fechaEntrega, @idEmpleado, @idAeronave, 0, @idTipoMantenimiento);
                -- Obtener el id del mantenimiento recién insertado
                SET @idMantenimiento = SCOPE_IDENTITY();
                -- Generar número de repuestos (entre 1 y 5)
                SET @numRepuestos = FLOOR(RAND() * 5) + 1;
                SET @costoMantenimiento = 0;
                SET @i = 0;
                WHILE @i < @numRepuestos
                BEGIN
                    -- Seleccionar repuesto aleatorio y obtener su precio
                    DECLARE @tempRepuesto TABLE (id INT, precio INT);
                    INSERT INTO @tempRepuesto
                    SELECT TOP 1 id_Repuesto, precio FROM Repuesto ORDER BY NEWID();
                    -- Asignar valores de @tempRepuesto a las variables @idRepuesto y @precioRepuesto
                    SELECT @idRepuesto = id, @precioRepuesto = precio FROM @tempRepuesto;
                    -- Generar cantidad aleatoria de repuestos (1-5)
                    SET @cantidad = FLOOR(RAND() * 5) + 1;
                    -- Insertar registro en la tabla DetalleMantenimiento
                    INSERT INTO DetalleMantenimiento (cantidad, id_Repuesto, id_Mantenimiento)
                    VALUES (@cantidad, @idRepuesto, @idMantenimiento);
                    -- Calcular costo del mantenimiento
                    SET @costoMantenimiento += @precioRepuesto * @cantidad;
                    SET @i = @i + 1;
                END
                -- Actualizar el costo total del mantenimiento
                UPDATE Mantenimientos
                SET costo_mantenimiento = @costoMantenimiento
                WHERE id_Mantenimiento = @idMantenimiento;
                SET @contador = @contador + 1;
            END
            SET @anio = @anio + 1;
        END
        FETCH NEXT FROM cursorAeronaves INTO @idAeronave;
    END
    CLOSE cursorAeronaves;
    DEALLOCATE cursorAeronaves;
END;

execute PoblarMantenimientosYDetalle


 -- Asientos   --

CREATE PROCEDURE PoblarAsientos
AS
BEGIN
    -- Insertar asientos para el modelo de aeronave con id 1 (210 asientos)
    DECLARE @fila INT
    SET @fila = 1
    WHILE @fila <= 45  -- 35 filas para el primer modelo
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
    WHILE @fila <= 37  -- 17 filas para el segundo modelo
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


execute PoblarAsientos


 -- Pais   *--

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
INSERT INTO Pais (nombre_pais, nacionalidad) VALUES ('Bolivia', 'Boliviano');

 -- Ciudad *--

INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Nueva York', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Los Ángeles', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chicago', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Miami', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('San Francisco', 1);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('París', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Marsella', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Lyon', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Toulouse', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Niza', 2);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Londres', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Manchester', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Edimburgo', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Birmingham', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Glasgow', 3);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Pekín', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Shanghái', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Guangzhou', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Shenzhen', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chengdu', 4);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Roma', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Milán', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Venecia', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Florencia', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Nápoles', 5);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Madrid', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Barcelona', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Sevilla', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Valencia', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Bilbao', 6);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Estambul', 7);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Ankara', 7);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Izmir', 7);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Dubái', 8);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Abu Dhabi', 8);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Sharjah', 8);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Bangkok', 9);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chiang Mai', 9);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Phuket', 9);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Tokio', 10);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Kioto', 10);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Osaka', 10);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Ciudad de México', 11);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Cancún', 11);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Guadalajara', 11);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Berlín', 12);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Múnich', 12);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Fráncfort', 12);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Ámsterdam', 13);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Róterdam', 13);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('La Haya', 13);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Sídney', 14);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Melbourne', 14);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Brisbane', 14);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Río de Janeiro', 15);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('São Paulo', 15);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Brasilia', 15);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('La Paz', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Cochabamba', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Santa Cruz', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Oruro', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Potosí', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Chuquisaca', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Tarija', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Beni', 16);
INSERT INTO Ciudad (nombre_ciudad, id_Pais) VALUES ('Pando', 16);


 -- Aeropuerto 3--

CREATE PROCEDURE PoblarAeropuerto
AS
BEGIN
    DECLARE @idCiudad INT;
    DECLARE @nombreCiudad VARCHAR(100);
    DECLARE @nombreAeropuerto VARCHAR(150);

    -- Cursor para recorrer todas las ciudades
    DECLARE cursorCiudades CURSOR FOR 
    SELECT id_Ciudad, nombre_ciudad FROM Ciudad;

    OPEN cursorCiudades;
    FETCH NEXT FROM cursorCiudades INTO @idCiudad, @nombreCiudad;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Crear nombre del aeropuerto basado en el nombre de la ciudad
        SET @nombreAeropuerto = 'Aeropuerto - ' + @nombreCiudad;

        -- Insertar el aeropuerto en la tabla Aeropuerto
        INSERT INTO Aeropuerto (id_Ciudad, nombre_aeropuerto)
        VALUES (@idCiudad, @nombreAeropuerto);

        FETCH NEXT FROM cursorCiudades INTO @idCiudad, @nombreCiudad;
    END
    
    CLOSE cursorCiudades;
    DEALLOCATE cursorCiudades;
END;

execute PoblarAeropuerto



 -- TipoVuelo  --

INSERT INTO TipoVuelo (descripcion) VALUES ('nacional');
INSERT INTO TipoVuelo (descripcion) VALUES ('internacional');


 -- NumeroVuelo  --

CREATE PROCEDURE PoblarNumeroVuelo
AS
BEGIN
    DECLARE @horaSalida TIME;
    DECLARE @idAeronave INT;
    DECLARE @origen INT;
    DECLARE @destino INT;
    DECLARE @numeroPuerta INT;
    DECLARE @maxPuerta INT = 20; -- Número máximo de puertas (ajustable según disponibilidad)
    DECLARE @numRegistros INT = 0;
    DECLARE @totalRegistros INT = 5500;

    -- Obtener todas las aeronaves disponibles
    DECLARE @tblAeronaves TABLE (id_Aeronave INT);

    -- Poblar tabla temporal de aeronaves
    INSERT INTO @tblAeronaves (id_Aeronave)
    SELECT id_Aeronave FROM Aeronave;

    -- Bucle para insertar 5500 registros en la tabla NumeroVuelo
    WHILE @numRegistros < @totalRegistros
    BEGIN
        -- Seleccionar una hora de salida aleatoria (en horas completas)
        SET @horaSalida = CAST((DATEADD(HOUR, ABS(CHECKSUM(NEWID()) % 24), '00:00:00')) AS TIME);

        -- Seleccionar una aeronave aleatoria
        SELECT TOP 1 @idAeronave = id_Aeronave FROM @tblAeronaves ORDER BY NEWID();

        -- Seleccionar un origen aleatorio entre 55 y 66
        SET @origen = 55 + ABS(CHECKSUM(NEWID()) % 12);

        -- Seleccionar un destino aleatorio entre 1 y 66 que sea diferente del origen
        SET @destino = ABS(CHECKSUM(NEWID()) % 66) + 1;
        WHILE @destino = @origen
        BEGIN
            SET @destino = ABS(CHECKSUM(NEWID()) % 66) + 1;
        END

        -- Generar un número de puerta aleatorio entre 1 y el valor máximo de puertas
        SET @numeroPuerta = ABS(CHECKSUM(NEWID()) % @maxPuerta) + 1;

        -- Insertar el registro en NumeroVuelo
        INSERT INTO NumeroVuelo (hora_salida, id_Aeronave, origen, destino, numero_puerta)
        VALUES (@horaSalida, @idAeronave, @origen, @destino, @numeroPuerta);

        -- Incrementar el contador de registros
        SET @numRegistros += 1;
    END
END;


execute PoblarNumeroVuelo


 -- PlanVuelo  5--


CREATE PROCEDURE PoblarPlanVuelo
AS
BEGIN
    DECLARE @idNumeroVuelo INT;
    DECLARE @origen INT;
    DECLARE @cantidadEscala INT;
    
    DECLARE cursorNumeroVuelo CURSOR FOR 
    SELECT id_NumeroVuelo, origen 
    FROM NumeroVuelo;

    OPEN cursorNumeroVuelo;
    FETCH NEXT FROM cursorNumeroVuelo INTO @idNumeroVuelo, @origen;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Si el origen está entre 58 y 66, la cantidad de escalas será 0 o 1
        IF @origen BETWEEN 58 AND 66
        BEGIN
            SET @cantidadEscala = CASE 
                WHEN RAND() < 0.5 THEN 0 -- 50% probabilidad de 0 escalas
                ELSE 1                   -- 50% probabilidad de 1 escala
            END;
        END
        ELSE
        BEGIN
            -- Asignación de escalas con probabilidades 20% para 0, 40% para 1, 30% para 2, y 10% para 3
            DECLARE @randomValue FLOAT = RAND();
            SET @cantidadEscala = CASE 
                WHEN @randomValue < 0.2 THEN 0
                WHEN @randomValue < 0.6 THEN 1
                WHEN @randomValue < 0.9 THEN 2
                ELSE 3
            END;
        END

        -- Insertar el registro en PlanVuelo
        INSERT INTO PlanVuelo (id_NumeroVuelo, cantidad_escala)
        VALUES (@idNumeroVuelo, @cantidadEscala);

        FETCH NEXT FROM cursorNumeroVuelo INTO @idNumeroVuelo, @origen;
    END

    CLOSE cursorNumeroVuelo;
    DEALLOCATE cursorNumeroVuelo;
END;


execute PoblarPlanVuelo


 -- Escalas   --


CREATE PROCEDURE PoblarEscalas
AS
BEGIN
    DECLARE @horaSalida TIME;
    DECLARE @horaLlegada TIME;
    DECLARE @duracionEscala INT;
    DECLARE @escala INT;
    DECLARE @idPlanVuelo INT;
    DECLARE @cantidadEscalas INT;
    DECLARE @origen INT;
    DECLARE @destino INT;
    
    -- Cursor para recorrer todos los registros de la tabla PlanVuelo
    DECLARE cursorPlanVuelo CURSOR FOR 
    SELECT PV.id_PlanVuelo, PV.cantidad_escala, NV.origen, NV.destino 
    FROM PlanVuelo PV
    JOIN NumeroVuelo NV ON PV.id_NumeroVuelo = NV.id_NumeroVuelo
    WHERE PV.cantidad_escala > 0;  -- Omitir planes de vuelo con cero escalas
    
    -- Abrir el cursor
    OPEN cursorPlanVuelo;
    
    FETCH NEXT FROM cursorPlanVuelo INTO @idPlanVuelo, @cantidadEscalas, @origen, @destino;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @i INT = 1;

        WHILE @i <= @cantidadEscalas
        BEGIN
            -- Generar una hora de salida aleatoria (exacta en horas con 00 minutos y 00 segundos)
            SET @horaSalida = CAST((DATEADD(HOUR, ABS(CHECKSUM(NEWID()) % 24), '00:00:00')) AS TIME);

            -- Condición para escalas cuando origen y destino están entre 55 y 66
            IF (@origen BETWEEN 55 AND 66) AND (@destino BETWEEN 55 AND 66)
            BEGIN
                -- La hora de llegada será exactamente una hora después de la hora de salida
                SET @horaLlegada = DATEADD(HOUR, 1, @horaSalida);
                SET @duracionEscala = 1;  -- Duración de una hora
            END
            ELSE
            BEGIN
                -- Generar una hora de llegada entre 2 a 10 horas después de la hora de salida
                DECLARE @incrementHours INT = ABS(CHECKSUM(NEWID()) % 9) + 2; -- Entre 2 y 10 horas
                SET @horaLlegada = DATEADD(HOUR, @incrementHours, @horaSalida);

                -- Ajuste para evitar duraciones negativas (si llegada es al día siguiente)
                IF @horaLlegada < @horaSalida
                BEGIN
                    SET @duracionEscala = DATEDIFF(HOUR, @horaSalida, DATEADD(DAY, 1, @horaLlegada));
                END
                ELSE
                BEGIN
                    SET @duracionEscala = DATEDIFF(HOUR, @horaSalida, @horaLlegada);
                END
            END

            -- Generar un aeropuerto de escala aleatorio de la tabla Aeropuerto
            IF (@origen BETWEEN 55 AND 66) AND (@destino BETWEEN 55 AND 66)
            BEGIN
                -- Seleccionar aleatoriamente entre 55 y 56, distinto de origen y destino
                SET @escala = 55 + (ABS(CHECKSUM(NEWID())) % 2); -- Valor aleatorio entre 55 y 56
                IF @escala = @origen OR @escala = @destino
                BEGIN
                    SET @escala = CASE WHEN @escala = 55 THEN 56 ELSE 55 END;
                END
            END
            ELSE
            BEGIN
                -- Escoger cualquier aeropuerto aleatorio distinto de origen y destino
                SELECT TOP 1 @escala = id_Aeropuerto FROM Aeropuerto 
                WHERE id_Aeropuerto NOT IN (@origen, @destino)
                ORDER BY NEWID();
            END

            -- Insertar el registro en la tabla Escalas
            INSERT INTO Escalas (hora_salida, hora_llegada, duracion_escala, escala, id_PlanVuelo)
            VALUES (@horaSalida, @horaLlegada, @duracionEscala, @escala, @idPlanVuelo);

            SET @i = @i + 1;
        END

        -- Obtener el siguiente registro de PlanVuelo
        FETCH NEXT FROM cursorPlanVuelo INTO @idPlanVuelo, @cantidadEscalas, @origen, @destino;
    END
    
    -- Cerrar y desasociar el cursor
    CLOSE cursorPlanVuelo;
    DEALLOCATE cursorPlanVuelo;
END;


execute PoblarEscalas


 -- Vuelo  --

CREATE PROCEDURE PoblarVuelo
AS
BEGIN
    DECLARE @horaEmbarque TIME;
    DECLARE @fechaVuelo DATE;
    DECLARE @duracionVuelo TIME;
    DECLARE @idNumeroVuelo INT;
    DECLARE @idTipoVuelo INT;
    DECLARE @destino INT;
    DECLARE @horaSalida TIME;

    -- Cursor para recorrer todos los registros de la tabla NumeroVuelo
    DECLARE cursorNumeroVuelo CURSOR FOR 
    SELECT NV.id_NumeroVuelo, NV.destino, NV.hora_salida 
    FROM NumeroVuelo NV;
    
    -- Abrir el cursor
    OPEN cursorNumeroVuelo;
    
    FETCH NEXT FROM cursorNumeroVuelo INTO @idNumeroVuelo, @destino, @horaSalida;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generar la hora de embarque (1 hora después de la hora de salida)
        SET @horaEmbarque = DATEADD(HOUR, 1, @horaSalida);

        -- Generar una fecha aleatoria entre los años 2019 y 2022
        DECLARE @year INT = 2019 + (ABS(CHECKSUM(NEWID())) % 4); -- Año entre 2019 y 2022
        DECLARE @month INT = 1 + (ABS(CHECKSUM(NEWID())) % 12);  -- Mes entre 1 y 12
        DECLARE @day INT = 1 + (ABS(CHECKSUM(NEWID())) % 28);    -- Día entre 1 y 28 (para evitar fechas inválidas)
        SET @fechaVuelo = DATEFROMPARTS(@year, @month, @day);

        -- Determinar el tipo de vuelo: 1 si el destino está entre 55 y 66, de lo contrario 2
        SET @idTipoVuelo = CASE WHEN @destino BETWEEN 55 AND 66 THEN 1 ELSE 2 END;

        -- Calcular la duración del vuelo sumando las duraciones de las escalas del mismo plan de vuelo
        DECLARE @totalDuracion INT;
        SELECT @totalDuracion = COALESCE(SUM(duracion_escala), 0)
        FROM Escalas E
        JOIN PlanVuelo PV ON PV.id_PlanVuelo = E.id_PlanVuelo
        WHERE PV.id_NumeroVuelo = @idNumeroVuelo;

        -- Si no hay escalas, establecer la duración en 1 hora
        SET @duracionVuelo = CASE WHEN @totalDuracion = 0 THEN '01:00:00' ELSE DATEADD(HOUR, @totalDuracion, '00:00:00') END;

        -- Insertar el registro en la tabla Vuelo
        INSERT INTO Vuelo (hora_embarque, fecha_vuelo, duracion_vuelo, id_NumeroVuelo, id_TipoVuelo)
        VALUES (@horaEmbarque, @fechaVuelo, @duracionVuelo, @idNumeroVuelo, @idTipoVuelo);

        -- Obtener el siguiente registro de NumeroVuelo
        FETCH NEXT FROM cursorNumeroVuelo INTO @idNumeroVuelo, @destino, @horaSalida;
    END

    -- Cerrar y desasociar el cursor
    CLOSE cursorNumeroVuelo;
    DEALLOCATE cursorNumeroVuelo;
END;


execute PoblarVuelo


 -- Tripulacion   8--

CREATE PROCEDURE PoblarTripulacion
AS
BEGIN
    DECLARE @idVuelo INT;
    DECLARE @piloto INT;
    DECLARE @copiloto INT;
    DECLARE @tripulacionCabina1 INT;
    DECLARE @tripulacionCabina2 INT;
    DECLARE @tripulacionCabina3 INT;
    DECLARE @tripulacionCabina4 INT;
    DECLARE @tripulacionCabina5 INT;
    DECLARE @tripulacionCabina6 INT;
    DECLARE @mecanico INT;
    DECLARE @despachadorVuelo INT;

    -- Cursor para recorrer todos los registros de la tabla Vuelo
    DECLARE cursorVuelo CURSOR FOR 
    SELECT id_Vuelo FROM Vuelo;
    
    -- Abrir el cursor
    OPEN cursorVuelo;
    
    FETCH NEXT FROM cursorVuelo INTO @idVuelo;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generar asignaciones aleatorias para cada rol en la tripulación

        -- Piloto (valores entre 1 y 25)
        SET @piloto = 1 + (ABS(CHECKSUM(NEWID())) % 25);

        -- Copiloto (valores entre 26 y 45)
        SET @copiloto = 26 + (ABS(CHECKSUM(NEWID())) % 20);

        -- Tripulación de cabina (valores entre 46 y 95, asegurando que sean únicos)
        DECLARE @tripulacionCabina TABLE (id INT);
        WHILE (SELECT COUNT(*) FROM @tripulacionCabina) < 6
        BEGIN
            DECLARE @nuevoCabina INT = 46 + (ABS(CHECKSUM(NEWID())) % 50);
            IF NOT EXISTS (SELECT 1 FROM @tripulacionCabina WHERE id = @nuevoCabina)
            BEGIN
                INSERT INTO @tripulacionCabina (id) VALUES (@nuevoCabina);
            END
        END

        SELECT TOP 1 @tripulacionCabina1 = id FROM @tripulacionCabina ORDER BY NEWID();
        SELECT TOP 1 @tripulacionCabina2 = id FROM @tripulacionCabina WHERE id <> @tripulacionCabina1 ORDER BY NEWID();
        SELECT TOP 1 @tripulacionCabina3 = id FROM @tripulacionCabina WHERE id NOT IN (@tripulacionCabina1, @tripulacionCabina2) ORDER BY NEWID();
        SELECT TOP 1 @tripulacionCabina4 = id FROM @tripulacionCabina WHERE id NOT IN (@tripulacionCabina1, @tripulacionCabina2, @tripulacionCabina3) ORDER BY NEWID();
        SELECT TOP 1 @tripulacionCabina5 = id FROM @tripulacionCabina WHERE id NOT IN (@tripulacionCabina1, @tripulacionCabina2, @tripulacionCabina3, @tripulacionCabina4) ORDER BY NEWID();
        SELECT TOP 1 @tripulacionCabina6 = id FROM @tripulacionCabina WHERE id NOT IN (@tripulacionCabina1, @tripulacionCabina2, @tripulacionCabina3, @tripulacionCabina4, @tripulacionCabina5) ORDER BY NEWID();

        -- Mecánico (valores entre 96 y 110)
        SET @mecanico = 96 + (ABS(CHECKSUM(NEWID())) % 15);

        -- Despachador de vuelo (valores entre 61 y 66)
        SET @despachadorVuelo = 61 + (ABS(CHECKSUM(NEWID())) % 6);

        -- Insertar el registro en la tabla Tripulacion
        INSERT INTO Tripulacion (
            id_Vuelo, 
            piloto, 
            copiloto, 
            tripulacion_cabina_1, 
            tripulacion_cabina_2, 
            tripulacion_cabina_3, 
            tripulacion_cabina_4, 
            tripulacion_cabina_5, 
            tripulacion_cabina_6, 
            mecanico, 
            despachador_vuelo
        )
        VALUES (
            @idVuelo, 
            @piloto, 
            @copiloto, 
            @tripulacionCabina1, 
            @tripulacionCabina2, 
            @tripulacionCabina3, 
            @tripulacionCabina4, 
            @tripulacionCabina5, 
            @tripulacionCabina6, 
            @mecanico, 
            @despachadorVuelo
        );

        -- Obtener el siguiente registro de Vuelo
        FETCH NEXT FROM cursorVuelo INTO @idVuelo;
    END

    -- Cerrar y desasociar el cursor
    CLOSE cursorVuelo;
    DEALLOCATE cursorVuelo;
END;

execute PoblarTripulacion


 -- AsientoDisponible  9--

CREATE PROCEDURE PoblarAsientoDisponible
AS
BEGIN
    DECLARE @id_Vuelo INT;
    DECLARE @id_NumeroVuelo INT;
    DECLARE @id_Aeronave INT;
    DECLARE @id_ModeloAeronave INT;
    DECLARE @cantidadAsientos INT;
    DECLARE @id_Asientos INT;
    DECLARE @estadoAsiento VARCHAR(1);
    DECLARE @contador INT;

    -- Cursor para recorrer cada vuelo en la tabla Vuelo
    DECLARE cursor_vuelos CURSOR FOR 
    SELECT V.id_Vuelo, NV.id_NumeroVuelo, A.id_Aeronave, A.id_ModeloAeronave
    FROM Vuelo V
    INNER JOIN NumeroVuelo NV ON V.id_NumeroVuelo = NV.id_NumeroVuelo
    INNER JOIN Aeronave A ON NV.id_Aeronave = A.id_Aeronave;

    OPEN cursor_vuelos;
    FETCH NEXT FROM cursor_vuelos INTO @id_Vuelo, @id_NumeroVuelo, @id_Aeronave, @id_ModeloAeronave;

    -- Procesar cada vuelo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Determinar la cantidad de asientos según el modelo de aeronave
        IF @id_ModeloAeronave = 1
            SET @cantidadAsientos = 180; -- Asientos para el modelo de aeronave 1
        ELSE IF @id_ModeloAeronave = 2
            SET @cantidadAsientos = 150; -- Asientos para el modelo de aeronave 2
        ELSE
            SET @cantidadAsientos = 150; -- Suponiendo un tercer modelo con 150 asientos

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
        FETCH NEXT FROM cursor_vuelos INTO @id_Vuelo, @id_NumeroVuelo, @id_Aeronave, @id_ModeloAeronave;
    END

    -- Cerrar y liberar el cursor
    CLOSE cursor_vuelos;
    DEALLOCATE cursor_vuelos;
END;


execute PoblarAsientoDisponible


 -- TipoCliente    *--

INSERT INTO TipoCliente (descripcion) VALUES ('economico');
INSERT INTO TipoCliente (descripcion) VALUES ('ejecutivo');
INSERT INTO TipoCliente (descripcion) VALUES ('premiun');
INSERT INTO TipoCliente (descripcion) VALUES ('primera clase');
INSERT INTO TipoCliente (descripcion) VALUES ('Platinium');



 -- TipoDocumento  *--

INSERT INTO TipoDocumento (descripcion) VALUES ('Pasaporte');
INSERT INTO TipoDocumento (descripcion) VALUES ('DNI');
INSERT INTO TipoDocumento (descripcion) VALUES ('Licencia de Conducir');
INSERT INTO TipoDocumento (descripcion) VALUES ('Tarjeta de Residencia');


 -- DocumentoIdentidad     10--

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


 -- Cliente    *----

BULK INSERT Cliente
FROM 'C:\Users\Lenovo\Downloads\clientes-aerolinea2.txt'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Ignorar el encabezado
    TABLOCK
);



 -- TipoPago   *--

INSERT INTO TipoPago(descripcion) VALUES ('Efectivo'),
INSERT INTO TipoPago(descripcion) VALUES ('Tarjeta de Crédito'),
INSERT INTO TipoPago(descripcion) VALUES ('Tarjeta de Débito'),
INSERT INTO TipoPago(descripcion) VALUES ('Transferencia Bancaria'),
INSERT INTO TipoPago(descripcion) VALUES ('Cheque'),
INSERT INTO TipoPago(descripcion) VALUES ('PayPal'),
INSERT INTO TipoPago(descripcion) VALUES ('Criptomoneda'),
INSERT INTO TipoPago(descripcion) VALUES ('Pago Móvil');


 -- CanalPago  *--

INSERT INTO CanalPago(descripcion, plataforma) VALUES  ('pago realizado', 'Mostrador'),
INSERT INTO CanalPago(descripcion, plataforma) VALUES  ('pago realizado', 'Web'),
INSERT INTO CanalPago(descripcion, plataforma) VALUES  ('pago realizado', 'Móvil');


 -- Moneda     *--

INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Dólar Estadounidense', 'USD'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Euro', 'EUR'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Yen Japonés', 'JPY'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Libra Esterlina', 'GBP'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Peso Mexicano', 'MXN'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Real Brasileño', 'BRL'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Peso Argentino', 'ARS'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Franco Suizo', 'CHF'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Dólar Canadiense', 'CAD'),
INSERT INTO moneda (descripcion, nombre_moneda) VALUES ('Rupia India', 'INR');


 -- MotivoPago *--

INSERT INTO MotivoPago(motivo_pago)VALUES('Reserva');
INSERT INTO MotivoPago(motivo_pago)VALUES('Equipaje');
INSERT INTO MotivoPago(motivo_pago)VALUES('alimentos');
INSERT INTO MotivoPago(motivo_pago)VALUES('encomienda');


 -- EstadoReserva  *--

INSERT INTO EstadoReserva(estado_reserva)VALUES('Reservado');
INSERT INTO EstadoReserva(estado_reserva)VALUES('Cancelado');


 -- Reservas   11--

CREATE PROCEDURE PoblarReservas
AS
BEGIN
    DECLARE @total_asientos INT = 907530;
    DECLARE @id_Cliente INT;
    DECLARE @cantidad_asientos INT;
    DECLARE @id_EstadoReserva INT;

    -- Configuración de las cantidades específicas de cada tipo de asiento
    DECLARE @asientos_1 INT = @total_asientos - (272259 + 226882 + 181506); -- Asientos con valor 1
    DECLARE @asientos_2 INT = 272259; -- Asientos con valor 2
    DECLARE @asientos_3 INT = 226882; -- Asientos con valor 3
    DECLARE @asientos_4 INT = 181506; -- Asientos con valor 4

    -- Cursor para obtener los ids de los clientes
    DECLARE cursor_clientes CURSOR FOR 
    SELECT id_Cliente FROM Cliente
    ORDER BY NEWID(); -- Obtener clientes en orden aleatorio

    OPEN cursor_clientes;

    -- Iterar mientras aún tengamos asientos disponibles por asignar
    WHILE @total_asientos > 0
    BEGIN
        FETCH NEXT FROM cursor_clientes INTO @id_Cliente;
        
        IF @@FETCH_STATUS <> 0
        BEGIN
            -- Reiniciar el cursor si ya no hay clientes disponibles
            CLOSE cursor_clientes;
            OPEN cursor_clientes;
            FETCH NEXT FROM cursor_clientes INTO @id_Cliente;
        END

        -- Asignar aleatoriamente cantidad de asientos según las cantidades restantes
        DECLARE @random INT = ABS(CHECKSUM(NEWID()) % 100);

        IF @random < 10 AND @asientos_4 > 0 
        BEGIN
            SET @cantidad_asientos = 4;
            SET @asientos_4 -= 1;
        END
        ELSE IF @random < 30 AND @asientos_3 > 0 
        BEGIN
            SET @cantidad_asientos = 3;
            SET @asientos_3 -= 1;
        END
        ELSE IF @random < 60 AND @asientos_2 > 0 
        BEGIN
            SET @cantidad_asientos = 2;
            SET @asientos_2 -= 1;
        END
        ELSE
        BEGIN
            SET @cantidad_asientos = 1;
            SET @asientos_1 -= 1;
        END

        -- Calcular el estado de reserva con un 96% probabilidad de ser 1 y un 4% de ser 2
        SET @id_EstadoReserva = CASE 
                                    WHEN ABS(CHECKSUM(NEWID()) % 100) < 96 THEN 1 
                                    ELSE 2 
                                END;

        -- Insertar en Reservas con los datos generados
        INSERT INTO Reservas (id_Cliente, fecha_reserva, cantidad_asientos, monto, id_EstadoReserva)
        VALUES (@id_Cliente, NULL, @cantidad_asientos, NULL, @id_EstadoReserva);

        -- Restar la cantidad de asientos asignada del total restante
        SET @total_asientos -= @cantidad_asientos;
    END

    -- Cerrar y liberar el cursor
    CLOSE cursor_clientes;
    DEALLOCATE cursor_clientes;
END;




execute PoblarReservas


 -- DetalleReserva 12--

CREATE PROCEDURE PoblarDetalleReserva
AS
BEGIN
    DECLARE @id_Reservas INT;
    DECLARE @cantidad_asientos INT;
    DECLARE @id_AsientoDisponible INT;
    DECLARE @PrecioUnitario INT;
    DECLARE @descripcion VARCHAR(100) = 'Detalle de Reserva';
    DECLARE @monto_total INT;
    DECLARE @fecha_reserva DATE;

    -- Cursor para recorrer cada reserva en la tabla Reservas
    DECLARE cursor_reservas CURSOR FOR 
    SELECT id_Reservas, cantidad_asientos 
    FROM Reservas;

    -- Cursor para recorrer cada asiento disponible
    DECLARE cursor_asientos CURSOR FOR
    SELECT AD.id_AsientoDisponible, V.fecha_vuelo
    FROM AsientoDisponible AD
    INNER JOIN Vuelo V ON AD.id_Vuelo = V.id_Vuelo
    ORDER BY AD.id_AsientoDisponible;

    OPEN cursor_reservas;
    OPEN cursor_asientos;

    -- Procesar cada reserva
    FETCH NEXT FROM cursor_reservas INTO @id_Reservas, @cantidad_asientos;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @monto_total = 0;

        -- Generar los detalles de reserva según la cantidad de asientos de cada reserva
        DECLARE @contador INT = 0;
        WHILE @contador < @cantidad_asientos
        BEGIN
            -- Obtener el siguiente asiento disponible y su fecha de vuelo
            FETCH NEXT FROM cursor_asientos INTO @id_AsientoDisponible, @fecha_reserva;

            -- Generar un precio unitario aleatorio entre 200 y 700
            SET @PrecioUnitario = 200 + ABS(CHECKSUM(NEWID()) % 501);

            -- Insertar en DetalleReserva
            INSERT INTO DetalleReserva (id_AsientoDisponible, id_Reservas, PrecioUnitario, descripcion)
            VALUES (@id_AsientoDisponible, @id_Reservas, @PrecioUnitario, @descripcion);

            -- Acumular el monto total para la reserva
            SET @monto_total += @PrecioUnitario;

            SET @contador = @contador + 1;
        END

        -- Actualizar el campo monto y fecha_reserva en la tabla Reservas
        UPDATE Reservas
        SET monto = @monto_total, fecha_reserva = @fecha_reserva
        WHERE id_Reservas = @id_Reservas;

        -- Pasar a la siguiente reserva
        FETCH NEXT FROM cursor_reservas INTO @id_Reservas, @cantidad_asientos;
    END

    -- Cerrar y liberar los cursores
    CLOSE cursor_reservas;
    DEALLOCATE cursor_reservas;
    
    CLOSE cursor_asientos;
    DEALLOCATE cursor_asientos;
END;


execute PoblarDetalleReserva


-- Pago ****reservas--


CREATE PROCEDURE PoblarPago
AS
BEGIN
    DECLARE @id_Reservas INT;
    DECLARE @id_Cliente INT;
    DECLARE @monto DECIMAL(10, 2);
    DECLARE @fecha_pago DATE;
    DECLARE @id_TipoPago INT;
    DECLARE @id_CanalPago INT;
    DECLARE @id_Moneda INT;
    DECLARE @id_MotivoPago INT = 1;

    -- Cursor para recorrer las reservas con estado = 1
    DECLARE cursor_reservas CURSOR FOR
    SELECT id_Reservas, id_Cliente, monto, fecha_reserva
    FROM Reservas
    WHERE id_EstadoReserva = 1;

    OPEN cursor_reservas;

    FETCH NEXT FROM cursor_reservas INTO @id_Reservas, @id_Cliente, @monto, @fecha_pago;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Seleccionar aleatoriamente un id_TipoPago de la tabla TipoPago
        SELECT TOP 1 @id_TipoPago = id_TipoPago
        FROM TipoPago
        ORDER BY NEWID();

        -- Seleccionar aleatoriamente un id_CanalPago de la tabla CanalPago
        SELECT TOP 1 @id_CanalPago = id_CanalPago
        FROM CanalPago
        ORDER BY NEWID();

        -- Seleccionar aleatoriamente un id_Moneda de la tabla Moneda
        SELECT TOP 1 @id_Moneda = id_Moneda
        FROM Moneda
        ORDER BY NEWID();

        -- Insertar el registro de pago con los datos obtenidos
        INSERT INTO Pago (id_Cliente, id_TipoPago, id_CanalPago, id_Moneda, id_MotivoPago, monto, fecha_pago)
        VALUES (@id_Cliente, @id_TipoPago, @id_CanalPago, @id_Moneda, @id_MotivoPago, @monto, @fecha_pago);

        -- Pasar a la siguiente reserva
        FETCH NEXT FROM cursor_reservas INTO @id_Reservas, @id_Cliente, @monto, @fecha_pago;
    END

    -- Cerrar y liberar el cursor
    CLOSE cursor_reservas;
    DEALLOCATE cursor_reservas;
END;


execute PoblarPago


--pago ***otros pagos 


 CREATE PROCEDURE PoblarPagoAleatorio2
AS
BEGIN
    DECLARE @id_Cliente INT;
    DECLARE @id_TipoPago INT;
    DECLARE @id_CanalPago INT;
    DECLARE @id_Moneda INT;
    DECLARE @id_MotivoPago INT;
    DECLARE @monto DECIMAL(10, 2);
    DECLARE @fecha_pago DATE;

    -- Obtener el rango de fechas de pago previas
    DECLARE @fecha_min DATE;
    DECLARE @fecha_max DATE;

    SELECT @fecha_min = MIN(fecha_pago), @fecha_max = MAX(fecha_pago)
    FROM Pago;

    -- Si no hay fechas previas, usar fechas por defecto
    IF @fecha_min IS NULL OR @fecha_max IS NULL
    BEGIN
        SET @fecha_min = '2023-01-01';
        SET @fecha_max = GETDATE();
    END

    -- Generar 100 registros aleatorios para pagos
    DECLARE @contador INT = 1;

    WHILE @contador <= 5231
    BEGIN
        -- Seleccionar aleatoriamente un id_Cliente de la tabla Cliente
        SELECT TOP 1 @id_Cliente = id_Cliente
        FROM Cliente
        ORDER BY NEWID();

        -- Seleccionar aleatoriamente un id_TipoPago de la tabla TipoPago
        SELECT TOP 1 @id_TipoPago = id_TipoPago
        FROM TipoPago
        ORDER BY NEWID();

        -- Seleccionar aleatoriamente un id_CanalPago de la tabla CanalPago
        SELECT TOP 1 @id_CanalPago = id_CanalPago
        FROM CanalPago
        ORDER BY NEWID();

        -- Seleccionar aleatoriamente un id_Moneda de la tabla Moneda
        SELECT TOP 1 @id_Moneda = id_Moneda
        FROM Moneda
        ORDER BY NEWID();

        -- Seleccionar aleatoriamente un id_MotivoPago de la tabla MotivoPago (diferente de 1)
        SELECT TOP 1 @id_MotivoPago = id_MotivoPago
        FROM MotivoPago
        WHERE id_MotivoPago != 1
        ORDER BY NEWID();

        -- Generar un monto aleatorio entre 50 y 300
        SET @monto = ROUND((RAND() * (300 - 50) + 50), 2);

        -- Generar una fecha de pago aleatoria dentro del rango de fechas anteriores
        SET @fecha_pago = DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, @fecha_min, @fecha_max)), @fecha_min);

        -- Insertar el registro de pago con los valores generados aleatoriamente
        INSERT INTO Pago (id_Cliente, id_TipoPago, id_CanalPago, id_Moneda, id_MotivoPago, monto, fecha_pago)
        VALUES (@id_Cliente, @id_TipoPago, @id_CanalPago, @id_Moneda, @id_MotivoPago, @monto, @fecha_pago);

        -- Incrementar el contador
        SET @contador = @contador + 1;
    END
END;


execute PoblarPagoAleatorio2





