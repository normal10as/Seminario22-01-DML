/* Informar cuantas unidades de cada t�tulo deben venderse 
para cubrir el adelanto (en concepto de regal�as). 
Mostrar t�tulo y cantidad estimada
*/
use editorial
go

select titulo, adelanto / (precio * regalias / 100)
from titulos
