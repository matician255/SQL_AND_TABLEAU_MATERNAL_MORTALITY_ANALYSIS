----Top 10 countries with highest maternal deaths

SELECT 
    country,
    md_measure AS Maternal_deaths
FROM 
    maternal_deaths
WHERE
    year = '2020'
GROUP BY 
    country,
    Maternal_deaths
ORDER BY 
    Maternal_deaths DESC
LIMIT 10;

-- Maternal Mortality trend over time 

SELECT 
    year, 
    ROUND(AVG(mm_measure),2) as avg_mm_ratio
FROM 
    maternal_mortality
GROUP BY 
    year
ORDER BY 
    year;

--What countries met their target mortality ratio

SELECT 
country, 
mm_measure AS Maternal_mortality, 
mm_target AS Mortality_target
FROM maternal_mortality
WHERE
mm_measure <= mm_target
ORDER BY
country, year


--what countries have the largest gap btn th MMR AND target

WITH ranked_gaps AS(
    SELECT DISTINCT ON (country) 
        country,
        year,
        (mm_measure - mm_target) AS GAP
    FROM 
        maternal_mortality
    ORDER BY
        country, GAP DESC
    LIMIT 5
)
SELECT
    country,
    year,
    GAP
FROM
    ranked_gaps
ORDER BY GAP DESC;