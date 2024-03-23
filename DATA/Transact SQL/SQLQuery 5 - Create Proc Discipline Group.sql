CREATE PROCEDURE my_sp_select_discipline_for_group_from_schedule 
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
	FROM Schedule
	JOIN Groups		 ON ([group] = group_id)
	JOIN Disciplines ON (discipline = discipline_id)
	JOIN Teachers	 ON (teacher = teacher_id)

WHERE group_name LIKE ('%PD_321%')
AND	  Disciplines.discipline_name LIKE ('%MS SQL server%')

