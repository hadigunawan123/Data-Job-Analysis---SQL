/*
 Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 15 highest-paying Data Analyst jobs in Indonesia from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
 helping job seekers understand which skills to develop that align with top salaries
 */
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
/*
 
 ========================
 Here's the breakdown of the most demanded skills for Indonesian data analysts in 2023, based on high paying job postings:
 
 -SQL is leading with a bold count of 9.
 -Python follows closely with a bold count of 8.
 -Excel is also highly sought after, with a bold count of 6.
 -Other skills like R, BigQuery, Tableau, and Power BI, show varying degrees of demand.
 ========================
 
 ===Results: Below are the top skills required to be a competitive candidate for those positions===
 
 [
 {
 "skills": "sql",
 "total_appearance": "9"
 },
 {
 "skills": "python",
 "total_appearance": "8"
 },
 {
 "skills": "excel",
 "total_appearance": "6"
 },
 {
 "skills": "r",
 "total_appearance": "3"
 },
 {
 "skills": "bigquery",
 "total_appearance": "3"
 },
 {
 "skills": "tableau",
 "total_appearance": "3"
 },
 {
 "skills": "power bi",
 "total_appearance": "1"
 },
 {
 "skills": "powerpoint",
 "total_appearance": "1"
 },
 {
 "skills": "slack",
 "total_appearance": "1"
 },
 {
 "skills": "sql server",
 "total_appearance": "1"
 },
 {
 "skills": "asana",
 "total_appearance": "1"
 },
 {
 "skills": "word",
 "total_appearance": "1"
 },
 {
 "skills": "aws",
 "total_appearance": "1"
 },
 {
 "skills": "gitlab",
 "total_appearance": "1"
 },
 {
 "skills": "hadoop",
 "total_appearance": "1"
 },
 {
 "skills": "javascript",
 "total_appearance": "1"
 },
 {
 "skills": "looker",
 "total_appearance": "1"
 }
 ]
 
 
 */