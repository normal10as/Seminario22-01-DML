/* 12.1. Agregar los nuevos autores Facundo Manes (id 541-54-5643) 
y Mateo Niro (id 541-25-5641). 
El primero tiene teléfono 011-4515-9897, dirección Av. Libertador
2354, CP 10445 y el segundo teléfono 011-4554-7856, 
dirección Av. De Mayo 564, CP 10056. 
Ambos viven en C.A.B.A. (BA) y están contratados. */

SELECT * FROM autores

INSERT INTO autores (autor_id, autor_nombre, autor_apellido, 
	telefono, direccion, ciudad, estado, codigo_postal, contratado)
	VALUES ('541-54-5643', 'Facundo', 'Manes', '11-4515-9897', 
	'Av. Libertador 2354', 'C.A.B.A.', 'BA', '10445', 1)

INSERT INTO autores (autor_id, autor_nombre, autor_apellido, telefono, direccion, ciudad, estado, codigo_postal, contratado)
	VALUES ('541-25-5641', 'Mateo', 'Niro', '11-4554-7856', 'Av. De Mayo 564', 'C.A.B.A.', 'BA', '10056', 1)

/* 12.2. Agregar la editorial Planeta (id 5684) ubicada en C.A.B.A. (BA), Argentina. */
SELECT * FROM editoriales
INSERT INTO editoriales (editorial_id, editorial_nombre, ciudad, estado, pais)
VALUES ('9984', 'Editorial Planeta', 'C.A.B.A.', 'BA', 'Argentina')

/*12.3. Agregar el título Usar el cerebro, ID NC5001, género Neurociencia, de la
editorial Planeta, precio $12, adelanto $3000, regalías 18%, publicado el 1º de marzo
de 2014. Notas: Conocer nuestra mente para vivir mejor */
select * from titulos

insert into titulos ( titulo_id,titulo, genero, editorial_id, precio, 
	adelanto, regalias, notas, fecha_publicacion)
select 'NC5001', 'Usar el cerebro', 'Neurociencia', (
	select editorial_id 
		from editoriales 
		where editorial_nombre = 'Editorial Planeta'
	)
	,'12', '3000', '18', 'Conocer nuestra mente para vivir mejor', '20140301'

/*12.4. Agregar al título “Usar el cerebro” los autores Facundo Manes y Mateo Niro en
ese orden. Para el primero las regalías son 70% y para el segundo 30%. */

select * from titulo_autor
insert into titulo_autor (autor_id, titulo_id, 
	autor_orden, porcentaje_regalias)
select (
	select autor_id 
		from autores 
		where autor_nombre = 'Facundo' 
			and autor_apellido = 'Manes'),
	(select titulo_id 
		from titulos 
		where titulo = 'Usar el cerebro'), 
	1, 70
--insert into titulo_autor (autor_id, titulo_id, autor_orden, porcentaje_regalias)
union
select (
	select autor_id 
		from autores 
		where autor_nombre = 'Mateo' 
			and autor_apellido = 'Niro'),
	(select titulo_id 
		from titulos 
		where titulo = 'Usar el cerebro'),
	2, 30

delete from titulo_autor
where autor_id = '541-54-5643'

/*
delete from titulo_autor where autor_id = 
(select autor_id from autores where autor_nombre = 'Facundo' and autor_apellido = 'Manes')
and titulo_id =
	(select titulo_id from titulos where titulo = 'Usar el cerebro')
	*/

/* 12.5. Agregar una venta al almacén 7896 con los siguientes datos:
 Orden JJ3598
 Fecha: 30 de abril del 2015
 Cantidad: 30
 Forma de pago: 30 días
 Título: “Usar el cerebro” */

select * from ventas

insert into ventas(almacen_id, numero_orden, fecha_orden, cantidad, 
	forma_pago, titulo_id)
select 7896, 'JJ3598', '20150430', 30, '30 días', titulo_id
from titulos
where titulo = 'Usar el cerebro'

/* 12.6. Agregar un plan de regalías a cada título que no lo tenga. El rango mínimo será
cero y el máximo 5000. El porcentaje de regalías establecer en 10 */
select * from plan_regalias

insert into plan_regalias (titulo_id, regalias, rango_minimo, rango_maximo)
select titulo_id, 10, 0, 5000 
from titulos
where titulo_id not in (
	select distinct titulo_id from plan_regalias
	)

/* 12.7. Agregar un plan de regalías a cada título. El rango mínimo será el rango
máximo actual más uno, el rango máximo será el doble del rango máximo actual y la
regalía será el máximo actual más dos puntos. */
select * from plan_regalias
order by titulo_id, rango_minimo

insert into plan_regalias (titulo_id, regalias, rango_minimo, rango_maximo)
select titulo_id, max(regalias) + 2, max(rango_maximo)+1, max(rango_maximo)*2
from plan_regalias 
group by titulo_id

/* 12.8. Subir en un 10% los precios de los títulos de la editorial Algodata Infosystems */
update t
set precio = precio * 1.1
--select * 
from titulos as t
inner join editoriales as e on e.editorial_id = t.editorial_id
where editorial_nombre = 'Algodata Infosystems'

/* 12.9. A aquellos empleados que en su cargo están en el nivel mínimo (rango inferior)
subirle a la al punto medio. */
update e
set nivel_cargo = nivel_minimo + (nivel_maximo - nivel_minimo) / 2
--select *
from empleados as e
inner join cargos as c on c.cargo_id = e.cargo_id
where e.nivel_cargo = nivel_minimo

/* 12.10. Cambiar el cargo de los “editores” a “director editorial” a aquellos editores que
están a por lo menos 15 puntos del nivel máximo */
select *
from cargos

update e
set cargo_id = (select cargo_id 
					from cargos 
					where cargo_descripcion = 'director editorial'),
nivel_cargo = (select nivel_minimo 
					from cargos 
					where cargo_descripcion = 'director editorial') 
--select *
from empleados as e
inner join cargos as c on c.cargo_id = e.cargo_id
where cargo_descripcion = 'Editor'
and nivel_cargo >= nivel_maximo - 15
--where nivel_maximo - nivel_cargo <= 15


/* 12.11. Borrar los autores que no fueron contratados */
delete
--select *
from autores
where contratado = 0

/* 12.12. Borrar el título “Usar el cerebro”. Para poder completar esta operación borrar
las filas relacionas den las distintas tablas mediante subconsulta */

delete ta
--select *
from titulo_autor as ta
inner join titulos as t on t.titulo_id = ta.titulo_id
where titulo = 'Usar el cerebro'

delete v
--select *
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
where titulo = 'Usar el cerebro'

delete pa
--select *
from plan_regalias as pa
inner join titulos as t on t.titulo_id = pa.titulo_id
where titulo = 'Usar el cerebro'

delete 
--select *
from titulos
where titulo = 'Usar el cerebro'
