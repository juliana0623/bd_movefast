-- verificación de ON DELETE CASCADE
INSERT INTO cliente (cliente_id, nombre, apellido, correo)
VALUES (1,'Juan', 'Pérez', 'juanprueba@correo.com');

INSERT INTO sucursal (sucursal_id, nombre, ciudad, direccion)
VALUES (1, 'Sucursal Temporal', 'Cali', 'Calle 100 #10-10');

INSERT INTO vehiculo (placa_vehiculo, marca, modelo, esta_disponible, sucursal_id)
VALUES ('DEL123', 'Chevrolet', 2022, TRUE, 1);

INSERT INTO alquiler (alquiler_id, fecha_inicio, fecha_fin, cliente_id, placa_vehiculo)
VALUES (1,'2025-06-01', '2025-06-05', 1, 'DEL123');

-- verificación de ON UPDATE CASCADE
INSERT INTO sucursal (sucursal_id, nombre, ciudad, direccion)
VALUES (2, 'Sucursal Cascada', 'Medellín', 'Cra 20 #30-40');

INSERT INTO vehiculo (placa_vehiculo, marca, modelo, esta_disponible, sucursal_id)
VALUES ('CAS123', 'Kia', 2023, TRUE, 2);

-- verificacion CHECK
INSERT INTO vehiculo (placa_vehiculo, marca, modelo, esta_disponible, sucursal_id)
VALUES ('INV199', 'Fiat', 1999, TRUE, 1); -- da error

--Pruebas de restricciones adicionales

-- verificación llave primaria
-- Intentar insertar un cliente con el mismo ID (duplicado)
INSERT INTO cliente (cliente_id, nombre, apellido, correo) 
VALUES (1, 'Juan', 'Pérez', 'juan.perez@email.com');

-- Intentar insertar un segundo cliente con el mismo ID (1), lo cual debería fallar y efectivamente, si falla
INSERT INTO cliente (cliente_id, nombre, apellido, correo) 
VALUES (1, 'Carlos', 'López', 'carlos.lopez@email.com');

-- verificacion unique en correo
-- insertar un cliente con un correo específico
INSERT INTO cliente (cliente_id, nombre, apellido, correo) 
VALUES (1, 'Ana', 'González', 'ana.gonzalez@email.com');

-- Intentar insertar un segundo cliente con el mismo correo (da error)
INSERT INTO cliente (cliente_id, nombre, apellido, correo) 
VALUES (2, 'Luis', 'Martínez', 'ana.gonzalez@email.com');


-- eliminar registros de las pruebas para ingresar los registros de las consultas desde cero
DELETE FROM pago;
DELETE FROM alquiler;
DELETE FROM vehiculo;
DELETE FROM cliente;
DELETE FROM sucursal;

-- insercion de registros
-- Clientes
INSERT INTO cliente (cliente_id, nombre, apellido, correo) VALUES
(1, 'Laura', 'García', 'laura@gmail.com'),
(2, 'Carlos', 'Ríos', 'carlos@gmail.com'),
(3, 'Ana', 'Torres', 'ana@gmail.com');

-- Sucursales
INSERT INTO sucursal (sucursal_id, nombre, ciudad, direccion) VALUES
(1, 'Sucursal Norte', 'Cali', 'Calle 10 #20-30'),
(2, 'Sucursal Sur', 'Cali', 'Cra 50 #80-12'),
(3, 'Sucursal Centro', 'Bogotá', 'Av 1 #45-67');

-- Vehículos
INSERT INTO vehiculo (placa_vehiculo, marca, modelo, esta_disponible, sucursal_id) VALUES
('AAA001', 'Toyota', 2022, TRUE, 1),
('BBB002', 'Mazda', 2021, TRUE, 2),
('CCC003', 'Chevrolet', 2020, FALSE, 1),
('DDD004', 'Kia', 2023, TRUE, 3),
('EEE005', 'Ford', 2022, FALSE, 2),
('FFF006', 'Nissan', 2021, TRUE, 1);

-- Alquileres del vehículo AAA001 (6)
INSERT INTO alquiler (alquiler_id, fecha_inicio, fecha_fin, esta_activo, cliente_id, placa_vehiculo) VALUES
(1, '2025-05-01', '2025-05-03', TRUE, 1, 'AAA001'),
(2, '2025-05-04', '2025-05-06', FALSE, 2, 'AAA001'),
(3, '2025-05-07', '2025-05-09', FALSE, 1, 'AAA001'),
(4, '2025-05-10', '2025-05-12', FALSE, 3, 'AAA001'),
(5, '2025-05-13', '2025-05-15', FALSE, 1, 'AAA001'),
(6, '2025-05-16', '2025-05-18', FALSE, 2, 'AAA001');

-- Alquileres del vehículo BBB002 (4)
INSERT INTO alquiler (alquiler_id, fecha_inicio, fecha_fin, esta_activo, cliente_id, placa_vehiculo) VALUES
(7, '2025-06-01', '2025-06-05', TRUE, 1, 'BBB002'),
(8, '2025-06-06', '2025-06-10', FALSE, 2, 'BBB002'),
(9, '2025-06-11', '2025-06-15', FALSE, 3, 'BBB002'),
(10, '2025-06-16', '2025-06-20', FALSE, 1, 'BBB002');

-- Alquileres del vehículo CCC003 (2)
INSERT INTO alquiler (alquiler_id, fecha_inicio, fecha_fin, esta_activo, cliente_id, placa_vehiculo) VALUES
(11, '2025-07-01', '2025-07-05', FALSE, 1, 'CCC003'),
(12, '2025-07-06', '2025-07-10', FALSE, 2, 'CCC003');

-- Alquiler activo del vehículo DDD004
INSERT INTO alquiler (alquiler_id, fecha_inicio, fecha_fin, esta_activo, cliente_id, placa_vehiculo) VALUES
(13, '2025-08-01', '2025-08-10', TRUE, 3, 'DDD004');

-- Pagos (IDs asignados manualmente)
INSERT INTO pago (pago_id, cantidad_de_pago, alquiler_id) VALUES
(1, 200000, 1),
(2, 250000, 2),
(3, 180000, 3),
(4, 220000, 4),
(5, 190000, 5),
(6, 210000, 6),
(7, 300000, 7),
(8, 280000, 8),
(9, 270000, 9),
(10, 310000, 10),
(11, 150000, 11),
(12, 160000, 12);

