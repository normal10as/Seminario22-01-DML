/* Informar cuantas unidades de cada título deben venderse 
para cubrir el adelanto (en concepto de regalías). 
Mostrar título y cantidad estimada
*/
use editorial
go

select titulo, adelanto / (precio * regalias / 100)
from titulos
