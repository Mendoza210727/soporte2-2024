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
        INSERT INTO identityDocument (numero_documento, fecha_nacimiento, id_ciudad, id_pais, id_TipoDocumento, fecha_emision, fecha_vencimiento)
        VALUES (@numero_documento, @fecha_nacimiento, @id_city, @id_country, @id_documentType, @fecha_emision, @fecha_vencimiento);

        -- Incrementar el contador
        SET @i = @i + 1;
    END
END;
