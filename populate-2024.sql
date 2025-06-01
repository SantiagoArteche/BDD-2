CREATE TABLE autores (
    autorId INTEGER PRIMARY KEY,
    nombreAutor TEXT,
    nacionalidad TEXT
);

CREATE TABLE libros (
    isbn TEXT PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    publicacionFecha DATE,
    autorId INTEGER,
    FOREIGN KEY (autorId) REFERENCES autores(autorId)
);

CREATE TABLE editoriales (
    editorialId INTEGER PRIMARY KEY,
    nombreEditorial TEXT,
    pais TEXT
);

CREATE TABLE libros_editoriales (
    isbn TEXT,
    editorialId INTEGER,
    precio DECIMAL,
    PRIMARY KEY (isbn, editorialId),
    FOREIGN KEY (isbn) REFERENCES libros(isbn),
    FOREIGN KEY (editorialId) REFERENCES editoriales(editorialId)
);

CREATE TABLE criticas (
    idCritica INTEGER PRIMARY KEY,
    libros_isbn TEXT,
    detalleCritica TEXT,
    FOREIGN KEY (libros_isbn) REFERENCES libros(isbn)
);

INSERT INTO autores (autorId, nombreAutor, nacionalidad) VALUES
(1, 'Gabriel García Márquez', 'Colombiano'),
(2, 'Miguel de Cervantes', 'Español'),
(3, 'Jorge Luis Borges', 'Argentino'),
(4, 'Isabel Allende', 'Chilena'),
(5, 'Rosa Montero', 'Española');

INSERT INTO editoriales (editorialId, nombreEditorial, pais) VALUES
(1, 'Planeta', 'España'),
(2, 'Alfaguara', 'España'),
(3, 'Random House', 'Argentina'),
(4, 'Anagrama', 'Chile');

INSERT INTO libros (isbn, titulo, genero, publicacionFecha, autorId) VALUES
('ISBN001', 'Cien años de soledad', 'Ficción', '1967-06-05', 1),
('ISBN002', 'Don Quijote de la Mancha', 'Ficción', '1605-01-16', 2),
('ISBN003', 'Ficciones', 'Ficción', '1944-01-01', 3),
('ISBN004', 'La casa de los espíritus', 'Drama', '1982-01-01', 4),
('ISBN005', 'El amor no es suficiente', 'Drama', '2005-01-01', 5),
('ISBN006', 'La ciudad y los perros', 'Drama', '1963-01-01', 5);

INSERT INTO libros_editoriales (isbn, editorialId, precio) VALUES
('ISBN001', 1, 12000),
('ISBN002', 1, 11000),
('ISBN003', 2, 13000),
('ISBN004', 2, 9000),
('ISBN005', 1, 8000),
('ISBN005', 3, 9500),
('ISBN006', 2, 11500);

INSERT INTO criticas (idCritica, libros_isbn, detalleCritica) VALUES
(1, 'ISBN001', 'Una obra maestra del realismo mágico'),
(2, 'ISBN001', 'Profundo y conmovedor'),
(3, 'ISBN002', 'Divertido y reflexivo'),
(4, 'ISBN003', 'Una exploración del infinito'),
(5, 'ISBN004', 'Una historia poderosa sobre la memoria'),
(6, 'ISBN004', 'Increíble narrativa'),
(7, 'ISBN004', 'Gran desarrollo de personajes'),
(8, 'ISBN004', 'Un clásico contemporáneo'),
(9, 'ISBN004', 'Muy recomendado'),
(10, 'ISBN006', 'Narrativa sólida y atrapante');

