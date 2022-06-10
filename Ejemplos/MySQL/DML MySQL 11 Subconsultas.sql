select almacen_nombre, a.almacen_direccion, a.codigo_postal, a.ciudad, sum(cantidad) as total
from ventas as v
inner join almacenes as a on a.almacen_id = v.almacen_id
group by v.almacen_id, almacen_nombre, a.almacen_direccion, codigo_postal, ciudad


select a.almacen_nombre, a.almacen_direccion, a.codigo_postal, 
	a.ciudad, v.total
from almacenes as a
inner join (
	select almacen_id, sum(cantidad) as total
	from ventas
	group by almacen_id
) as v on v.almacen_id = a.almacen_id
order by total desc
/* Obtener un conjunto de resultados donde cada fila corresponde 
a un código de cargo y por cada código de cargo se calcula 
la cantidad de empleados que tienen asignados esa cargo. 
Mostrar la descripción de la cargo y la cantidad calculada. 
Mostrar todas las cargos inclusive la que no tengan empleados asignados
*/
SELECT cargo_descripcion, COUNT(e.cargo_id) AS cantidad
FROM empleados as e
right JOIN cargos as c on c.cargo_id = e.cargo_id
GROUP BY e.cargo_id, cargo_descripcion


SELECT t.cargo_descripcion, t.nivel_maximo, t.nivel_minimo,
	ifnull(te.cantidad,0) AS cantidad
FROM cargos AS t
LEFT JOIN (
	SELECT cargo_id, COUNT(*) AS cantidad
	FROM empleados
	GROUP BY cargo_id
) AS te ON te.cargo_id = t.cargo_id

/* Ejemplo: Mostrar los autores que residen en las ciudades de Covelo, Palo Alto y San Jose.
*/

select *
from autores
where ciudad in ('Covelo','Palo Alto', 'San Jose', 'Posadas')

select *
from autores
where codigo_postal in (95128,94301,95428)

select *
from autores
where codigo_postal not in (95128,94301,95428)

-- Ejemplo: Listar los autores que escribieron libros
SELECT *
FROM AUTORES
WHERE AUTOR_ID IN (
	SELECT autor_id
	FROM TITULO_AUTOR
)

SELECT distinct a.*
FROM AUTORES as a
inner join TITULO_AUTOR as ta on ta.autor_id = a.autor_id

--Ejemplo: Listar los autores que no escribieron titulos
SELECT *
FROM AUTORES
WHERE AUTOR_ID NOT IN (
	SELECT AUTOR_ID
	FROM TITULO_AUTOR
)

SELECT a.*
FROM AUTORES as a
left join TITULO_AUTOR as ta on ta.autor_id = a.autor_id
where ta.autor_id is null

--Ejemplo: Listar los autores que escribieron libros:
SELECT *
FROM AUTORES AS A
WHERE EXISTS (
	SELECT *
	FROM TITULO_AUTOR AS TA
	WHERE TA.AUTOR_ID = A.AUTOR_ID
)

--Ejemplo: Listar los autores que no escribieron libros:
SELECT *
FROM AUTORES AS A
WHERE NOT EXISTS (
	SELECT 1
	FROM TITULO_AUTOR AS TA
	WHERE TA.AUTOR_ID = A.AUTOR_ID
)

SELECT *
FROM AUTORES AS A
WHERE NOT EXISTS (
	SELECT 1
	FROM TITULO_AUTOR AS TA
	WHERE TA.AUTOR_ID = A.AUTOR_ID
		and porcentaje_regalias > 50
)

select nombre, apellido
	, (
		select nivel_minimo
		from cargos
		where cargos.cargo_id = empleados.cargo_id
		) as nivel_minimo
FROM empleados
