--7.Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí
--amb un retràs promig major de 10 minuts.
SELECT UniqueCarrier, AVG(ArrDelay) AS avgDelay FROM flights 
GROUP BY UniqueCarrier
HAVING avgDelay > 10
ORDER BY avgDelay DESC;

--Nota: el promedio de retraso para las compañías EV y FL a mí me sale diferente que en el documento del enunciado, pero comprobandolo
--con un select y exportandolo además en Excel, me aparece que mi resultado es el correcto...