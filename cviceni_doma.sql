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

