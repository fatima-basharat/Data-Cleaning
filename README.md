# Layoffs Data Cleaning & Exploratory Analysis

### Description
This project focuses on cleaning and analyzing a dataset related to company layoffs. The dataset includes fields such as company, location, industry, total laid off, percentage laid off, date, and other relevant information. The cleaning process ensures the data is consistent, free of duplicates, and ready for exploratory analysis to extract valuable insights.

### Data Cleaning in SQL
The following SQL-based steps were taken to clean the data:

#### 1. **Remove Duplicates**
   - Created a duplicate staging table (`layoffs_staging`) to work on.
   - Used the `ROW_NUMBER()` function to identify and flag duplicate rows based on key columns like `company`, `location`, `industry`, and `date`.
   - Deleted rows where `row_num` > 1, effectively removing the duplicates from the dataset.

#### 2. **Standardize the Data**
   - **Whitespace Removal**: Trimmed unnecessary spaces around company names to maintain consistency.
   - **Industry Consolidation**: Standardized industry names, grouping variations of 'Crypto' under a single value.
   - **Date Formatting**: Converted the `date` column from text format to a standardized `DATE` format using the `STR_TO_DATE()` function.

#### 3. **Handle Null and Blank Values**
   - Checked for null or blank values in key columns such as `industry`.
   - For example, updated null entries for Airbnb in the `industry` column to 'Travel' based on contextual knowledge.

#### 4. **Remove Unnecessary Columns**
   - Dropped any intermediate or temporary columns such as `row_num` that were used solely for cleaning purposes but were not part of the final dataset.

### Exploratory Data Analysis (EDA) in SQL
The following SQL-based steps were taken to perform exploratory analysis on the cleaned layoffs dataset:

#### 1. **Identify Companies with 100% Layoffs**
   - Queried companies where the `percentage_laid_off` was 100% and ordered them by funds raised to determine how much capital these companies had before fully laying off their workforce.

#### 2. **Total Layoffs by Company**
   - Aggregated the total number of layoffs per company and ranked them to find which companies had the highest number of layoffs overall.

#### 3. **Date Range of Layoffs**
   - Queried the minimum and maximum `date` values to understand the time span of the layoffs recorded in the dataset.

#### 4. **Total Layoffs by Industry**
   - Summed the total layoffs by industry to see which industries were impacted the most during the analyzed period.

#### 5. **Total Layoffs by Country**
   - Aggregated layoffs by country to find the most affected countries and ordered them by total layoffs.

#### 6. **Rolling Total of Layoffs by Month**
   - Queried the rolling total of layoffs by month, helping identify any trends or spikes over time in layoffs.

#### 7. **Top Companies by Layoffs in Each Year**
   - Used a window function to rank the top 5 companies with the highest layoffs per year, giving a year-over-year perspective on the companies affected.

- **[Data Cleaning SQL Code](https://github.com/fatima-basharat/Layoffs-Data-Cleaning-and-Exploratory-Analysis/blob/main/DataCleaning.sql)**
- **[Exploratory Analysis SQL Code](https://github.com/fatima-basharat/Layoffs-Data-Cleaning-and-Exploratory-Analysis/blob/main/ExploratoryDataAnalysis.sql)**

The SQL code used for both data cleaning and exploratory analysis is designed to ensure a clean, accurate, and insightful exploration of the layoffs dataset.
