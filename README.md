# Introduction

📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background

This project was created to help navigate the data analyst job market more effectively—driven by a desire to identify the highest-paying and most in-demand skills, making it easier for others to find their ideal roles.

### The questions I wanted to answer through my SQL queries were:

What are the top-paying data analyst jobs in Indonesia?
What skills are required for these top-paying jobs?
What skills are most in demand for data analysts (in Indonesia and worldwide)?
Which skills are associated with higher salaries (in Indonesia)?
What are the most optimal skills to learn?

# Tools I Used

For my deep dive into the data analyst job market, I harnessed the power of several key tools:

**SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
**PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
**Visual Studio Code**: For database management and executing SQL queries.
**Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and located in Indonesia. This query highlights the high paying opportunities in the field.

```sql
SELECT job_id,
    job_title,
    job_location,
    name AS company_name,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE LOWER(job_title_short) = 'data analyst'
    AND LOWER(job_location) LIKE '%indonesia%'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 15;
```

Here's the breakdown of the top data analyst jobs in 2023:

-**Wide Salary Range**: Top 15 paying data analyst roles span from $50,400 to $132,500, indicating significant salary potential in the field. -**Diverse Employers**: Companies like GoTo Group, Stockbit, and Samsung Electronics are among those offering high salaries, showing a broad interest across different industries. -**Job Title Variety**: There's a high diversity in job titles, from Data Analyst (Junior), Audit Data Analytics, and Marketing Data Analytics Manager, reflecting varied roles and specializations within data analytics.

![Top Paying Roles](assets\Q1.jpg)
\*Only 13 are shown due to data limitations

### 2. Skills for Top Paying Jobs (Related to Question Number 1)

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
   SELECT job_id,
       job_title,
       name AS company_name,
       salary_year_avg
   FROM job_postings_fact
       LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
   WHERE LOWER(job_title_short) = 'data analyst'
       AND LOWER(job_location) LIKE '%indonesia%'
       AND salary_year_avg IS NOT NULL
   ORDER BY salary_year_avg DESC
   LIMIT 15
), top_skills AS(
   SELECT top_paying_jobs.*,
       skills
   FROM top_paying_jobs
       INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
       INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
   ORDER BY salary_year_avg DESC
)
SELECT skills,
   COUNT(*) AS total_appearance
from top_skills
GROUP BY skills
ORDER BY total_appearance DESC;
```

Here's the breakdown of the most demanded skills for Indonesian data analysts in 2023, based on high paying job postings:

-**SQL** is leading with a bold count of 9. -**Python** follows closely with a bold count of 8. -**Excel** is also highly sought after, with a bold count of 6.
-Other skills like **R, BigQuery, Tableau, and Power BI**, show varying degrees of demand.

![Top Paying Roles](assets\Q2.jpg)

### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand

In Indonesia:

```sql
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE LOWER(job_title_short) = 'data analyst'
    AND LOWER(job_location) LIKE '%indonesia%'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

In Worldwide:

```sql
SELECT skills,
   COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
   INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
   INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE LOWER(job_title_short) = 'data analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

Here's the breakdown of the most demanded skills for Indonesian data analysts in 2023:

- **SQL, Python, Excel, and Tableau remain fundamental**, emphasizing the need for strong foundational skills in data analysis and spreadsheet data processing.
- **Programming and Visualization Tools like Python and Tableau are essential**, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| Skills  | Demand Count |
| ------- | ------------ |
| SQL     | 218          |
| Python  | 139          |
| Excel   | 139          |
| Tableau | 111          |
| R       | 73           |

On the other hand let's have a look at the overall worldwide market below (psst.. it's similar, want to #KaburAjaDulu? anyone?)

| Skills   | Demand Count |
| -------- | ------------ |
| SQL      | 92,628       |
| Excel    | 67,031       |
| Python   | 57,326       |
| Tableau  | 46,554       |
| Power BI | 39,468       |

### 4. Average Salary Based on Skills

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE LOWER(job_title_short) = 'data analyst'
    AND LOWER(job_location) LIKE '%indonesia%'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC;
```

Here's a breakdown of the results for top paying skills for Data Analysts:

- A data analyst with skills in using **business intelligence tools** tends to have a higher average salary.
- This is followed by other essential skills needed for analyzing **large-scale data**, such as SQL, Python, R, AWS, and Hadoop.
- In the end, having a **combination of both** sets of skills enables a data analyst to work more effectively within a company, as these skills are often interconnected.

Notes from me: Based on my observations while actively job hunting, for a data analyst, knowledge of JavaScript is quite rare. Perhaps because of its rarity, it tends to be associated with a higher average salary.

| Skills     | Average Salary ($) |
| ---------- | ------------------ |
| Javascript | 132,500            |
| Power BI   | 132,500            |
| Tableau    | 112,667            |
| Looker     | 105,000            |
| Excel      | 92,814             |
| SQL        | 91,784             |
| Python     | 83,270             |
| R          | 81,248             |
| AWS        | 77,018             |
| Hadoop     | 75,068             |

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE LOWER(job_title_short) = 'data analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

Here's a breakdown of the most optimal skills for Data Analysts in 2023:

-The data analyst skills (worldwide) with the highest average salaries and fairly high demand are those related to **big data tools and machine learning**.
-Therefore, it can be concluded that after mastering the essential skills of a data analyst, it is highly beneficial to also learn tools and concepts related to big data and machine learning to potentially earn a higher salary in the future.

| Skill ID | Skills     | Demand Count | Average Salary ($) |
| -------- | ---------- | ------------ | -----------------: |
| 98       | kafka      | 40           |            129,999 |
| 101      | pytorch    | 20           |            125,226 |
| 31       | perl       | 20           |            124,686 |
| 99       | tensorflow | 24           |            120,647 |
| 63       | cassandra  | 11           |            118,407 |
| 219      | atlassian  | 15           |            117,966 |
| 96       | airflow    | 71           |            116,387 |
| 3        | scala      | 59           |            115,480 |
| 169      | linux      | 58           |            114,883 |
| 234      | confluence | 62           |            114,153 |

# What I Learned

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding CTE clauses for temp table maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights

From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for Indonesian data analysts that allow remote work offer a wide range of salaries, the highest at $132,500!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as big data and machine learning, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: Although SQL does not appear among the rising skills based on salary, it remains highly in demand. Positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring and experienced data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
