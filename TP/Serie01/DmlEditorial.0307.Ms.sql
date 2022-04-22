/* 3.7. Mostrar los nombres de los autores que tengan
una “A” en su nombre. */
use editorial
go
select autor_nombre
from autores
where autor_nombre LIKE '%A%'