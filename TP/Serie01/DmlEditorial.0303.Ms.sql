/* 3.3. Mostrar los t�tulos que no sean de la editorial
�Algodata Infosystems�. Informar t�tulo y
Editorial */
use editorial
go

SELECT titulo, editorial_nombre
FROM titulos as t, editoriales AS e
WHERE t.editorial_id = E.editorial_id
AND editorial_nombre != 'Algodata Infosystems'
