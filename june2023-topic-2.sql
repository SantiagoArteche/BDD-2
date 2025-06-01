-- 1
-- Mostrar un listado de los chefs que han realizado recetas nuevas durante el corriente año. Se quiere conocer
-- el nombre y apellido del chef, el nombre de las recetas realizadas durante este año, los nombres de los
-- ingredientes y sus cantidades. Ordenar el listado alfabéticamente.
SELECT c.nombre as nombre_chef, c.apellido as apellido_chef, r.nombre as nombre_receta, i.nombre, ir.cantidad FROM chefs c
LEFT JOIN recetas r ON c.id = r.id_chef_inventor
LEFT JOIN ingredientes_recetas ir ON ir.id_receta = r.id
LEFT JOIN ingredientes i ON i.id = ir.id_ingrediente
WHERE YEAR(r.fecha_creacion) >= 2024 OR r.id IS NULL
ORDER BY c.apellido ASC;

-- 2
-- Realizar un listado con la cantidad de recetas de cada chef, con el nombre y apellido de los mismos. Incluir
-- los chefs que no tengan ninguna receta. Ordenar el listado por cantidad decreciente.
SELECT c.id, c.nombre, c.apellido, COUNT(r.id) cantidad_recetas FROM chefs c
LEFT JOIN recetas r ON c.id = r.id_chef_inventor
GROUP BY c.apellido, c.nombre, c.id
ORDER BY cantidad_recetas DESC;

-- 3
-- Mostrar las recetas de chefs Argentinos que utilizan más de cinco ingredientes. Mostrar el nombre de la
-- receta y la cantidad de ingredientes. Ordenar el listado por cantidad de ingredientes decreciente.

SELECT c.nombre, c.apellido, r.nombre, COUNT(ir.id_ingrediente) cantidad_ingredientes FROM chefs c
JOIN recetas r ON  r.id_chef_inventor = c.id
JOIN ingredientes_recetas ir ON ir.id_receta = r.id
JOIN ingredientes i ON i.id = ir.id_ingrediente WHERE c.id IN (SELECT id FROM chefs WHERE nacionalidad = 'Argentina')
GROUP BY r.id
HAVING COUNT(ir.id_ingrediente) > 5;


-- 4
-- Mostrar el nombre de la receta y todos ingredientes de las recetas que no usen lentejas.
SELECT r.nombre, i.nombre FROM ingredientes i
JOIN ingredientes_recetas ir ON i.id = ir.id_ingrediente
JOIN recetas r ON r.id = ir.id_receta
WHERE i.id NOT IN (SELECT id FROM ingredientes WHERE nombre = 'lentejas');

-- 5
-- Se quiere conocer cuántas recetas se tienen de cada nacionalidad. Mostrar las nacionalidades, y la cantidad
-- total de recetas de chefs de dicha nacionalidad. Ordenar el listado alfabéticamente.
SELECT c.nacionalidad, COUNT(r.id) cantidad_recetas FROM recetas r
JOIN chefs c ON c.id = r.id_chef_inventor
GROUP BY c.nacionalidad
ORDER BY c.nacionalidad ASC;

