USE `31bd2artechebonviniborghitp1`;

-- 5)
UPDATE orden SET total_abonado = 400 
WHERE numero_orden = 2;

-- 6)
DELETE FROM orden_servicio WHERE numero_orden = 2;
DELETE FROM orden WHERE numero_orden = 2;

-- 7)
-- Necesidad de información: Esta consulta muestra, para cada cliente, su apellido y nombre, junto con el número de orden,
--  el nombre del servicio solicitado y el estado en que se encuentra ese servicio.
SELECT c.apellido, c.nombre, o.numero_orden, s.nombre, e.nombre 
FROM cliente c 
JOIN orden o ON o.dni_cliente = c.dni 
JOIN orden_servicio os ON os.numero_orden = o.numero_orden 
JOIN servicio s ON s.nombre = os.nombre_servicio 
JOIN estado e ON e.numero_estado = s.numero_estado;

-- 8)
-- La administración de la lavandería requiere un informe detallado que permita ver todas las órdenes de servicio registradas, 
-- incluyendo la información básica del cliente que solicitó cada orden (DNI, nombre y apellido), 
-- la fecha en que fue iniciada la orden, 
-- el total monetario generado por los servicios aplicados y el nombre del empleado encargado de gestionarla. 
-- En caso de que un cliente no tenga órdenes asociadas, también debe aparecer en el informe con sus datos correspondientes y un total monetario en cero. 
-- El listado debe presentarse ordenado alfabéticamente por el apellido del cliente.
SELECT 
    ord.numero_orden,
    cl.dni,
    cl.nombre,
    cl.apellido,
    ord.fecha_inicio AS fecha_ingreso,
    COALESCE(SUM(os.cantidad * os.precio_unitario), 0) AS precio_total,
    CONCAT(emp.nombre, ' ', emp.apellido) AS encargado
FROM
    cliente cl
    LEFT JOIN orden ord ON cl.dni = ord.dni_cliente
    LEFT JOIN orden_servicio os ON ord.numero_orden = os.numero_orden
    LEFT JOIN servicio serv ON serv.nombre = os.nombre_servicio
    LEFT JOIN estado es ON serv.numero_estado = es.numero_estado
    LEFT JOIN empleado emp ON emp.legajo = ord.legajo_empleado
GROUP BY ord.numero_orden, cl.dni, cl.nombre, cl.apellido, ord.fecha_inicio, emp.nombre, emp.apellido
ORDER BY cl.apellido ASC;