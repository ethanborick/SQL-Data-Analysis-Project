# Introduction
This repository contains SQL-based data analysis focused on exploring trends in the data analyst job market. Using data from online job postings, the project examines job titles, salaries, locations, essential skills, and the relationship between skills and compensation.
# Background
I aimed to answer the following questions through each one of my queries:
1. What are the top paying Data Analyst positions in Boston, Massachusetts?
2. What are the neccessary skills for these jobs?
3. What are the most highly demanded skills for Data Analysts?
4. Which skills are associated with higher average salaries for Data Analysts?
5. What are the most optimal skills to learn for Data Analysts?
# Tools
- SQL: Queried and analyzed large datasets using joins, CTEs, and aggregations to extract insights from job market data.
- PostgreSQL: Database management system that was used for handling job posting data.
- VSCode: Used as the primary development environment for writing SQL, managing files, and handling version control with Git.
# Analysis
1. This query filters job postings based on location and average yearly salary. The bar chart below shows the distribution of yearly salaries among the positions that were identified as high paying in Boston, MA.
```sql
SELECT
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_location LIKE '%Boston%' AND
    job_title LIKE '%Data Analyst%' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
```
\
![Top Paying Roles](charts/query_1_chart.png) 

The data shows that a correlation exists between the compensation an analyst receives and their level of experience and specialization. Data Analyst Director tops the list for analyst salaries at $225,000 due to its leadership responsibilities and the strategic oversight required. Senior level and specialized positions have a clustered salary range between $150,000 and $175,000. Examples of these types of positions are Sr Quality Data Analyst, Principal People Data Analyst, and ESG-focused positions. Overall, the salary growth is driven by experience, leadership, and specialization in the field of analytics. The average salaries for mid-level Analyst positions were reported to have ranges between $130,000 and $151,500; thus solid earning potential exists for those who occupy non-executive roles as well.