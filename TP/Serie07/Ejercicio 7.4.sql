use editorial
go
/* Informar el nivel de cargo más alto alcanzado por algún empleado 
de cada editorial. Mostrar Nombre de la editorial y nivel de cargo. 
Ordenar por nivel de cargo máximo empezando por el mayor */

select *
from empleados
order by editorial_id

SELECT editorial_nombre, 'nivel cargo' = MAX(nivel_cargo)
FROM editoriales, empleados
WHERE editoriales.editorial_id = empleados.editorial_id
GROUP BY editoriales.editorial_id, editorial_nombre
ORDER BY 'nivel cargo' DESC
