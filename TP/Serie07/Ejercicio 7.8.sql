use editorial
go
/* Informar los autores que hayan escrito varios g�neros de t�tulos. 
Mostrar nombre y cantidad de g�neros ordenados 
por esta �ltima columna empezando por el mayor*/
SELECT autor_nombre, 'Cantidad de generos' = COUNT(DISTINCT genero)
FROM titulos,autores a,titulo_autor
WHERE a.autor_id = titulo_autor.autor_id 
AND titulos.titulo_id = titulo_autor.titulo_id
GROUP BY a.autor_id, autor_nombre
HAVING COUNT(DISTINCT genero) > 1
ORDER BY 'Cantidad de generos' DESC
