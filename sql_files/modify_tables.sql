--DROPPING ALL THE DEPENDENT FOREIGN KEY
ALTER TABLE health_expenditure DROP CONSTRAINT health_expenditure_Country_fkey;
ALTER TABLE md_density DROP CONSTRAINT md_density_Country_fkey;
ALTER TABLE birth_by_skilled DROP CONSTRAINT birth_by_skilled_Country_fkey;
ALTER TABLE health_facilities_count DROP CONSTRAINT health_facilities_count_Country_fkey;
ALTER TABLE maternal_mortality DROP CONSTRAINT maternal_mortality_Country_fkey;
ALTER TABLE poverty_rate DROP CONSTRAINT poverty_rate_Country_fkey;
ALTER TABLE sub_health_facilities DROP CONSTRAINT sub_health_facilities_Country_fkey;
ALTER TABLE unemployment_rate DROP CONSTRAINT unemployment_rate_Country_fkey;

---RECREATING A COMPOSITE PRIMARY KEY
ALTER TABLE maternal_deaths DROP CONSTRAINT maternal_deaths_pkey;
ALTER TABLE maternal_deaths ADD PRIMARY KEY (country, year);



--RECREATING THE FOREIGN KEYS
ALTER TABLE health_expenditure
ADD CONSTRAINT health_expenditure_Country_fkey
FOREIGN KEY (Country, Year) REFERENCES maternal_deaths(Country, Year);


ALTER TABLE birth_by_skilled
ADD CONSTRAINT birth_by_skilled_Country_fkey
FOREIGN KEY (Country, Year) REFERENCES maternal_deaths(Country, Year);


ALTER TABLE maternal_mortality
ADD CONSTRAINT maternal_mortality_Country_fkey
FOREIGN KEY (Country, Year) REFERENCES maternal_deaths(Country, Year);


ALTER TABLE md_density
ADD CONSTRAINT md_density_Country_fkey
FOREIGN KEY (Country, Year) REFERENCES maternal_deaths(Country, Year);


ALTER TABLE poverty_rate
ADD CONSTRAINT poverty_rate_Country_fkey
FOREIGN KEY (Country, Year) REFERENCES maternal_deaths(Country, Year);


ALTER TABLE unemployment_rate
ADD CONSTRAINT unemployment_rate_Country_fkey
FOREIGN KEY (Country, Year) REFERENCES maternal_deaths(Country, Year);


---ADDING DATA IN THE MATERNAL DEATHS DATA

INSERT INTO maternal_deaths (country, year, md_measure)
VALUES  ('ZIMBABWE', 2015, 2035),
        ('ZIMBABWE', 2016, 1960),
        ('ZIMBABWE', 2017, 1810),
        ('ZIMBABWE', 2018, 1700);