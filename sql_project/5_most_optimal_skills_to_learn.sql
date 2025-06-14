SELECT
    skills_dim.skills,
    count(skills_job_dim.job_id) AS demand_count,
    round(avg(job_postings_fact.salary_year_avg), 0) AS avg_salary_year
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location IS NOT NULL AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    count(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC
LIMIT 10;