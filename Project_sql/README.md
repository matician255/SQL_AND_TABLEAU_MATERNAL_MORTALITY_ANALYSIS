# INDEPTH ANALYSIS OF THE FACTORS AFFECTING MATERNAL HEALTH OUTCOMES


## 📌 MATERNAL MORTALITY TRENDS IN SUBSAHARAN COUNTRIES
Under this section i will analyse:  
- Top ten countries with highest maternal death
- Maternal Mortality trend over time 
- What countries met their target mortality ratio 
- What countries have the highest gaps between their maternal mortality ratio and target  
- Does access to skilled birth attendant reduce mortality?  
- Is healthcare expenditure linked to better health outcomes?
- Do more health facilities reduce maternal mortality ? 
- Is higher doctor density linked to lower mortality?
- Does poverty increase maternal mortality ?
- Does unemployment affect maternal mortality?
- What countries have high health investment but poor health outcomes?
- countries with fastest reduction in maternal deaths
✅
### 🚀 Top 10 countries with highest maternal deaths
```sql
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
```

### 🚀 Maternal Mortality trend over time
```sql
SELECT 
    year, 
    ROUND(AVG(mm_measure),2) as avg_mm_ratio
FROM 
    maternal_mortality
GROUP BY 
    year
ORDER BY 
    year;
```
### 🚀 What countries met their target mortality ratio
```sql
SELECT 
country, 
mm_measure AS Maternal_mortality, 
mm_target AS Mortality_target
FROM maternal_mortality
WHERE
mm_measure <= mm_target
ORDER BY
country, year
```
### 🚀 What countries have the highest gaps between their maternal mortality ratio and target
```sql
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
```

## 📌RELATIOSHIP BETWEEN SOCIOECONOMIC, HEALTHCARE FACTORS AND MATERNAL HEALTH OUTCOMES

## 📌HEALTHCARE FACTORS
### 🚀Does access to skilled birth attendant reduce mortality?

```SQL
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
```

### 🚀Is healthcare expenditure linked to better health outcomes
```SQL
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
```

### 🚀Do more health facilities reduce maternal mortality
```SQL
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
```

### 🚀Is higher doctor density linked to lower mortality 
```SQL
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
```


## 📌SOCIOECONOMIC FACTORS

### 🚀Does poverty increase maternal mortality ?

```SQL
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
```

### 🚀 Does unemployment affect maternal mortality?
```SQL
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
```