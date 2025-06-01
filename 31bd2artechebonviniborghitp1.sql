CREATE DATABASE 31bd2artechebonviniborghitp1;

USE 31bd2artechebonviniborghitp1;

CREATE TABLE direccion (
    calle VARCHAR(30),
    ciudad VARCHAR(30),
    altura INT,
    PRIMARY KEY (calle , ciudad , altura)
);

CREATE TABLE cliente (
    dni INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(50),
    email VARCHAR(50),
    edad INT,
    calle VARCHAR(30),
    ciudad VARCHAR(30),
    altura INT,
    FOREIGN KEY (calle , ciudad , altura)
        REFERENCES direccion (calle , ciudad , altura)
);

CREATE TABLE rol (
    numero_rol INT PRIMARY KEY,
    nombre VARCHAR(40)
);

CREATE TABLE empleado (
    legajo VARCHAR(11) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(50),
    email VARCHAR(50),
    edad INT,
    numero_rol INT,
    turno ENUM('mañana', 'tarde'),
    FOREIGN KEY (numero_rol) REFERENCES rol(numero_rol)
);

CREATE TABLE prenda (
    tipo VARCHAR(30) PRIMARY KEY,
    nombre VARCHAR(30),
    color VARCHAR(30),
    material VARCHAR(30)
);

CREATE TABLE estado (
    numero_estado INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE servicio (
    nombre VARCHAR(30) PRIMARY KEY,
    precio INT,
    descripcion TEXT,
    numero_estado INT,
    tipo_prenda VARCHAR(30),
    FOREIGN KEY (numero_estado)
        REFERENCES estado (numero_estado),
	FOREIGN KEY (tipo_prenda) REFERENCES prenda(tipo)
);

CREATE TABLE orden (
    numero_orden INT PRIMARY KEY,
    fecha_inicio DATE,
    total_abonado INT,
    fecha_estimada DATE,
    fecha_entrega DATE,
    dni_cliente INT,
    legajo_empleado VARCHAR(30),
    FOREIGN KEY (dni_cliente)
        REFERENCES cliente (dni),
    FOREIGN KEY (legajo_empleado)
        REFERENCES empleado (legajo)
);


CREATE TABLE orden_servicio (
    numero_orden INT,
    nombre_servicio VARCHAR(30),
	cantidad INT DEFAULT 1,
    precio_unitario INT,
    PRIMARY KEY (numero_orden , nombre_servicio),
    FOREIGN KEY (numero_orden)
        REFERENCES orden (numero_orden),
    FOREIGN KEY (nombre_servicio)
        REFERENCES servicio (nombre)
);


INSERT INTO direccion VALUES ("Avellaneda", "Rosario", 1565), 
("Santa Fe", "Rosario", 2859),
("Rodriguez", "Rosario", 1155),
("San Lorenzo", "Rosario", 1552),
("San Rodriguez", "Rosario", 1999),
("San Juan", "Rosario", 1553),
("Oroño", "Rosario", 1554),
("Balcarce", "Rosario", 1545),
("Viamonte", "Rosario", 1655),
("Avellaneda", "Rosario", 1565),
("AlmaFuerte", "Rosario", 1556);

INSERT INTO cliente VALUES
(12345678, 'Lucía', 'Martínez', '1112345678', 'lucia@gmail.com', 21, "Santa Fe", "Rosario", 2859),
(22334455, 'Juan', 'Gómez', '1122334455', 'juan@hotmail.com', 22, "Rodriguez", "Rosario", 1155),
(33445566, 'Ana', 'López', '1133445566','ana@gmail.com', 33, "San Lorenzo", "Rosario", 1552),
(44556677, 'Pedro', 'Fernández', '1144556677', 'pedro@yahoo.com', 23, "San Rodriguez", "Rosario", 1999),
(55667788, 'Marta', 'Pérez', '1155667788', 'marta@gmail.com',24, "San Juan", "Rosario", 1553),
(66778899, 'Sofía', 'Torres', '1166778899', 'sofia@gmail.com',35, "Oroño", "Rosario", 1554),
(77889900, 'Carlos', 'García', '1177889900', 'carlos@gmail.com',26, "Balcarce", "Rosario", 1545),
(88990011, 'Diego', 'Romero', '1188990011', 'diego@gmail.com',27, "Viamonte", "Rosario", 1655),
(99001122, 'Laura', 'Mendoza', '1199001122', 'laura@gmail.com',38, "Avellaneda", "Rosario", 1565),
(10111213, 'Luis', 'Navarro', '1101112131', 'luis@gmail.com',49, "AlmaFuerte", "Rosario", 1556);

INSERT INTO rol VALUES
(1, 'Recepcionista de prendas'),
(2, 'Clasificador de ropa'),
(3, 'Lavador'),
(4, 'Secador'),
(5, 'Planchador'),
(6, 'Inspector de calidad'),
(7, 'Costurero'),
(8, 'Empaquetador'),
(9, 'Encargado de entregas'),
(10, 'Supervisor de turno');

INSERT INTO empleado VALUES
('A-543', 'Juan', 'Pérez', '1234567890', 'juan.perez@gmail.com', 28, 1, 'mañana'),
('A-5521', 'María', 'Gómez', '1234567891', 'maria.gomez@gmail.com', 32, 2, 'tarde'),
('A-5432', 'Carlos', 'López', '1234567892', 'carlos.lopez@gmail.com', 25, 3, 'mañana'),
('B-7837', 'Ana', 'Martínez', '1234567893', 'ana.martinez@gmail.com', 30, 4, 'tarde'),
('B-9383', 'Luis', 'Rodríguez', '1234567894', 'luis.rodriguez@gmail.com', 35, 5, 'mañana'),
('A-5598', 'Laura', 'Fernández', '1234567895', 'laura.fernandez@gmail.com', 27, 6, 'tarde'),
('B-3302', 'Diego', 'Sánchez', '1234567896', 'diego.sanchez@gmail.com', 29, 7, 'mañana'),
('B-8232', 'Sofía', 'Torres', '1234567897', 'sofia.torres@gmail.com', 31, 8, 'tarde'),
('A-9833', 'Martín', 'Ramírez', '1234567898', 'martin.ramirez@gmail.com', 33, 9, 'mañana'),
('B-7733', 'Valeria', 'Ruiz', '1234567899', 'valeria.ruiz@gmail.com', 26, 10, 'tarde');

INSERT INTO prenda VALUES
('camisa', 'Camisa de vestir', 'blanco', 'algodón'),
('pantalon', 'Pantalón de vestir', 'negro', 'poliéster'),
('remera', 'Remera casual', 'azul', 'algodón'),
('pulover', 'Pulover impermeable', 'gris', 'nylon'),
('falda', 'Falda plisada', 'rojo', 'lino'),
('blusa', 'Blusa formal', 'beige', 'seda'),
('short', 'Short deportivo', 'verde', 'poliéster'),
('buzo', 'Buzo con capucha', 'negro', 'algodón'),
('campera', 'Campera de abrigo', 'azul marino', 'lana'),
('jean', 'Jean clásico', 'azul', 'lana');

INSERT INTO estado VALUES
(1, 'Recibida'),
(2, 'Etiquetada'),
(3, 'Clasificada'),
(4, 'En lavado'),
(5, 'Enjuagada'),
(6, 'En secado'),
(7, 'Planchado'),
(8, 'Control de calidad'),
(9, 'Empaquetada'),
(10, 'Lista para entrega');

INSERT INTO orden (numero_orden, fecha_inicio, total_abonado, fecha_estimada, fecha_entrega, dni_cliente, legajo_empleado) VALUES
(1, '2025-05-01', 1000, '2025-05-05', '2025-05-04', 12345678, 'A-543'),
(2, '2025-05-02', 0, '2025-05-06', NULL, 22334455, 'A-5521'),
(3, '2025-05-03', 600, '2025-05-07', '2025-05-07', 33445566, 'A-5432'),
(4, '2025-05-04', 1500, '2025-05-08', '2025-05-08', 44556677, 'B-7837'),
(5, '2025-05-05', 1000, '2025-05-09', NULL, 55667788, 'B-9383'),
(6, '2025-05-06', 800, '2025-05-10', NULL, 66778899, 'A-5598'),
(7, '2025-05-07', 2000, '2025-05-11', '2025-05-10', 77889900, 'B-3302'),
(8, '2025-05-08', 1000, '2025-05-12', '2025-05-11', 88990011, 'B-8232'),
(9, '2025-05-09', 600, '2025-05-13', NULL, 99001122, 'A-9833'),
(10, '2025-05-10', 2300, '2025-05-14', '2025-05-14', 10111213, 'B-7733');

INSERT INTO servicio (nombre, precio, descripcion, numero_estado, tipo_prenda) VALUES
('Lavado', 1000, 'Lavado estándar de prendas comunes', 4, 'camisa'),
('Planchado', 800, 'Planchado profesional para prendas de vestir', 7, 'pantalon'),
('Secado', 600, 'Secado controlado según tipo de tela', 6, 'remera'),
('Lavado Especial', 1500, 'Lavado especial para prendas delicadas', 4, 'blusa'),
('Reparación', 2000, 'Costura, parches y arreglos menores', 7, 'jean'),
('Tintura', 1300, 'Tintura para ropa de algodón y lino', 3, 'falda'),
('Desmanchado', 1200, 'Tratamiento para remover manchas difíciles', 5, 'camisa'),
('Impermeabilización', 1800, 'Aplicación de impermeabilizante para prendas de abrigo', 8, 'campera'),
('Lavado a mano', 1400, 'Lavado manual para tejidos finos', 4, 'pulover'),
('Planchado Deluxe', 1100, 'Planchado a vapor para ropa de lujo', 7, 'blusa');


INSERT INTO orden_servicio (numero_orden, nombre_servicio, cantidad, precio_unitario) VALUES
(1, 'Lavado', 1, 1000),
(2, 'Planchado', 1, 800),
(3, 'Secado', 1, 600),
(4, 'Lavado Especial', 1, 1500),
(5, 'Lavado', 1, 1000),
(6, 'Planchado', 1, 800),
(7, 'Reparación', 1, 2000),
(8, 'Lavado', 1, 1000),
(9, 'Secado', 1, 600),
(10, 'Lavado Especial', 1, 1500),
(10, 'Planchado', 1, 800);

UPDATE orden SET total_abonado = 400 
WHERE numero_orden = 2;

DELETE FROM orden_servicio WHERE numero_orden = 2;
DELETE FROM orden WHERE numero_orden = 2;

-- Se quiere conocer la dirección de los clientes

SELECT * FROM cliente cl JOIN direccion dir
    ON cl.calle = dir.calle
    AND cl.ciudad = dir.ciudad
    AND cl.altura = dir.altura;


-- La administración de la lavandería requiere un informe detallado y 
-- consolidado que permita conocer todas las órdenes de servicio registradas, 
-- junto con la información básica del cliente que solicitó cada orden, 
-- la fecha en que fue iniciada la orden, el total monetario generado por los servicios aplicados 
-- y el empleado encargado de gestionar dicha orden. 
SELECT 
    ord.numero_orden,
    cl.dni,
    cl.nombre,
    cl.apellido,
    ord.fecha_inicio AS fecha_ingreso,
    SUM(os.cantidad * os.precio_unitario) AS precio_total,
    CONCAT(emp.nombre, ' ', emp.apellido) as encargado
FROM
    orden_servicio os
        JOIN orden ord ON ord.numero_orden = os.numero_orden
        JOIN cliente cl ON cl.dni = ord.dni_cliente
        JOIN servicio serv ON serv.nombre = os.nombre_servicio
        JOIN estado es ON serv.numero_estado = es.numero_estado
        LEFT JOIN empleado emp ON emp.legajo = ord.legajo_empleado
GROUP BY ord.numero_orden, cl.dni, cl.nombre, cl.apellido, ord.fecha_inicio
ORDER BY ord.numero_orden;