/* 3.8. Mostrar los t�tulos que no tengan un �Computer�
en su t�tulo. */
use editorial
go

select *
from titulos 
where titulo NOT LIKE '%computer%'