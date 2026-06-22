SELECT
    job_id,
    job_title_short,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_id,
    job_title_short,
    job_location
FROM
    february_jobs

UNION

SELECT
    job_id,
    job_title_short,
    job_location
FROM
    march_jobs;