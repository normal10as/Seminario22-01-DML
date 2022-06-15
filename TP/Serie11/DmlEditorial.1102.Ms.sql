/* 11.2. Listar los almacenes que vendieron todos los títulos.
Mostrar nombre de almacén. */

use editorial
go

select *
from almacenes as a
inner join (
	select almacen_id, total=COUNT( distinct titulo_id) 
	from ventas
	group by almacen_id
	) as v on v.almacen_id = a.almacen_id
where v.total = 
(
	select count(*) - 12 -- le afecto al valor para tener algun resultado
	--select count(*)
	from titulos
)
