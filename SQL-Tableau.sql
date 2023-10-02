-- 1. Timeline of Cases, Deaths, and Stock Prices:
SELECT c.date, c.total_cases, c.total_deaths, g.[close]
FROM dbo.covid_data c
JOIN dbo.greek_stock_market g ON c.date = g.Date
WHERE c.location = 'Greece'
ORDER BY c.date;

-- 2. Infection Rate vs. Stock Prices:
SELECT c.date, 
       (c.total_cases/c.population) * 100 AS infection_rate, 
       g.[close]
FROM dbo.covid_data c
JOIN dbo.greek_stock_market g ON c.date = g.Date
WHERE c.location = 'Greece'
ORDER BY c.date;

-- 3. Death Rate vs. Stock Prices:
SELECT c.date, 
       (c.total_deaths/c.population) * 100 AS death_rate, 
       g.[close]
FROM dbo.covid_data c
JOIN dbo.greek_stock_market g ON c.date = g.Date
WHERE c.location = 'Greece'
ORDER BY c.date;

-- 4. Vaccination Progress:
SELECT date, new_vaccinations, total_vaccinations
FROM dbo.covid_data
WHERE location = 'Greece'
AND new_vaccinations IS NOT NULL
ORDER BY date;


-- 5. Summary Metrics:
SELECT MAX(c.date) AS latest_date, 
       MAX(c.total_cases) AS total_cases, 
       MAX(c.total_deaths) AS total_deaths, 
       MAX(g.[close]) AS latest_stock_price
FROM dbo.covid_data c
JOIN dbo.greek_stock_market g ON c.date = g.Date
WHERE location = 'Greece';