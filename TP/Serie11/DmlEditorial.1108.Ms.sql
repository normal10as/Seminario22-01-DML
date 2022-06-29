/* Informar las ciudades donde existan editoriales, 
almacenes y autores y cuantos son de cada uno. 
Mostrar nombre de ciudad, estado, la entidad existente 
(editorial, almacén o autor) y la cantidad */

select ciudad, estado, 'Editorial' as Entidad, count(*) as Cantidad
from editoriales
group by ciudad, estado
union
select ciudad, estado, 'Almacén', count(*)
from almacenes
group by ciudad, estado
union
select ciudad, estado, 'Autor', COUNT(*)
from autores
group by ciudad, estado
