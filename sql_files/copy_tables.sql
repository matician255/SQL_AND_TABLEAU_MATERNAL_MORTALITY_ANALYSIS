--copying tables from external csv to the vreated tables in the postgres data base
\COPY health_expenditure FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/health expenditure.csv' WITH CSV HEADER;
\COPY health_facilities_count FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/Hfacilities count.csv' WITH CSV HEADER;
\COPY maternal_deaths FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/maternal deaths.csv' WITH CSV HEADER;
\COPY maternal_mortality FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/maternal mortality.csv' WITH CSV HEADER;
\COPY md_density FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/md_density.csv' WITH CSV HEADER;
\COPY poverty_rate FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/poverty rate.csv' WITH CSV HEADER;
\COPY sub_health_facilities FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/subsaharan facilities.csv' WITH CSV HEADER;
\COPY unemployment_rate FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/unemployment rate.csv' WITH CSV HEADER;
\COPY birth_by_skilled FROM 'C:/Users/Administrator/Desktop/MM PROJECT/CLEANED/mm_csvs/skilled births.csv' WITH CSV HEADER;