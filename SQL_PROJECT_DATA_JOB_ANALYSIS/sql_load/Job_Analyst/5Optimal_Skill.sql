/*
Question: What are the optimal skills to learn when applying as Data Engineer?
- Identify the top 25 skills in high demand with high average salaries for Data Engineer roles
- Focus on remote positions with specified salaries
- Purpose: This is to target the skills needed to learn and develop in terms on job postings with high demand and high salary.
*/

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

/*
[
  {
    "skills": "dynamodb",
    "skill_count": "27",
    "yearly_avg": "138883.10",
    "count_to_salary_ratio": "5143.82"
  },
  {
    "skills": "jenkins",
    "skill_count": "26",
    "yearly_avg": "133016.56",
    "count_to_salary_ratio": "5116.02"
  },
  {
    "skills": "looker",
    "skill_count": "30",
    "yearly_avg": "134614.43",
    "count_to_salary_ratio": "4487.15"
  },
  {
    "skills": "jira",
    "skill_count": "29",
    "yearly_avg": "129562.07",
    "count_to_salary_ratio": "4467.66"
  },
  {
    "skills": "mongodb",
    "skill_count": "32",
    "yearly_avg": "138568.83",
    "count_to_salary_ratio": "4330.28"
  },
  {
    "skills": "mongodb",
    "skill_count": "32",
    "yearly_avg": "138568.83",
    "count_to_salary_ratio": "4330.28"
  },
  {
    "skills": "c#",
    "skill_count": "28",
    "yearly_avg": "112431.64",
    "count_to_salary_ratio": "4015.42"
  },
  {
    "skills": "shell",
    "skill_count": "34",
    "yearly_avg": "135499.07",
    "count_to_salary_ratio": "3985.27"
  },
  {
    "skills": "pandas",
    "skill_count": "38",
    "yearly_avg": "144656.21",
    "count_to_salary_ratio": "3806.74"
  },
  {
    "skills": "javascript",
    "skill_count": "33",
    "yearly_avg": "121357.58",
    "count_to_salary_ratio": "3677.50"
  },
  {
    "skills": "terraform",
    "skill_count": "44",
    "yearly_avg": "146057.28",
    "count_to_salary_ratio": "3319.48"
  },
  {
    "skills": "excel",
    "skill_count": "36",
    "yearly_avg": "115581.11",
    "count_to_salary_ratio": "3210.59"
  },
  {
    "skills": "github",
    "skill_count": "41",
    "yearly_avg": "121983.69",
    "count_to_salary_ratio": "2975.21"
  },
  {
    "skills": "linux",
    "skill_count": "44",
    "yearly_avg": "126397.11",
    "count_to_salary_ratio": "2872.66"
  },
  {
    "skills": "kubernetes",
    "skill_count": "56",
    "yearly_avg": "158189.73",
    "count_to_salary_ratio": "2824.82"
  },
  {
    "skills": "flow",
    "skill_count": "46",
    "yearly_avg": "123866.22",
    "count_to_salary_ratio": "2692.74"
  },
  {
    "skills": "mysql",
    "skill_count": "53",
    "yearly_avg": "129287.62",
    "count_to_salary_ratio": "2439.39"
  },
  {
    "skills": "bigquery",
    "skill_count": "53",
    "yearly_avg": "126626.73",
    "count_to_salary_ratio": "2389.18"
  },
  {
    "skills": "go",
    "skill_count": "53",
    "yearly_avg": "125005.94",
    "count_to_salary_ratio": "2358.60"
  },
  {
    "skills": "postgresql",
    "skill_count": "55",
    "yearly_avg": "121785.82",
    "count_to_salary_ratio": "2214.29"
  },
  {
    "skills": "pyspark",
    "skill_count": "64",
    "yearly_avg": "139428.36",
    "count_to_salary_ratio": "2178.57"
  },
  {
    "skills": "docker",
    "skill_count": "64",
    "yearly_avg": "134286.25",
    "count_to_salary_ratio": "2098.22"
  },
  {
    "skills": "r",
    "skill_count": "60",
    "yearly_avg": "121064.67",
    "count_to_salary_ratio": "2017.74"
  },
  {
    "skills": "oracle",
    "skill_count": "63",
    "yearly_avg": "121979.93",
    "count_to_salary_ratio": "1936.19"
  },
  {
    "skills": "ssis",
    "skill_count": "61",
    "yearly_avg": "115272.06",
    "count_to_salary_ratio": "1889.71"
  }
]
*/