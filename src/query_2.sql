WITH top_da_boston_jobs AS (
        SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
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
)

SELECT
    top_da_boston_jobs.*,
    skills_dim.skills
FROM 
    top_da_boston_jobs
INNER JOIN skills_job_dim ON top_da_boston_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_da_boston_jobs.salary_year_avg DESC;