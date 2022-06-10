use editorial
go

/* Informar el total de unidades vendidas por número de orden 
del almacén 7131. Mostrar número de orden y total vendido */
SELECT *
FROM ventas
WHERE almacen_id = '7131'


SELECT numero_orden
	,'Total de unidades vendidas por número de orden' = sum(cantidad)
FROM ventas
WHERE almacen_id = '7131'
GROUP BY numero_orden
