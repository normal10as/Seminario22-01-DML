/* 3.2. Listar el nombre, la inicial del segundo nombre
y el apellido de los empleados de las editoriales
“Lucerne Publishing” y “New Moon Books” */
use editorial;

select nombre, inicial_segundo_nombre, apellido
FROM empleados as em, editoriales as ed
WHERE em.editorial_id = ed.editorial_id
	AND (ed.editorial_nombre = 'Lucerne Publishing'
	OR ed.editorial_nombre = 'New Moon Books')
