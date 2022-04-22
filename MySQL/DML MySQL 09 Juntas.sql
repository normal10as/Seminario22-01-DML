use editorial;

-- mostrar todos los datos de los empleados y todos los datos de su cargo
-- versión junta natural, planificador resuelve por junta interna
select *
from cargos, empleados
where cargos.cargo_id = empleados.cargo_id;

-- versión junta interna
select *
from cargos
inner join empleados on cargos.cargo_id = empleados.cargo_id;

-- Informar los autores (id, nombre y apellido), sus titulos y el genero
-- versión junta natural, planificador resuelve por junta interna
select a.autor_id, autor_nombre, autor_apellido, titulo, genero
from autores as a, titulo_autor as ta, titulos as t
where ta.autor_id = a.autor_id
and t.titulo_id = ta.titulo_id;

-- versión junta interna
select a.autor_id, autor_nombre, autor_apellido, titulo, genero
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id;

-- mostrar los cargos y sus empleados inclusive aquellos que no tienen empleados
select *
from cargos
left outer join empleados on cargos.cargo_id = empleados.cargo_id
order by apellido;

-- como las columnas de la tabla derecha pueden traer nulos operar esas columnas con isnull
select cargos.cargo_id, cargo_descripcion, ifnull(empleado_id,'S.E.') as empleado_id
from cargos
left outer join empleados on cargos.cargo_id = empleados.cargo_id
order by apellido;

-- inviertiendo el orden de las tablas
select cargos.cargo_id, cargo_descripcion, ifnull(empleado_id,'S.E.') as empleado_id
from empleados
right outer join cargos on cargos.cargo_id = empleados.cargo_id
order by apellido;

-- mostrar todos los autores y los títulos que escribieron
-- informar autor id, nombre, paellido, titulo y genero
-- los que no tengan escrito un titulo aclararlo con el mensaje: "Sin titulos"
select a.autor_id, autor_nombre, autor_apellido, 
	ifnull(titulo,'Sin titulos') as titulo, ifnull(genero,'') as genero
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
left join titulos as t on t.titulo_id = ta.titulo_id;

-- mostrar todos los titulos y sus autores si existiesen
-- informar titulo, genero, autor id, nombre y apellido
select ifnull(titulo,'') as titulo, ifnull(genero,'') as genero, 
	ifnull(a.autor_id,'') as autor_id, ifnull(autor_nombre,'') autor_nombre, 
	ifnull(autor_apellido,'') autor_apellido
from autores as a
right join titulo_autor as ta on ta.autor_id = a.autor_id
right join titulos as t on t.titulo_id = ta.titulo_id;

-- mostrar todos los cargos y sus empleados asignados (apellido y nombre) junto a su editorial (nombre)
select c.cargo_descripcion, e.apellido, e.nombre, d.editorial_nombre
from empleados e
inner join editoriales d on d.editorial_id = e.editorial_id
right outer join cargos c on c.cargo_id = e.cargo_id;

-- Informar todos los autores y todos los títulos
-- si resolución, no soporta full outer join


select cargo_descripcion, 
	apellido=isnull(apellido,' sin contratación'), 	nombre=isnull(nombre,'')
from cargos as c
left outer join empleados as e on c.cargo_id = e.cargo_id
where e.fecha_contratacion between '20110201' and '20120331'
