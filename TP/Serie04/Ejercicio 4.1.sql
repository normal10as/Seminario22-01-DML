use editorial
go

SELECT titulo_id,titulo,editorial_nombre,ISNULL(precio,0)
FROM titulos,editoriales
WHERE titulos.editorial_id = editoriales.editorial_id
