CREATE SCHEMA IF NOT EXISTS `HR_System` DEFAULT CHARACTER SET utf8;
USE `HR_System` ;

CREATE TABLE IF NOT EXISTS `department` (
    `department_id` INT PRIMARY KEY,
    `department_name` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `team` (
    `team_id` INT PRIMARY KEY,
    `team_name` VARCHAR(255),
    `department_id` INT,
     CONSTRAINT department_id_fk FOREIGN KEY (department_id)
        REFERENCES department (department_id)
);

CREATE TABLE IF NOT EXISTS `job` (
    `job_id` INT PRIMARY KEY,
    `title` VARCHAR(255),
    `description` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `employee` (
    `employee_id` INT PRIMARY KEY,
    `employee_name` VARCHARACTER(255),
    `start_day` datetime,
    `end_day` datetime,
    `job_id` int,
    `team_id` int,
    CONSTRAINT team_id_fk FOREIGN KEY (team_id)
        REFERENCES team (team_id),
	CONSTRAINT job_id_fk FOREIGN KEY (job_id)
        REFERENCES job (job_id)
);

CREATE TABLE IF NOT EXISTS `pay_check` (
    `pay_check_id` INT PRIMARY KEY,
    `month` int,
    `pay_rank` int,
    `salary` int,
	`start_day` datetime,
    `employee_id` int,
    CONSTRAINT employee_id_fk FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id)
);

CREATE TABLE IF NOT EXISTS `skill` (
    `skill_id` INT PRIMARY KEY,
    `skill_name` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `job_skills` (
    `job_id` INT,
    `skill_id` int,
    `experience` int,
    `level` int,
    CONSTRAINT skill_id_fk FOREIGN KEY (skill_id)
        REFERENCES skill (skill_id),
	CONSTRAINT job_id_fk_to_job FOREIGN KEY (job_id)
        REFERENCES job (job_id)
);

CREATE TABLE IF NOT EXISTS `personality` (
    `personality_id` INT PRIMARY KEY,
    `personality_name` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `required_attributes_for_job` (
    `job_id` INT,
    `personality_id` int,
    CONSTRAINT personality_id_fk FOREIGN KEY (personality_id)
        REFERENCES personality (personality_id),
	CONSTRAINT refered_job_id_fk FOREIGN KEY (job_id)
        REFERENCES job (job_id)
);

CREATE TABLE IF NOT EXISTS `interview` (
    `interview_id` INT PRIMARY KEY,
    `interview_type` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `job_interviews` (
    `job_id` INT,
    `interview_id` int,
    CONSTRAINT interview_id_fk FOREIGN KEY (interview_id)
        REFERENCES interview (interview_id),
	CONSTRAINT job_id_fk1 FOREIGN KEY (job_id)
        REFERENCES job (job_id)
);

CREATE TABLE IF NOT EXISTS `candidate` (
    `candidate_id` INT PRIMARY KEY,
    `candidate_name` VARCHAR(255),
    `job_id` int,
     CONSTRAINT job_id_fk_1 FOREIGN KEY (job_id)
        REFERENCES job (job_id)
);

CREATE TABLE IF NOT EXISTS `candidates_personalities` (
    `candidate_id` INT,
    `personality_id` int,
    CONSTRAINT candidate_id_fk FOREIGN KEY (candidate_id)
        REFERENCES candidate (candidate_id),
	CONSTRAINT personality_id_fk1 FOREIGN KEY (personality_id)
        REFERENCES personality (personality_id)
);

CREATE TABLE IF NOT EXISTS `candidate_skills` (
    `candidate_id` INT,
    `skill_id` int,
    `experience` int,
    `level` int,
    CONSTRAINT skill_id_fk2 FOREIGN KEY (skill_id)
        REFERENCES skill (skill_id),
	CONSTRAINT candidate_id_fk2 FOREIGN KEY (candidate_id)
        REFERENCES candidate (candidate_id)
);

CREATE TABLE IF NOT EXISTS `status` (
    `status_id` INT PRIMARY KEY,
    `status_name` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `candidates_interviews` (
    `candidate_id` INT,
    `interview_id` int,
     `status_id` INT,
     `interview_description` VARCHAR(255),
    CONSTRAINT status_id_fk FOREIGN KEY (status_id)
        REFERENCES status (status_id),
	CONSTRAINT candidate_id_fk3 FOREIGN KEY (candidate_id)
        REFERENCES candidate (candidate_id),
    CONSTRAINT interview_id_fk3 FOREIGN KEY (interview_id)
        REFERENCES interview (interview_id)
);