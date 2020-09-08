--1.Quantitat de registres de la taula de vols
SELECT COUNT(flightID) AS total FROM flights;

--2.Retard promig de sortida i arribada segons l’aeroport origen
SELECT Origin, AVG(ArrDelay) AS prom_arribades, AVG(DepDelay) AS prom_sortides FROM flights 
GROUP BY Origin;

--3.Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els 
--resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM flights 
GROUP BY Origin, colYear, colMonth;

--4.Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans 
--i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
SELECT City, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM flights 
INNER JOIN usairports 
ON flights.Origin = usairports.IATA 
GROUP BY City, colYear, colMonth;

--5.Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que 
--les companyies amb més cancel·lacions apareguin les primeres.
SELECT UniqueCarrier, colYear, colMonth, COUNT(Cancelled) AS total_cancelled FROM flights
WHERE Cancelled=1
GROUP BY UniqueCarrier, colYear, colMonth
ORDER BY total_cancelled DESC, colYear ASC;

--6.L’identificador dels 10 avions que més distància han recorregut fent vols
SELECT TailNum, SUM(Distance) AS total_distance FROM flights 
WHERE TailNum != "" 
GROUP BY TailNum 
ORDER BY total_distance DESC LIMIT 10


