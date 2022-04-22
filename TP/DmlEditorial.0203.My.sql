use editorial;
SELECT apellido, nombre, cargo_id, nivel_cargo
FROM empleados
WHERE cargo_id BETWEEN 10 AND 13
        AND nivel_cargo < 100;


select  *
from empleados
