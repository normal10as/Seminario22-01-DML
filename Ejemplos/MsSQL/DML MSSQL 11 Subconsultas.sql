select almacen_nombre, a.almacen_direccion, a.codigo_postal, a.ciudad, sum(cantidad) as total
from ventas as v
inner join almacenes as a on a.almacen_id = v.almacen_id
group by v.almacen_id, almacen_nombre


select a.almacen_nombre, a.almacen_direccion, a.codigo_postal, 
	a.ciudad, v.total
from almacenes as a
inner join (
	select almacen_id, sum(cantidad) as total
	from ventas
	group by almacen_id
) as v on v.almacen_id = a.almacen_id
order by total desc
/* Obtener un conjunto de resultados donde cada fila corresponde 
a un código de cargo y por cada código de cargo se calcula 
la cantidad de empleados que tienen asignados esa cargo. 
Mostrar la descripción de la cargo y la cantidad calculada. 
Mostrar todas las cargos inclusive la que no tengan empleados asignados
*/
SELECT cargo_descripcion, COUNT(e.cargo_id) AS cantidad
FROM empleados as e
right JOIN cargos as c on c.cargo_id = e.cargo_id
GROUP BY e.cargo_id, cargo_descripcion


SELECT t.cargo_descripcion, t.nivel_maximo, t.nivel_minimo,
	ISNULL(te.cantidad,0) AS cantidad
FROM cargos AS t
LEFT JOIN (
	SELECT cargo_id, COUNT(*) AS cantidad
	FROM empleados
	GROUP BY cargo_id
) AS te ON te.cargo_id = t.cargo_id

