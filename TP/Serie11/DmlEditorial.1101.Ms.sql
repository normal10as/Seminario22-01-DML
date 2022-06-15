/* 11.1. Informar las editoriales que tengan solo tengan como empleado 
un editor y ningún otro cargo */
use editorial
go

select ed.editorial_nombre
from editoriales ed
inner join empleados as em on em.editorial_id = ed.editorial_id
inner join cargos as c on c.cargo_id = em.cargo_id
where c.cargo_descripcion = 'Editor'
and ed.editorial_id not in (
	select editorial_id
	from empleados as em
	inner join cargos as c on c.cargo_id = em.cargo_id
	where c.cargo_descripcion <> 'Editor'
)

