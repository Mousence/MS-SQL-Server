CREATE PROCEDURE my_sp_select_discipline_for_group_from_schedule 
AS
SELECT 
		lesson_id,
		[Группа] = group_name,
		[Дисциплина] = Disciplines.discipline_name,
		[Преподаватель] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
		[Дата]			= [Schedule].[date],
		[Время]			= [Schedule].[time],
		[Статус]		= IIF([Schedule].[spent] = 1, 'Проведено', 'Запланировано'),	
		[Номер занятия] = number_of_lesson,
		[Тема занятия]  = subject_of_lesson
	FROM Schedule
	JOIN Groups		 ON ([group] = group_id)
	JOIN Disciplines ON (discipline = discipline_id)
	JOIN Teachers	 ON (teacher = teacher_id)

WHERE group_name LIKE ('%PD_321%')
AND	  Disciplines.discipline_name LIKE ('%MS SQL server%')

