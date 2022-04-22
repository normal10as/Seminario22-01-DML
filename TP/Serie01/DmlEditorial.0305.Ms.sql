/* 3.5. Informar las publicaciones del a�o 2011 exceptuando 
las de los g�neros �business�, �psychology�
y �trad_cook�. 
Mostrar t�tulo y g�nero. 
Ordenar por g�nero y titulo. */
use editorial
go

SELECT titulo, genero
FROM titulos
WHERE fecha_publicacion between '20110101' and '20111231'
--where year(fecha_publicacion) = 2011
and genero <> 'business'
and genero <>  'psychology'
and genero <>  'trad_cook'
ORDER BY genero, titulo