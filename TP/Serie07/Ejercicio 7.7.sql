use editorial
go
/* Informar el total de regal�as obtenidas por cada t�tulo 
que haya tenido 40 o m�s unidades vendidas. 
Mostrar el t�tulo y el monto en pesos de las regal�as 
y ordenar por mayor regal�a primero */

select *
from titulos

select *
from ventas
order by titulo_id


SELECT t.titulo_id
	,'Monto regalias en pesos' = SUM(cantidad*precio*regalias/100)
	, sum(cantidad)
FROM titulos t,ventas v
WHERE t.titulo_id = v.titulo_id
GROUP BY t.titulo_id
HAVING sum(cantidad) >= 40
ORDER BY 'Monto regalias en pesos' DESC
