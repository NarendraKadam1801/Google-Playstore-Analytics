# Google Play Store Data Analytics  

## Project Overview  
This project provides a **comprehensive SQL-based analysis of 50,000+ Android applications** from the Google Play Store.  
The aim was to design a **normalized MySQL database**, perform **data cleaning and transformation**, and execute **advanced SQL queries** to uncover trends in **app popularity, category performance, pricing strategies, and developer behavior**.  

This work demonstrates **end-to-end database management, data analysis, and reporting**—key skills for real-world data-driven decision making.  

---

## Objectives 
- Download the raw data from Kaggle Dataset 
- Design and implement a **relational database schema** in MySQL for Play Store apps
- Import the data into MySQL raw table
- Apply **data normalization (3NF)** on raw data to ensure integrity and reduce redundancy  
- Perform **data cleaning, indexing, and optimization** for query performance  
- Write **advanced SQL queries** (joins, subqueries, window functions, aggregations) for insights  

---

## Tools & Technologies  
- **Database:** MySQL
- **Database Client / Tool:** MySQL Workbench  
- **Languages:** SQL (DDL, DML, Joins, Subqueries, Window Functions, Aggregations)  
- **Version Control:** Git & GitHub  

---

## Database Design  

### **Database Schema & Tables**

#### **Raw CSV Table**
The raw dataset from Kaggle is stored in the `raw_csv_data` table as-is before normalization:

- **raw_csv_data**  
  | Column Name          | Data Type        |
  |---------------------|----------------|
  | AppName             | varchar(255)    |
  | AppID               | varchar(100)    |
  | Category            | varchar(100)    |
  | Rating              | varchar(20)     |
  | RatingCount         | bigint          |
  | Installs            | varchar(50)     |
  | MinInstalls         | bigint          |
  | MaxInstalls         | bigint          |
  | Free                | varchar(10)     |
  | Price               | varchar(20)     |
  | Currency            | varchar(10)     |
  | Size                | varchar(20)     |
  | MinAndroid          | varchar(50)     |
  | DeveloperID         | varchar(255)    |
  | DeveloperWebsite    | varchar(255)    |
  | DeveloperEmail      | varchar(255)    |
  | Released            | varchar(50)     |
  | LastUpdated         | varchar(50)     |
  | ContentRating       | varchar(50)     |
  | PrivacyPolicy       | varchar(255)    |
  | AdSupported         | varchar(10)     |
  | InAppPurchases      | varchar(10)     |
  | EditorsChoice       | varchar(10)     |
  | ScrapedTime         | varchar(50)     |

---

#### **Normalized Database Tables**
After cleaning and transformation, the normalized tables are:

- **apps**  
  | Column Name        | Data Type         | Notes                       |
  |-------------------|-----------------|-----------------------------|
  | AppID             | int AI PK        | Auto-increment primary key  |
  | AppName           | varchar(255)     |                             |
  | CategoryID        | int              | Foreign key → categories    |
  | DeveloperID       | int              | Foreign key → developers    |
  | Rating            | decimal(3,2)     |                             |
  | RatingCount       | int              |                             |
  | Installs          | varchar(50)      | Original install string     |
  | MinInstalls       | int              |                             |
  | MaxInstalls       | int              |                             |
  | Free              | tinyint(1)       | 0 = No, 1 = Yes             |
  | Price             | decimal(6,2)     |                             |
  | Currency          | varchar(10)      |                             |
  | Size              | varchar(20)      |                             |
  | MinAndroid        | varchar(50)      |                             |
  | Released          | date             |                             |
  | LastUpdated       | date             |                             |
  | ContentRating     | varchar(50)      |                             |
  | PrivacyPolicy     | varchar(255)     |                             |
  | AdSupported       | tinyint(1)       | 0 = No, 1 = Yes             |
  | InAppPurchases    | tinyint(1)       | 0 = No, 1 = Yes             |
  | EditorsChoice     | tinyint(1)       | 0 = No, 1 = Yes             |
  | ScrapedTime       | datetime         | Timestamp of data scrape    |
  | PackageName       | varchar(255)     | App package identifier      |

- **categories**  
  | Column Name    | Data Type      |
  |---------------|---------------|
  | CategoryID     | int AI PK      |
  | CategoryName   | varchar(100)  |

- **developers**  
  | Column Name       | Data Type      |
  |------------------|---------------|
  | DeveloperID       | int AI PK      |
  | DeveloperName     | varchar(255)  |
  | DeveloperWebsite  | varchar(255)  |
  | DeveloperEmail    | varchar(255)  |

---

## Key SQL Queries  

1. **Database Setup & Data Insertion**  
   - `database_schema.sql` → Creates normalized database tables (`apps`, `categories`, `developers`).  
   - `data_inserts.sql` → Inserts cleaned and transformed data from CSV/batch files into the tables.  

2. **Category & App Analysis**  
   - `category_avg_price_rating.sql` → Calculates average price and rating per category.  
   - `free_vs_paid_apps.sql` → Analyzes distribution of free vs. paid apps across categories.  
   - `top_3_apps_per_category.sql` → Lists top 3 apps in each category based on rating and installs.  
   - `suspicious_apps_analysis.sql` → Identifies apps with inconsistent installs or pricing data.  

3. **Developer Analysis**  
   - `top_developer_portfolio.sql` → Identifies developers with the most published apps.  
   - `top_developers_installs.sql` → Finds developers whose apps have the highest total installs.  

> **Usage:** Run the scripts in the order listed above to replicate the analysis and insights.

---

## Insights

1. **Category Trends**
   - Highest rated categories: *Simulation (3.35)*, *Casino (3.32)*, *Role Playing (3.18)*.
   - Lowest rated categories: *Events (1.19)*, *Food & Drink (1.39)*, *Beauty (1.51)*.
   - Largest app counts: *Education (5496 apps)*, *Entertainment (3059 apps)*, *Tools (3276 apps)*.

2. **Free vs Paid Apps**
   - Free apps dominate in both number and installs.
   - Paid apps tend to have slightly higher ratings in *Adventure, Action, Simulation, Personalization*.
   - Categories like *Music & Audio* and *Productivity* show high installs mostly for free apps.

3. **Top Apps per Category**
   - Examples: *INDIANA- Lost In The Jungle* (Adventure), *Language Translator free* (Tools), *Unlock any Phone Guide & Methods* (Productivity).  

4. **Suspicious Apps**
   - High *RatingPerInstall* indicates potential anomalies (5-star rating with <10 installs).  

5. **Developer Insights**
   - Top developers by portfolio: *EduGorilla Testseries 2*, *New keyboard Theme for Android 2021*, *Free keyboard for Android-2021 theme apps*.
   - Highest installs do not always correlate with top ratings.

6. **Overall Observation**
   - High installs and high ratings rarely coincide.
   - Free apps drive most engagement; paid apps maintain slightly better ratings in selected categories.

---

##  How to Run the Project  
1. **Clone the repository**  
   ```bash
   git clone https://github.com/yourusername/google-playstore-sql-analytics.git
   
2. **Import dataset into MySQL**  
   You can choose either of the following options:
   
   - **Option 1 (Full Dataset):** Use the original Kaggle dataset (large file, may take longer to load).  
      Download it here: [Google Play Store Apps Dataset on Kaggle](https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps)
     
   - **Option 2 (Recommended): Use the optimized batch dataset created from the original file for smoother execution.
     ```sql
     SOURCE Google-Playstore-Analytics/Datasets/batch-dataset.csv;
     
4. **Run analysis queries**
   Open your MySQL client and execute the queries from the `SQL-scripts` folder.  
   You can run them one by one, for example:  
   ```sql
   SOURCE Google-Playstore-Analytics/SQL-scripts/database_schema.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/data_inserts.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/category_avg_price_rating.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/free_vs_paid_apps.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/top_3_apps_per_category.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/suspicious_apps_analysis.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/top_developer_portfolio.sql;
   SOURCE Google-Playstore-Analytics/SQL-scripts/top_developers_installs.sql

---

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  

This project is licensed under the **MIT License** – you are free to use, modify, and distribute with attribution.

---

## Author  
**Narendra Kadam**  

<p align="left">
  <a href="mailto:nrk19059@gmail.com"> 
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email Badge"> 
  </a> 
  <a href="https://www.linkedin.com/in/narendra-kadam1801/"> 
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"> 
  </a> 
  <a href="https://github.com/NarendraKadam1801"> 
    <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Badge"> 
  </a>
  <a href="https://www.mysql.com/"> 
    <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL Badge"> 
  </a>
  <a href="https://www.microsoft.com/en-us/microsoft-365/excel"> 
    <img src="https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white" alt="Excel Badge"> 
  </a> 
  <a href="https://www.sql.org/"> 
    <img src="https://img.shields.io/badge/SQL-005C99?style=for-the-badge&logo=sql&logoColor=white" alt="SQL Badge"> 
  </a> 
</p> ```
