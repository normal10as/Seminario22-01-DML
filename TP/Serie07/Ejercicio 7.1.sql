use editorial
go
-- Informar cuantos títulos tiene cada autor. 
-- Mostrar código de autor y cantidad de libros
select *
from titulo_autor
order by autor_id


SELECT autor_id, 'Titulo por cada autor' = COUNT(titulo_id)
FROM titulo_autor
GROUP BY autor_id
