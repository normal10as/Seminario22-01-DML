/* 3.4. Informar las ventas de los siguientes títulos:
'Cooking with Computers: Surreptitious Balance
Sheets', 'The Psychology of Computer Cooking', 
'Emotional Security: A New Algorithm'. 
Mostrar titulo, nombre de almacén, fecha de orden, 
número de orden y cantidad.
Ordenar por títulos. */
use editorial;

select titulo, almacen_nombre, fecha_orden, numero_orden, cantidad
from ventas as v, titulos as t, almacenes as a 
where t.titulo_id = v.titulo_id
	AND a.almacen_id = v.almacen_id
    AND (t.titulo = 'Cooking with Computers: Surreptitious Balance Sheets'
		OR T.titulo = 'The Psychology of Computer Cooking'
        OR t.titulo = 'Emotional Security: A New Algorithm')
ORDER BY titulo