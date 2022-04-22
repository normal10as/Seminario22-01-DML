USE EDITORIAL
GO
SELECT titulo, genero, fecha_publicacion
FROM titulos
where editorial_id = '1389'

SELECT titulo, genero, fecha_publicacion
FROM titulos
where editorial_id like '1389'