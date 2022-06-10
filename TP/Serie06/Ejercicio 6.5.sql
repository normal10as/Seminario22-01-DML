use editorial
go
-- Informar cuantas formas de pago existen
select *
from ventas

--select distinct forma_pago
SELECT 'Cantidad formas de pago' = COUNT(DISTINCT forma_pago)
FROM ventas

select * from ventas
