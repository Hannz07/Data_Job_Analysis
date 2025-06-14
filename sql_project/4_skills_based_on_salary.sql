SELECT
    skills,
    round(avg(salary_year_avg), 0) AS avg_salary_year
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location IS NOT NULL AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary_year DESC
LIMIT 10;