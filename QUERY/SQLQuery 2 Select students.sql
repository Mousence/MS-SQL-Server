Use MyBase

SELECT
	last_name + ' ' + first_name + ' ' + middle_name	AS 'ФИО Студента',
	DATEDIFF(hour, birth_date, getdate())/8766			AS 'Возраст',
	group_name											AS 'Группа',
	Directions.direction_name							AS 'Направление'
FROM Students
JOIN 
    Groups ON Students.[group] = Groups.group_id
JOIN
    Directions ON Groups.direction = Directions.direction_id;
--ORDER BY last_name