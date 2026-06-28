/*
Question: What are the most in-demand skills for data engineer?
- Identify the top 5 in-demand skills for a data engineer
- Purpose: To determine the skills that are in-demand and needed to learn for jobs seekers.
*/

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

/*
[
  {
    "skill_id": 0,
    "skills": "sql",
    "skill_count": "14213"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "skill_count": "13893"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "skill_count": "8570"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "skill_count": "6997"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "skill_count": "6612"
  }
]
*/