--1. Obtener el nombre y apellido de los clientes que hayan consumido un platillo específico
SELECT c.nombre, c.apellido -- seleccion de nombre y apellido
FROM cliente c -- de la relacion cliente
JOIN factura f ON c.id_cliente = f.id_cliente
JOIN platillo p ON f.id_platillo = p.id_platillo 
WHERE p.nombre = 'Filete de res';  -- especificacion de platillo 'Filete de res'

-- 2. Obtener el nombre y apellido de los clientes que hayan consumido arroz a la marinera.
-- Similar a la anterior pero filtrando directamente por el platillo "Arroz a la marinera"
SELECT c.nombre, c.apellido-- seleccion de nombre y apellido
FROM cliente c -- de la relacion cliente
JOIN factura f ON c.id_cliente = f.id_cliente
JOIN platillo p ON f.id_platillo = p.id_platillo 
WHERE p.nombre = 'Arroz a la marinera';-- especificacion de platillo 'Arroz a la marinera'

--3. Listar el nombre del mesero y la fecha en la que atendió una mesa 10 que se encuentra ubicada en el segundo piso del restautante.
SELECT m.nombre AS nombre_mesero, m.apellido1 AS apellido_mesero, f.fecha_factura
FROM factura f
JOIN mesero m ON f.id_mesero = m.id_mesero
JOIN mesa me ON f.id_mesa = me.id_mesa
WHERE me.id_mesa = 10 AND me.ubicacion = 'Segundo piso';

-- 4. Mostrar el nombre de los clientes junto con los nombres de las bebidas que consumieron en sus facturas.
SELECT c.nombre AS cliente_nombre, b.nombre AS bebida
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN bebida b ON f.id_bebida = b.id_bebida;

-- 5. Consultar todas las facturas que incluyan platillos con un importe mayor a $300000, incluyendo el nombre del cliente y del platillo.
SELECT f.id_factura, c.nombre AS cliente, p.nombre AS platillo, p.importe
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN platillo p ON f.id_platillo = p.id_platillo
WHERE p.importe > 300000;

-- 6. Listar el total de consumo (importe de platillos y bebidas) del cliente llamado Manuel Pedroza Gonzalez.
SELECT c.nombre, c.apellido,
       SUM(COALESCE(p.importe, 0) + b.importe) AS total_consumo
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN platillo p ON f.id_platillo = p.id_platillo
JOIN bebida b ON f.id_bebida = b.id_bebida
WHERE c.nombre = 'Manuel' AND c.apellido = 'Pedroza Gonzalez'
GROUP BY c.nombre, c.apellido;

--7. Liste las mesas que han sido utilizadas al menos una vez, indicando su ubicación y el número de comensales.
SELECT DISTINCT m.id_mesa, m.ubicacion, m.num_comensales
FROM factura f
JOIN mesa m ON f.id_mesa = m.id_mesa;
