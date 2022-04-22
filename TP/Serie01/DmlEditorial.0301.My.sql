/* 3.1.	Listar las ventas que realizo 
el título “Prolonged Data Deprivation: Four Case Studies” 
el día 29 de mayo de 2013. 
Mostrar nombre de almacenes, números de orden y la cantidad 
de cada venta. */

use editorial;
select a.almacen_nombre, v.numero_orden, cantidad
FROM almacenes as a, ventas as v, titulos as t
WHERE t.titulo_id = v.titulo_id
AND a.almacen_id = v.almacen_id
AND t.titulo = 'Prolonged Data Deprivation: Four Case Studies'
and fecha_orden = '20130529'