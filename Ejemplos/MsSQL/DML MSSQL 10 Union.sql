use editorial
go

-- mostrar los nombres de los autores y los empleados
-- Especificar el rol de cada uno

SELECT nombre, apellido, cargo_descripcion AS Rol
FROM empleados AS e
INNER JOIN cargos AS c ON c.cargo_id = e.cargo_id
UNION 
SELECT autor_nombre, autor_apellido, 'Autor'
FROM autores
ORDER BY apellido, nombre


select * from empleados
select * from cargos
select * from autores

-- mostrar los nombres de los autores y los empleados
-- incluir unicamente los autores del estado "CA"
-- incluir unicamente los empleados que son editores
-- Especificar el rol de cada uno

SELECT nombre, apellido, cargo_descripcion AS Rol
FROM empleados AS e
INNER JOIN cargos AS c ON c.cargo_id = e.cargo_id
WHERE cargo_descripcion = 'Editor'
UNION ALL
SELECT autor_nombre, autor_apellido, 'Autor'
FROM autores
WHERE estado = 'CA'
ORDER BY apellido, nombre
