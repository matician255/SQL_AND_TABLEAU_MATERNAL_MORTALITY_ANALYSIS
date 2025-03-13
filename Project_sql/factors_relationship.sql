-- Does access to skilled birth attendant reduce mortality?
SELECT 
    maternal_mortality.country,
    maternal_mortality.year,
    maternal_mortality.mm_measure AS MM,
    birth_by_skilled.att_measure*100 AS Birth_by_skilled

FROM 
    maternal_mortality
JOIN 
    birth_by_skilled ON maternal_mortality.country= birth_by_skilled.country
    AND maternal_mortality.year = birth_by_skilled.year

ORDER BY mm_measure DESC


---is healthcare expenditure linked to better health outcomes
SELECT
    maternal_deaths.country,
    maternal_deaths.year,
    md_measure AS m_deaths,
    health_expenditure.exp_measure AS "h_expenditure(usd)"
FROM
    maternal_deaths
JOIN 
    health_expenditure ON maternal_deaths.country = health_expenditure.country 
    AND maternal_deaths.year = health_expenditure.year
ORDER BY m_deaths DESC;


---do more health facilities reduce maternal mortality



WITH expenditure_vs_mm AS (
    SELECT DISTINCT ON (country)
        maternal_deaths.country,
        maternal_deaths.md_measure AS m_deaths,
        health_facilities_count.facilities_count AS facilities_count
    FROM
        maternal_deaths
    JOIN 
        health_facilities_count ON maternal_deaths.country = health_facilities_count.country
    ORDER BY country
)
SELECT
    country,
    m_deaths,
    facilities_count
FROM expenditure_vs_mm
ORDER BY m_deaths DESC;


--is higher doctor density linked to lower mortality 

WITH m_deaths_vs_doctors AS(
    SELECT
        maternal_deaths.country, 
        maternal_deaths.year,
        maternal_deaths.md_measure AS m_deaths,
        md_density.d_measure AS doctor_density
    FROM 
        maternal_deaths
    JOIN md_density 
    ON maternal_deaths.country = md_density.country AND maternal_deaths.year = md_density.year
    ORDER BY maternal_deaths.year DESC
)
SELECT
    country,
    m_deaths,
     doctor_density
FROM m_deaths_vs_doctors
ORDER BY m_deaths DESC;