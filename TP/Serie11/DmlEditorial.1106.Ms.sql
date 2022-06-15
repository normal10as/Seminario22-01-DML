/* Informar cuantos g�neros tienen en su cat�logo cada editorial. 
Mostrar nombre de editorial y cantidad. 
Ordenar por mayor cantidad de g�neros */

select editorial_nombre, cantidad
from editoriales e
inner join 
(
	select editorial_id, COUNT(distinct genero) as cantidad
	from titulos
	group by editorial_id
) as g on g.editorial_id = e.editorial_id
order by cantidad desc
