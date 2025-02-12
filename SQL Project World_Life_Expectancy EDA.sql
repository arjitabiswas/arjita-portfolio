# WORLD LIFE EXPECTANCY (EXPLORATORY DATA ANALYSIS)


SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`)
FROM world_life_expectancy
GROUP BY Country
ORDER BY Country DESC;

SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`),1) AS Life_Increase_In_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY Life_Increase_In_15_Years DESC;

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp >0
AND GDP > 0
ORDER BY GDP DESC;

SELECT 
SUM(CASE WHEN GDP>= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
AVG(CASE WHEN GDP>= 1500 THEN `Life expectancy` ELSE NULL END) AS High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
AVG(CASE WHEN GDP<= 1500 THEN `Life expectancy` ELSE NULL END) AS LOW_GDP_Life_Expectancy
FROM world_life_expectancy;


SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY Status;

SELECT Country,ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp >0
AND BMI > 0
ORDER BY BMI ASC;

SELECT Country,Year, `Life expectancy`, `Adult Mortality`,
        SUM(`Adult Mortality`) OVER (PARTITION BY Country ORDER BY Year) AS Rolling_Total     
FROM world_life_expectancy
WHERE Country LIKE '%United%';