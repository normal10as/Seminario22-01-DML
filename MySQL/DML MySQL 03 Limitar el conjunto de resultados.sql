USE editorial;

-- Listar los generos de los libros 
SELECT DISTINCT genero
FROM titulos;

-- Listar los generos de los libros y las editoriales
SELECT DISTINCT genero, editorial_id
FROM titulos;

-- Informar los autores y los géneros que han escrito
SELECT DISTINCT autor_apellido, autor_nombre, genero
FROM autores AS a, titulo_autor AS ta, titulos AS t
WHERE a.autor_id = ta.autor_id
	AND ta.titulo_id = t.titulo_id;

-- Listar las primeras 5 tuplas de la relación empleado.
SELECT *
FROM empleados
LIMIT 5 ;
