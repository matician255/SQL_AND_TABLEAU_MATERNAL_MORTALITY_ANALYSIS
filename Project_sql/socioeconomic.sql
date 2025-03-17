---Does poverty increase maternal mortality ?

WITH mm_poverty AS (
    SELECT 
    maternal_mortality.country, 
    maternal_mortality.year, 
    maternal_mortality.mm_measure, 
    poverty_rate.poverty_rate_avg
    FROM 
        maternal_mortality
    JOIN poverty_rate
    ON maternal_mortality.country = poverty_rate.country 
    AND maternal_mortality.year = poverty_rate.year
    ORDER BY maternal_mortality.year DESC
)
SELECT 
    country,
    year,
    mm_measure,
    poverty_rate_avg
FROM mm_poverty
ORDER BY mm_measure DESC;


---does unemployment affect maternal mortality?
SELECT 
    maternal_mortality.country, 
    maternal_mortality.year, 
    maternal_mortality.mm_measure, 
    unemployment_rate.unemployment_rate
FROM 
    maternal_mortality
JOIN unemployment_rate
ON maternal_mortality.country = unemployment_rate.country 
AND maternal_mortality.year = unemployment_rate.year
ORDER BY maternal_mortality.mm_measure DESC;


---countries with high health investment but poor health outcomes
SELECT DISTINCT ON (maternal_mortality.country)
    maternal_mortality.country,
    maternal_mortality.year,
    maternal_mortality.mm_measure,
    health_expenditure.exp_measure
FROM
    maternal_mortality
JOIN health_expenditure ON maternal_mortality.country = health_expenditure.country 
AND maternal_mortality.year = health_expenditure.year 
WHERE
mm_measure > 400 AND
exp_measure > 150
ORDER BY mm_measure DESC;

-- top 10 countries with fastest reduction in maternal deaths

WITH mortality_change AS (
    SELECT country, 
           MAX(md_measure) - MIN(md_measure) AS reduction,
           MIN(year) AS start_year, MAX(year) AS end_year
    FROM maternal_deaths
    GROUP BY country
)
SELECT 
    country, 
    reduction, 
    start_year, 
    end_year
FROM 
    mortality_change
ORDER BY reduction DESC
LIMIT 10;