--tabla ModeloAeronave--
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Airbus A320', 100);
INSERT INTO ModeloAeronave (modelo, cantidad_asientos) VALUES ('Boeing 737-800', 120);
--tabla Aeronave--
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
--tabla TipoEmpleado--
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
---tabla Empleados---


BULK INSERT Empleados
FROM 'C:\Users\Lenovo\Downloads\empleados-aerolinea2.txt'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Ignorar el encabezado
    TABLOCK
);

--tabla PlanillaSueldos y tabla DetallePlanillaSueldos--
CREATE PROCEDURE PoblarPlanillaSueldosYDetalle
AS
BEGIN
    DECLARE @fecha_pago DATE = '2019-02-10';
    DECLARE @fecha_final DATE = '2022-12-10';
    DECLARE @monto_total INT;
    DECLARE @id_PlanillaSueldos INT;
    DECLARE @id_Empleado INT;
    DECLARE @salario INT;

    -- Bucle para crear una planilla mensual desde febrero de 2019 hasta diciembre de 2022
    WHILE @fecha_pago <= @fecha_final
    BEGIN
        -- Inicializar el monto total para la planilla del mes actual
        SET @monto_total = 0;

        -- Insertar un registro en PlanillaSueldos con la fecha de pago actual
        INSERT INTO PlanillaSueldos (fecha_pago, monto)
        VALUES (@fecha_pago, 0);

        -- Obtener el ID de la planilla de sueldos recién creada
        SET @id_PlanillaSueldos = SCOPE_IDENTITY();

        -- Cursor para recorrer los empleados y poblar DetallePlanillaSueldos
        DECLARE EmpleadoCursor CURSOR FOR
            SELECT id_Empleado, saladrio
            FROM Empleados;

        OPEN EmpleadoCursor;
        FETCH NEXT FROM EmpleadoCursor INTO @id_Empleado, @salario;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Insertar en DetallePlanillaSueldos el salario correspondiente de cada empleado
            INSERT INTO DetallePlanillaSueldos (id_PlanillaSueldos, id_Empleado, salario)
            VALUES (@id_PlanillaSueldos, @id_Empleado, @salario);

            -- Sumar el salario al monto total de la planilla
            SET @monto_total = @monto_total + @salario;

            FETCH NEXT FROM EmpleadoCursor INTO @id_Empleado, @salario;
        END;

        CLOSE EmpleadoCursor;
        DEALLOCATE EmpleadoCursor;

        -- Actualizar el monto total en la tabla PlanillaSueldos
        UPDATE PlanillaSueldos
        SET monto = @monto_total
        WHERE id_PlanillaSueldos = @id_PlanillaSueldos;

        -- Avanzar al siguiente mes para el 10 de ese mes
        SET @fecha_pago = DATEADD(MONTH, 1, @fecha_pago);
    END;
END;


execute PoblarPlanillaSueldosYDetalle


--tabla de  repuestos--
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Alerón', 5000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Motor Turbofán', 150000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Turbina de escape', 30000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Compresor de aire', 25000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Bujía de encendido', 200);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Filtro de aceite', 150);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Filtro de combustible', 180);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Asiento de cabina', 700);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de control de vuelo', 25000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Caja de herramientas', 300);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Unidad de potencia auxiliar', 80000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Caja de cambios', 20000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de frenos', 15000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Cámara de aire', 100);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema hidráulico', 12000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Neumático', 1200);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Hélice', 10000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de deshielo', 4000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Parabrisas', 5000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Pantalla de navegación', 8000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Radar meteorológico', 15000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Antena de comunicación', 2000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de oxígeno', 4000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Iluminación de cabina', 1200);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Panel de control de vuelo', 9000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Actuador de flaps', 3000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Válvula de escape', 800);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Controlador de presión', 2000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Tubo de escape', 1500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Filtro de aire', 200);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Tanque de combustible', 10000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Tornillo de fijación', 50);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Ala de repuesto', 200000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Turbina auxiliar', 70000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Paracaídas de emergencia', 3000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Ventana de cabina', 1200);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Equipo de navegación', 15000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de detección de hielo', 5000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Cámara de aterrizaje', 2500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Kit de emergencia', 1000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sensor de presión', 800);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de escape de emergencia', 7000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Dispositivo de iluminación de emergencia', 1200);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Palanca de mando', 3000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de radar', 20000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Cinturón de seguridad', 150);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Módulo de comunicación', 6000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Refrigerador de cabina', 500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Receptor de GPS', 4500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de iluminación exterior', 3000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Kit de reparación de fuselaje', 2000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Panel de instrumentos', 12000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Botón de control de cabina', 150);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de aviso de proximidad', 18000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Extintor de cabina', 500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Cableado eléctrico', 250);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de monitoreo de combustible', 5000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Manguera hidráulica', 400);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Unidad de presurización', 7500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de audio', 2000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Reemplazo de fusible', 30);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Pantalla de cabina', 7000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Filtro de cabina', 300);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sensor de altitud', 4000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Batería de respaldo', 1500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Sistema de ventilación', 2000);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Rueda de repuesto', 2500);
INSERT INTO Repuesto (nombre_repuesto, precio) VALUES ('Repuesto de amortiguador', 1200);

--tablas Mantenimiento y detalleMantenimiento--


CREATE PROCEDURE PoblarMantenimientos
AS
BEGIN
    DECLARE @year INT = 2019;
    DECLARE @fecha_mantenimiento DATE;
    DECLARE @fecha_entrega DATE;
    DECLARE @id_Aeronave INT;
    DECLARE @id_Empleado INT;
    DECLARE @cantidad INT;
    DECLARE @id_Repuesto INT;
    DECLARE @costo_mantenimiento INT;
    DECLARE @id_Mantenimiento INT;
    DECLARE @total_repuestos INT;
    DECLARE @precio INT;
    DECLARE @repuestos_por_mantenimiento INT;
    
    -- Recorre los años desde 2019 hasta 2022
    WHILE @year <= 2022
    BEGIN
        -- Itera por cada aeronave registrada en la tabla Aeronave
        DECLARE aeronave_cursor CURSOR FOR 
        SELECT id_Aeronave FROM Aeronave;
        
        OPEN aeronave_cursor;
        
        FETCH NEXT FROM aeronave_cursor INTO @id_Aeronave;
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Genera entre 4 y 7 mantenimientos para la aeronave en el año
            DECLARE @mantenimientos_por_año INT = ABS(CHECKSUM(NEWID()) % 4) + 4;
            
            WHILE @mantenimientos_por_año > 0
            BEGIN
                -- Genera fecha de mantenimiento aleatoria en el año
                SET @fecha_mantenimiento = DATEFROMPARTS(@year, ABS(CHECKSUM(NEWID()) % 12) + 1, ABS(CHECKSUM(NEWID()) % 28) + 1);
                SET @fecha_entrega = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 5) + 1, @fecha_mantenimiento);
                
                -- Selecciona un empleado aleatorio para el mantenimiento
                SELECT TOP 1 @id_Empleado = id_Empleado 
                FROM Empleados 
                ORDER BY NEWID();
                
                -- Inserta el mantenimiento en la tabla Mantenimientos
                INSERT INTO Mantenimientos (fecha_mantenimiento, fecha_entrega, id_Empleado, id_Aeronave, costo_mantenimiento)
                VALUES (@fecha_mantenimiento, @fecha_entrega, @id_Empleado, @id_Aeronave, 0);
                
                -- Obtiene el ID del mantenimiento insertado
                SET @id_Mantenimiento = SCOPE_IDENTITY();
                
                -- Genera una cantidad aleatoria de repuestos entre 1 y 10 para el mantenimiento
                SET @repuestos_por_mantenimiento = ABS(CHECKSUM(NEWID()) % 10) + 1;
                SET @costo_mantenimiento = 0;
                
                WHILE @repuestos_por_mantenimiento > 0
                BEGIN
                    -- Selecciona un repuesto aleatorio de la tabla Repuesto
                    SELECT TOP 1 @id_Repuesto = id_Repuesto, @precio = precio
                    FROM Repuesto 
                    ORDER BY NEWID();
                    
                    -- Genera una cantidad aleatoria de repuestos (entre 1 y 5)
                    SET @cantidad = ABS(CHECKSUM(NEWID()) % 5) + 1;
                    
                    -- Inserta el detalle de mantenimiento
                    INSERT INTO DetalleMantenimiento (cantidad, id_Repuesto, id_Mantenimiento)
                    VALUES (@cantidad, @id_Repuesto, @id_Mantenimiento);
                    
                    -- Calcula el costo acumulado de los repuestos en el mantenimiento
                    SET @costo_mantenimiento += @cantidad * @precio;
                    
                    SET @repuestos_por_mantenimiento = @repuestos_por_mantenimiento - 1;
                END
                
                -- Actualiza el costo total del mantenimiento
                UPDATE Mantenimientos
                SET costo_mantenimiento = @costo_mantenimiento
                WHERE id_Mantenimiento = @id_Mantenimiento;
                
                SET @mantenimientos_por_año = @mantenimientos_por_año - 1;
            END
            
            FETCH NEXT FROM aeronave_cursor INTO @id_Aeronave;
        END
        
        CLOSE aeronave_cursor;
        DEALLOCATE aeronave_cursor;
        
        SET @year = @year + 1;
    END
END;
 execute PoblarMantenimientos


--tabla asientos --
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


--tabla aeropuetos --

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

---tabla numero de vuelos y vuelos 


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

 --tabla asientos disponibles --


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



-- tipo cliente --

INSERT INTO TipoCliente (descripcion) VALUES ('economico');
INSERT INTO TipoCliente (descripcion) VALUES ('ejecutivo');
INSERT INTO TipoCliente (descripcion) VALUES ('premiun');
INSERT INTO TipoCliente (descripcion) VALUES ('primera clase');

--tabla tipo Documento --

INSERT INTO TipoDocumento (descripcion) VALUES ('Pasaporte');
INSERT INTO TipoDocumento (descripcion) VALUES ('DNI');
INSERT INTO TipoDocumento (descripcion) VALUES ('Licencia de Conducir');
INSERT INTO TipoDocumento (descripcion) VALUES ('Tarjeta de Residencia');

--tabla docuemento de identidad --



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

--tabla clientes --


BULK INSERT Cliente
FROM 'C:\Users\Lenovo\Downloads\clientes-aerolinea2.txt'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Ignorar el encabezado
    TABLOCK
);

-- tipo de pago --

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

--tabla canal de pago--

INSERT INTO CanalPago(descripcion, plataforma)
VALUES 
    ('pago realizado', 'Mostrador'),
    ('pago realizado', 'Web'),
    ('pago realizado', 'Móvil');

--tabla moneda--

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

-- tablas reservas y detalle de reservas--

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
    DECLARE @monto INT;
    DECLARE @id_EstadoReserva INT;

    -- Asigna aleatoriamente un estado para la reserva
    SELECT TOP 1 @id_EstadoReserva = id_estadoReserva
    FROM EstadoReserva
    ORDER BY NEWID();

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

            -- Calcular el monto total de la reserva
            SET @monto = 0;

            -- Inserta la reserva en la tabla Reservas
            INSERT INTO Reservas (id_Cliente, fecha_reserva, cantidad, monto, id_EstadoReserva)
            VALUES (@id_Cliente, @fecha_reserva, @asientosParaEstaReserva, 0, @id_EstadoReserva);
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
                -- Generar el PrecioUnitario aleatorio entre 200 y 600 para el asiento
                SET @PrecioUnitario = ABS(CHECKSUM(NEWID()) % 401) + 200;

                -- Sumar al monto total de la reserva
                SET @monto += @PrecioUnitario;

                -- Insertar el detalle de la reserva
                INSERT INTO DetalleReserva (id_AsientoDisponible, id_Reservas, PrecioUnitario, descripcion)
                VALUES (@id_AsientoDisponible, @id_Reserva, @PrecioUnitario, @descripcion);

                -- Cambia el estado del asiento a ocupado en AsientoDisponible
                UPDATE AsientoDisponible 
                SET estadoAsiento = 'O'
                WHERE id_AsientoDisponible = @id_AsientoDisponible;

                FETCH NEXT FROM AsientoCursor INTO @id_AsientoDisponible;
            END;

            CLOSE AsientoCursor;
            DEALLOCATE AsientoCursor;

            -- Actualizar el monto total de la reserva en la tabla Reservas
            UPDATE Reservas
            SET monto = @monto
            WHERE id_Reservas = @id_Reserva;
        END;

        FETCH NEXT FROM VueloCursor INTO @id_Vuelo, @fecha_vuelo;
    END;

    CLOSE VueloCursor;
    DEALLOCATE VueloCursor;
END;



execute PoblarReservasYDetalleReserva


-- tabla pagos --



CREATE PROCEDURE PoblarPagos
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_Reserva INT;
    DECLARE @id_Cliente INT;
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
        SELECT R.id_Reservas, R.id_Cliente, R.fecha_reserva
        FROM Reservas R;

    OPEN ReservaCursor;
    FETCH NEXT FROM ReservaCursor INTO @id_Reserva, @id_Cliente, @fecha_reserva;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Calcular el monto sumando el precio unitario de los detalles de la reserva
        SELECT @monto = SUM(DR.PrecioUnitario)
        FROM DetalleReserva DR
        WHERE DR.id_Reservas = @id_Reserva;

        -- Seleccionar aleatoriamente un tipo de pago, canal de pago y moneda
        SELECT TOP 1 @id_TipoPago = id_TipoPago FROM TipoPago ORDER BY NEWID();
        SELECT TOP 1 @id_CanalPago = id_CanalPago FROM CanalPago ORDER BY NEWID();
        SELECT TOP 1 @id_Moneda = id_Moneda FROM Moneda ORDER BY NEWID();

        -- Generar una fecha de pago entre 1 a 3 días después de la fecha de reserva
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

        FETCH NEXT FROM ReservaCursor INTO @id_Reserva, @id_Cliente, @fecha_reserva;
    END;

    CLOSE ReservaCursor;
    DEALLOCATE ReservaCursor;
END;



execute PoblarPagos


--tabla Plan de Vuelos--



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