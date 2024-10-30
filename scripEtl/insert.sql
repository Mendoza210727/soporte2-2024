

-- insert paises --
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Bolivia', 'Boliviano');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Argentina', 'Argentino');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Brasil', 'Brasileño');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Chile', 'Chileno');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Colombia', 'Colombiano');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Perú', 'Peruano');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Paraguay', 'Paraguayo');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Uruguay', 'Uruguayo');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Ecuador', 'Ecuatoriano');
INSERT INTO country (nombre_pais, nacionalidad) VALUES ('Venezuela', 'Venezolano');


-- Ciudades de Bolivia
INSERT INTO City (nombre_ciudad, id_country) VALUES ('La Paz', 1);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Santa Cruz de la Sierra', 1);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Cochabamba', 1);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Sucre', 1);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Oruro', 1);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Potosí', 1);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Tarija', 1);

-- Ciudades de Argentina
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Buenos Aires', 2);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Córdoba', 2);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Rosario', 2);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Mendoza', 2);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('La Plata', 2);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('San Miguel de Tucumán', 2);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Mar del Plata', 2);

-- Ciudades de Brasil
INSERT INTO City (nombre_ciudad, id_country) VALUES ('São Paulo', 3);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Río de Janeiro', 3);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Brasilia', 3);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Salvador', 3);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Fortaleza', 3);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Belo Horizonte', 3);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Manaos', 3);

-- Ciudades de Chile
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Santiago', 4);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Valparaíso', 4);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Concepción', 4);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('La Serena', 4);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Antofagasta', 4);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Temuco', 4);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Iquique', 4);

-- Ciudades de Colombia
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Bogotá', 5);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Medellín', 5);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Cali', 5);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Barranquilla', 5);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Cartagena', 5);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Bucaramanga', 5);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Pereira', 5);

-- Ciudades de Perú
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Lima', 6);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Arequipa', 6);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Trujillo', 6);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Chiclayo', 6);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Piura', 6);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Cusco', 6);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Iquitos', 6);

-- Ciudades de Paraguay
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Asunción', 7);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Ciudad del Este', 7);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Encarnación', 7);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('San Lorenzo', 7);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Lambaré', 7);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Fernando de la Mora', 7);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Capiatá', 7);

-- Ciudades de Uruguay
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Montevideo', 8);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Salto', 8);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Paysandú', 8);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Las Piedras', 8);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Rivera', 8);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Maldonado', 8);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Tacuarembó', 8);

-- Ciudades de Ecuador
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Quito', 9);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Guayaquil', 9);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Cuenca', 9);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Santo Domingo', 9);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Machala', 9);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Durán', 9);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Ambato', 9);

-- Ciudades de Venezuela
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Caracas', 10);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Maracaibo', 10);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Valencia', 10);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Barquisimeto', 10);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Ciudad Guayana', 10);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Maturín', 10);
INSERT INTO City (nombre_ciudad, id_country) VALUES ('Maracay', 10);


---insert de  tipo de documentos 
INSERT INTO documentType (descripcion) VALUES ('Pasaporte');
INSERT INTO documentType (descripcion) VALUES ('DNI');
INSERT INTO documentType (descripcion) VALUES ('Licencia de Conducir');
INSERT INTO documentType (descripcion) VALUES ('Tarjeta de Residencia');


INSERT INTO customerType (descripcion) VALUES ('Nuevo');
INSERT INTO customerType (descripcion) VALUES ('Frecuente');
INSERT INTO customerType (descripcion) VALUES ('VIP');
INSERT INTO customerType (descripcion) VALUES ('Corporativo');
INSERT INTO customerType (descripcion) VALUES ('Estudiante');

INSERT INTO paymentType (descripcion)
VALUES 
    ('Efectivo'),
    ('Tarjeta de Crédito'),
    ('Tarjeta de Débito'),
    ('Transferencia Bancaria'),
    ('Cheque'),
    ('PayPal'),
    ('Criptomoneda'),
    ('Pago Móvil');

INSERT INTO paymentChannel (descripcion, plataforma)
VALUES 
    ('pago realizado', 'Mostrador'),
    ('pago realizado', 'Web'),
    ('pago realizado', 'Móvil'),

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
