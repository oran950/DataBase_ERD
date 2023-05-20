USE `HR_System` ;

-- Data for department table
INSERT INTO department (department_id, department_name)
VALUES (1, 'Sales'), (2, 'Marketing'), (3, 'Finance'), (4, 'Engineering'), (5, 'Human Resources'),
       (6, 'Operations'), (7, 'Research&Development'), (8, 'Customer Support'), (9, 'IT'), (10, 'Legal');


-- Data for team table
INSERT INTO team (team_id, team_name, department_id)
VALUES (1, 'Sales Team A', 1), (2, 'Sales Team B', 1), (3, 'Marketing Team A', 2), (4, 'Marketing Team B', 2),
       (5, 'Finance Team A', 3), (6, 'Finance Team B', 3), (7, 'backend Team A', 7), (8, 'cloud Team B', 4),
        (9, 'HR Team A', 5), (10, 'HR Team B', 5);



-- Data for job table
INSERT INTO job (job_id, title, description)
VALUES (1, 'Manager', 'Responsible for overseeing team operations'), (2, 'Sales Representative', 'Responsible for generating sales leads'),
       (3, 'Marketing Specialist', 'Responsible for developing marketing campaigns'), (4, 'Linux developer', 'work on mainframes, servers, and supercomputers developed through Linux OS'),
       (5, 'HR Manager', 'Responsible for managing HR processes'), (6, 'Cloud Developer', ' builds scalable and highly available applications using Google-recommended tools and best practices.'),
       (7, 'backend developer', 'Responsible for build and maintain the mechanisms that process data and perform actions on websites'), (8, 'Frontend Developer', 'creates websites and applications using web languages such as HTML, CSS, and JavaScript'),
       (9, 'IT Technician', 'Responsible for providing IT support'), (10, 'Legal Counsel', 'Responsible for legal advice and compliance');



-- -- Data for employee table
INSERT INTO employee (employee_id, employee_name, start_day, end_day, job_id, team_id)
VALUES (1, 'John Doe', '2023-01-01', NULL, 4, 8), (2, 'Jane Smith', '2023-02-01', NULL, 2, 1),
       (3, 'Mike Johnson', '2023-03-01', NULL, 4, 8), (4, 'Sarah Davis', '2023-04-01', NULL, 7, 7),
       (5, 'Robert Wilson', '2023-05-01', NULL, 8, 7), (6, 'Emily Brown', '2023-06-01', NULL, 6, 8),
       (7, 'Daniel Clark', '2023-07-01', NULL, 7, 7), (8, 'Olivia Lee', '2023-08-01', NULL, 8, 7),
       (9, 'Michael Martinez', '2023-09-01', NULL, 9, 8), (10, 'Sophia Anderson', '2023-10-01', NULL, 7, 7);



-- Data for pay_check table
INSERT INTO pay_check (pay_check_id, month, pay_rank, salary, start_day, employee_id)
VALUES (1, 5, 3, 5000, '2023-05-01', 1), (2, 5, 2, 3000, '2023-05-01', 2),
       (3, 2, 1, 2000, '2023-05-01', 3), (4, 5, 4, 4000, '2023-05-01', 4),
       (5, 2, 5, 6000, '2023-05-01', 5), (6, 4, 2, 3000, '2023-05-01', 6),
       (7, 3, 3, 5000, '2023-05-01', 7), (8, 3, 4, 4000, '2023-05-01', 8),
       (9, 5, 2, 3000, '2023-05-01', 9), (10, 5, 1, 2000, '2023-05-01', 10);




-- Data for skill table
INSERT INTO skill (skill_id, skill_name)
VALUES (1, 'SQL'), (2, 'Java '), (3, 'Python'), (4, 'Html'),
       (5, 'MongoDB'), (6, 'GO'), (7, 'Excell'), (8, 'c++'),
        (9, 'IT Support'), (10, 'SAP');

-- -- Data for job_skills table
INSERT INTO job_skills (job_id, skill_id, experience, level)
VALUES (7, 1, 5, 5), (7, 2, 3, 4), (7, 3, 2, 3), (8, 4, 4, 5),(8,2, 6, 5),(8, 3, 4, 5),
       (7, 5, 3, 4), (7, 6, 2, 3), (2, 7, 3, 5), (4, 8, 5, 4),(4, 3, 3, 4),(4, 6, 6, 5),(6, 5, 6, 7),(6, 1, 3, 4),(6, 2, 3, 4),
       (9, 9, 2, 3), (5, 10, 4, 5);


-- Data for personality table
INSERT INTO personality (personality_id, personality_name)
VALUES (1, 'Analytical'), (2, 'Creative'), (3, 'Adaptable'), (4, 'Assertive'),
       (5, 'Detail-oriented'), (6, 'Innovative'), (7, 'Team Player'), (8, 'Responsible'),
       (9, 'Self-motivated'), (10, 'Open-minded');


-- Data for required_attributes_for_job table
INSERT INTO required_attributes_for_job (job_id, personality_id)
VALUES (7, 1), (7, 5), (7, 10), (7, 7),
       (6, 1), (6, 5), (6, 10), (6, 3),
       (8, 9),(2, 3),(6, 3), (8, 10),
       (4, 1),(4, 3),(4, 4),(4, 8);

-- Data for interview table
INSERT INTO interview (interview_id, interview_type)
VALUES (1, 'Phone Interview'), (2, 'In-person Interview'), (3, 'Technical Assessment'),
       (4, 'Panel Interview'), (5, 'Behavioral Interview'), (6, 'Case Study'),
       (7, 'Group Interview'), (8, 'Present Interview'), (9, 'Final Interview'), (10, 'Video Interview');

-- Data for job_interviews table
INSERT INTO job_interviews (job_id, interview_id)
VALUES (4, 8), (4, 1), (4, 3),
       (7, 8), (7, 1), (6, 2), (6, 3), (6, 1), (6, 10), (6, 9),
       (9, 9),(7, 2), (7, 3), (7, 1), (7, 10), (7, 9),
       (8, 2), (8, 3), (8, 1), (8, 10);

-- Data for candidate table
INSERT INTO candidate (candidate_id, candidate_name, job_id)
VALUES (1, 'Amy Johnson', 7),
(2, 'David Smith', 8), 
(3, 'Emma Davis', 7),
 (4, 'Jacob Wilson', 8),
       (5, 'Lily Brown', 4), 
       (6, 'Matthew Taylor', 4),
       (7, 'Olivia Clark', 6), (8, 'Ryan Lee', 6),
       (9, 'Sophia Anderson', 4), (10, 'William Martinez', 7);

-- Data for candidates_personalities table
INSERT INTO candidates_personalities (candidate_id, personality_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4),
       (5, 5), (6, 6), (7, 7), (8, 8),
       (9, 9), (10, 10);

-- Data for candidate_skills table
INSERT INTO candidate_skills (candidate_id, skill_id, experience, level)
VALUES (1, 1, 3, 4), (1, 3, 3, 4),(1, 2, 3, 4),(1, 5, 3, 4),
(2, 2, 5, 5),(2, 6, 5, 5),(2, 8, 5, 5),(2, 1, 5, 5),
 (3, 3, 2, 3), (3, 4, 2, 3),(3, 6, 2, 3),(3, 5, 2, 3),
 (4, 1, 4, 5), (4, 4, 4, 5), (4, 3, 4, 5), (4, 5, 4, 5), (4, 8, 4, 5),
       (5, 5, 3, 4), (5, 4, 3, 4), (5, 3, 3, 4),
       (6, 1, 2, 3),  (6, 2, 2, 3),
       (7, 5, 4, 5), (7, 6, 4, 5),(7, 8, 4, 5),
       (8, 8, 3, 4), (8, 1, 3, 4), (8, 2, 3, 4),
       (9, 3, 2, 3),   (9, 8, 2, 3),  (9,6, 2, 3),
       (10, 3, 4, 5),(10, 8, 4, 5),(10, 6, 4, 5);

-- Data for status table
INSERT INTO status (status_id, status_name)
VALUES (1, 'Pending'), (2, 'Scheduled'), (3, 'Completed'), (4, 'Cancelled'),
       (5, 'In Progress'), (6, 'On Hold'), (7, 'Declined'), (8, 'Rescheduled'),
       (9, 'Not Attended'), (10, 'Passed');

-- Data for candidates_interviews table
INSERT INTO candidates_interviews (candidate_id, interview_id, status_id, interview_description)
VALUES (1, 1, 2, 'Phone interview scheduled for tomorrow.'),
		(1, 8, 10, 'Candidate successfully passed the presentation interview.'),
		(1, 3, 3, 'Technical assessment in progress.'),
        (2, 1, 10, 'Phone interview scheduled for tomorrow.'),
		(2, 8, 10, 'Candidate successfully passed the presentation interview.'),
		(2, 3, 3, 'Technical assessment in progress.'),
        (3, 1, 2, 'Phone interview scheduled for tomorrow.'),
		(3, 8, 10, 'Candidate successfully passed the presentation interview.'),
		(3, 3, 3, 'Technical assessment in progress.'),
        (4, 1, 2, 'Phone interview scheduled for tomorrow.'),
		(4, 8, 10, 'Candidate successfully passed the presentation interview.'),
		(4, 3, 3, 'Technical assessment in progress.'),
		
       (2, 2, 1, 'Awaiting confirmation for in-person interview.'),
       (3, 3, 5, 'Technical assessment in progress.'),
       (4, 4, 10, 'Completed behavioral interview.'),
       (5, 5, 6, 'Interview on hold due to scheduling conflicts.'),
       (6, 6, 7, 'Candidate declined the case study interview.'),
       (7, 7, 4, 'Panel interview scheduled for next week.'),
       (8, 8, 10, 'Candidate successfully passed the presentation interview.'),
       (9, 9, 8, 'Interview rescheduled due to unforeseen circumstances.'),
       (10, 10, 9, 'Candidate did not attend the final interview.');
       
       



