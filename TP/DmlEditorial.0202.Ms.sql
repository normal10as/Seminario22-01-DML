USE EDITORIAL
go
SELECT apellido, nombre, fecha_contratacion 
FROM empleados 
WHERE month(fecha_contratacion) = 2 or 
	  month(fecha_contratacion) = 6 or 
	  month(fecha_contratacion) = 8
ORDER BY month(fecha_contratacion) ASC