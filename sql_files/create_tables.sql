-- number of maternal deaths table
CREATE TABLE maternal_deaths(
    Country VARCHAR(255) ,
    Year INT,
    MD_Measure NUMERIC,
    PRIMARY KEY (Country)

);

-- Medical doctors density table
CREATE TABLE MD_Density(
    Country VARCHAR(255),
    Year INT,
    D_Measure NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);

--Maternal mortality ratio
CREATE TABLE maternal_mortality(
    Country VARCHAR(255),
    Year INT,
    MM_Measure INT,
    MM_Target INT,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);

---health expenditure
CREATE TABLE health_expenditure(
    Country VARCHAR(255),
    Year INT,
    Exp_Measure NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);


--- working poverty rate
CREATE TABLE poverty_rate(
    Country VARCHAR(255),
    Year INT,
    poverty_rate_avg NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);


--- subsaharan health facilities
CREATE TABLE sub_health_facilities(
    Country VARCHAR(255),
    Facility_name TEXT,
    Facility_type VARCHAR(255),
    Facility_Ownership VARCHAR(255),
    Lat NUMERIC,
    Long NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);


--- BIRTHS ATTENDED BY SKILLED LABOUR
CREATE TABLE birth_by_skilled(
    Country VARCHAR(255),
    Year INT,
    Att_measure NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);


--- unemployment rate table
CREATE TABLE unemployment_rate(
    Country VARCHAR(255),
    Year INT,
    unemployment_rate NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);


---number of health facilities per country
CREATE TABLE health_facilities_count(
    Country VARCHAR(255),
    Facilities_Count NUMERIC,
    FOREIGN KEY (Country) REFERENCES maternal_deaths(Country)
);


--Creating ownership
ALTER TABLE maternal_deaths OWNER to postgres;
ALTER TABLE MD_Density OWNER to postgres;
ALTER TABLE maternal_mortality OWNER to postgres;
ALTER TABLE health_expenditure OWNER to postgres;
ALTER TABLE  sub_health_facilities OWNER to postgres;
ALTER TABLE  birth_by_skilled OWNER to postgres;
ALTER TABLE  unemployment_rate OWNER to postgres;
ALTER TABLE  health_facilities_count OWNER to postgres;

--creating index on foreign key for better perfomance 
CREATE INDEX Country_id ON maternal_deaths (Country);