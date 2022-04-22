USE editorial;
SELECT *
FROM plan_regalias;

-- informar el mínimo porcentaje de plan de regalias
select min(regalias)
from plan_regalias;

-- informar el máximo porcentaje de plan de regalias
select max(regalias)
from plan_regalias;

-- informar la sumatoria de planes de regalias
select sum(regalias)
from plan_regalias;

-- informar la cantidad de planes de regalias
select count(regalias)
from plan_regalias;

/* Informar cuantos titulos tienen precio */
SELECT count(precio)
FROM titulos;


-- informar el porcentaje promedio de planes de regalias
select avg(regalias)
from plan_regalias;

-- informar cuantos porcentajes diferentes de plan de regalias existen
select count(distinct regalias)
from plan_regalias;

-- informar cuantos porcentajes de plan de regalias existen 
-- para el título "Is Anger the Enemy?"
select COUNT(*)
from plan_regalias as p, titulos as t
where p.titulo_id = t.titulo_id
and titulo = 'Is Anger the Enemy?';

-- cuantos empleados hay en cada cargo
select cargo_id, COUNT(*)
from empleados
group by cargo_id;

-- cuantos empleados hay en cada cargo, informar cargo, descripcion y total
select e.cargo_id, c.cargo_descripcion, COUNT(*) as cantidad_empleados
from empleados as e, cargos as c
where e.cargo_id = c.cargo_id
group by e.cargo_id
order by COUNT(*) desc;

-- informar cuantos empleados fueron contratados cada año
SELECT year(fecha_contratacion), COUNT(*)
FROM empleados
GROUP BY year(fecha_contratacion);

-- informar cuantos empleados hay en cada cargo
select e.cargo_id, COUNT(*)
from empleados as e, cargos as c
where e.cargo_id = c.cargo_id
GROUP BY e.cargo_id;

-- informar cuales años se han contratado mas de cuatro empleado
SELECT year(fecha_contratacion), COUNT(*)
FROM empleados
GROUP BY year(fecha_contratacion)
HAVING COUNT(*) > 4;

-- informar los cargos que tengan un solo empleado
select e.cargo_id, COUNT(*) AS cantidad
from empleados as e, cargos as c
where e.cargo_id = c.cargo_id
GROUP BY e.cargo_id
HAVING COUNT(*) = 1; 

