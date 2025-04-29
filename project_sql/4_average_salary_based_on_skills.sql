/*
 Question: The average salary for a particular skill in data analyst positions in Indonesia?
 - Look at the average salary associated with each skill for Data Analyst positions
 - Why? It reveals how different skills impact salary levels for Data Analysts and 
 helps identify the most financially rewarding skills to acquire or improve
 */
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
/*
 ========================
 Here's a breakdown of the results for top paying skills for Data Analysts:
 
 - A data analyst with skills in using business intelligence tools tends to have a higher average salary.
 - This is followed by other essential skills needed for analyzing large-scale data, such as SQL, Python, R, AWS, and Hadoop.
 - In the end, having a combination of both sets of skills enables a data analyst to work more effectively within a company, as these skills are often interconnected.
 
 Notes from me: Based on my observations while actively job hunting, for a data analyst, knowledge of JavaScript is quite rare. Perhaps because of its rarity, it tends to be associated with a higher average salary.
 ========================
 
 ===Results: Average salary for specific skills for data analyst in Indonesia===
 
 [
 {
 "skills": "javascript",
 "avg_salary": "132500"
 },
 {
 "skills": "power bi",
 "avg_salary": "132500"
 },
 {
 "skills": "tableau",
 "avg_salary": "112667"
 },
 {
 "skills": "looker",
 "avg_salary": "105000"
 },
 {
 "skills": "excel",
 "avg_salary": "92814"
 },
 {
 "skills": "sql",
 "avg_salary": "91784"
 },
 {
 "skills": "python",
 "avg_salary": "83270"
 },
 {
 "skills": "r",
 "avg_salary": "81248"
 },
 {
 "skills": "aws",
 "avg_salary": "77018"
 },
 {
 "skills": "hadoop",
 "avg_salary": "75068"
 },
 {
 "skills": "word",
 "avg_salary": "64800"
 },
 {
 "skills": "powerpoint",
 "avg_salary": "64800"
 },
 {
 "skills": "sql server",
 "avg_salary": "64800"
 },
 {
 "skills": "gitlab",
 "avg_salary": "57500"
 },
 {
 "skills": "asana",
 "avg_salary": "57500"
 },
 {
 "skills": "slack",
 "avg_salary": "57500"
 },
 {
 "skills": "bigquery",
 "avg_salary": "55133"
 }
 ]
 */