/*La columna autor id de autores esta formateada con una secuencia de 3 series de
caracteres numéricos separadas por guiones asi: ‘xxx-xx-xxxx’ por ejemplo ‘172-32-1176’.
Informar los autores que en el id tengan las siguientes condiciones (una consulta por cada
punto)
e) Primer serie empiece con 7 a 9 y segunda serie no tenga 1 o 7 */
use editorial
go

select *
from autores
where autor_id like '[7-9]__-[^1,7][^1,7]%'
