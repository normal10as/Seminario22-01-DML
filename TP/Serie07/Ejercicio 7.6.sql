use editorial
go
-- Informar aquellos t�tulos que tengan m�s de un autor. 
-- Mostrar c�digo de t�tulo y cantidad de autores

select *
from titulo_autor
order by titulo_id

SELECT titulo_id,'Cantidad autor por libro' = COUNT(autor_id)
FROM titulo_autor
GROUP BY titulo_id
Having count(autor_id) > 1

