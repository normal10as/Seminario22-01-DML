-- 1.7. Listar los nombres de autores sin repetirlos.
USE editorial
go
SELECT DISTINCT autor_nombre
FROM autores