-- establecer la base de datos activa
USE editorial;

-- una consulta típica
SELECT *
FROM editoriales
WHERE pais = 'USA'

-- columna constante
SELECT 'Hello World'
SELECT 5*4
-- columna con funciones y variables del sistema
SELECT GETdate()
SELECT @@version
-- calcular el 20% de 5000
select valor1 = 5000 * .2, valor2 = 5000 * 20 / 100

-- calculo sobre columna de una tabla
SELECT nivel_cargo, doble_cargo = nivel_cargo * 2
	, apellido as last_name, nombre name
FROM empleados
select *
from empleados

-- todas las filas y todas las columnas de autores
select *
from autores

-- todas las filas y las columnas especificadas de autores
select autor_nombre, autor_apellido, autor_id
from autores

/* Informar todas las ventas realizadas
Por cada venta mostrar almacen, orden, 
fecha, id de titulo, titulo, 
cantidad, precio y total
*/
select *
from ventas
select *
from titulos
select *
from ventas, titulos

SELECT almacen_id, numero_orden, fecha_orden,
	ventas.titulo_id, titulo, cantidad, precio,
    total = cantidad * precio
FROM ventas, titulos
WHERE ventas.titulo_id = titulos.titulo_id

-- incluyendo el nombre del almacen
SELECT almacen_nombre, numero_orden, fecha_orden,
	ventas.titulo_id, titulo, cantidad, precio,
    total = cantidad * precio
FROM ventas, titulos, almacenes
WHERE ventas.titulo_id = titulos.titulo_id
	and ventas.almacen_id = almacenes.almacen_id

SELECT almacen_nombre, numero_orden, fecha_orden,
	v.titulo_id, titulo, cantidad, precio,
    total = cantidad * precio
FROM ventas as v, titulos as t, almacenes as a
WHERE v.titulo_id = t.titulo_id
	and v.almacen_id = a.almacen_id
