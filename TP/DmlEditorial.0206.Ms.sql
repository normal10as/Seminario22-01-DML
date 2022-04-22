USE editorial
go
SELECT tipo_descuento,cantidad_minima,descuento
FROM descuentos
WHERE cantidad_minima is not null