/*La columna autor id de autores esta formateada con una secuencia de 3 series de
caracteres numéricos separadas por guiones asi: ‘xxx-xx-xxxx’ por ejemplo ‘172-32-1176’.
Informar los autores que en el id tengan las siguientes condiciones (una consulta por cada
punto)
d) Primer serie empiece con 7 a 9 */

use editorial;
select*
from autores
where autor_id regexp '^[7-9]'; 