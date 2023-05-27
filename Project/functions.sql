-- 1 GetEmployeeFullName
DELIMITER //

CREATE FUNCTION GetEmployeeFullName(empId INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE fullName VARCHAR(255);
    SELECT CONCAT(employee_name, ' ') INTO fullName FROM employee WHERE employee_id = empId;
    RETURN fullName;
END;
DELIMITER ;


-- 2 GetSkillsByJob
DELIMITER //
CREATE FUNCTION GetSkillsByJob(jobId INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE skillsList VARCHAR(255);
    SELECT GROUP_CONCAT(s.skill_name) INTO skillsList
    FROM skill s
    INNER JOIN job_skills js ON s.skill_id = js.skill_id
    WHERE js.job_id = jobId;
    RETURN skillsList;
END;

DELIMITER ;


-- 3 GetDepartmentName
DELIMITER //
CREATE FUNCTION GetDepartmentName(deptId INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE deptName VARCHAR(255);
    SELECT department_name INTO deptName FROM department WHERE department_id = deptId
DELIMITER ;

-- 4 GetTotalEmployeesByDepartment
DELIMITER //
CREATE FUNCTION GetTotalEmployeesByDepartment(deptId INT) RETURNS INT
BEGIN
    DECLARE totalEmployees INT;
    SELECT COUNT(*) INTO totalEmployees
    FROM employee e
    INNER JOIN team t ON e.team_id = t.team_id
    WHERE t.department_id = deptId;
    RETURN totalEmployees;
END;

DELIMITER ;

-- 5 GetJobByCandidate
DELIMITER //

CREATE FUNCTION GetJobByCandidate(candidateId INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE jobTitle VARCHAR(255);
    SELECT j.title INTO jobTitle
    FROM candidate c
    INNER JOIN job j ON c.job_id = j.job_id
    WHERE c.candidate_id = candidateId;
    RETURN jobTitle;
END;

DELIMITER ;

-- 6 GetEmployeesBySkill
DELIMITER //

CREATE FUNCTION GetEmployeesBySkill(skillId INT, experienceLevel INT) RETURNS TABLE (employee_name VARCHAR(255), skill_name VARCHAR(255))
BEGIN
    RETURN (
        SELECT e.employee_name, s.skill_name
        FROM employee e
        INNER JOIN employee_skills es ON e.employee_id = es.employee_id
        INNER JOIN skill s ON es.skill_id = s.skill_id
        WHERE es.skill_id = skillId AND es.experience = experienceLevel
    );
END;
DELIMITER ;


-- 7 GetJobApplicantsCount
DELIMITER //

CREATE FUNCTION GetJobApplicantsCount(jobId INT) RETURNS INT
BEGIN
    DECLARE applicantCount INT;
    SELECT COUNT(*) INTO applicantCount
    FROM candidate
    WHERE job_id = jobId;
    RETURN applicantCount;
END;

DELIMITER ;

-- 8 GetCurrentEmploymentDuration
DELIMITER //

CREATE FUNCTION GetCurrentEmploymentDuration(employeeId INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE currentDuration DECIMAL(10, 2);
    SELECT DATEDIFF(NOW(), start_day) / 365 INTO currentDuration
    FROM employee
    WHERE employee_id = employeeId AND end_day IS NULL;
    RETURN currentDuration;
END;
DELIMITER ;

