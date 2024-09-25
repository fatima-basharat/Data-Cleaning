# Layoffs Data Cleaning Project

### Description
This project focuses on cleaning a dataset related to company layoffs. The dataset includes fields such as company, location, industry, total laid off, percentage laid off, date, and other relevant information. The cleaning process ensures the data is consistent, free of duplicates, and ready for further analysis.

### Data Cleaning in SQL
The following SQL-based steps were taken to clean the data:

#### 1. **Remove Duplicates**
   - Created a duplicate staging table (`layoffs_staging`) to work on.
   - Used the `ROW_NUMBER()` function to identify and flag duplicate rows based on key columns like `company`, `location`, `industry`, and `date`.
   - Deleted rows where `row_num` > 1, effectively removing the duplicates from the dataset.

#### 2. **Standardize the Data**
   - **Whitespace Removal**: Trimmed unnecessary spaces around company names to maintain consistency.
   - **Industry Consolidation**: Standardized industry names, grouping variations of 'Crypto' under a single value.
   - **Country Field Cleanup**: Removed trailing periods from country names like 'United States.'.
   - **Date Formatting**: Converted the `date` column from text format to a standardized `DATE` format using the `STR_TO_DATE()` function.

#### 3. **Handle Null and Blank Values**
   - Checked for null or blank values in key columns such as `industry`.
   - For example, updated null entries for Airbnb in the `industry` column to 'Travel' based on contextual knowledge.

#### 4. **Remove Unnecessary Columns**
   - Dropped any intermediate or temporary columns such as `row_num` that were used solely for cleaning purposes but were not part of the final dataset.

### [SQL Source Code] (https://github.com/fatima-basharat/Data-Cleaning-Project/blob/main/DataCleaning.sql)
The SQL code used for the above operations is structured to ensure a clean, accurate, and usable dataset for further analysis.
