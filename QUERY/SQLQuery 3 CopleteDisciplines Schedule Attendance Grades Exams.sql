USE PD_321_SQL

CREATE TABLE	CompleteDisciplines
(
	[group]		INT NOT NULL CONSTRAINT FK_CompleteDisciplines_Groups FOREIGN KEY REFERENCES Groups(group_id),
	discipline	SMALLINT NOT NULL CONSTRAINT FK_CompleteDisciplines_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id)
	PRIMARY KEY (discipline, [group])
)

------------------------------------------------------------
CREATE TABLE	Schedule
(
	lesson_id	BIGINT PRIMARY KEY IDENTITY(1,1),
	[group]		INT NOT NULL CONSTRAINT FK_Schedule_Groups FOREIGN KEY REFERENCES Groups(group_id),
	discipline	SMALLINT NOT NULL CONSTRAINT FK_Schedule_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher		SMALLINT NOT NULL CONSTRAINT FK_Schedule_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
	date		DATE,
	time		TIME(0),
	spent		BIT
)
--------------------------------------------------------------
CREATE TABLE	Attendance
(
	student		INT		NOT NULL CONSTRAINT FK_Attendance_Students FOREIGN KEY REFERENCES Students(stud_id),
	lesson		BIGINT	NOT NULL CONSTRAINT FK_Attendance_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
	present		BIT		NOT NULL
	PRIMARY KEY (student, lesson)
)

CREATE TABLE Grades
(
	student	INT NOT NULL CONSTRAINT FK_Grades_Students	FOREIGN KEY REFERENCES Students(stud_id),
	lesson	BIGINT NOT NULL CONSTRAINT FK_Grades_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
	grade1	TINYINT,
	grade2  TINYINT

	PRIMARY KEY(student, lesson)
)

CREATE TABLE Exams
(
	student		INT NOT NULL CONSTRAINT FK_Exams_Students FOREIGN KEY REFERENCES Students(stud_id),
	discipline	SMALLINT NOT NULL CONSTRAINT FK_Exams_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
	date		DATE,
	grade		TINYINT

	PRIMARY KEY(student, discipline)
)