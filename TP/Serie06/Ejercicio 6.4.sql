use editorial
go

select *
from ventas

-- Obtener el total de ventas realizadas a 30 días en el año 2014
SELECT 'Total ventas 30 dias año 2014' = SUM(cantidad) 
FROM ventas
WHERE YEAR(fecha_orden) = '2014'
AND forma_pago LIKE '30 días'

SELECT 'Total ventas 30 dias año 2014' = SUM(cantidad * precio) 
FROM ventas
inner join titulos on titulos.titulo_id = ventas.titulo_id
WHERE YEAR(fecha_orden) = '2014'
AND forma_pago LIKE '30 días'
