/* 3.4. Informar las ventas de los siguientes t�tulos:
'Cooking with Computers: Surreptitious Balance
Sheets', 'The Psychology of Computer Cooking', 
'Emotional Security: A New Algorithm'. 
Mostrar titulo, nombre de almac�n, fecha de orden, 
n�mero de orden y cantidad.
Ordenar por t�tulos. */
use editorial
go
select titulo, almacen_nombre, fecha_orden, numero_orden, cantidad
from ventas as v, titulos as t, almacenes as a 
where t.titulo_id = v.titulo_id
	AND a.almacen_id = v.almacen_id
    AND (t.titulo = 'Cooking with Computers: Surreptitious Balance Sheets'
		OR t.titulo = 'The Psychology of Computer Cooking'
        OR t.titulo = 'Emotional Security: A New Algorithm')
order by titulo
