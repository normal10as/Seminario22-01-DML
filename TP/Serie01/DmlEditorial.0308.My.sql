/* 3.8. Mostrar los títulos que no tengan un “Computer”
en su título. */
use editorial;

select *
from titulos 
where titulo NOT LIKE '%computer%'