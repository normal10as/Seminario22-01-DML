/* 3.9. Mostrar los nombres de los autores que empiecen
con letras que van de la T a la Y. */
use editorial;

select *
from autores
where autor_nombre regexp '^[T-Y]'