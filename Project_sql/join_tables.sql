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



--joining the 
SELECT * FROM health_facilities_count