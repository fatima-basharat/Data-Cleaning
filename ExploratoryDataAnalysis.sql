-- Exploratory Data Analysis

SELECT * 
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off) 
FROM layoffs_staging2;

-- Select all rows where 100% of the workforce was laid off, 
-- and order by companies with the highest funds raised
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


-- Sum total layoffs by company and display in descending order
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


-- Find the range of dates in the dataset (earliest and latest dates)
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;


-- Sum total layoffs by industry, sorted by highest layoffs
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;


-- Sum total layoffs by country, sorted by highest layoffs
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;


-- Sum total layoffs by year, sorted by most recent years
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;


-- Sum percentage of layoffs by company, ordered by highest percentage
SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Rolling total of layoffs by month (aggregating by year and month)
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;


-- Calculate a rolling total of layoffs, summed month by month
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;


-- Sum total layoffs by company and year, sorted by company alphabetically
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;
;


-- Rank the top 5 companies with the highest layoffs per year
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;