use editorial
go

select * from titulos

--  Mostrar el promedio de venta anual de todos los t�tulos
SELECT 'Promedio venta anual' = AVG(venta_anual)
FROM titulos
