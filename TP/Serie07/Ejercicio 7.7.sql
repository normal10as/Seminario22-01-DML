use editorial
go
/* Informar el total de regalías obtenidas por cada título 
que haya tenido 40 o más unidades vendidas. 
Mostrar el título y el monto en pesos de las regalías 
y ordenar por mayor regalía primero */

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
