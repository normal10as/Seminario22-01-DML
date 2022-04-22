USE editorial;
SELECT tipo_descuento,cantidad_minima,descuento
FROM descuentos
WHERE cantidad_minima IS NOT NULL;

select * 
from descuentos
