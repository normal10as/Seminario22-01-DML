/* 1.2. Listar todAS lAS columnAS de empleados 
y la descripción del cargo que tienen. */
USE editorial
go
SELECT e.*, c.cargo_descripcion
FROM empleados as e, cargos as c
WHERE e.cargo_id = c.cargo_id

SELECT empleado_id, apellido, nombre, fecha_contratacion
FROM empleados
WHERE year(fecha_contratacion) = 2011
AND month(fecha_contratacion) = 7

SELECT empleado_id, apellido, nombre, fecha_contratacion
FROM empleados
where fecha_contratacion = '20120707'
-- literal fecha 4 digitos año, 2 dig mes, 2 dig. dia

SELECT empleado_id, apellido, nombre, fecha_contratacion
FROM empleados
where fecha_contratacion BETWEEN '20110707' AND '20111130'

SELECT *
FROM titulos 
WHERE precio BETWEEN 10 AND 20.95

SELECT *
FROM titulos 
WHERE precio NOT BETWEEN 10 AND 20.95

SELECT e.*, c.cargo_descripcion
FROM empleados as e, cargos as c
WHERE e.cargo_id = c.cargo_id
AND nivel_cargo BETWEEN 100 AND 200


SELECT e.*, c.cargo_descripcion
FROM empleados as e, cargos as c
WHERE e.cargo_id = c.cargo_id
AND (nivel_cargo BETWEEN 100 AND 200
OR nivel_cargo = 246)


SELECT *
FROM editoriales
where editorial_nombre is null

SELECT *
FROM editoriales
where editorial_nombre is not null

INSERT INTO editoriales
(editorial_id, editorial_nombre)
values ('9945', 'Quiroga')

