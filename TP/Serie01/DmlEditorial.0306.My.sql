/* 3.6. Mostrar los nombres de los autores que empiecen
con “L” */
use editorial;

select autor_nombre
from autores
where autor_nombre LIKE 'L%'
