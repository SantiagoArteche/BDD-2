USE 31bd2artechebonviniborghitp1;
-- PARTE 2
-- 1) function: calcular la diferencia en días entre la fecha estimada de entrega de una orden y la fecha actual, 
-- devolviendo como resultado los días restantes para que la orden esté lista o se deba entregar.
DELIMITER $$
CREATE FUNCTION calculo_dias_entrega (p_numero_orden INT)
RETURNS INT
DETERMINISTIC
BEGIN
     DECLARE diferencia INT;
      SELECT DATEDIFF(fecha_estimada, fecha_inicio)
  INTO diferencia
      FROM orden
  WHERE numero_orden = p_numero_orden;
      RETURN diferencia;
END $$
DELIMITER ;

SELECT calculo_dias_entrega(1) AS dias;

-- 2) Procedure: La lavandería necesita actualizar periódicamente el estado de las órdenes, marcándolas, por ejemplo, como “Entregadas” o
-- “Retrasadas”. Hacerlo manualmente sería propenso a errores y consumiría tiempo.
DELIMITER $$
CREATE PROCEDURE actualizar_estado_orden(
    IN p_numero_orden INT,
    IN p_numero_estado INT
)
BEGIN
    DECLARE servicio_nombre_actualizar VARCHAR(50);

        IF EXISTS (SELECT 1 FROM orden WHERE numero_orden = p_numero_orden) THEN
            SELECT s.nombre INTO servicio_nombre_actualizar FROM orden o
            JOIN orden_servicio os ON os.numero_orden = o.numero_orden
            JOIN servicio s ON s.nombre = os.nombre_servicio
            WHERE o.numero_orden = p_numero_orden;

            IF servicio_nombre_actualizar IS NULL THEN
                SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'El servicio no tiene un nombre valido';
            ELSE
                UPDATE servicio
                SET numero_estado = p_numero_estado
                WHERE nombre = servicio_nombre_actualizar;
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'La orden no existe';
        END IF;
END$$

DELIMITER ;

CALL actualizar_estado_orden(5, 9);


-- 3) trigger: El trigger se activa automáticamente después de insertar un nuevo registro en la tabla de empleados.
-- Su función es verificar si el nuevo empleado no tiene un rol asignado; en ese caso, asigna por defecto el rol número 1, que corresponde a recepcionista.
DELIMITER $$

CREATE TRIGGER rol_por_defecto
BEFORE INSERT ON empleado
FOR EACH ROW
BEGIN
    IF NEW.numero_rol IS NULL THEN
        SET NEW.numero_rol = 1;
    END IF;
END$$

DELIMITER ;

INSERT INTO empleado (legajo, nombre, apellido) VALUES ('51515','lucas','becerra');


-- 4) transaction: marca la orden número 4 como “lista para entregar” y registra la fecha de hoy como su fecha de entrega, asegurando que ambos cambios se realicen juntos y se guarden correctamente.
START TRANSACTION;

CALL actualizar_estado_orden(4, 10);

UPDATE orden SET fecha_entrega = DATE(NOW()) WHERE numero_orden = 4;

COMMIT;