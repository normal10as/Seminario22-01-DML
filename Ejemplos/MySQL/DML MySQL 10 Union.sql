USE editorial;


-- mostrar los nombres de los autores y los empleados
-- Especificar el rol de cada uno
-- ordenar por apellido y nombre

SELECT autor_nombre AS Nombre, autor_apellido AS Apellido, 'Autor' as Rol
FROM autores
UNION
SELECT nombre, apellido, cargo_descripcion
FROM empleados as e
inner JOIN cargos as c on c.cargo_id = e.cargo_id
order by apellido, nombre;


select * from empleados;
select * from cargos;
select * from autores;