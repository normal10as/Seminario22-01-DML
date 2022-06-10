/*9.1. Informar las ciudades y estado donde residen 
los autores, las editoriales y los almacenes descartando 
valores duplicados. Ordenar por nombre de ciudad. */
select ciudad, estado
from autores as a
union
select ciudad, estado
from editoriales
union
select ciudad, estado
from almacenes
order by ciudad;

/* 9.2. Informar cuantos títulos se han publicado primer semestre del 2011
 y en el primer semestre del 2017. Mostrar dos columnas y dos filas: 
 en la primera columna la descripción del periodo y en la segunda 
 la cantidad de títulos. */
 --select *
select 'Primer semestre 2011' as periodo, 
	count(titulo_id) as cantidad
from titulos
where year(fecha_publicacion) = 2011
	and MONTH(fecha_publicacion) between 1 and 6
union
select 'Primer semestre 2017', count(titulo_id)
from titulos
where year(fecha_publicacion) = 2017
	and MONTH(fecha_publicacion) between 1 and 6 
;
/* 9.3. Emitir un informe comparativo entre las ventas del año 2012 
y el año 2014. El informe debe tener las siguientes columnas: 
código de título, titulo, año y cantidad de vendida en el año 
(cada uno correspondiente al código de título de la fila correspondiente).
Tener presente que un título puede tener ventas en un año y no en el otro, 
en cuyo caso debe aparecer igual en el informe el año sin ventas. 
Ordenar por título y año */
select t.titulo_id, titulo, 2012 as anio, isnull(sum(cantidad),0) as cantidad
from titulos as t
left join ventas as v on v.titulo_id = t.titulo_id
	and year(fecha_orden) = 2012
group by t.titulo_id, titulo
union
select t.titulo_id, titulo, 2014, isnull(sum(cantidad),0)
from titulos as t
left join ventas as v on v.titulo_id = t.titulo_id
	and year(fecha_orden) = 2014
group by t.titulo_id, titulo
order by titulo_id, anio
;