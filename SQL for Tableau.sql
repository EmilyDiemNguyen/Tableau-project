-- GLOBAL NUMBERS

Select SUM(new_cases) as TotalCasesCount, SUM(cast(new_deaths as bigint)) as TotalDeathsCount, SUM(cast(new_deaths as bigint))/SUM(New_Cases)*100 as DeathRatio
From CovidDeaths
WHERE continent is not null

Select SUM(new_cases) as TotalCasesCount, SUM(cast(new_deaths as bigint)) as TotalDeathsCount, SUM(cast(new_deaths as bigint))/SUM(New_Cases)*100 as DeathRatio
From CovidDeaths
WHERE location = 'World'

-- Death Count by continent

SELECT continent, SUM(cast(new_deaths as bigint)) as TotalDeathsCount
From CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathsCount desc

-- Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) as HighestInfection, MAX((total_cases/population))*100 as InfectionRatio
FROM CovidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY InfectionRatio DESC

-- 

SELECT location, population, date, MAX(total_cases) as HighestInfection, MAX((total_cases/population))*100 as InfectionRatio
FROM CovidDeaths
WHERE continent is not null
GROUP BY location, population, date
ORDER BY InfectionRatio DESC


