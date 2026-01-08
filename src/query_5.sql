WITH skills_job_counts AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS job_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title LIKE '%Data Analyst%'
    GROUP BY
        skills_dim.skill_id
),

skills_avg_salaries AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short LIKE '%Data Analyst%' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skills_job_counts.skills,
    skills_job_counts.job_count,
    skills_avg_salaries.avg_salary
FROM
    skills_job_counts
INNER JOIN skills_avg_salaries ON skills_job_counts.skill_id = skills_avg_salaries.skill_id
WHERE
    skills_job_counts.job_count >= 50
ORDER BY
    skills_avg_salaries.avg_salary DESC,
    skills_job_counts.job_count DESC
LIMIT 25