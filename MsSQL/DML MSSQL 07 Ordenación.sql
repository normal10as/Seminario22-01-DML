USE editorial
GO

/* Listar los almacenes ordenados por nombre */
SELECT *
FROM almacenes
ORDER BY almacen_nombre

/* Listar los almacenes ordenados inversamente por nombre */
SELECT *
FROM almacenes
ORDER BY almacen_nombre DESC

/* Listar los almacenes ordenados por estado y nombre */
SELECT *
FROM almacenes
ORDER BY estado, almacen_nombre

/* Listar los almacenes ordenados por estado y nombre, 
este último empezando por la Z*/
SELECT *
FROM almacenes
ORDER BY estado, almacen_nombre DESC