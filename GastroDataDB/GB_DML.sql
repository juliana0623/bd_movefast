-- CLIENTES
INSERT INTO cliente (id_cliente, nombre, apellido, observaciones) VALUES
(1, 'Manuel', 'Pedroza Gonzalez', 'Cliente frecuente'),
(2, 'Laura', 'Martínez Rivera', 'Primera visita'),
(3, 'Carlos', 'Gómez Pérez', 'Vegetariano'),
(4, 'Lucía', 'Ramírez Soto', 'Recomendado'),
(5, 'Pedro', 'López Fernández', 'Le gusta el marisco'),
(6, 'Marta', 'Suárez Jiménez', 'Cliente nuevo'),
(7, 'Andrés', 'Vargas Salas', 'Festejo'),
(8, 'Fernanda', 'Ruiz Méndez', 'Vegetariana'),
(9, 'Sofía', 'Castillo Duarte', 'Sin gluten'),
(10, 'José', 'Paredes Nieto', 'Cliente frecuente');

-- MESEROS
INSERT INTO mesero (id_mesero, nombre, apellido1, apellido2) VALUES
(1, 'José', 'Ramírez', 'López'),
(2, 'Ana', 'Hernández', 'Castro'),
(3, 'Luis', 'Torres', 'Martínez'),
(4, 'María', 'Pérez', 'Santos'),
(5, 'Jorge', 'Luna', 'García'),
(6, 'Elena', 'Rodríguez', 'Morales'),
(7, 'Miguel', 'Fernández', 'Delgado'),
(8, 'Paula', 'Núñez', 'Herrera'),
(9, 'Cristina', 'Ríos', 'Ortiz'),
(10, 'David', 'Mendoza', 'Vega');

-- PLATILLOS
INSERT INTO platillo (id_platillo, nombre, importe) VALUES
(1, 'Arroz a la marinera', 250000),
(2, 'Filete de res', 350000),
(3, 'Ensalada César', 120000),
(4, 'Pollo a la plancha', 180000),
(5, 'Sopa de mariscos', 320000),
(6, 'Pasta carbonara', 150000),
(7, 'Paella valenciana', 280000),
(8, 'Taco de camarón', 90000),
(9, 'Ceviche mixto', 220000),
(10, 'Hamburguesa especial', 130000);

-- BEBIDAS
INSERT INTO bebida (id_bebida, nombre, importe) VALUES
(1, 'Vino tinto', 100000),
(2, 'Agua mineral', 50000),
(3, 'Refresco', 40000),
(4, 'Cerveza artesanal', 60000),
(5, 'Té helado', 30000),
(6, 'Jugo natural', 45000),
(7, 'Café americano', 35000),
(8, 'Mojito', 70000),
(9, 'Limonada', 40000),
(10, 'Whisky', 120000);

-- MESAS
INSERT INTO mesa (id_mesa, num_comensales, ubicacion) VALUES
(10, 4, 'Segundo piso'),
(11, 2, 'Primer piso'),
(12, 6, 'Terraza'),
(13, 3, 'Segundo piso'),
(14, 2, 'Jardín interior'),
(15, 5, 'Primer piso'),
(16, 1, 'Barra'),
(17, 4, 'Segundo piso'),
(18, 6, 'Terraza'),
(19, 3, 'Salón privado');

-- FACTURAS
INSERT INTO factura (id_factura, fecha_factura, id_cliente, id_mesero, id_mesa, id_platillo, id_bebida) VALUES
(1, '2025-04-01', 1, 1, 10, 1, 1), 
(2, '2025-04-02', 2, 2, 11, 2, 2),
(3, '2025-04-03', 3, 3, 13, 3, 3),
(4, '2025-04-04', 4, 4, 14, 4, 4),
(5, '2025-04-05', 5, 5, 15, 5, 5), 
(6, '2025-04-06', 6, 6, 16, 6, 6),
(7, '2025-04-07', 7, 7, 17, 7, 7),
(8, '2025-04-08', 8, 8, 18, 8, 8),
(9, '2025-04-09', 9, 9, 19, 9, 9),
(10, '2025-04-10', 10, 10, 11, 10, 10),
(11, '2025-04-11', 1, 1, 10, 2, 1), 
(12, '2025-04-12', 1, 2, 10, 1, 2); 
