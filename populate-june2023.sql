CREATE TABLE chefs (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido TEXT,
    nacionalidad TEXT
);

CREATE TABLE recetas (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    fecha_creacion DATE,
    id_chef_inventor INTEGER,
    FOREIGN KEY (id_chef_inventor) REFERENCES chefs(id)
);

CREATE TABLE ingredientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);

CREATE TABLE ingredientes_recetas (
    id_receta INTEGER,
    id_ingrediente INTEGER,
    cantidad TEXT,
    PRIMARY KEY (id_receta, id_ingrediente),
    FOREIGN KEY (id_receta) REFERENCES recetas(id),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id)
);

INSERT INTO chefs (id, nombre, apellido, nacionalidad) VALUES
(1, 'Daniela', 'Lemes', 'Uruguaya'),
(2, 'Carlos', 'Martínez', 'Argentino'),
(3, 'Lucía', 'Gómez', 'Argentina');

INSERT INTO ingredientes (id, nombre) VALUES
(1, 'pollo'),
(2, 'ajo'),
(3, 'cebolla'),
(4, 'tomate'),
(5, 'sal'),
(6, 'pimienta'),
(7, 'aceite de oliva'),
(8, 'pasta'),
(9, 'carne'),
(10, 'queso');

INSERT INTO recetas (id, nombre, fecha_creacion, id_chef_inventor) VALUES
(1, 'Pollo al ajillo', '2023-05-01', 1),
(2, 'Ensalada de tomate', '2023-06-10', 1),
(3, 'Pasta con pollo', '2023-07-15', 1),
(4, 'Bife con papas', '2023-06-12', 2),
(5, 'Empanadas criollas', '2023-07-01', 2),
(6, 'Locro', '2023-05-25', 3),
(7, 'Milanesa', '2023-08-08', 3);

INSERT INTO ingredientes_recetas (id_receta, id_ingrediente, cantidad) VALUES
(1, 1, '500g'),
(1, 2, '2 dientes'),
(1, 5, '1 cdita'),
(1, 7, '2 cdas'),
(2, 4, '2 unidades'),
(2, 5, 'al gusto'),
(2, 7, '1 cda'),
(3, 1, '300g'),
(3, 8, '200g'),
(3, 5, 'al gusto'),
(3, 7, '1 cda'),
(4, 9, '1 unidad'),
(4, 5, 'al gusto'),
(4, 6, 'al gusto'),
(5, 9, '300g'),
(5, 3, '1 unidad'),
(5, 5, 'al gusto'),
(6, 9, '400g'),
(6, 3, '1 unidad'),
(6, 5, 'al gusto'),
(6, 2, '1 diente'),
(7, 9, '1 unidad'),
(7, 10, '50g'),
(7, 5, 'al gusto');

