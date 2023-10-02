-- View tables
SELECT *
FROM dbo.covid_data;

SELECT *
FROM dbo.greek_stock_market;

-- *********************
-- ANALYSIS BY LOCATION
-- *********************

-- 1 Greece > Total Cases, Total Deaths & Death Rate by Date
-- Shows the likelihood of dying if you contract Covid-19
SELECT location, date, total_cases, total_deaths, 
       (total_deaths/total_cases) * 100 AS death_rate
FROM dbo.covid_data
WHERE location = 'Greece'
ORDER BY date;

-- 2 Greece > Infection Rate per Population by Date
-- Show the percentage of population contracting Covid-19 in Greece
SELECT location, date, total_cases, population, 
       (total_cases/population) * 100 AS infection_rate
FROM dbo.covid_data
WHERE location = 'Greece'
ORDER BY date;

-- 3 Greece > Overall Highest Infection Rate in Greece
SELECT location, population, MAX(total_cases) AS total_cases, 
       MAX((total_cases/population)) * 100 AS infection_rate
FROM dbo.covid_data
WHERE location = 'Greece'
GROUP BY location, population;

-- 4 Greece > Highest Death Count by Population & Death Rate
SELECT location, population, MAX(total_deaths) AS total_deaths, 
       (MAX(total_deaths)/population) * 100 AS death_rate_by_population
FROM dbo.covid_data
WHERE location = 'Greece'
GROUP BY location, population;

-- ***********************
-- ANALYSIS BY VACCINATION
-- ***********************

-- 5 Greece > Rolling Vaccinations by Date
SELECT c.location, c.date, c.population, v.new_vaccinations, 
       SUM(CONVERT(INT,v.new_vaccinations)) OVER (PARTITION BY c.location
       ORDER BY c.location, c.date) AS rolling_vaccinations
FROM dbo.covid_data AS c
JOIN dbo.covid_data AS v
  ON c.location = v.location AND c.date = v.date
WHERE c.location = 'Greece'
ORDER BY c.date;

-- Use CTE
-- 6 Greece > Rolling Vaccinations & Percentage of Vaccinated Population
WITH vaccination_per_population (location, date, population, new_vaccinations, rolling_vaccinations) AS 
(
  SELECT c.location, c.date, c.population, v.new_vaccinations, 
         SUM(CONVERT(INT,v.new_vaccinations)) OVER (PARTITION BY c.location
         ORDER BY c.location, c.date) AS rolling_vaccinations
  FROM dbo.covid_data AS c
  JOIN dbo.covid_data AS v
    ON c.location = v.location AND c.date = v.date
  WHERE c.location = 'Greece'
)
SELECT *, (rolling_vaccinations/population) * 100 AS vaccinated_per_population
FROM vaccination_per_population;

-- ******************************************
-- ANALYSIS OF IMPACT ON GREEK STOCK MARKET
-- ******************************************

-- 7 Greece > Infection Rate & Death Rate vs Greek Stock Market Index Price by Date
SELECT c.date, c.location, c.new_cases, c.total_cases, c.new_deaths, c.total_deaths, 
       (c.total_cases/c.population) * 100 AS infection_rate, 
       (c.total_deaths/c.population) * 100 AS death_perc, 
       g.[close]
FROM dbo.covid_data AS c
LEFT JOIN dbo.greek_stock_market AS g
  ON c.date = g.Date
WHERE c.location = 'Greece'
ORDER BY c.date;

