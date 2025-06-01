-- 1 Mostrar un listado de las editoriales españolas y los autores que editan. El listado debe incluir: Nombre editorial,
-- país, y nombre y nacionalidad de todos los autores que edita dicha editorial. Ordenar el listado alfabéticamente
-- por editorial, y nombre de autor.
SELECT e.nombreEditorial, e.pais, a.nombreAutor, a.nacionalidad from editoriales e
JOIN libros_editoriales le ON le.editorialId = e.editorialId
JOIN libros l ON l.isbn = le.isbn
JOIN autores a ON a.autorId = l.autorId
WHERE e.pais = 'España'
ORDER BY e.nombreEditorial ASC, a.nombreAutor ASC;

-- 2 Mostrar una lista de TODOS los libros disponibles. El listado debe incluir: Nombre del libro, autor, género, y el
-- detalle de cada crítica si posee. Ordenar el listado alfabéticamente por género del libro.
SELECT l.titulo, a.nombreAutor, l.genero, c.detalleCritica FROM libros l
JOIN autores a ON a.autorId = l.autorId
JOIN criticas c ON c.libros_isbn = l.isbn;

-- 3 Mostrar una lista de todos los libros de ficción disponibles. El listado debe incluir: Nombre del libro, autor, y el
-- menor precio al que se puede conseguir solo para los libros que superan los $10000. Ordenar el listado por precios
-- en forma decreciente.
SELECT l.titulo, a.nombreAutor, MIN(CAST(le.precio AS DECIMAL)) min_price FROM libros l
JOIN autores a ON a.autorId = l.autorId
JOIN libros_editoriales le ON le.isbn = l.isbn
WHERE l.genero = 'Ficción'
GROUP BY l.titulo, a.nombreAutor
HAVING min_price > 10000
ORDER BY min_price DESC;

-- 4 Mostrar una lista de los libros de ficción disponibles. El listado debe incluir: nombre del libro, autor, y su cantidad
-- de críticas. Ordenar el listado por cantidad de críticas en forma decreciente.
SELECT l.titulo, a.nombreAutor, COUNT(c.idCritica) cant_criticas FROM libros l
JOIN autores a ON a.autorId = l.autorId
JOIN criticas c ON c.libros_isbn = l.isbn
GROUP BY l.titulo, a.nombreAutor
ORDER BY cant_criticas DESC;
