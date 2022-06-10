USE EDITORIAL;
SELECT apellido, nombre, fecha_contratacion
FROM empleados
WHERE MONTH(fecha_contratacion) = 2
        OR MONTH(fecha_contratacion) = 6
        OR MONTH(fecha_contratacion) = 8
ORDER BY MONTH(fecha_contratacion) ASC;