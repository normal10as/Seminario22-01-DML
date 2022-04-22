-- 1.9. Listar los nombres de almacén que hayan tenido ventas sin repetirlos.
USE editorial;
SELECT DISTINCT almacen_nombre
FROM almacenes as a, ventas as v
WHERE a.almacen_id = v.almacen_id ;