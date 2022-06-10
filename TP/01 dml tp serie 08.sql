use editorial

/* 8.1 	Mostrar los tres primeros g�neros m�s vendidos. 
Mostrar g�nero y total de ventas ordenado por mayor total de venta. */

SELECT TOP 3 genero, total=SUM(cantidad*precio)
FROM titulos as t
INNER JOIN ventas as v on v.titulo_id = t.titulo_id
GROUP BY genero
ORDER BY total desc
go 

/*8.2. Informar las ventas a 60 d�as. Mostrar el id de t�tulo,
 el t�tulo y el total de ventas
(cantidad por precio). Renombrar a la columna calculada.*/
select t.titulo_id, titulo, sum(cantidad*precio) as total_venta
from titulos as t
inner join ventas as v on v.titulo_id = t.titulo_id
where forma_pago = '60 d�as'
group by t.titulo_id, titulo

/* 8.3. Informar los autores que hayan escrito varios g�neros de libros. 
Mostrar nombre y cantidad de g�neros ordenados por esta �ltima columna
 empezando por el mayor */

select autor_nombre, count(distinct genero) as cantidad
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on ta.titulo_id = t.titulo_id
group by a.autor_id, autor_nombre
having count(distinct genero) > 1
order by cantidad desc

/* 8.3. Informar para que editorial ha trabajado cada autor. 
Mostrar Apellido y nombre del autor y nombre de la editorial. 
Ordenar por Apellido y nombre del autor y nombre de la editorial */
select distinct autor_apellido, autor_nombre, editorial_nombre
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
order by autor_apellido, autor_nombre, editorial_nombre


/* 8.4. Informar las ventas por t�tulo. Mostrar t�tulo, 
fecha de orden y cantidad, si no tienen venta al menos 
mostrar una fila que indique la cantidad en 0. 
Ordenar por t�tulo y mayor cantidad vendida primero. */

select v.titulo_id, t.titulo, fecha_orden, sum(cantidad) as total
--, v.almacen_id
from ventas as v right join titulos as t on t.titulo_id = v.titulo_id
group by v.titulo_id, t.titulo, fecha_orden
order by titulo, total desc


select v.titulo_id, t.titulo, fecha_orden, sum(cantidad) as total
from titulos as t left join ventas as v on t.titulo_id = v.titulo_id
group by v.titulo_id, t.titulo, fecha_orden
order by titulo, total desc

select *
from ventas
order by titulo_id, fecha_orden
/* 8.5. Informar los autores que no tienen t�tulos. 
Mostrar nombre y apellido */

select autor_nombre, autor_apellido, ta.autor_id
from autores as a
left outer join titulo_autor as ta on ta.autor_id = a.autor_id
where ta.titulo_id is null

select autor_nombre, autor_apellido--, ta.autor_orden
from titulo_autor as ta 
right join autores as a on a.autor_id = ta.autor_id
group by a.autor_id, autor_nombre, autor_apellido
having count(titulo_id) = 0

/* 8.6. Informar todos los cargos y los empleados que le 
corresponden de la editorial 'New Moon Books', 
si alg�n cargo est� vacante informar como 'Vacante' en apellido.
Mostrar descripci�n del cargo, apellido y nombre. 
Ordenar por descripci�n del cargo, apellido y nombre */
--select * from cargos
select isnull(e.apellido,'Vacante') as apellido, e.nombre
	, d.editorial_nombre
	,c.cargo_descripcion
from empleados e
inner join editoriales d on d.editorial_id = e.editorial_id 
	and d.editorial_nombre = 'New Moon Books'
right outer join cargos c on c.cargo_id = e.cargo_id
--where d.editorial_nombre = 'New Moon Books'
order by c.cargo_descripcion, apellido, e.nombre

/* 8.7. Informar cuantos t�tulos escribi� cada autor 
inclusive aquellos que no lo hayan hecho
a�n. Mostrar nombre y apellido del autor y cantidad. 
Ordenar por cantidad mayor primero, apellido y nombre */

select autor_nombre, autor_apellido
	, COUNT(ta.autor_id) as cantidad
	--, ta.autor_id
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
GROUP BY a.autor_id, autor_nombre, autor_apellido
order by cantidad desc, autor_apellido, autor_nombre

/* 8.8. �Informar cuantos t�tulos �Is Anger the Enemy?� 
vendi� cada almac�n. Si un almac�n no tuvo ventas del mismo 
informar con un cero. Mostrar c�digo de almac�n y cantidad*/

select a.almacen_id, total=isnull(sum(cantidad),0)
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
	and titulo = 'Is Anger the Enemy?'
right join almacenes as a on a.almacen_id = v.almacen_id
group by a.almacen_id

/* 8.9. Informar los totales de ventas (pesos) al contado 
entre abril y septiembre del 2014 por cada almac�n. 
Mostrar nombre de almac�n, y total de venta. Si un almac�n no
tiene ventas mostrar en cero. */
select almacen_nombre, total=isnull(sum(cantidad * precio),0)
from almacenes as al
left join ventas as v on v.almacen_id = al.almacen_id
left join titulos as t on t.titulo_id = v.titulo_id
and year(fecha_orden) = 2014 
	and MONTH(fecha_orden) between 4 and 9
	and v.forma_pago = 'Al contado'
group by al.almacen_id, almacen_nombre

select almacen_nombre, total=isnull(sum(cantidad * precio),0)
from ventas as v 
inner join titulos as t on t.titulo_id = v.titulo_id
right join almacenes as al on v.almacen_id = al.almacen_id
	and year(fecha_orden) = 2014 
	and MONTH(fecha_orden) between 4 and 9
	and v.forma_pago = 'Al contado'
group by al.almacen_id, almacen_nombre

/*8.10. Informar el monto de regal�as a pagar por cada autor, 
inclusive aquellos que no tengan ventas, de las ventas del a�o 2013
de la editorial �Binnet & Hardley�. Mostrar apellido y nombre 
del autor y monto a pagar. Tener en cuenta que hay que operar la
regal�a del t�tulo y sobre esta la regal�a del autor respecto 
a ese libro. */
select a.autor_nombre, a.autor_apellido
	,regalias = sum(cantidad * precio * regalias / 100 * porcentaje_regalias / 100)
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
	and editorial_nombre = 'Binnet & Hardley'
left join ventas as v on v.titulo_id = ta.titulo_id
where year(fecha_orden) = 2013
group by a.autor_id, a.autor_nombre, a.autor_apellido

select a.autor_nombre, a.autor_apellido, 
	regalias = sum(cantidad * precio * regalias / 100 * porcentaje_regalias / 100)
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
	and editorial_nombre = 'Binnet & Hardley'
left join ventas as v on v.titulo_id = ta.titulo_id
	and year(fecha_orden) = 2013
group by a.autor_id, a.autor_nombre, a.autor_apellido

select a.autor_nombre, a.autor_apellido, 
	regalias = sum(cantidad * precio * regalias / 100 * porcentaje_regalias / 100)
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
and year(fecha_orden) = 2013
inner join titulo_autor as ta on ta.titulo_id = t.titulo_id
	and editorial_nombre = 'Binnet & Hardley'
right join autores as a on a.autor_id = ta.autor_id
group by a.autor_id, a.autor_nombre, a.autor_apellido
