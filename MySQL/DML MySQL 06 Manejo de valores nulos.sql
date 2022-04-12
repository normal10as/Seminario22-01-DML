USE editorial;

-- obtener los titulos que no tienen precio
SELECT *
FROM titulos
WHERE precio is null;

-- mostrar todos los titulos, su precio y notas
-- aquellos que no tengan precio mostrar el mismo en 0
SELECT titulo, ifnull(precio,0) as precio, ifnull(notas,"") as notas
FROM titulos;