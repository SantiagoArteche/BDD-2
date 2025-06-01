CREATE TABLE chefs (
    id INT(11) PRIMARY KEY,
    apellido VARCHAR(10),
    nombre VARCHAR(8),
    nacionalidad VARCHAR(9)
);

CREATE TABLE recetas (
    id INT(11) PRIMARY KEY,
    nombre VARCHAR(20),
    fecha_creacion DATE,
    id_chef_inventor INT(11),
    FOREIGN KEY (id_chef_inventor)
        REFERENCES chefs (id)
);

CREATE TABLE ingredientes (
    id INT(11) PRIMARY KEY,
    nombre VARCHAR(14)
);

CREATE TABLE ingredientes_recetas (
    id_ingrediente INT(11),
    id_receta INT(11),
    cantidad VARCHAR(30),
    FOREIGN KEY (id_ingrediente)
        REFERENCES ingredientes (id),
    FOREIGN KEY (id_receta)
        REFERENCES recetas (id),
    PRIMARY KEY (id_ingrediente , id_receta)
);


INSERT INTO chefs (id, apellido, nombre, nacionalidad) VALUES
(1, 'Lemes', 'Daniela', 'Uruguaya'),
(2, 'Martínez', 'Pedro', 'Argentino'),
(3, 'García', 'Laura', 'Argentina'),
(4, 'Kimura', 'Sato', 'Japonesa'),
(5, 'Fernandez', 'Luis', 'Argentino');


INSERT INTO recetas (id, nombre, fecha_creacion, id_chef_inventor) VALUES
(1, 'Pollo al curry', '2023-06-01', 1),
(2, 'Ensalada César', '2022-03-15', 1),
(3, 'Empanadas criollas', '2023-04-22', 2),
(4, 'Sushi vegano', '2024-01-10', 4),
(5, 'Milanesa napolitana', '2022-12-05', 3),
(6, 'Pollo al horno', '2023-09-10', 1),
(7, 'Pizza margarita', '2023-07-20', 5),
(8, 'Pollo con papas', '2023-11-01', 3),
(9, 'Tarta de verduras', '2022-05-10', 1),
(10, 'Curry de pollo', '2023-08-01', 2);


INSERT INTO ingredientes (id, nombre) VALUES
(1, 'Pollo'),
(2, 'Cebolla'),
(3, 'Ajo'),
(4, 'Pimiento'),
(5, 'Queso'),
(6, 'Tomate'),
(7, 'Lechuga'),
(8, 'Carne'),
(9, 'Aceite'),
(10, 'Harina'),
(11, 'Papas'),
(12, 'Orégano'),
(13, 'Huevo'),
(14, 'Pan rallado');

INSERT INTO ingredientes_recetas (id_ingrediente, id_receta, cantidad) VALUES
(1, 1, '500g'),
(2, 1, '1 unidad'),
(3, 1, '2 dientes'),
(4, 1, '1 unidad'),

(7, 2, '5 hojas'),
(6, 2, '1 unidad'),
(5, 2, '100g'),

(8, 3, '300g'),
(2, 3, '1 unidad'),
(9, 3, '2 cucharadas'),

(6, 4, '1 unidad'),
(7, 4, '3 hojas'),
(12, 4, '1 pizca'),

(8, 5, '250g'),
(5, 5, '100g'),
(10, 5, '100g'),

(1, 6, '600g'),
(11, 6, '3 unidades'),
(3, 6, '1 diente'),

(6, 7, '2 unidades'),
(5, 7, '150g'),
(12, 7, '1 cucharadita'),

(1, 8, '400g'),
(11, 8, '2 unidades'),
(2, 8, '1 unidad'),

(4, 9, '1 unidad'),
(3, 9, '1 diente'),
(7, 9, '4 hojas'),

(1, 10, '550g'),
(3, 10, '1 diente'),
(9, 10, '2 cucharadas');

INSERT INTO ingredientes_recetas (id_ingrediente, id_receta, cantidad) VALUES
(2,10, '500g');

-- 1 Mostrar las recetas y los ingredientes de la chef Daniela Lemes. Mostrar el nombre de la receta,
-- ingrediente, cantidad y fecha de creación. Ordenar la salida por fecha de creación de la receta descendente y
-- luego por ingrediente ascendente
SELECT * FROM chefs c 
JOIN recetas r ON r.id_chef_inventor = c.id
JOIN ingredientes_recetas ir ON ir.id_receta = r.id
JOIN ingredientes i ON i.id = ir.id_ingrediente 
WHERE c.id = (SELECT id FROM chefs WHERE nombre = 'Daniela' AND apellido = 'Lemes')
ORDER BY r.fecha_creacion DESC, i.nombre ASC;

-- 2 Mostrar para cada ingrediente, el nombre de ingrediente y la cantidad de recetas en las que aparece,
-- incluidos los que no se usaron todavía. Ordenar el listado por cantidad decreciente.
SELECT i.nombre, COUNT(ir.id_receta) veces_en_receta FROM ingredientes_recetas ir 
RIGHT JOIN ingredientes i ON ir.id_ingrediente = i.id
GROUP BY i.nombre
ORDER BY veces_en_receta DESC;

-- 3 Mostrar los ingredientes usados en más de 5 recetas de chefs argentinos. Ordenar de mayor a menor por
-- cantidad de ingredientes.
SELECT i.nombre, COUNT(ir.id_receta) veces_receta FROM ingredientes i
JOIN ingredientes_recetas ir ON ir.id_ingrediente = i.id
JOIN recetas r ON r.id = ir.id_receta
JOIN chefs c ON c.id = r.id_chef_inventor 
GROUP BY i.nombre
HAVING veces_receta > 5 
ORDER BY COUNT(ir.id_receta) DESC;

-- 4 Mostar la cantidad de recetas en las que se incluye cada ingrediente.
SELECT 
    i.nombre AS ingrediente,
    COUNT(ir.id_receta) AS cantidad_recetas
FROM ingredientes i
JOIN ingredientes_recetas ir ON i.id = ir.id_ingrediente
GROUP BY i.id;

-- 5 Mostrar el nombre de la receta y todos ingredientes de las recetas que usen pollo.
SELECT r.nombre nombre_receta, i.nombre nombre_ingrediente FROM recetas r
LEFT JOIN ingredientes_recetas ir ON ir.id_receta = r.id
RIGHT JOIN ingredientes i ON i.id = ir.id_ingrediente
WHERE r.id IN (
SELECT r.id FROM recetas r
LEFT JOIN ingredientes_recetas ir ON ir.id_receta = r.id
RIGHT JOIN ingredientes i ON i.id = ir.id_ingrediente
WHERE i.nombre = 'pollo'
);









