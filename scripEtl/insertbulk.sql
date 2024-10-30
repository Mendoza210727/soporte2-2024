BULK INSERT customer
FROM 'C:\Users\Lenovo\Downloads\clientes-aerolinea2.txt'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Ignorar el encabezado
    TABLOCK
);