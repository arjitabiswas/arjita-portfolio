#WORLD LIFE EXPECTANCY (DATA CLEANING)

SELECT *
FROM world_life_expectancy;


SELECT Country, Year,Concat(Country, Year), COUNT(Concat(Country, Year))
FROM world_life_expectancy
GROUP BY Country, Year,Concat(Country, Year)
HAVING COUNT(Concat(Country, Year)) > 1;


SELECT  *
FROM (  
        SELECT Row_id, 
		 Concat(Country, Year),
		 ROW_NUMBER() OVER (PARTITION BY Concat(Country, Year) ORDER BY Concat(Country, Year)) AS Row_Num
		 FROM world_life_expectancy
	) AS Row_table
WHERE Row_Num > 1;

DELETE FROM world_life_expectancy
WHERE  
     ROW_ID IN (
                 SELECT  Row_id
FROM (  
        SELECT Row_id, 
		 Concat(Country, Year),
		 ROW_NUMBER() OVER (PARTITION BY Concat(Country, Year) ORDER BY Concat(Country, Year)) AS Row_Num
		 FROM world_life_expectancy
	) AS Row_table
WHERE Row_Num > 1
              );
      
 SELECT *
 FROM world_life_expectancy
 WHERE Status = '';
 
 SELECT DISTINCT(status)
 FROM world_life_expectancy;
 
 SELECT DISTINCT(Country)
 FROM world_life_expectancy
 WHERE status ='Developing';
 
 UPDATE world_life_expectancy t1
 JOIN world_life_expectancy t2
  ON t1.Country= t2.Country
SET t1.status= 'Developing'
WHERE t1.status= ''
AND   t2.status <> ''
AND   t2.status= 'Developing';

SELECT *
FROM world_life_expectancy
WHERE Country = 'United States of America';


UPDATE world_life_expectancy t1
 JOIN world_life_expectancy t2
  ON t1.Country= t2.Country
SET t1.status= 'Developed'
WHERE t1.status= ''
AND   t2.status <> ''
AND   t2.status= 'Developed';


SELECT *
FROM world_life_expectancy
WHERE `Life Expectancy` = '';


SELECT Country, Year, `Life expectancy`
FROM world_life_expectancy;

SELECT t1.Country, t1.Year, t1.`Life expectancy`,
       t2.Country,t2.Year, t2.`Life expectancy`,
       t3.Country,t3.Year, t3.`Life expectancy`,
       ROUND((t2.`Life expectancy`+t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
  ON t1. Country= t2. Country
  AND t1.YEAR= t2.Year - 1
JOIN world_life_expectancy t3
   ON t1. Country= t3. Country
  AND t1.YEAR= t3.Year +1
WHERE t1.`Life expectancy`='';


UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
  ON t1. Country= t2. Country
  AND t1.YEAR= t2.Year - 1
JOIN world_life_expectancy t3
   ON t1. Country= t3. Country
  AND t1.YEAR= t3.Year +1
SET t1.`Life expectancy`= ROUND((t2.`Life expectancy`+t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy`='';

