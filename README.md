# Google Play Store Data Analytics  

## Project Overview  
This project provides a **comprehensive SQL-based analysis of 10,000+ Android applications** from the Google Play Store.  
The aim was to design a **normalized MySQL database**, perform **data cleaning and transformation**, and execute **advanced SQL queries** to uncover trends in **app popularity, category performance, pricing strategies, and developer behavior**.  

This work demonstrates **end-to-end database management, data analysis, and reporting**—key skills required for real-world data-driven decision making.  

---

## Objectives  
- Design and implement a **relational database schema** in MySQL for Play Store apps  
- Apply **data normalization (3NF)** to ensure integrity and reduce redundancy  
- Perform **data cleaning, indexing, and optimization** for query performance  
- Write **advanced SQL queries** (joins, subqueries, window functions, aggregations) for insights  
- Build **visual summaries** using Excel/Power BI to communicate findings  

---

## Tools & Technologies  
- **Database:** MySQL  
- **Languages:** SQL (DDL, DML, Joins, Subqueries, Window Functions, Aggregations)  
- **Version Control:** Git & GitHub  

---

## Database Design  

### **Schema & Tables**
- **Apps** → AppID, AppName, CategoryID, DeveloperID, Rating, RatingCount, Installs, Price, Size, ReleasedDate, LastUpdated  
- **Categories** → CategoryID, CategoryName  
- **Developers** → DeveloperID, DeveloperName, Country  

Designed in **Third Normal Form (3NF)** to avoid redundancy and maintain referential integrity.  

---

## Key SQL Queries  
Some of the analytical queries implemented:  
- **Top categories** by average rating and install count  
- **Free vs. Paid apps distribution** across categories  
- **Revenue estimation** of paid apps by category  
- **Most installed apps** overall and by category  
- **Developers with maximum published apps**  
- **Correlation analysis** between rating count and installs  

---

## Insights Generated  
- **Games and Tools** dominate installs but face high competition  
- **Education and Finance apps** achieve higher trust through consistently strong ratings  
- **Paid apps adoption is lower**, but niches like Productivity & Health deliver strong revenue potential  
- **Few developers** control multiple successful apps, while the majority launch only one  

---

##  How to Run the Project  
1. **Clone the repository**  
   ```bash
   git clone https://github.com/yourusername/google-playstore-sql-analytics.git
