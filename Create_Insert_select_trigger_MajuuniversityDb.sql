-- NIM				: 2301896873
-- NAMA				: Samuel wijaya
--Kelas				: LI01
--Kode Mata Kuliah	: ISYS6169

CREATE DATABASE MajuUniversityDB

USE MajuUniversityDB

CREATE TABLE Program(
ProgramID int PRIMARY KEY NOT NULL,
ProgramName VARCHAR(255)NOT NULL

)

CREATE TABLE Student(
StudentID  char(12) PRIMARY KEY NOT NULL,
StudentName VARCHAR(255) NOT NULL,
PlaceOfBirth VARCHAR(255)NOT NULL,
DateOfBirth CHAR(12)NOT NULL,
ProgramID int FOREIGN KEY NOT NULL Program(ProgramID),
[Address] VARCHAR(255)

)

CREATE TABLE ScoreComponent(
Component CHAR(12) PRIMARY KEY NOT NULL,
Description VARCHAR(100)NOT NULL,
Weight FLOAT NOT NULL

)

CREATE TABLE Course(
CourseID CHAR(12) PRIMARY KEY NOT NULL,
CourseName VARCHAR(255) NOT NULL,
Credit int

)

CREATE TABLE Weight(
Grade CHAR(12) PRIMARY KEY NOT NULL,
ScoreMin int NOT NULL,
ScoreMax int NOT NULL,
Weight FLOAT NOT NULL

)

CREATE TABLE StudentScore(
StudentID CHAR(12) FOREIGN KEY REFERENCES NOT NULL Student(StudentID),
Semester CHAR(12) NOT NULL,
CourseID CHAR(12) FOREIGN KEY NOT NULL Course(CourseID),
TotalScore int NOT NULL,
Grade CHAR(12) CHECK(Grade in ('A' ,'A-' ,'B+' ,'B' ,'B-' ,'C+' ,'C' ,'D' ,'E' ,'F'))NOT NULL

)

CREATE TABLE StudentScoreDetail(
StudentID CHAR(12)FOREIGN KEY REFERENCES NOT NULL Student(StudentID),
Semester int NOT NULL,
CourseID CHAR(12)FOREIGN KEY REFERENCES NOT NULL Course(CourseID),
Component CHAR(12)FOREIGN KEY REFERENCES NOT NULL ScoreComponent(Component),
Score int CHECK(Score >=0 and Scpre <=100) NOT NULL

)

INSERT INTO Student VALUES(
'2301234234',
'NADYA STUFANY',
'Makasar',
'1990-02-24',
45,
'Jl.Kebon Jeruk Raya No.55 RT 6 RW 7,Kampung Bahag...'
)

INSERT INTO Student VALUES(
'2301234237',
'JUAN KANAM',
'Bandung',
'1991-03-01',
45,
'NULL'
)

INSERT INTO Student VALUES(
'2301234614',
'RANGGA ADATYI',
'SURABAYA',
'1996-03-11',
26,
'Jl.Mangga Manalagi N0.27 RT 01 RW 02 Kemanggisan, ...'
)

INSERT INTO Student VALUES(
'2301234734',
'SYLYIA KUYEPUTRA',
'Jakarta',
'1995-01-10',
45,
'Perumahan Ramainya Luar Biasa Blok A1 No.200 RT 01 ...'
)

INSERT INTO Student VALUES(
'2301234866',
'RYAN RUSLEN',
'Bekasi',
'1997-11-05',
25,
'Jalan Petukangan Utara Raya No.99. Gang Senggol ,RT ...'
)

INSERT INTO Student VALUES(
'2301234885',
'ANDRUW TANAMAS',
'Riau',
'1995-02-17',
25,
'Perumahan Alfa Indah Blok C40 No.76 Tangerang Selatan...'
)

INSERT INTO Student VALUES(
'2301234916',
'AAN AGUNG JULEAN',
'Jambi',
'1997-07-09',
26,
'Kampung Buah Mangga Harus Manis No.58 Depan Keb...'
)


INSERT INTO Program VALUES(
25,
'Computer Science'
)

INSERT INTO Program VALUES(
26,
'Information Systems'
)

INSERT INTO Program VALUES(
44,
'Accounting'
)

INSERT INTO Program VALUES(
45,
'Management'
)

INSERT INTO Program VALUES(
47,
'Internasional Business'
)

INSERT INTO Program VALUES(
77,
'Communication'
)


INSERT INTO ScoreComponent VALUES(
'ASG',
'Assigment',
30.00
)

INSERT INTO ScoreComponent VALUES(
'MID',
'Mid Test',
35.00
)

INSERT INTO ScoreComponent VALUES(
'FIN',
'Final Test',
35.00
)


INSERT INTO Course VALUES(
'ACCT6164',
'Financial Accounting',
2
)

INSERT INTO Course VALUES(
'COMP6141',
'Interactive Computer Graphic',
4
)

INSERT INTO Course VALUES(
'COMP6143',
'Mobile Multimedia',
4
)

INSERT INTO Course VALUES(
'COMP6449',
'Machine Learning',
3
)

INSERT INTO Course VALUES(
'ENGL6171',
'Acedemic English I',
3
)

INSERT INTO Course VALUES(
'FINC6067',
'Internasional Financial management',
2
)

INSERT INTO Course VALUES(
'ISYS6440',
'Introduction to Business Databases',
4
)

INSERT INTO Course VALUES(
'MKTG6286',
'Consumer Psychology and Behavior',
4
)

INSERT INTO Course VALUES(
'MKTG6287',
'Product and Brand Management',
4
)

INSERT INTO Course VALUES(
'MKTG6288',
'Digital Business and Analytics',
3
)

INSERT INTO Weight VALUES(
'A',
91,
100,
4.00
)

INSERT INTO Weight VALUES(
'A-',
86,
90,
3.67
)

INSERT INTO Weight VALUES(
'B+',
81,
85,
3.33
)

INSERT INTO Weight VALUES(
'B',
76,
80,
3.00
)

INSERT INTO Weight VALUES(
'B-',
71,
75,
2.67
)

INSERT INTO Weight VALUES(
'C+',
66,
70,
2.33
)

INSERT INTO Weight VALUES(
'C',
61,
65,
2.00
)

INSERT INTO Weight VALUES(
'D',
50,
60,
1.00
)

INSERT INTO Weight VALUES(
'E',
1,
49,
0.00
)

INSERT INTO Weight VALUES(
'F',
0,
0,
0.00
)

INSERT INTO StudentScore VALUES(
'2301234734',
'20192',
'ACCT6164',
96,
'A'
)

INSERT INTO StudentScore VALUES(
'2301234734',
'20192',
'COMP6141',
82,
'B+'
)

INSERT INTO StudentScore VALUES(
'2301234734',
'20192',
'COMP6143',
87,
'A-'
)

INSERT INTO StudentScore VALUES(
'2301234734',
'20192',
'COMP6449',
89,
'A-'
)

INSERT INTO StudentScore VALUES(
'2301234734',
'20192',
'ENGL6171',
91,
'A'
)

INSERT INTO StudentScore VALUES(
'2301234734',
'20192',
'ISYS6440',
88,
'A-'
)


INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ACCT6164',
'ASG',
100
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ACCT6164',
'MID',
90
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ACCT6164',
'FIN',
95
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6141',
'ASG',
80
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6141',
'MID',
83
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6141',
'FIN',
85
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6143',
'ASG',
91
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6143',
'MID',
85
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6143',
'FIN',
87
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6449',
'ASG',
90
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6449',
'MID',
90
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'COMP6449',
'FIN',
88
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ENGL6171',
'ASG',
100
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ENGL6171',
'MID',
89
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ENGL6171',
'FIN',
87
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ISYS6440',
'ASG',
95
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ISYS6440',
'MID',
90
)

INSERT INTO StudentScoreDetail VALUES(
'2301234734',
'20192',
'ISYS6440',
'FIN',
80
)


--2
--a
SELECT *FROM Course 
WHERE Credit >3

--b
SELECT s.StudentID ,s.StudentName ,p.ProgramName FROM Student AS s JOIN Program AS p on s.ProgramID=p.ProgramID

--3
SELECT s.Semester ,c.CourseID ,c.CourseName ,COUNT(s.StudentID) FROM StudentScore AS s JOIN Course AS c on s.StudentID=c.CourseID GROUP BY Grade
'A' = Count(Case WHEN Grade = 'A' THEN +1 END),
'A-' = Count(Case WHEN Grade = 'A-' THEN +1 END),
'B+' = Count(Case WHEN Grade = 'B+' THEN +1 END),
'B' = Count(Case WHEN Grade = 'B' THEN +1 END),
'B-' = Count(Case WHEN Grade = 'B-' THEN +1 END)

--4
SELECT s.StudentID ,s.StudentName ,st.Semester ,SUM(c.Credit),
CAST(SUM(w.[Weight]*c.Credit))/(SUM(c.Credit))
CAST(SUM(Credit*Wight))/SUM(Credit)
FROM Student AS s JOIN StudentScore AS st on s.StudentID=st.StudentID 
JOIN Course AS c on c.CourseID = st.CourseID
JOIN [Weight] AS w on w.Grade = st.Grade GROUP BY StudentID

--5
CREATE PROCEDURE  Sp_CreateNewStudent @StudentID CHAR(12) ,@StudentName VARCHAR(255) ,@PlaceOfBirth VARCHAR(255),@DateOfBirth CHAR(12),@ProgramID INT,@Address VARCHAR(255)
AS 
INSERT INTO Student VALUES(
@StudentID,
@StudentName,
@PlaceOfBirth,
@DateOfBirth,
@ProgramID,
@Address
)

--6
CREATE TRIGGER Trigger_UpdateStudentSCore ON StudentScoreDetail AFTER INSERT ,UPDATE ,DELETE AS 
BEGIN StudentID ,Semester ,CourseID ,Componnent ,Score