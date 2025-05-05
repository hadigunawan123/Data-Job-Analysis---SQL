/*
 Question: What are the top-paying data analyst jobs in Indonesia?
 - Identify the top 15 highest-paying Data Analyst roles that are available remotely
 - Focuses on job postings with specified salaries (remove nulls)
 - Include company names of top 10 roles
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options
 */
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
/*
 
 ========================
 Here's the breakdown of the top data analyst jobs in 2023:
 
 -Wide Salary Range: Top 15 paying data analyst roles span from $50,400 to $132,500, indicating significant salary potential in the field.
 -Diverse Employers: Companies like GoTo Group, Stockbit, and Samsung Electronics are among those offering high salaries, showing a broad interest across different industries.
 -Job Title Variety: There's a high diversity in job titles, from Data Analyst (Junior), Audit Data Analytics, and Marketing Data Analytics Manager, reflecting varied roles and specializations within data analytics.
 
 Notes: Based on the data we have in the database, the salary rate for that job position is listed as yearly. However, this could be misleading — there's a possibility that the salary is actually hourly and in Indonesian Rupiah. Nonetheless, this does not affect the ordering, so our query remains valid. Additionally, since many positions do not display salary information, we only consider the data that includes salary details.
 ========================
 
 ===Results: Top 15 jobs ordered by salary (annualy) in Indonesia===
 
 [
 {
 "job_id": 1771851,
 "job_title": "Marketing Data Analytics Manager",
 "job_location": "Jakarta, Indonesia",
 "company_name": "GoTo Group",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "132500.0",
 "job_posted_date": "2023-08-03 10:18:35"
 },
 {
 "job_id": 176019,
 "job_title": "Data Analyst - Merchant Success",
 "job_location": "Jakarta, Indonesia",
 "company_name": "BukuWarung",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "111175.0",
 "job_posted_date": "2023-02-03 12:39:23"
 },
 {
 "job_id": 413113,
 "job_title": "Data Analyst - Consumer Lending",
 "job_location": "Jakarta, Indonesia",
 "company_name": "GoTo Group",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "105000.0",
 "job_posted_date": "2023-08-30 02:37:44"
 },
 {
 "job_id": 1516589,
 "job_title": "Customer Loyalty SLA Control Tower & Data Analyst",
 "job_location": "Jakarta, Indonesia",
 "company_name": "Ninja Van",
 "job_schedule_type": "Contractor",
 "salary_year_avg": "105000.0",
 "job_posted_date": "2023-08-14 07:17:07"
 },
 {
 "job_id": 869889,
 "job_title": "(Operation) Data Analyst Manual Activity",
 "job_location": "Yogyakarta, Yogyakarta City, Special Region of Yogyakarta, Indonesia",
 "company_name": "Ninja Van",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "102500.0",
 "job_posted_date": "2023-04-05 07:18:38"
 },
 {
 "job_id": 1367719,
 "job_title": "Data Analyst",
 "job_location": "Jakarta, Indonesia",
 "company_name": "Stockbit",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "100500.0",
 "job_posted_date": "2023-06-08 18:37:59"
 },
 {
 "job_id": 1467344,
 "job_title": "Data Analyst - Junior",
 "job_location": "Indonesia",
 "company_name": "Samsung Electronics",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "77017.5",
 "job_posted_date": "2023-12-15 11:38:16"
 },
 {
 "job_id": 182865,
 "job_title": "Data Analyst",
 "job_location": "Jakarta, Indonesia",
 "company_name": "Trusting Social",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "75067.5",
 "job_posted_date": "2023-12-22 21:17:34"
 },
 {
 "job_id": 496498,
 "job_title": "Audit Data Analytics & System Development",
 "job_location": "South Jakarta, South Jakarta City, Jakarta, Indonesia",
 "company_name": "Amartha",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "64800.0",
 "job_posted_date": "2023-05-10 09:24:58"
 },
 {
 "job_id": 277216,
 "job_title": "Data Analyst",
 "job_location": "Jakarta, Indonesia",
 "company_name": "Gravel",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "57500.0",
 "job_posted_date": "2023-08-26 23:15:14"
 },
 {
 "job_id": 1110700,
 "job_title": "Data Analyst (Junior/Entry-level) - Campaign Management",
 "job_location": "Jakarta, Indonesia",
 "company_name": "GoTo Group",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "57500.0",
 "job_posted_date": "2023-08-24 17:33:21"
 },
 {
 "job_id": 521352,
 "job_title": "Data Analyst - Ads and Promo Platform",
 "job_location": "Jakarta, Indonesia",
 "company_name": "GoTo Group",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "57500.0",
 "job_posted_date": "2023-06-30 09:19:55"
 },
 {
 "job_id": 176958,
 "job_title": "Data Analytics Associate",
 "job_location": "Jakarta, Indonesia",
 "company_name": "Gravel",
 "job_schedule_type": "Full-time",
 "salary_year_avg": "50400.0",
 "job_posted_date": "2023-09-21 14:27:16"
 }
 ]
 */