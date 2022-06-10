use editorial
go

/* Informar el cargo de director */
SELECT *
FROM cargos
WHERE cargo_descripcion = 'director'
-- TRAE todo por collation no es sensible a distinguir mayusculas o minusculas

/* Informar los empleados de nombre 'Maria' */
SELECT *
FROM empleados
WHERE nombre = 'Maria'

/* Informar los empleados que tengan 
la inicial del segundo nombre */
SELECT *
FROM empleados
WHERE inicial_segundo_nombre <> ' '

/* Informar los cargos de directores de diferentes areas */
select *
from cargos
where cargo_descripcion LIKE 'director%'

/* informar los cargos de 'compras' */
select *
from cargos
where cargo_descripcion LIKE '%compras'

/* informar los cargos de algún departamento,
por convención se usa la palabra 'de' */
select *
from cargos
where cargo_descripcion LIKE '%de%'

/* informar los cargos que tengan 'comercial' */
select *
from cargos
where cargo_descripcion LIKE '%comercial%'

/* los espacios son significativos */
select *
from cargos
where cargo_descripcion LIKE '%en%'

select *
from cargos
where cargo_descripcion LIKE '% en %'

/* informar los empleados que en el segundo caracter
del id tenga un guion */
select *
from empleados
where empleado_id LIKE '_-%'

/* informar los empleados que en el segundo caracter
del id no tenga un guion */
select *
from empleados
where empleado_id NOT LIKE '_-%'


/* informar los empleados que en el segundo caracter
del id tenga un guion o 'Y' */
select *
from empleados
where empleado_id LIKE '_-%'
	OR empleado_id LIKE '_Y%'

select *
from empleados
where empleado_id LIKE '_[-,Y]%'

/* informar los empleados que en el segundo caracter
del id tenga un guion o entre 'A' y 'P' */
select *
from empleados
where empleado_id LIKE '_[-,A-P]%'

select *
from empleados
where empleado_id NOT LIKE '_[-,A-P]%'

/* informar los empleados que en el segundo caracter
del id tenga un guion o entre 'A' y 'P' 
y el tercero no sea 'C'  */
select *
from empleados
where empleado_id LIKE '_[-,A-P][^C]%'

select *
from empleados
where empleado_id not LIKE '_[-,A-P][^C]%'

/* informar los empleados que en el segundo caracter
del id tenga un guion o entre 'A' y 'P' 
y el tercero no sea 'C' o entre 'Q' y 'Z' */
select *
from empleados
where empleado_id LIKE '_[-,A-P][^C,Q-Z]%'

/* Informar los titulos que tengan un nombre 
con guion bajo */
select *
from titulos
where genero LIKE '%R/_%' ESCAPE '/'


SELECT *
FROM empleados
WHERE apellido LIKE '_____%'

SELECT *
FROM empleados
WHERE nivel_cargo LIKE '___%'

SELECT *
FROM empleados
WHERE nivel_cargo LIKE '__'
