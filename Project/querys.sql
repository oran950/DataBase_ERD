USE `HR_System` ;

-- 1. Retrieve all departments and their corresponding team count:
SELECT d.department_name, COUNT(t.team_id) AS team_count
FROM department d
LEFT JOIN team t ON d.department_id = t.department_id
GROUP BY d.department_id;


-- 2. Get the job title and description for a specific job ID:
SELECT title, description
FROM job
WHERE job_id = 4;


-- 3. List all employees and their  team and department names:
SELECT e.employee_name, t.team_name, d.department_name
FROM employee e
JOIN team t ON e.team_id = t.team_id
JOIN department d ON t.department_id = d.department_id;


-- 4. Retrieve the average salary for each month:
SELECT month, AVG(salary) AS average_salary
FROM pay_check
GROUP BY month;


-- 5. Find employees who possess a specific skill:
SELECT e.employee_name
FROM employee e
JOIN candidate_skills cs ON e.employee_id = cs.candidate_id
JOIN skill s ON cs.skill_id = s.skill_id
WHERE s.skill_name = 'Python';


-- 6. Get the list of candidates who have completed a specific interview:
SELECT c.candidate_name
FROM candidate c
JOIN candidates_interviews ci ON c.candidate_id = ci.candidate_id
WHERE ci.interview_id = 8 AND ci.status_id = 10;


-- 7. Retrieve the skills and experience level required for a particular job:
SELECT s.skill_name, js.experience, js.level
FROM job_skills js
JOIN skill s ON js.skill_id = s.skill_id
WHERE js.job_id = 7;


-- 8. Find employees who have the required personality traits for a specific job:
SELECT e.employee_name
FROM employee e
JOIN required_attributes_for_job rafj ON e.job_id = rafj.job_id
JOIN personality p ON rafj.personality_id = p.personality_id
WHERE rafj.job_id = 7
group by e.employee_id;


-- 9. Count the number of interviews conducted for each job:
SELECT j.title, COUNT(ji.interview_id) AS interview_count
FROM job j
LEFT JOIN job_interviews ji ON j.job_id = ji.job_id
GROUP BY j.job_id;


-- 10. Get the total number of candidates in each interview status:
SELECT s.status_name, COUNT(ci.candidate_id) AS candidate_count
FROM status s
LEFT JOIN candidates_interviews ci ON s.status_id = ci.status_id
GROUP BY s.status_id;


  -- the candidate who know specific skill  
SELECT c.candidate_id, c.candidate_name
FROM candidate c
JOIN candidate_skills cs ON c.candidate_id = cs.candidate_id
JOIN skill s ON cs.skill_id = s.skill_id
WHERE s.skill_name = 'Java';

-- how many candidate are have specific skill
SELECT COUNT(*) AS candidate_count
FROM candidate c
JOIN candidate_skills cs ON c.candidate_id = cs.candidate_id
JOIN skill s ON cs.skill_id = s.skill_id
WHERE s.skill_name = 'SQL';

-- who is pass the interview

SELECT c.candidate_id, c.candidate_name
FROM candidate c
JOIN candidates_interviews ci ON c.candidate_id = ci.candidate_id
WHERE ci.status_id = 10;

-- Retrieve the average salary for each department:
SELECT d.department_name, AVG(p.salary) AS average_salary
FROM department d
JOIN team t ON d.department_id = t.department_id
JOIN employee e ON t.team_id = e.team_id
JOIN pay_check p ON e.employee_id = p.employee_id
GROUP BY d.department_name;

-- Retrieve the job titles and the number of candidates who have applied for each job:

SELECT j.title, COUNT(c.candidate_id) AS num_applicants
FROM job j
LEFT JOIN candidate c ON j.job_id = c.job_id
GROUP BY j.title;

-- find candidates who possess all the required skills for a specific job
SELECT c.candidate_id, c.candidate_name
FROM candidate c
WHERE c.candidate_id IN (
    SELECT cs.candidate_id
    FROM candidate_skills cs
    WHERE cs.skill_id IN (
        SELECT skill_id
        FROM job_skills
        WHERE job_id = 4
    )
    GROUP BY cs.candidate_id
    HAVING COUNT(DISTINCT cs.skill_id) = (
        SELECT COUNT(skill_id)
        FROM job_skills
        WHERE job_id = 4
    )
);

--  know how many employee start to work on 2023
SELECT COUNT(*) AS total_employees
FROM employee
WHERE YEAR(start_day) = 2023;

-- This procedure accepts the department_name as input and returns the employee details (employee_id, employee_name, start_day, end_day, and job_title) for the employees belonging to the specified department.
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN department_name VARCHAR(255))
BEGIN
    SELECT e.employee_id, e.employee_name, e.start_day, e.end_day, j.title AS job_title
    FROM employee e
    INNER JOIN job j ON e.job_id = j.job_id
    INNER JOIN team t ON e.team_id = t.team_id
    INNER JOIN department d ON t.department_id = d.department_id
    WHERE d.department_name = department_name;
END//

DELIMITER ;

