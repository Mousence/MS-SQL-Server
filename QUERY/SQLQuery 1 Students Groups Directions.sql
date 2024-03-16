USE PD_321_SQL

DROP TABLE IF EXISTS Directions;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Students;

CREATE TABLE dbo.Directions
(
	direction_id	TINYINT PRIMARY KEY,
	direction_name	NVARCHAR(50) --NOT NULL
)

ALTER TABLE Directions
	ALTER COLUMN direction_name NVARCHAR(50) NOT NULL

-------------------------------------------------------

CREATE TABLE dbo.Groups
(
	group_id	 INT IDENTITY(1,1) PRIMARY KEY,
	group_name	 NVARCHAR(15) NOT NULL,
	direction	 TINYINT CONSTRAINT FK_Groups_Directions FOREIGN KEY REFERENCES dbo.Directions(direction_id)
)

ALTER TABLE Groups
	ALTER COLUMN direction TINYINT NOT NULL
------------------------------------------------------

CREATE TABLE Students
(
	stud_id		INT PRIMARY KEY IDENTITY(1,1),
	last_name	NVARCHAR(50)	NOT NULL,
	first_name	NVARCHAR(50)	NOT NULL,
	middle_name NVARCHAR(50),
	birth_date	DATE			NOT NULL,
	email		NVARCHAR(50),
	phone		NVARCHAR(16)	 NOT NULL,
	photo		IMAGE,
	[group]		INT		CONSTRAINT FK_Students_Groups FOREIGN KEY REFERENCES Groups(group_id)
)

CREATE TABLE Teachers
(
	teacher_id	SMALLINT PRIMARY KEY IDENTITY(1,1),
	last_name	NVARCHAR(50)	NOT NULL,
	first_name	NVARCHAR(50)	NOT NULL,
	middle_name NVARCHAR(50),
	birth_date	DATE			NOT NULL,
	email		NVARCHAR(50),
	phone		NVARCHAR(16)	 NOT NULL,
	photo		IMAGE,
)