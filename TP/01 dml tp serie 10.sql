use editorial
go

/* 10.1.	Informar los títulos que no hayan tenido ventas entre el 
año 2011 y 2013 exceptuando los que se hayan publicado posteriormente. 
Mostrar título, y nombre de editorial. 
Resolver este problema dos veces usando In y Exists */
select * from titulos

select titulo, editorial_nombre
from titulos as t
inner join editoriales as e on e.editorial_id = t.editorial_id
where titulo_id not in (
	select distinct titulo_id
	from ventas
	where year(fecha_orden) between 2011 and 2013
)
and year(fecha_publicacion) <= 2013

select titulo, editorial_nombre
from titulos as t
inner join editoriales as e on e.editorial_id = t.editorial_id
where not exists (
	select 1
	from ventas as v
	where year(fecha_orden) between 2011 and 2013
	and v.titulo_id = t.titulo_id
)
and year(fecha_publicacion) <= 2013

select t.titulo, e.editorial_nombre
from titulos as t
inner join editoriales as e on e.editorial_id = t.editorial_id
where fecha_publicacion < '20140101'
and t.titulo_id not in (
	select titulo_id
	from ventas
	where fecha_orden between '20110101' and '20131231'
	)

select t.titulo, e.editorial_nombre
from titulos as t
inner join editoriales as e on e.editorial_id = t.editorial_id
where fecha_publicacion < '20140101'
and not exists (
	select 1
	from ventas
	where titulo_id = t.titulo_id
	and fecha_orden between '20110101' and '20131231'
	)

/* 10.2.	Informar las editoriales que no hayan contratados empleados 
en el año 2010 excepto que sean Director editorial, Diseñador o Editor. 
Mostrar nombre de editorial. Ordenar. */
select *
from editoriales as e
--inner join empleados on empleados.editorial_id = e.editorial_id
--inner join cargos as c on c.cargo_id = empleados.cargo_id
where e.editorial_id not in (
	select editorial_id
	from empleados as e
	inner join cargos as c on c.cargo_id = e.cargo_id
	where year(fecha_contratacion) = 2010
	and cargo_descripcion not in ('Director editorial', 'Diseñador', 'Editor')
	)

select *
from editoriales
where editorial_id not in (
	select distinct editorial_id
	from empleados as e
	inner join cargos as c on c.cargo_id = e.cargo_id
	where e.fecha_contratacion between '20100101' and '20101231'
	and cargo_descripcion not in ('Director editorial', 'Diseñador', 'Editor')
	)

select *
from editoriales as ed
where not exists (
	select 1
	from empleados as e
	inner join cargos as c on c.cargo_id = e.cargo_id
	where e.fecha_contratacion between '20100101' and '20101231'
	and cargo_descripcion not in ('Director editorial', 'Diseñador', 'Editor')
	and ed.editorial_id = e.editorial_id
	)

/* 10.3.	Informar los autores que han hecho algún título juntos. 
Mostrar los nombres y apellidos de a pares, 
ósea en una misma fila apellido y nombre de un autor 
seguido de apellido y nombre del otro autor. 
Ordenar por apellido y nombre de un autor seguido de apellido y nombre del otro autor. */
select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2,
(
	select ta1.autor_id autor1, ta2.autor_id autor2
	--, ta1.titulo_id, ta2.titulo_id
	from titulo_autor as ta1, titulo_autor as ta2
	where ta1.titulo_id = ta2.titulo_id
		and ta1.autor_id > ta2.autor_id
	) as ta 
where ta.autor1 = a1.autor_id and ta.autor2 = a2.autor_id
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2,
 (
	 select ta1.autor_id autor1, ta2.autor_id autor2
	from titulo_autor as ta1, titulo_autor as ta2
	where ta1.titulo_id = ta2.titulo_id
		and ta1.autor_id <> ta2.autor_id
		and ta1.autor_orden < ta2.autor_orden
	) as ta 
where ta.autor1 = a1.autor_id and ta.autor2 = a2.autor_id
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2
where exists (
	select ta1.autor_id, ta2.autor_id
	from titulo_autor as ta1, titulo_autor as ta2
	where ta1.titulo_id = ta2.titulo_id
	and ta1.autor_id < ta2.autor_id
	and ta1.autor_id = a1.autor_id
	and ta2.autor_id = a2.autor_id
	)
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2
where exists (
	select ta1.autor_id, ta2.autor_id
	from titulo_autor as ta1
	inner join titulo_autor as ta2 on ta1.titulo_id = ta2.titulo_id
	where ta1.autor_id < ta2.autor_id
	and ta1.autor_id = a1.autor_id
	and ta2.autor_id = a2.autor_id
	)
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2
where exists (
	select ta1.autor_id, ta2.autor_id
	from titulo_autor as ta1
	inner join titulo_autor as ta2 on ta1.titulo_id = ta2.titulo_id
	where ta1.autor_id < ta2.autor_id
	and ta1.autor_id = a1.autor_id
	and ta2.autor_id = a2.autor_id
	)
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
go

/* 10.4.	Informar aquellos títulos
 que hayan tenido alguna venta mejor que las ventas del titulo 
 “Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean”. 
 Mostrar titulo y genero. Ordenar por titulo. */

 select *
 from titulos as t
 inner join ventas as v on v.titulo_id = t.titulo_id
 where cantidad > some (
	 select cantidad
	 from ventas as v
	 inner join titulos as t on t.titulo_id = v.titulo_id
--	 where titulo = 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean'
	where titulo = 'Secrets of Silicon Valley'
	 )

select distinct t.titulo, t.genero
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
where cantidad > some (
	select cantidad
	from ventas as v
	inner join titulos as t on t.titulo_id = v.titulo_id
	where titulo = 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean'
	)
order by titulo

/* 10.5.	Informar los almacenes que hayan vendido 
más del doble que cualquier otro almacén. 
Mostrar Nombre de almacén y cantidad. 
Ordenar por mayor venta primero. */

select a.almacen_nombre, v.cantidad
from almacenes as a
inner join (
	select almacen_id, sum(cantidad) as cantidad
	from ventas
	group by almacen_id
	) as v on v.almacen_id = a.almacen_id
where v.cantidad > (
	select top 1 sum(cantidad*2)
	from ventas
	group by almacen_id
	order by sum(cantidad*2) asc
	)
order by cantidad desc

select almacen_nombre, cantidad
from almacenes as a
inner join (
	select almacen_id, cantidad=sum(cantidad)
	from ventas
	group by almacen_id
	having sum(cantidad) > some( 
		select sum(cantidad) * 2
		from ventas
		group by almacen_id
	)
) as v on v.almacen_id = a.almacen_id
order by cantidad desc

/* 10.6.	Informar el almacén o los almacenes 
que haya vendido más que todos los otros. 
Mostrar Nombre de almacén y cantidad. */

select almacen_nombre, cantidad
from almacenes as a
inner join (
	select almacen_id, cantidad=sum(cantidad)
	from ventas as v
	group by almacen_id
	having sum(cantidad) > all( 
		select sum(cantidad)
		from ventas as t
		where t.almacen_id <> v.almacen_id
		group by almacen_id
	)
) as v on v.almacen_id = a.almacen_id

/* 10.7.	Informar el o los títulos que se vendieron 
más que cualquier otro con forma de pago a 60 días. */
select t.titulo
from titulos as t
inner join (
	select titulo_id
	from ventas as v1
	where forma_pago = '60 días'
	group by titulo_id
	having sum(cantidad) >= all (
		select sum(cantidad)
		from ventas as v2
		where forma_pago = '60 días'
		and v1.titulo_id <> v2.titulo_id
		group by titulo_id
	)
) as v on v.titulo_id = t.titulo_id


select *
from titulos as t
inner join (
	select titulo_id, cantidad = sum(cantidad)
	from ventas as v
	where forma_pago = '60 días'
	group by titulo_id
	having sum(cantidad) >= all(
		select sum(cantidad)
		from ventas as t
		where forma_pago = '60 días'
		and t.titulo_id <> v.titulo_id
		group by titulo_id
	)
) as v on v.titulo_id = t.titulo_id

/* 10.8.	Informar cuantos títulos tiene cada autor. 
Mostrar código de autor, nombre y cantidad de libros. */
select a.autor_id, a.autor_apellido, a.autor_nombre, cantidad
from autores as a
inner join (
	select autor_id, cantidad=COUNT(titulo_id)
	from titulo_autor
	group by autor_id
) as ta on ta.autor_id = a.autor_id


select autor_nombre, autor_apellido, cantidad
from autores as a
inner join (
	select autor_id, COUNT(*) as cantidad
	from titulo_autor
	group by autor_id
) as ta on ta.autor_id = a.autor_id

/* 10.9.	Informar el nivel de cargo más alto alcanzado 
por algún empleado de cada editorial. 
Mostrar Nombre de la editorial y nivel de cargo. 
Ordenar por nivel de cargo máximo empezando por el mayor. */
select ed.editorial_nombre, max_nivel
from editoriales as ed
inner join (
	select editorial_id, MAX(nivel_cargo) as max_nivel
	from empleados
	group by editorial_id
) as e on e.editorial_id = ed.editorial_id
order by max_nivel desc

-- mostrando el apellido
select editorial_nombre, Maximo_Nivel_cargo, e2.apellido
from editoriales as ed
inner join (
	select editorial_id, Maximo_Nivel_cargo = max(nivel_Cargo)
	from empleados
	group by editorial_id
) as em on em.editorial_id = ed.editorial_id
inner join empleados as e2 on e2.editorial_id = ed.editorial_id 
	and e2.nivel_cargo = em.Maximo_Nivel_cargo
order by Maximo_Nivel_cargo desc

/* 10.10.	Informar los autores que hayan escrito varios géneros de libros. 
Mostrar nombre y cantidad de géneros 
ordenados por esta última columna empezando por el mayor. */

select autor_nombre, cantidad
from autores as a
inner join (
	select ta.autor_id, COUNT(distinct genero) as cantidad
	from titulo_autor as ta
	inner join titulos as t on ta.titulo_id = t.titulo_id
	group by autor_id
	having COUNT(distinct genero) > 1
) as g on g.autor_id = a.autor_id
order by cantidad desc

select autor_nombre, count(distinct genero) as cantidad
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on ta.titulo_id = t.titulo_id
group by a.autor_id, autor_nombre
having count(distinct genero) > 1
order by cantidad desc

/* 10.12.	Informar cuantos títulos escribió cada autor 
inclusive aquellos que no lo hayan hecho aún. 
Mostrar nombre y apellido del autor y cantidad. 
Ordenar por cantidad mayor primero, apellido y nombre. */

select autor_nombre, autor_apellido, isnull(cantidad,0) as cantidad
from autores as a
left join (
	select autor_id, COUNT(titulo_id) as cantidad
	from titulo_autor
	group by autor_id
) as ta on ta.autor_id = a.autor_id
order by cantidad desc, autor_apellido, autor_nombre

select autor_nombre, autor_apellido, COUNT(titulo_id) as cantidad
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
GROUP BY a.autor_id, autor_nombre, autor_apellido
order by cantidad desc, autor_apellido, autor_nombre

/* 10.13.	Informar el monto de regalías a pagar por cada autor, 
inclusive aquellos que no tengan ventas, 
de las ventas del año 2013 de la editorial ‘Binnet & Hardley’. 
Mostrar apellido y nombre del autor y monto a pagar. 
Tener en cuenta que hay que operar la regalía del título 
y sobre esta la regalía del autor respecto a ese libro. */

select autor_apellido, autor_nombre, v.regalias
from autores as a
inner join (
	select ta.autor_id, sum(isnull(cantidad,0) * precio * t.regalias / 100 * ta.porcentaje_regalias / 100) as regalias
	from titulo_autor as ta
	inner join titulos as t on t.titulo_id = ta.titulo_id
	inner join editoriales as e on e.editorial_id = t.editorial_id
	left join ventas as v on v.titulo_id = ta.titulo_id and fecha_orden between '20130101' and '20131231' 
	where e.editorial_nombre = 'Binnet & Hardley'
	group by ta.autor_id
) as v on v.autor_id = a.autor_id

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

select autor_apellido, autor_nombre, isnull(v.regalias,0)
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
left join (
select ta.autor_id, sum(cantidad * precio * t.regalias / 100 * ta.porcentaje_regalias / 100) as regalias
from ventas as v
inner join titulos as t on v.titulo_id = t.titulo_id
inner join titulo_autor as ta on ta.titulo_id = t.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
where fecha_orden between '20130101' and '20131231'
and e.editorial_nombre = 'Binnet & Hardley'
group by ta.autor_id
) as v on v.autor_id = a.autor_id
where e.editorial_nombre = 'Binnet & Hardley'



--autor_id	regalias
--712-45-1867	23,988
--724-80-9391	43,18
--756-30-7391	43,18

select *
from titulos as t
inner join titulo_autor as ta on ta.titulo_id = t.titulo_id
where ta.autor_id = '724-80-9391'

select *
from titulos as t
inner join editoriales as e on e.editorial_id = t.editorial_id
inner join 

select *
from (
select t.editorial_id, v.titulo_id, sum(cantidad) as cantidad
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
group by t.editorial_id, v.titulo_id
) as v


order by t.editorial_id

