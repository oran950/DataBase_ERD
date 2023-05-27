-- trigers

-- 1 Trigger to insert a default interview status when a new candidate is added:

 DELIMITER 
CREATE TRIGGER insert_default_interview_status_trigger
AFTER INSERT ON candidate
FOR EACH ROW
BEGIN
    -- Insert default interview status
    INSERT INTO candidates_interviews (candidate_id, interview_id, status_id, interview_description)
    VALUES (NEW.candidate_id, 1, 1, 'Pending');
END;
 DELIMITER 
 
 -- 2 Trigger to update the status of a candidate's interview when the interview status changes:
 DELIMITER //
 
 CREATE TRIGGER update_candidate_interview_status_trigger
AFTER UPDATE ON candidates_interviews
FOR EACH ROW
BEGIN
    -- Update the candidate's interview status
    UPDATE candidate
    SET interview_status = NEW.status_id
    WHERE candidate_id = NEW.candidate_id;
END;

DELIMITER //

-- 3 Trigger to check if a candidate has passed all interviews and update their status accordingly:
DELIMITER //

CREATE TRIGGER update_candidate_status_trigger
AFTER INSERT ON candidates_interviews
FOR EACH ROW
BEGIN
    DECLARE candidate_id INT;
    DECLARE total_interviews INT;
    DECLARE passed_interviews INT;
    
    SET candidate_id = NEW.candidate_id;
    
    -- Get the total number of interviews for the candidate
    SELECT COUNT(*)
    INTO total_interviews
    FROM candidates_interviews
    WHERE candidate_id = candidate_id;
    
    -- Get the number of passed interviews for the candidate
    SELECT COUNT(*)
    INTO passed_interviews
    FROM candidates_interviews
    WHERE candidate_id = candidate_id AND status_id = 10;
    
    -- Check if all interviews have been passed
    IF passed_interviews = total_interviews THEN
        -- Update the candidate's status to 'Passed'
        UPDATE candidate
        SET candidate_status = 10
        WHERE candidate_id = candidate_id;
    END IF;
END;

DELIMITER //
-- 4 

DELIMITER //

-- 5 Trigger to enforce a maximum salary limit for a job:

DELIMITER //
CREATE TRIGGER enforce_salary_limit
BEFORE INSERT ON pay_check
FOR EACH ROW
BEGIN
    DECLARE max_salary DECIMAL(10, 2);
    
    -- Set the maximum salary limit based on the job_id
    IF NEW.job_id = '1' THEN
        SET max_salary = 10000.00; -- Example maximum salary for job1
    ELSEIF NEW.job_id = '2' THEN
        SET max_salary = 15000.00; -- Example maximum salary for job2
	 ELSEIF NEW.job_id = '3' THEN
        SET max_salary = 10000.00; -- Example maximum salary for job2
	 ELSEIF NEW.job_id = '4' THEN
        SET max_salary = 14000.00; -- Example maximum salary for job2
	 ELSEIF NEW.job_id = '5' THEN
        SET max_salary = 13000.00; -- Example maximum salary for job2
    ELSE
        -- Set a default maximum salary or handle the case when job_id doesn't match any predefined limits
        SET max_salary = 0.00; -- Default maximum salary
    END IF;

    IF NEW.salary > max_salary THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary exceeds the maximum limit for this job.';
    END IF;
END;


DELIMITER //


-- 6 

DELIMITER //
CREATE TRIGGER meet_minimum_requirements
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    DECLARE candidate_count_pass INT;
    DECLARE candidate_count_interviews INT;
    
    -- Check if the candidate meets the minimum requirements
    SELECT COUNT(*) INTO candidate_count_pass
    FROM candidate c
    JOIN candidates_interviews ci ON c.candidate_id = ci.candidate_id
    WHERE ci.status_id = 10
    AND c.candidate_id = NEW.candidate_id;
    
    SELECT COUNT(*) INTO candidate_count_interviews
    FROM candidate c
    JOIN candidates_interviews ci ON c.candidate_id = ci.candidate_id
    AND c.candidate_id = NEW.candidate_id;
    
    -- If the candidate does not meet the minimum requirements, raise an error
    IF candidate_count_pass != candidate_count_interviews THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Candidate does not meet the minimum requirements.';
    END IF;
END;
DELIMITER //
