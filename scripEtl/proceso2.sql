CREATE PROCEDURE PopulatePayments
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 1;
    DECLARE @id_customer INT;
    DECLARE @id_paymentType INT;
    DECLARE @id_paymentChannel INT;
    DECLARE @id_moneda INT;
    DECLARE @monto DECIMAL(10, 2);
    DECLARE @fecha_pago DATE;
    DECLARE @estatus VARCHAR(20);

    WHILE @i <= 1000
    BEGIN
        -- Seleccionar aleatoriamente un id_customer existente
        SET @id_customer = (SELECT TOP 1 id_customer FROM customer ORDER BY NEWID());

        -- Seleccionar aleatoriamente un id_paymentType existente
        SET @id_paymentType = (SELECT TOP 1 id_paymentType FROM paymentType ORDER BY NEWID());

        -- Seleccionar aleatoriamente un id_paymentChannel existente
        SET @id_paymentChannel = (SELECT TOP 1 id_paymentChannel FROM paymentChannel ORDER BY NEWID());

        -- Seleccionar aleatoriamente un id_moneda existente
        SET @id_moneda = (SELECT TOP 1 id_moneda FROM moneda ORDER BY NEWID());

        -- Generar un monto aleatorio entre 500 y 1000
        SET @monto = 500 + (ABS(CHECKSUM(NEWID())) % 501) + CAST(RAND() AS DECIMAL(10, 2));

        -- Generar una fecha de pago aleatoria entre los años 2019 y 2023
        DECLARE @anio_pago INT = 2019 + (ABS(CHECKSUM(NEWID())) % 5);  -- Año entre 2019 y 2023
        DECLARE @mes_pago INT = 1 + (ABS(CHECKSUM(NEWID())) % 12);     -- Mes entre 1 y 12
        DECLARE @dia_pago INT = 1 + (ABS(CHECKSUM(NEWID())) % 28);     -- Día entre 1 y 28

        SET @fecha_pago = CAST(CONCAT(@anio_pago, '-', @mes_pago, '-', @dia_pago) AS DATE);

        -- Generar un estatus de pago aleatorio
        SET @estatus = (SELECT TOP 1 estatus FROM (VALUES ('Completado'), ('Pendiente'), ('Fallido')) AS estados(estatus) ORDER BY NEWID());

        -- Insertar el registro en la tabla payments
        INSERT INTO payments (id_customer, id_paymentType, id_paymentChannel, id_moneda, monto, fecha_pago, estatus)
        VALUES (@id_customer, @id_paymentType, @id_paymentChannel, @id_moneda, @monto, @fecha_pago, @estatus);

        -- Incrementar el contador
        SET @i = @i + 1;
    END
END;
