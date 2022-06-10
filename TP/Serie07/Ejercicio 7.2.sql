use editorial
go

/* Informar el total de unidades vendidas por n�mero de orden 
del almac�n 7131. Mostrar n�mero de orden y total vendido */
SELECT *
FROM ventas
WHERE almacen_id = '7131'


SELECT numero_orden
	,'Total de unidades vendidas por n�mero de orden' = sum(cantidad)
FROM ventas
WHERE almacen_id = '7131'
GROUP BY numero_orden
