-- verificación de ON DELETE CASCADE
DELETE FROM cliente WHERE cliente_id = 1;

SELECT * FROM alquiler WHERE cliente_id = 1;

-- verificación de ON UPDATE CASCADE
SELECT * FROM vehiculo WHERE placa_vehiculo = 'CAS123';

UPDATE sucursal SET sucursal_id = 99 WHERE sucursal_id = 2;

SELECT * FROM vehiculo WHERE placa_vehiculo = 'CAS123';

--4. Obtener los vehículos disponibles en una ciudad específica (por ejemplo: 'Cali')
SELECT v.placa_vehiculo, v.marca, v.modelo, s.nombre AS sucursal, s.ciudad
FROM vehiculo v
JOIN sucursal s ON v.sucursal_id = s.sucursal_id
WHERE v.esta_disponible = TRUE
  AND s.ciudad = 'Cali';

-- 5. Listar los alquileres activos con información del cliente y vehículo. 
SELECT a.alquiler_id, a.fecha_inicio, a.fecha_fin,
       c.nombre AS nombre_cliente, c.apellido AS apellido_cliente,
       v.placa_vehiculo, v.marca, v.modelo
FROM alquiler a
JOIN cliente c ON a.cliente_id = c.cliente_id
JOIN vehiculo v ON a.placa_vehiculo = v.placa_vehiculo
WHERE a.esta_activo = TRUE;

-- 6. Calcular los ingresos totales por sucursal considerando solo vehículos con más de 3 alquileres.
SELECT s.nombre AS sucursal, SUM(p.cantidad_de_pago) AS ingresos_totales
FROM pago p
JOIN alquiler a ON p.alquiler_id = a.alquiler_id
JOIN vehiculo v ON a.placa_vehiculo = v.placa_vehiculo
JOIN sucursal s ON v.sucursal_id = s.sucursal_id
WHERE v.placa_vehiculo IN (
    SELECT placa_vehiculo
    FROM alquiler
    GROUP BY placa_vehiculo
    HAVING COUNT(*) > 3
)
GROUP BY s.nombre;

-- 7. Filtrar solo vehículos con más de 5 alquileres (usar subconsulta)
SELECT v.placa_vehiculo, v.marca, v.modelo
FROM vehiculo v
WHERE v.placa_vehiculo IN (
    SELECT placa_vehiculo
    FROM alquiler
    GROUP BY placa_vehiculo
    HAVING COUNT(*) > 5
);

-- 8. Sumar los montos de todos los pagos asociados
SELECT SUM(cantidad_de_pago) AS total_pagado
FROM pago;


