use editorial
go
SELECT * 
FROM plan_regalias

-- Informar cuantos planes de regal�as tiene el t�tulo MC3021
SELECT 'Cantidad de planes de regalia titulo MC3021' = COUNT(regalias)
FROM plan_regalias
WHERE titulo_id = 'MC3021'
