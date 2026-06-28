SELECT
    jpc.job_id,
    jpc.job_title,
    cd.name as company_name,
    jpc.job_schedule_type,
    jpc.job_location,
    jpc.salary_year_avg,
    jpc.job_posted_date
FROM
    job_postings_fact as jpc
LEFT JOIN
    company_dim as cd on cd.company_id = jpc.company_id
WHERE
    salary_year_avg is not null AND
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
limit 10;