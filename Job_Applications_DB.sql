CREATE DATABASE Job_Application_DB;
USE Job_Application_DB;

-- Create Applicants Table
CREATE TABLE Applicants (
    applicant_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    resume_link TEXT,
    date_of_birth DATE,
    address TEXT
);

-- Create Jobs Table
CREATE TABLE Jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(100),
    department VARCHAR(100),
    job_description TEXT,
    required_experience INT,
    salary DECIMAL(10, 2),
    job_location VARCHAR(100),
    date_posted DATE
);

-- Create Applications Table
CREATE TABLE Applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    applicant_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (applicant_id) REFERENCES Applicants(applicant_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

-- Create Interviewers Table
CREATE TABLE Interviewers (
    interviewer_id INT PRIMARY KEY AUTO_INCREMENT,
    interviewer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    department VARCHAR(100)
);

-- Create Interviews Table
CREATE TABLE Interviews (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT,
    interviewer_id INT,
    interview_date DATE,
    interview_result VARCHAR(100),
    comments TEXT,
    FOREIGN KEY (application_id) REFERENCES Applications(application_id),
    FOREIGN KEY (interviewer_id) REFERENCES Interviewers(interviewer_id)
);

-- Insert sample data into Applicants table
INSERT INTO Applicants (first_name, last_name, email, phone_number, resume_link, date_of_birth, address) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', 'resume_link_john', '1990-01-15', '123 Street, City'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'resume_link_jane', '1992-03-22', '456 Avenue, City');

-- Insert sample data into Jobs table
INSERT INTO Jobs (job_title, department, job_description, required_experience, salary, job_location, date_posted) 
VALUES 
('Software Engineer', 'Engineering', 'Develop software solutions.', 3, 60000, 'New York', '2024-01-01'),
('Marketing Manager', 'Marketing', 'Lead marketing campaigns.', 5, 80000, 'Los Angeles', '2024-02-15');

-- Insert sample data into Applications table
INSERT INTO Applications (applicant_id, job_id, application_date, status) 
VALUES 
(1, 1, '2024-03-01', 'Pending'),
(2, 2, '2024-03-05', 'Pending');

-- Insert sample data into Interviewers table
INSERT INTO Interviewers (interviewer_name, email, phone_number, department) 
VALUES 
('Emily Davis', 'emily.davis@company.com', '1112223333', 'Engineering'),
('Michael Brown', 'michael.brown@company.com', '4445556666', 'Marketing');

-- Insert sample data into Interviews table
INSERT INTO Interviews (application_id, interviewer_id, interview_date, interview_result, comments) 
VALUES 
(1, 1, '2024-03-10', 'Passed', 'Good technical skills'),
(2, 2, '2024-03-15', 'Failed', 'Needs more experience in marketing');
