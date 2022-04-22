USE editorial;

-- alias de columnas
SELECT cargo_id AS cargo,
	nivel_cargo nivel,
    nivel_cargo * 2 AS doble_cargo
FROM empleados;

SELECT cargo_id as cargo,
	nivel_cargo nivel,
    nivel_cargo * 2 AS doble_cargo
FROM empleados
WHERE cargo_id > 10;

SELECT almacen_nombre, numero_orden, fecha_orden,
	v.titulo_id, titulo, cantidad, precio,
    cantidad * precio as total
FROM ventas as v, titulos as t, almacenes as a
where v.titulo_id = t.titulo_id
	and v.almacen_id = a.almacen_id;