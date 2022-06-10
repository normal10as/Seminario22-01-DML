use editorial
go
select *
from titulos
order by genero

-- Mostrar los tres primeros géneros más vendidos. 
-- Mostrar género y total de ventas ordenado por mayor total de venta
select *
from ventas


SELECT top 3 genero,'Total ventas' = SUM(cantidad*precio), sum(cantidad)
FROM titulos,ventas
WHERE titulos.titulo_id = ventas.titulo_id
GROUP BY genero
ORDER BY 'Total ventas' DESC

