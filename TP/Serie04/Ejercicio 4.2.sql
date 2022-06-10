use editorial
go

SELECT titulo,ISNULL(adelanto,1000) as Adelanto
FROM titulos
