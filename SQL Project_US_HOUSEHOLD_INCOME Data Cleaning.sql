# US HOUSEHOLD INCOME DATACLEANING

SELECT *
FROM us_projects.us_household_income;

ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;

SELECT *
FROM us_household_income_statistics;

SELECT id, COUNT(id)
FROM us_projects.us_household_income
GROUP BY id
HAVING  COUNT(id) > 1 ;

SELECT row_id, id, row_num
FROM (
     SELECT row_id, id,
     ROW_NUMBER()OVER (PARTITION BY id ORDER BY id)AS row_num
     FROM us_projects.us_household_income
	) AS row_table
WHERE row_num > 1;

DELETE FROM  us_household_income 
WHERE row_id IN (
                  SELECT row_id
FROM (
     SELECT row_id, id,
     ROW_NUMBER()OVER (PARTITION BY id ORDER BY id)AS row_num
     FROM us_projects.us_household_income
	) AS row_table
WHERE row_num > 1
);

SELECT id, COUNT(id)
FROM us_household_income_statistics
GROUP BY id
HAVING  COUNT(id) > 1 ;

SELECT DISTINCT(state_name)
FROM us_household_income_statistics;

UPDATE us_household_income
SET state_name= 'Georgia'
WHERE state_name= 'georia';

UPDATE us_household_income
SET state_name= 'Alabama'
WHERE state_name= 'Alabama';


SELECT *
FROM us_household_income
WHERE place = '';

SELECT *
FROM us_household_income
WHERE County = 'Autauga County';

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND  City= 'Vinemont';

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type= 'Boroughs';

SELECT ALand,AWater
FROM us_household_income
WHERE ALand ='' OR ALand=0 OR ALand IS NULL;

SELECT ALand,AWater
FROM us_household_income
WHERE AWater ='' OR AWater=0 OR AWater IS NULL;