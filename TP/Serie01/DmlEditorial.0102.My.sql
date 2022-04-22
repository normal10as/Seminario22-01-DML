-- 1.2. Listar todAS lAS columnAS de empleados y la descripción del cargo que tienen.
USE editorial;
SELECT e.*, c.cargo_descripcion
FROM empleados as e, cargos as c
WHERE e.cargo_id = c.cargo_id;