/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions
- Check the jobs with indicated salaries regardless of location
- Purpose: To determine the skills needed to learn and develop including the type of skill to land a top salary jobs
*/

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

/*
[
  {
    "skills": "node",
    "type": "webframeworks",
    "yearly_average": "181861.78"
  },
  {
    "skills": "mongo",
    "type": "programming",
    "yearly_average": "179402.54"
  },
  {
    "skills": "ggplot2",
    "type": "libraries",
    "yearly_average": "176250.00"
  },
  {
    "skills": "solidity",
    "type": "programming",
    "yearly_average": "166250.00"
  },
  {
    "skills": "vue",
    "type": "webframeworks",
    "yearly_average": "159375.00"
  },
  {
    "skills": "codecommit",
    "type": "other",
    "yearly_average": "155000.00"
  },
  {
    "skills": "ubuntu",
    "type": "os",
    "yearly_average": "154455.00"
  },
  {
    "skills": "clojure",
    "type": "programming",
    "yearly_average": "153662.60"
  },
  {
    "skills": "cassandra",
    "type": "databases",
    "yearly_average": "150255.30"
  },
  {
    "skills": "rust",
    "type": "programming",
    "yearly_average": "147770.73"
  }
]
*/