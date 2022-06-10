USE editorial;
SELECT titulo_id, titulo, editorial_nombre
FROM titulos AS t, editoriales e
WHERE t.editorial_id = e.editorial_id
	AND precio IS NULL;