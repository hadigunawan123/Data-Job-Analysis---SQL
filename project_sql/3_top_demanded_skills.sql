/*
 Question: What are the most in-demand skills for data analysts?
 - Join job postings table similar to query 2
 - Identify the top 5 in-demand skills for a data analyst.
 - Focus on all job postings.
 - Why? Retrieves the top 5 skills with the highest demand in the job market, 
 providing insights into the most valuable skills for job seekers.
 */
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
/*
 ========================
 Here's the breakdown of the most demanded skills for Indonesian data analysts in 2023:
 
 - SQL, Python, Excel, and Tableau remain fundamental, emphasizing the need for strong foundational skills in data analysis and spreadsheet data processing.
 - Programming and Visualization Tools like Python and Tableau are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.
 ========================
 
 ===Results: Top 5 skills for data analyst in Indonesia===
 
 [
 {
 "skills": "sql",
 "demand_count": "218"
 },
 {
 "skills": "python",
 "demand_count": "139"
 },
 {
 "skills": "excel",
 "demand_count": "138"
 },
 {
 "skills": "tableau",
 "demand_count": "111"
 },
 {
 "skills": "r",
 "demand_count": "73"
 }
 ]
 
 
 On the other hand let's have a look at the overall worldwide market below (psst.. it's similar, want to #KaburAjaDulu? anyone?)
 */
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE LOWER(job_title_short) = 'data analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
/*
 ===Results: Top 5 skills for data analyst worldwide===
 
 [
 {
 "skills": "sql",
 "demand_count": "92628"
 },
 {
 "skills": "excel",
 "demand_count": "67031"
 },
 {
 "skills": "python",
 "demand_count": "57326"
 },
 {
 "skills": "tableau",
 "demand_count": "46554"
 },
 {
 "skills": "power bi",
 "demand_count": "39468"
 }
 ]
 */