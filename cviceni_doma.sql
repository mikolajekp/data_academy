SELECT
	continent,
	sum(population)
FROM countries
WHERE surface_area IS NOT NULL
GROUP BY continent;

SELECT
	continent,
	round(avg(surface_area), 2)
FROM countries
WHERE surface_area IS NOT NULL
GROUP BY continent;

SELECT
	religion ,
	count(*)
FROM countries
WHERE religion IS NOT NULL
GROUP BY religion;

SELECT 	
	continent,
	round(sum(population), 2),
	round(avg(population), 2),
	count(country) AS countries_count
FROM countries c 	
WHERE continent IS NOT NULL
GROUP BY continent 
ORDER BY continent;

SELECT 
	continent,
	round(avg(surface_area), 2) AS avg_area_of_countries,
	sum(surface_area)
FROM countries c 
GROUP BY continent;

SELECT 
	religion,
	sum(population),
	count(country)
FROM countries c 
GROUP BY religion;

SELECT 
	continent,
	sum(landlocked),
	round()
FROM countries
GROUP BY continent;

SELECT 
	continent,
	landlocked,
	round(avg(landlocked), 2) AS share_of_landlocked,
	round(sum(landlocked * population)/sum(population) , 2) AS share_of_landlock_population,
	round(sum(landlocked * surface_area)/sum(surface_area) , 2) AS share_of_area
FROM countries
GROUP BY continent ;

SELECT 
	continent,
	sum(landlocked),
	sum(population*landlocked)
FROM countries c 
WHERE continent = 'South America'
GROUP BY continent
ORDER BY landlocked DESC;

SELECT 
	continent,
	landlocked,
	population 
FROM countries c 
WHERE continent = 'South America'
ORDER BY landlocked DESC;

SELECT
	continent,
	region_in_world,
	country,
	sum(population)
FROM countries c
WHERE continent IS NOT NULL
GROUP BY
	continent,
	region_in_world
ORDER BY continent,
	population DESC;
	
SELECT 
	continent,
	religion,
	sum(population),
	count(country)
FROM countries c 
GROUP BY 
	continent,
	religion 
ORDER BY continent,
	sum(population) DESC;

SELECT 
	city,
	year(date),
	avg(temp)	
FROM weather
WHERE city IS NOT NULL
GROUP BY city,
	year(date);

SELECT 
	region_in_world,
	round(avg(yearly_average_temperature), 2) 
FROM countries c 
WHERE continent = 'Africa' AND region_in_world IS NOT NULL
GROUP BY region_in_world ;

------------- PART TWO -----------

SELECT *,
	confirmed - recovered/2 AS new_column
FROM covid19_basic cb;

SELECT 
	sum(recovered)
FROM covid19_basic cb 
WHERE date = '2020_08_30';

SELECT sum(confirmed - recovered)
FROM covid19_basic cb 
WHERE date = '2020-08-30';

SELECT confirmed
FROM covid19_basic cb 
WHERE date = '2020-08-30' AND country = 'Czechia';

SELECT 
	country,
	sum(confirmed)
FROM covid19_basic cb 
WHERE month(date) = 8
GROUP BY country;

SELECT country,
	sum(confirmed)
FROM covid19_basic cb 
WHERE country IN ('Czechia', 'Slovakia', 'Austria')
	AND date BETWEEN '2020-08-20' AND '2020-08-30'
GROUP BY country;

SELECT country, sum( confirmed )
FROM covid19_basic
WHERE country IN ('Czechia', 'Slovakia', 'Austria')
    AND date >= '2020-08-20' AND date <= '2020-08-30'
GROUP BY country;

SELECT country,
	max(confirmed)
FROM covid19_basic cb
GROUP BY country;

SELECT
	country,
	max(confirmed)
FROM covid19_basic_differences cbd 
WHERE country LIKE 'c%'
GROUP BY country;

SELECT
	country
FROM covid19_basic_differences cbd 
WHERE confirmed = 21669;

SELECT
	country
FROM countries c 
WHERE population > 50000000

SELECT 
	date,
	country,
	sum(confirmed)
FROM covid19_basic_differences cbd 
WHERE date >= '2020-08-01' AND country IN(
	SELECT
		country
	FROM countries c 
	WHERE population > 50000000
)
GROUP BY date,
	country;
	
SELECT 
	province,
	sum(confirmed)
FROM covid19_detail_us_differences cdud 
WHERE province LIKE 'Arkansas';

SELECT 
	country,
	province,
	population
FROM lookup_table lt 
WHERE country = 'Brazil'
ORDER BY population DESC;

SELECT 
	date,
	round(sum(confirmed), 2),
	round(avg(confirmed), 2)
FROM covid19_basic cb
GROUP BY date
ORDER BY date DESC;

SELECT 
	province,
	sum(confirmed)
FROM covid19_detail_us cdu 
WHERE date = '2020-08-30';
GROUP BY province;

SELECT
	date,
	country,
	sum(confirmed)
FROM covid19_basic_differences cbd 
GROUP BY
	date,
	country
ORDER BY confirmed DESC;