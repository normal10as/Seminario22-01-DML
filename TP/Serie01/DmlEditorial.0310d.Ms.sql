/*La columna autor id de autores esta formateada con una secuencia de 3 series de
caracteres num�ricos separadas por guiones asi: �xxx-xx-xxxx� por ejemplo �172-32-1176�.
Informar los autores que en el id tengan las siguientes condiciones (una consulta por cada
punto)
d) Primer serie empiece con 7 a 9 */
use editorial
go

select *
from autores
where autor_id like '[7-9]%'
