# I. Introduction
This is an analysis through the job postings focusing in data engineer roles. This project explores the top paying jobs including the in-demand skills that connects to high salary paying job openings.

For qsl queries used, check all using the link:
[Job_Analys](/SQL_PROJECT_DATA_JOB_ANALYSIS/)

# II. Background
The purpose for this analysis is to understand the best skills to learn and develop to land a high paying job.

## Questions that is needed to answer to thoroughly investigate the data:

1. What are the top paying jobs?
2. What skills are required for these top paying jobs?
3. What are the most in-demand skills for Data Engineer?
4. Which skills is associated for these higher salary jobs?
5. What are the most optimal skills to learn to easily land a job?

# III. Tools Used
To analyze the data available for the job postings, I used the following tools:

1. **SQL:** The core for data analysis, allowing me to query the database to obtain the needed insights.
2. **POSTGESQL:** The chosen database management system for handling the data.
3. **VISUAL STUDIO CODE:** My chosen software to execute the queries from the database.
4. **GIT & GITHUB:** Used as a platform to share my project specifically SQL scripts and queries needed for the project.
5. **CHATGPT:** To use as quick ai tool for further analyzation to the query result.

# IV. Analysis
This section will be the query results to answer the questions needed to provide insights in the analysis.

### 1. What are the top paying jobs?
It is to determine the highest paying Data Engineer roles and opportunities that are available online. I filtered the job postings fact table to extract the highest paying jobs.

```sql
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
    job_title_short = 'Data Engineer' AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
limit 10;
```

### 2. What skills are required for these top paying jobs?
This question is to determine the jobs available with skills needed to learn and develop to land a top salary jobs. I use CTE for a better management query and by joining table to extract the skills that corresponds to a top paying jobs.

```sql
with top_jobs as
(
    SELECT
        jpc.job_id,
        jpc.job_title,
        cd.name as company_name,
        jpc.salary_year_avg
    FROM
        job_postings_fact as jpc
    LEFT JOIN
        company_dim as cd on cd.company_id = jpc.company_id
    WHERE
        salary_year_avg is not null AND
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere'
    limit 10
)

SELECT
    tj.*,
    skills
FROM
    top_jobs as tj
INNER JOIN
    skills_job_dim as sjd on sjd.job_id = tj.job_id
INNER JOIN
    skills_dim as sd on sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC;
```

### 3. What are the most in-demand skills for Data Engineer?
This question is to understand the skills that are in-demand and needed to learn for jobs seekers. I use CTE for a better management query and by joining tables to extract the most in-demand skills as a Data Engineer.

```sql
with total_job_with_skills as
    (
    select
        sjd.skill_id,
        count(*) as skill_count
    from
        job_postings_fact as jpc
    INNER JOIN
        skills_job_dim as sjd on sjd.job_id = jpc.job_id
    WHERE
        jpc.job_work_from_home = TRUE AND
        job_title_short = 'Data Engineer'
    GROUP BY
        sjd.skill_id
    )

select
    sd.skill_id,
    sd.skills,
    tjws.skill_count
from
    total_job_with_skills as tjws
INNER JOIN
    skills_dim as sd on sd.skill_id = tjws.skill_id
ORDER BY
    tjws.skill_count DESc
LIMIT 5;
```

### 4. Which skills is associated for these higher salary jobs?
This is to determine the skills needed to learn and develop including the type of skill to land a top salary job. Using a CTE to split the query into different parts and by joining tables to extract the skills with the corresponding high paying jobs.

```sql
with avg_salary_per_skill as 
(
SELECT
    sjd.skill_id,
    round(avg(jpc.salary_year_avg),2) as yearly_average
FROM
    job_postings_fact as jpc
INNER JOIN
    skills_job_dim as sjd on sjd.job_id = jpc.job_id
WHERE
    jpc.salary_year_avg is not null AND
    jpc.job_title_short = 'Data Engineer'
GROUP BY
    sjd.skill_id
ORDER BY
    yearly_average desc
LIMIT 10
)

SELECT
    sd.skills,
    sd.type,
    asps.yearly_average
FROM
    avg_salary_per_skill as asps
INNER JOIN
    skills_dim as sd on sd.skill_id = asps.skill_id
ORDER BY
    asps.yearly_average desc;
```

### 5. What are the most optimal skills to learn to easily land a job?
This is to target the skills needed to learn and develop in terms on job postings with high demand and high salary. Analyzing the most optimal skill to learn in terms of demand and salary through CTE and joining tables.

```sql
with total_job_with_skills as
    (
    select
        sjd.skill_id,
        count(*) as skill_count,
        round(avg(salary_year_avg),2) as yearly_avg
    from
        job_postings_fact as jpc
    INNER JOIN
        skills_job_dim as sjd on sjd.job_id = jpc.job_id
    WHERE
        jpc.salary_year_avg is not null AND
        job_title_short = 'Data Engineer' AND
        job_work_from_home = TRUE
    GROUP BY
        sjd.skill_id
    )

select
    sd.skills,
    tjws.skill_count,
    tjws.yearly_avg,
    round(tjws.yearly_avg / tjws.skill_count,2) as count_to_salary_ratio
from
    total_job_with_skills as tjws
INNER JOIN
    skills_dim as sd on sd.skill_id = tjws.skill_id
WHERE
  tjws.skill_count > 25
ORDER BY
    count_to_salary_ratio desc
limit 25;
```

# V. What I Learned
1. Enhance my skill into an advance level specially in querying data from the database.
2. Mastering my skills specially in CTE, joining tables and grouping by datas through aggregations.
3. Develop new skill through git and github by showing my projects into the public.
4. Improve my critical thinking skills by providing the best query to analyze critical datas.

# VI. Conclusions & Insights

1. In terms of top paying jobs, the best company to apply is Engtal, Durlston Partners, Twitch, Signify Technology and AI Startup. Within the top 10 companies are mostly tech companies which is a booming industry today.
![Top Paying Jobs](SQL_PROJECT_DATA_JOB_ANALYSIS\Assets\Top_Paying_Jobs.png)

2. For the skills, it is better to learn and develop SQL, Python, AWS, Azure and Spark since these skills are most in-demand as Data Engineer. The more demand means the higher chance of getting a job with these skills.
![In Demand Skills](SQL_PROJECT_DATA_JOB_ANALYSIS\Assets\In_Demand_Skills.png)

3. Overall, when we talk about optimal (highest demand with high salary) these data suggests that proffesionals who combine Data Engineering, Cloud, DevOps, Distributed Systems skills tend to earn the highest salaries. Building experties in technologies like Kubernetes, Terraform, Docker, Pyspark, and Cloud databases appears to provide the strongest salary advantage.
![Most Optimal Skills](SQL_PROJECT_DATA_JOB_ANALYSIS\Assets\Optimal_Skill.png)