-- Mostrar una lista de TODOS los libros disponibles. El listado debe incluir: Nombre del libro, autor, género, y el detalle
-- de cada crítica si posee. Ordenar el listado alfabéticamente por género del libro.
SELECT l.titulo, a.nombreAutor, l.genero, c.detalleCritica from libros l 
JOIN autores a ON l.autorId = a.autorId
JOIN criticas c ON l.ISBN = c.libros_ISBN
ORDER BY l.genero ASC;

-- Mostrar una lista de autores que escriban libros de drama, con los nombres de los libros que escribió y las
-- editoriales que lo editan. Incluir en la lista: Nombre del autor, nombre del libro, género, nombre de la editorial y fecha
-- de publicación. Ordenar el listado alfabéticamente por nombre de autor, y título del libro
SELECT a.nombreAutor, l.titulo, e.NombreEditorial, l.genero, l.publicacionFecha FROM autores a 
JOIN libros l ON l.AutorId = a.AutorId
JOIN libros_editoriales le ON l.ISBN = le.ISBN
JOIN editoriales e ON e.editorialId = le.editorialId
WHERE l.isbn IN (SELECT isbn FROM libros WHERE genero = 'drama');


--  Mostrar una lista de los libros de Ficción disponibles. El listado debe incluir: Nombre del libro, autor, y el menor
-- precio al que se puede conseguir. Ordenar el listado por precios decreciente

SELECT le.precio FROM libros l JOIN libros_editoriales le on le.isbn = l.isbn;

SELECT l.titulo, a.nombreAutor, MIN(CAST(le.precio AS decimal)) precio_minimo FROM libros l 
JOIN libros_editoriales le ON le.isbn = l.isbn 
JOIN autores a ON a.autorId = l.autorId
WHERE l.genero = 'Ficción'
GROUP BY l.ISBN, l.titulo, a.nombreAutor
ORDER BY precio_minimo DESC;


-- Mostrar una lista de todos los libros de drama disponibles. El listado debe incluir: Nombre del libro, autor, y su
-- cantidad de críticas. Solo para los libros que tengan más de 4 críticas. Ordenar el listado por cantidad de críticas
-- decreciente

SELECT * FROM libros;
SELECT l.titulo, a.nombreAutor, COUNT(c.libros_isbn) AS cant_crit FROM libros l 
JOIN autores a ON a.autorId = l.autorId
JOIN criticas c ON c.libros_isbn = l.isbn WHERE GENERO = 'FICCIÓN'
GROUP BY l.titulo, a.nombreAutor
HAVING cant_crit >= 4
ORDER BY cant_crit DESC;


