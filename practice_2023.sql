-- 1) A. Generar una vista que muestre un listado de propiedades. Para cada propiedad se requiere su id, titulo, su
-- descripción, dirección, precio por noche, puntaje promedio.
-- B. Realizar una consulta que utilice la vista anterior para mostrar para cada propiedad título, su descripción, precio
-- por noche, puntaje promedio. Esta información se quiere solamente para las propiedades cuyo puntaje promedio
-- sea mayor al puntaje promedio general de todas las propiedades.

-- 2) A. Realizar una rutina que tome como parámetro el id de una propiedad y un año y devuelva la cantidad de
-- reservas que tuvo dicha propiedad para ese año.
-- B. Utilizando la rutina anterior realizar una consulta que muestre para todas las propiedades su título, descripción y
-- cantidad de reservas para el año el año 2022.

-- 3) A. Realizar una rutina para que cada vez que se da de alta una propiedad verifique que la capacidad este entre
-- uno y doce. Y si no lo está, no permita guardarlo y muestre un mensaje de error claro al usuario con la descripción
-- del problema.
-- b) Realizar un ejemplo de uso de dicha rutina


-- 1-A

CREATE VIEW property_list AS (
SELECT p.id, p.titulo, p.descripcion, p.direccion, p.precio_por_noche, FORMAT((SELECT AVG(puntuacion) FROM comentarios WHERE propiedad_id = p.id), 2) FROM propiedades p 
);


-- 1-B
SELECT titulo, descripcion, precio_por_noche, Name_exp_6 as promedio FROM property_list WHERE Name_exp_6 > (SELECT AVG(Name_exp_6) FROM property_list);

-- 2-A
DELIMITER $$ 
CREATE  PROCEDURE proc2(IN property_id INT, IN year INT)
BEGIN
 SELECT * FROM reservas WHERE propiedad_id = property_id AND YEAR(fecha_inicio) = year;
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION useProc6(propiedadId int, year int)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;

	SELECT count(*) INTO total FROM propiedades p
    JOIN reservas r ON r.propiedad_id = p.id WHERE propiedadId = p.id AND YEAR(r.fecha_inicio) = year;
    
    return total;
END $$
DELIMITER ;


-- 2B
SeLECT titulo, descripcion, useProc6(id, 2025) FROM propiedades;




-- 3-a
DELIMITER $$
CREATE TRIGGER altaPropb BEFORE INSERT ON propiedades
FOR EACH ROW
BEGIN
    IF NEW.capacidad < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error la capacidad no puede ser menor que 1';
    ELSEIF NEW.capacidad > 12 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error la capacidad no puede ser mayor que 12';
    END IF;
END$$

DELIMITER ;


INSERT INTO propiedades(titulo, descripcion, capacidad, precio_por_noche, direccion, propietario_id) VALUES ('aaaaa', 'nueva', 12, 15, 'abccd',1);
-- 3-b


-- 1) A. Realizar una vista que muestre un listado de propiedades, con la siguiente información: el id de la propiedad,
-- nombre de la propiedad, el precio por noche y la cantidad de reservas del año en curso (con fecha de inicio en este
-- año)
-- B. Realizar una consulta que utilice la vista anterior para mostrar para cada propiedad su título, su descripción,
-- precio por noche y la cantidad de reservas del año, solamente para las propiedades cuyo precio por noche sea
-- menor o igual al precio por noche promedio general de todas las propiedades

-- 2) A. Realizar una rutina que tome como parámetro el id de usuario y un año y devuelva la cantidad de comentarios
-- que realizo dicho usuario para reservas de ese año.
-- B. Utilizando la rutina anterior realizar una consulta que muestre para todos los usuarios: nombre de usuario y la
-- cantidad de comentarios que hizo sobre las reservas del año 2022.

-- 3) A. Realizar una rutina para que cada vez que se crea un comentario verifique que el valor del puntaje este entre
-- uno y cinco. Y si no lo está, no permita guardarlo y muestre un mensaje de error claro al usuario con la descripción
-- del problema.
-- B. Realizar un ejemplo de uso de dicha rutina.

-- 1A
CREATE VIEW v_listado AS (
SELECT p.id, p.titulo, p.precio_por_noche, (SELECT COUNT(*) FROM reservas WHERE propiedad_id = p.id AND YEAR(fecha_inicio) = 2025) FROM propiedades p
);

-- 1B
SELECT p.titulo, p.precio_por_noche FROM propiedades p WHERE p.precio_por_noche <= (SELECT AVG(precio_por_noche) FROM v_listado);

SELECT AVG(precio_por_noche) FROM v_listado;

-- 2A
DELIMITER $$
CREATE FUNCTION comentarios(idUsuario INT, año INT)
RETURNS INT deterministic
BEGIN
	DECLARE cantidad_consultas INT;
    
	SELECT COUNT(c.id) into cantidad_consultas FROM comentarios c
    JOIN reservas r ON r.propiedad_id = c.propiedad_id
    JOIN usuarios u ON u.id = r.huesped_id WHERE YEAR(fecha_inicio_reserva) = año AND u.id = idUsuario;
    
    RETURN cantidad_consultas;
END $$
DELIMITER ;

-- 2B
SELECT nombre, comentarios(id, 2025) FROM usuarios;



-- 3A
DELIMITER $$
CREATE TRIGGER not_comment BEFORE INSERT ON comentarios
FOR EACH ROW
BEGIN
	IF NEW.puntuacion > 5 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error la puntuacion tiene que ser menor a 5';
	ELSEIF NEW.puntuacion < 1 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error la puntuacion tiene que ser mayor a 0';
	END IF;
END $$
DELIMITER ;

-- 3B
INSERT INTO comentarios(propiedad_id, fecha_inicio_reserva, comentario, puntuacion) VALUES (2, '2025-04-05', 'HOLA', 6);

