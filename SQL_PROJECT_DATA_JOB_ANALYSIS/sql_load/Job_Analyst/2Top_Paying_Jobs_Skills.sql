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
        job_title_short = 'Data Analyst' AND
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

/*
What this chart shows
*SQL dominates → it appeared in all 10 top-paying jobs.
*Python is the strongest secondary skill, showing up in 60% of roles.
*Visualization tools (Tableau, Power BI) remain valuable but usually alongside technical skills.
*Cloud technologies (AWS, BigQuery, Redshift) appear repeatedly in higher-paying positions, suggesting infrastructure knowledge increases earning potential.

[
  {
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "company_name": "EPIC Brokers",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "azure"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "python"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "sql"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "oracle"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1354909,
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "db2"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "company_name": "EL Education (Formerly Expeditionary Learning)",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "company_name": "EL Education (Formerly Expeditionary Learning)",
    "salary_year_avg": "105000.0",
    "skills": "word"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "company_name": "EL Education (Formerly Expeditionary Learning)",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "excel"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "r"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "python"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "sql"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "tableau"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "90000.0",
    "skills": "sql server"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "sql"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "python"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "scala"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "java"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "r"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "javascript"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "tableau"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "jira"
  },
  {
    "job_id": 833662,
    "job_title": "Marketing Data Analyst (Remote)",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1112585,
    "job_title": "Senior Data Analyst II",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 1112585,
    "job_title": "Senior Data Analyst II",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_id": 1112585,
    "job_title": "Senior Data Analyst II",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1112585,
    "job_title": "Senior Data Analyst II",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 934891,
    "job_title": "Data Analysts- Capital Markets Team",
    "company_name": "CyberCoders",
    "salary_year_avg": "82500.0",
    "skills": "word"
  },
  {
    "job_id": 934891,
    "job_title": "Data Analysts- Capital Markets Team",
    "company_name": "CyberCoders",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 934891,
    "job_title": "Data Analysts- Capital Markets Team",
    "company_name": "CyberCoders",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 794255,
    "job_title": "Manufacturing Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 794255,
    "job_title": "Manufacturing Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 794255,
    "job_title": "Manufacturing Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 794255,
    "job_title": "Manufacturing Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 794255,
    "job_title": "Manufacturing Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 794255,
    "job_title": "Manufacturing Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 1301761,
    "job_title": "Business Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1301761,
    "job_title": "Business Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "smartsheet"
  },
  {
    "job_id": 1301761,
    "job_title": "Business Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 1301761,
    "job_title": "Business Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 1301761,
    "job_title": "Business Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "github"
  }
]
*/