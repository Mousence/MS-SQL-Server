USE MyBase

SELECT
	[Направление обучения]	= direction_name,
	[Количество студентов]	= COUNT(stud_id)
FROM	Students, Groups, Directions
WHERE	Students.[group] = Groups.group_id
AND		Groups.direction = Directions.direction_id
GROUP BY direction_name