/* 3.5. Informar las publicaciones del año 2011 exceptuando 
las de los géneros ‘business’, ‘psychology’
y ‘trad_cook’. 
Mostrar título y género. 
Ordenar por género y titulo. */
use editorial;


SELECT *
FROM titulos
WHERE fecha_publicacion between '20110101' and '20111231'
and genero <> 'business'
and genero <>  'psychology'
and genero <>  'trad_cook'
ORDER BY genero, titulo