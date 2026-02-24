Create database world;

use world;

select * from city;

select * from country;

select * from country;

## Question 1 : Count how many cities are there in each country?

SELECT countrycode, COUNT(*) AS city_count
FROM city
GROUP BY countrycode
ORDER BY city_count DESC;

## Question 2 : Display all continents having more than 30 countries.

SELECT continent, COUNT(*) AS country_count
FROM country
GROUP BY continent
HAVING COUNT(*) > 30;

## Question 3 : List regions whose total population exceeds 200 million.

SELECT region, SUM(Country_Pop) AS total_population
FROM country
GROUP BY region
HAVING SUM(Country_Pop) > 200000000;

## Question 4 : Find the top 5 continents by average GNP per country.

SELECT continent, AVG(GNP) AS avg_gnp
FROM country
GROUP BY continent
ORDER BY avg_gnp DESC
LIMIT 5;

## Question 5 : Find the total number of official languages spoken in each continent.

SELECT Continent, COUNT(DISTINCT.Language) AS official_languages
FROM country 
JOIN Language ON c.code = Country language(in).countrycode
WHERE Isofficial = 'T'
GROUP BY Continent;

## Question 6 : Find the maximum and minimum GNP for each continent.

SELECT continent, MAX(GNP) AS max_gnp, MIN(GNP) AS min_gnp
FROM country
GROUP BY continent;

## Question 7 : Find the country with the highest average city population.

SELECT Country_Name AS country, AVG(Country_Pop) AS avg_city_population
FROM country 
JOIN City ON Countrycode =city.CountryCode 
GROUP BY Country_Name
ORDER BY avg_city_population DESC
LIMIT 1;

## Question 8 : List continents where the average city population is greater than 200,000.

SELECT Continent, AVG(Country_Pop) AS avg_city_population
FROM country 
JOIN city ON Country_code = city.Countrycode
GROUP BY Continent
HAVING AVG(Country_Pop) > 200000;


## Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.

SELECT continent, SUM(Country_Pop) AS total_population, AVG(lifeexpectancy) AS avg_life_expectancy
FROM country
GROUP BY continent
ORDER BY avg_life_expectancy DESC;

## Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

SELECT Continent, AVG(LifeExpectancy) AS avg_life_expectancy, SUM(Country_Pop) AS total_population
FROM Country
GROUP BY Continent
HAVING SUM(Country_Pop) > 200000000
ORDER BY avg_life_expectancy DESC
LIMIT 3;






