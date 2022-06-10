/* 1.6. Tomando las ventas mostrar el id de título, el título y el total de ventas que se obtiene
de multiplicar la cantidad por precio. Renombrar a la columna calculada como “Total
de venta”. */ 
USE editorial
go
SELECT v.titulo_id, titulo
	, 'Total de venta' = cantidad * precio
FROM ventas as v, titulos as t
WHERE v.titulo_id = t.titulo_id
