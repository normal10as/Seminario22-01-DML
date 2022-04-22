use editorial
go

-- mostrar todos los datos de los empleados 
-- y todos los datos de su cargo
-- versión junta natural, planificador resuelve por junta interna
select *
from cargos, empleados
where cargos.cargo_id = empleados.cargo_id

-- versión junta interna
select *
from cargos
inner join empleados on cargos.cargo_id = empleados.cargo_id

-- Informar los autores (id, nombre y apellido), sus titulos y el genero
-- versión junta natural, planificador resuelve por junta interna
select a.autor_id, autor_nombre, autor_apellido, titulo, genero
from autores as a, titulo_autor as ta, titulos as t
where ta.autor_id = a.autor_id
and t.titulo_id = ta.titulo_id

-- versión junta interna
select a.autor_id, autor_nombre, autor_apellido, titulo, genero
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id

-- mostrar los cargos y sus empleados 
-- inclusive aquellos que no tienen empleados
select *
from cargos
left outer join empleados on cargos.cargo_id = empleados.cargo_id
order by cargo_descripcion

-- como las columnas de la tabla derecha pueden traer nulos operar esas columnas con isnull
select cargos.cargo_id, cargo_descripcion, isnull(empleado_id,'S.E.') as empleado_id
from cargos
left outer join empleados on cargos.cargo_id = empleados.cargo_id
order by apellido

-- mostrar todos los autores y los títulos que escribieron
-- informar autor id, nombre, paellido, titulo y genero
-- los que no tengan escrito un titulo aclararlo con el mensaje: "Sin titulos"
select a.autor_id, autor_nombre, autor_apellido, 
isnull(titulo,'Sin titulos') as titulo, isnull(genero,'') as genero
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
left join titulos as t on t.titulo_id = ta.titulo_id

-- tecnica incorrecta
select a.autor_id, autor_nombre, autor_apellido, ta.titulo_id
--,isnull(titulo,'Sin titulos') as titulo, isnull(genero,'') as genero
from autores as a
left outer join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id

-- mostrar los cargos y sus empleados inclusive aquellos que no tienen empleados
-- inviertiendo el orden de las tablas
select cargos.cargo_id, cargo_descripcion, isnull(empleado_id,'S.E.') as empleado_id
from empleados
right outer join cargos on cargos.cargo_id = empleados.cargo_id
order by apellido

-- mostrar todos los titulos y sus autores si existiesen
-- informar titulo, genero, autor id, nombre y apellido
select titulo as titulo, genero, 
	isnull(a.autor_id,'') as autor_id, isnull(autor_nombre,'') autor_nombre, isnull(autor_apellido,'') autor_apellido
from autores as a
right join titulo_autor as ta on ta.autor_id = a.autor_id
right join titulos as t on t.titulo_id = ta.titulo_id

-- mostrar todos los cargos y sus empleados asignados (apellido y nombre) 
-- junto a su editorial (nombre)
select c.cargo_descripcion, e.apellido, e.nombre, d.editorial_nombre
from empleados e
inner join editoriales d on d.editorial_id = e.editorial_id
right outer join cargos c on c.cargo_id = e.cargo_id

-- tecnica incorrecta
select c.cargo_descripcion, e.apellido, e.nombre, d.editorial_nombre
from empleados e
right outer join cargos c on c.cargo_id = e.cargo_id
inner join editoriales d on d.editorial_id = e.editorial_id

-- Informar todos los autores y todos los títulos
select isnull(a.autor_id,'-') as autor_id, isnull(autor_nombre,'') autor_nombre, isnull(autor_apellido,'') autor_apellido, 
	isnull(titulo,'') as titulo, isnull(genero,'') genero
from autores as a
full join titulo_autor as ta on ta.autor_id = a.autor_id
full join titulos as t on t.titulo_id = ta.titulo_id

/* Mostrar todos los cargos y los empleados que le corresponden 
contratados el entre febrero del 2011 y marzo del 2012, 
si algún cargo no tiene empleados mostrar “sin contratación” en apellido. */

select cargo_descripcion, 
	apellido=isnull(apellido,' sin contratación'), 	nombre=isnull(nombre,''),
	fecha_contratacion
from cargos as c
left outer join empleados as e on c.cargo_id = e.cargo_id
and e.fecha_contratacion between '20110201' and '20120331'
