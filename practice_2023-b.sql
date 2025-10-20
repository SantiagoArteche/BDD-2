CREATE VIEW artistas_data AS (
SELECT a.nombre,
(SELECT COUNT(*) FROM albumes WHERE id_artista = a.id_artista AND fecha_lanzamiento < '2020-01-01' ) as albumes, 
(SELECT COUNT(g.nombre) FROM generos g
JOIN canciones ca ON ca.id_genero = g.id_genero
JOIN albumes al ON al.id_artista = a.id_artista) as cantidad_generos
FROM artistas a);

SELECT * FROM artistas_data;

SELECT a.* from artistas a
JOIN albumes alb ON alb.id_artista = a.id_artista
JOIN canciones c ON c.id_album = alb.id_album
JOIN generos g ON g.id_genero = c.id_genero
WHERE g.nombre = 'pop' AND a.nombre IN (SELECT nombre FROM artistas_data);

-- No es posible realizar un UPDATE sobre la vista creada, porque la vista se construyó a partir de tablas agregadas y cálculos (como conteo de álbumes y géneros). En SQL, las vistas que incluyen agregaciones, GROUP BY o combinaciones de múltiples tablas no son actualizables directamente. Esto se debe a que las vistas solo representan un conjunto de resultados calculado a partir de los datos originales y no pueden modificar directamente los registros subyacentes. 
-- Por lo tanto, solo se pueden usar para consultar información, no para actualizarla. 

DELIMITER $$
CREATE TRIGGER not_create_album BEFORE INSERT ON albumes
FOR EACH ROW
BEGIN
	IF NEW.fecha_lanzamiento > now() THEN
		SIGNAL sqlstate '45000'
        SET MESSAGE_TEXT = 'No se pueden crear albumes con una fecha posterior!';
	END IF;
END $$
DELIMITER ;

INSERT INTO albumes (titulo, fecha_lanzamiento, id_artista) VALUES ('nuevo', '2025-10-21',2);


DELIMITER $$
CREATE PROCEDURE get_album(idAlbum INT)
BEGIN
	DECLARE promedio FLOAT;
    
	SELECT AVG(c.duracion) INTO promedio FROM albumes a
    JOIN canciones c ON c.id_album = a.id_album
    WHERE a.id_album = idAlbum;
    
    SELECT promedio;
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION get_album(idAlbum INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE promedio FLOAT;
    
	SELECT AVG(c.duracion) INTO promedio FROM albumes a
    JOIN canciones c ON c.id_album = a.id_album
    WHERE a.id_album = idAlbum;
    
    return promedio;
END $$
DELIMITER ;

CREATE VIEW prom_dur_albumes AS
(
	SELECT alb.titulo, 
    (SELECT AVG(c.duracion) FROM canciones c WHERE id_album = alb.id_album) AS prom_duracion 
    FROM albumes alb
    JOIN artistas ar ON ar.id_artista = alb.id_artista
    JOIN paises p ON p.id_pais = ar.id_pais
    WHERE p.descripcion_pais = 'Estados Unidos'
);

SELECT * FROM prom_dur_albumes;


    