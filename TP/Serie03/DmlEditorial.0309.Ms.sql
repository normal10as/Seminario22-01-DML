/* 3.9. Mostrar los nombres de los autores que empiecen
con letras que van de la T a la Y. */
use editorial
go

select autor_nombre
from autores
where autor_nombre LIKE '[T-Y]%'