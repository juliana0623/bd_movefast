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

-- CREATE VIEW

-- 1. Cree una vista (VIEW) que presente del consumo de cada cliente (nombre, bebida, platillo, fecha y montos).
CREATE VIEW vista_consumo_cliente AS
SELECT 
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    b.nombre AS bebida,
    p.nombre AS platillo,
    f.fecha_factura,
    COALESCE(p.importe, 0) AS monto_platillo,
    b.importe AS monto_bebida
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN bebida b ON f.id_bebida = b.id_bebida
LEFT JOIN platillo p ON f.id_platillo = p.id_platillo;

-- 2. Cree una vista (VIEW) que presente el mesero, el numero de factura que atendió, la fecha y la mesa.
CREATE VIEW vista_mesero_factura AS
SELECT 
    m.nombre AS nombre_mesero,
    m.apellido1 AS apellido1,
    m.apellido2 AS apellido2,
    f.id_factura,
    f.fecha_factura,
    me.id_mesa
FROM factura f
JOIN mesero m ON f.id_mesero = m.id_mesero
JOIN mesa me ON f.id_mesa = me.id_mesa;

-- 3. Cree una vista (VIEW) que el valor total de compra por cada cliente en todas sus facturas (platillo + bebida).
CREATE VIEW vista_total_compra_cliente AS
SELECT 
    c.nombre,
    c.apellido,
    SUM(COALESCE(p.importe, 0) + b.importe) AS total_compras
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN platillo p ON f.id_platillo = p.id_platillo
JOIN bebida b ON f.id_bebida = b.id_bebida
GROUP BY c.nombre, c.apellido;

-- 4. Conviera a vista las consultas 6 y 7 del anterior ejercicio
-- (Consulta 6) Total consumo del cliente "Manuel Pedroza Gonzalez"
CREATE VIEW vista_total_manuel_pedroza AS
SELECT 
    c.nombre, 
    c.apellido, 
    SUM(COALESCE(p.importe, 0) + b.importe) AS total_consumo
FROM factura f
JOIN cliente c ON f.id_cliente = c.id_cliente
LEFT JOIN platillo p ON f.id_platillo = p.id_platillo
JOIN bebida b ON f.id_bebida = b.id_bebida
WHERE c.nombre = 'Manuel' AND c.apellido = 'Pedroza Gonzalez'
GROUP BY c.nombre, c.apellido;

-- (Consulta 7) Mesas que han sido utilizadas al menos una vez
CREATE VIEW vista_mesas_utilizadas AS
SELECT DISTINCT 
    m.id_mesa,
    m.ubicacion,
    m.num_comensales
FROM factura f
JOIN mesa m ON f.id_mesa = m.id_mesa;



