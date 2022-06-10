use editorial
go

SELECT titulo_id,titulo,precio,	 genero
FROM titulos
WHERE genero = 'business'
ORDER BY precio DESC, titulo_id