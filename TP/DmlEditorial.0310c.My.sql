/*La columna autor id de autores esta formateada con una secuencia de 3 series de
caracteres numéricos separadas por guiones asi: ‘xxx-xx-xxxx’ por ejemplo ‘172-32-1176’.
Informar los autores que en el id tengan las siguientes condiciones (una consulta por cada
punto)
-- c) Segunda serie tenga 0, 5 u 8 en cualquier posición.
*/
use editorial;
select *
from autores
where autor_id regexp '^...[-][0-9]*[058][0-9]*[-]....$';
    
select *
from autores
where autor_id regexp '^...[-][058]'
	or autor_id regexp '^...[-].[058]'