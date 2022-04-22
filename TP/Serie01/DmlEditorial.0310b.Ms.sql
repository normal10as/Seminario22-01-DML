/*La columna autor id de autores esta formateada con una secuencia de 3 series de
caracteres numéricos separadas por guiones asi: ‘xxx-xx-xxxx’ por ejemplo ‘172-32-1176’.
Informar los autores que en el id tengan las siguientes condiciones (una consulta por cada
punto)
b) Segunda serie tenga solo 0, 5 y 8 en cualquier posición
*/
use editorial

select *
from autores
where autor_id like '___-[0,5,8][0,5,8]-%'
