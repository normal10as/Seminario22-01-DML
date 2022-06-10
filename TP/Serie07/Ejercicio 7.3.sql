use editorial
go
/* . Informar la �ltima orden generada por cada almac�n 
con forma de pago a 30 d�as y 60 d�as.
Mostrar c�digo de almac�n, fecha de la orden y forma de pago. 
Ordenar por fecha de orden. */

select *
from ventas
order by almacen_id, fecha_orden


SELECT almacen_id,'Fecha orden' = MAX(fecha_orden), forma_pago
FROM ventas
--WHERE ventas.almacen_id = almacenes.almacen_id
WHERE forma_pago LIKE '%[30,60] d�as%'
GROUP BY almacen_id, forma_pago
ORDER BY 'Fecha orden'
