USE editorial
go
SELECT almacen_id, numero_orden, fecha_orden, titulo
FROM ventas as v, titulos as t
WHERE v.titulo_id = t.titulo_id 
	AND almacen_id Between 7000 and 7999