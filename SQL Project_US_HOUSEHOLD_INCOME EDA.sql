#US_HOUSEHOLD_INCOME_EXPLORATORY_DATA_ANALYSIS

SELECT *
FROM us_projects.us_household_income;

SELECT *
FROM us_household_income_statistics;


SELECT State_Name, County,City, ALand, AWater
FROM us_projects.us_household_income;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_projects.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_projects.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT *
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0;

SELECT u.State_Name, County, `Type`, `Primary`, Mean, Median
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0;

SELECT u.State_Name, ROUND(avg( Mean),1), ROUND(AVG(Median),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5;

SELECT u.State_Name, ROUND(avg( Mean),1), ROUND(AVG(Median),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT u.State_Name, ROUND(avg( Mean),1), ROUND(AVG(Median),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 10;

SELECT u.State_Name, ROUND(avg( Mean),1), ROUND(AVG(Median),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 3 
LIMIT 10;

SELECT Type, COUNT(Type),ROUND(avg( Mean),1), ROUND(AVG(Median),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0
GROUP BY Type
ORDER BY 3 desc
LIMIT 20;


SELECT State_Name
FROM us_projects.us_household_income
WHERE Type ='Community';

SELECT Type, COUNT(Type),ROUND(avg( Mean),1), ROUND(AVG(Median),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
WHERE mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 desc
LIMIT 20;

SELECT u.State_Name,City, ROUND(avg( Mean),1)
FROM us_projects.us_household_income u
INNER JOIN us_household_income_statistics  us
  ON u.id= us.id
GROUP BY u.State_Name,City
ORDER BY 3 DESC;