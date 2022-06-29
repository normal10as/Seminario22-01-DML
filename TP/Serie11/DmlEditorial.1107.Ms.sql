/* 11.7. Informar los almacenes que no han vendido algún título 
publicado el año 2011. 
Mostrar  nombre de almacén y ordenar por esta columna */

select almacen_nombre
from almacenes
where almacen_id not in (
	select distinct almacen_id
	from ventas
	where titulo_id in (
		select titulo_id --, fecha_publicacion
		from titulos  
		where year(fecha_publicacion) = 2011
	)
)
order by almacen_nombre
