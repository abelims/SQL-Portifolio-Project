--select *
--from [portfolio project ]..CovidDeaths$

select *
from [portfolio project ]..CovidDeaths$
order by 3,4

--select *
--from [portfolio project ]..CovidVaccinations$
--order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, population
From [portfolio project ]..CovidDeaths$
Where continent is not null 
order by 1,2

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as Deathrate
From [portfolio project ]..CovidDeaths$
Where location like 'United kingdom'
and continent is not null 
order by 1,2

Select Location, total_cases, Poulation, (total_cases/population)*100 as Deathrate
From [portfolio project ]..CovidDeaths$
Where location like 'United kingdom'
and continent is not null 
order by 1,2

Select Population
From [portfolio project ]..CovidDeaths$

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From [portfolio project ]..CovidDeaths$
Where location like 'United kingdom'
order by 1,2

Select Location, Population, MAX(total_deaths) as HighestInfectionCount,  Max((total_deaths/population))*100 as PercentPopulationInfected
From  [portfolio project ]..CovidDeaths$
Group by Location, Population
order by PercentPopulationInfected desc, HighestInfectionCount desc

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From [portfolio project ]..CovidDeaths$
--Where location like '%states%'
Where continent is not null 
Group by Location
order by TotalDeathCount desc