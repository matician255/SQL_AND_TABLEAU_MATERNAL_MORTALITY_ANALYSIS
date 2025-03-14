# **Maternal Mortality Analysis in Sub-Saharan Africa**  
### **A Data-Driven Approach to Understanding Maternal Health Outcomes**

## **📌 Project Overview**  
This project explores the factors influencing **maternal mortality** in **Sub-Saharan Africa**, using **SQL for data transformation and analysis** and **Tableau for interactive visualizations**.

🚀 **Key Objectives:**  
✔️ Identify key socioeconomic and healthcare factors affecting maternal health.  
✔️ Analyze trends in **maternal mortality**  
✔️ Showcase **SQL querying, data transformation, and Tableau dashboarding skills**.  


----
## 🛠Tools Used

**SQL**: For data cleaning, transformation, and analysis.

**Tableau**: For creating interactive dashboards and visualizations.

**GitHub**: For version control and showcasing the project.

---
### **🚀 Skills Showcased**  
✅ **SQL:** Data Cleaning, Joins, Aggregations, Feature Engineering.  
✅ **Tableau:** KPI Dashboards, Dynamic Filters, Interactive Maps.  
✅ **Data Analysis:** Identifying patterns, correlations, and trends in maternal health data.

## **📊 Data Sources & Structure**  
The project is built using **9 datasets**, each representing critical maternal health indicators:  

| **Table Name**               | **Description** |
|------------------------------|------------------------------------------------|
| `maternal_mortality`         | Annual maternal mortality ratios per country  |
| `maternal_deaths`            | Total maternal deaths per year per country  |
| `birth_by_skilled`           | Percentage of births attended by skilled personnel  |
| `unemployment_rate`          | Annual unemployment rates per country  |
| `health_expenditure`         | Health expenditure as a percentage of GDP  |
| `poverty_rate`               | Percentage of population living below the poverty line  |
| `health_facilities_count`    | Total number of health facilities per country  |
| `sub_health_facilities`      | Subset of facilities in **Sub-Saharan Africa**  |
| `md_density`                 | Medical doctor density (doctors per 1,000 people)  |

**Key Challenge:** The datasets have **different year ranges** and **varying country name conventions**, which required **data cleaning and transformation** in SQL and Power Query.

 
---   

## **🛠 Data Transformation in SQL**  
### **Key SQL Steps:**
✔️ **Data Cleaning**: I did most of my data cleaning in power query, so i only added the index column 

```sql
--creating index on primary key for better perfomance 
CREATE INDEX Country_id ON maternal_deaths (Country);
``` 

✔️ **Data Joins**: Combined multiple tables using **INNER JOIN** and **LEFT JOIN** to merge key indicators.  


```sql
---Joining maternal mortality with all other contributing and socioeconomic factors*
SELECT 
    md.country,
    md.year,
    md.md_measure AS m_deaths,
    mm.mm_measure AS m_mortality,
    mm.mm_target as mortality_target,
    bp.att_measure AS skilled_birth_rate,
    ur.unemployment_rate AS unemploy_rate,
    he.exp_measure AS "health_exp(usd)",
    pr.poverty_rate_avg AS pov_rate,
    md_density.d_measure AS dr_density
FROM maternal_deaths md
LEFT JOIN maternal_mortality mm ON md.country = mm.country AND md.year = mm.year
LEFT JOIN birth_by_skilled bp ON md.country = bp.country AND md.year = bp.year
LEFT JOIN unemployment_rate ur ON md.country = ur.country AND md.year = ur.year
LEFT JOIN health_expenditure he ON md.country = he.country AND md.year = he.year
LEFT JOIN poverty_rate pr ON md.country = pr.country AND md.year = pr.year
LEFT JOIN md_density ON md.country = md_density.country AND md.year = md_density.year
ORDER BY md.country, md.year;
```


✔️ **Missing Data Handling**: Replaced null values with zero or interpolated missing years,For important missing values , data was inserted manually from other datasets due to datasets inconsistency
```sql
---ADDING DATA IN THE MATERNAL DEATHS DATA

INSERT INTO maternal_deaths (country, year, md_measure)
VALUES  ('ZIMBABWE', 2015, 2035),
        ('ZIMBABWE', 2016, 1960),
        ('ZIMBABWE', 2017, 1810),
        ('ZIMBABWE', 2018, 1700);
``` 


✔️ **Feature Engineering**: Created new columns, such as mortality gap which through Common Table Expression (CTE) i was able to identify the countries that have the largest gap between the maternal mortality ratio and the country's target  value 
  ```sql
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
  ```
✔️ **Aggregation**: Computed average maternal mortality ratio by year which helped me to analyse the trend of maternal mortality ration over the course 2015-2020.

```sql
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
```
---  
## **📈 Interactive Tableau Dashboard**  
### **Key KPIs & Visualizations:**
✅ **Average Maternal Mortality Ratio (MMR) per country**  
✅ **% of Births Attended by Skilled Personnel**  
✅ **Health Facilities per 100,000 People (No Decimals)**  
✅ **Medical Doctor Density per 1,000 People**  
✅ **Heatmaps & Trend Analysis by Year**  

📌 **Dynamic Features:**
✔️ **Filters by Country & Year**  
✔️ **Interactive Maps & Bar Charts**  
✔️ **Comparisons of Maternal Mortality vs Economic Indicators**  

🔗 **[View the Tableau Dashboard](https://public.tableau.com/shared/?:display_count=n&:origin=viz_share_link)**



---  
## **📂 Repository Structure**  
```
📂 maternal-mortality-analysis
│-- 📁 sql_file/                    # initial queiries for setting up the database
│-- 📁 Project_sql/             # All SQL scripts for data transformation
│-- 📁 tableau/                 # Tableau workbook & dashboards
│-- README.md                   # Project documentation
```

---  
## **🎯 Key Takeaways & Insights**  
📌 .................  
📌 ..............  
📌 ...................

---  
  

