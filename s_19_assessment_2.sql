-- Session 19 Assessment 2

SHOW DATABASES;

CREATE DATABASE timetable_management;

USE timetable_management;

CREATE TABLE timetable (
	T_Id INT PRIMARY KEY AUTO_INCREMENT,
     T_Name VARCHAR (50),
     T_Subject VARCHAR (50),
     Work_Load INT,
     C_Teacher VARCHAR (10),
     Gender ENUM ('M', 'F'),
     S_Class VARCHAR (10)
);

DESC timetable;

INSERT INTO timetable (T_Name, T_Subject, Work_Load, C_Teacher, Gender, S_Class)
VALUES
('Anita', 'Hindi', 20, 'Yes', 'F', 'VIII'),
('Aman', 'English', 22, 'Yes', 'M', 'VII'),
('Ruby', 'History', 24, 'No', 'F', 'VIII'),
('Seema', 'Hindi', 20, 'Yes', 'F', 'IX');

SELECT * FROM timetable;

-- 01. Display the detail of all teachers in ascending order of workload.
SELECT * FROM Timetable ORDER BY Work_Load ASC;

-- 02. Display the detail of class teachers of Class VIII.
SELECT * FROM Timetable WHERE C_Teacher = 'Yes' AND S_Class = 'VIII';

-- 03. Display t_Name and subject of all the class teachers.
SELECT T_Name, T_Subject FROM Timetable WHERE C_Teacher = 'Yes';

-- 04. Display t_Name and workload of Hindi teachers.
SELECT T_Name, Work_Load FROM Timetable WHERE T_Subject = 'Hindi';

-- 05. Display the detail of the teacher having the maximum workload.
SELECT * FROM Timetable WHERE Work_Load = (SELECT MAX(Work_Load) FROM Timetable);

-- 06. Display the detail of the teacher having the minimum workload.
SELECT * FROM Timetable WHERE Work_Load = (SELECT MIN(Work_Load) FROM Timetable);

-- 07. Display the detail of the female teacher teaching Class VIII.
SELECT * FROM Timetable WHERE Gender = 'F' AND S_Class = 'VIII';

-- 08. Display the total workload.
SELECT SUM(Work_Load) AS Total_Workload FROM Timetable;

-- 09. Display the details of teachers whose names end with ‘a’.
SELECT * FROM Timetable WHERE T_Name LIKE '%a';

-- 10. Display the class-wise workload.
SELECT S_Class, SUM(Work_Load) AS Total_Workload FROM Timetable GROUP BY S_Class;

-- 11. Display the subject-wise number of teachers.
SELECT T_Subject, COUNT(*) AS Number_of_Teachers FROM Timetable GROUP BY T_Subject;

-- 12. Display the details of "Anita" and "Aman" (using IN operator).
SELECT * FROM Timetable WHERE T_Name IN ('Anita', 'Aman');

-- 13. Display the details of the Class VIII teacher whose workload is more than 20.
SELECT * FROM Timetable WHERE S_Class = 'VIII' AND Work_Load > 20;

-- 14. Display t_Name, class, and workload of teachers whose workload is between 20 and 30 (including both).
SELECT T_Name, S_Class, Work_Load FROM Timetable WHERE Work_Load BETWEEN 20 AND 30;

-- 15. Increase the workload of all male teachers by 1.
UPDATE Timetable SET Work_Load = Work_Load + 1 WHERE Gender = 'M';

-- 16. Change the subject of Ruby from "History" to "Math".
UPDATE Timetable SET T_Subject = 'Math' WHERE T_Name = 'Ruby';

-- 17. Delete the record of "Seema".
DELETE FROM Timetable WHERE T_Name = 'Seema';

-- 18. Delete the column c_teacher.
ALTER TABLE Timetable DROP COLUMN C_Teacher;
