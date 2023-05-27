-- 1 GetEmployeeCount
DELIMITER //

CREATE PROCEDURE GetEmployeeCount()
BEGIN
    SELECT COUNT(*) AS TotalEmployees FROM employee;
END;
DELIMITER //

-- 2 GetEmployeeInfo
DELIMITER //

CREATE PROCEDURE GetEmployeeInfo(IN empId INT)
BEGIN
    SELECT * FROM employee WHERE employee_id = empId;
END;

DELIMITER //
