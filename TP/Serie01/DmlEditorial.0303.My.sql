/* 3.3. Mostrar los títulos que no sean de la editorial
“Algodata Infosystems”. Informar título y
Editorial */
use editorial;

SELECT titulo, editorial_nombre
FROM titulos as t, editoriales AS e
WHERE t.editorial_id = E.editorial_id
AND editorial_nombre != 'Algodata Infosystems'