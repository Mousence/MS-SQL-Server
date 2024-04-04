ALTER PROCEDURE my_sp_select_discipline_for_group_from_schedule 
@group		NVARCHAR(10),
@discipline	NVARCHAR(50)
AS
SELECT 
		lesson_id,
		[������] = group_name,
		[����������] = Disciplines.discipline_name,
		[�������������] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		[����]			= [Schedule].[date],
		[�����]			= [Schedule].[time],
		[������]		= IIF([Schedule].[spent] = 1, '���������', '�������������'),	
		[����� �������] = number_of_lesson,
		[���� �������]  = subject_of_lesson
	FROM MyBase.dbo.Schedule
	JOIN MyBase.dbo.Groups		 ON ([group] = group_id)
	JOIN MyBase.dbo.Disciplines ON (discipline = discipline_id)
	JOIN MyBase.dbo.Teachers	 ON (teacher = teacher_id)

WHERE group_name LIKE (@group)
AND	  Disciplines.discipline_name LIKE (@discipline)

