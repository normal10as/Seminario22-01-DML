USE editorial
GO

-- alias de columnas
SELECT cargo_id as cargo,
	nivel_cargo nivel,
    doble_cargo = nivel_cargo * 2
FROM empleados

SELECT cargo_id as cargo,
	nivel_cargo nivel,
    doble_cargo = nivel_cargo * 2
FROM empleados
WHERE cargo_id > 10

SELECT almacen_nombre, numero_orden, fecha_orden,
	v.titulo_id, titulo, cantidad, precio,
    total = cantidad * precio
FROM ventas as v, titulos as t, almacenes as a
WHERE v.titulo_id = t.titulo_id
	and v.almacen_id = a.almacen_id