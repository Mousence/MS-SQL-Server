Use MyBase

SELECT
	[Дисциплина]		= discipline_name,
	[Направление обучения] = direction_name
FROM	Disciplines, Directions, Directions_Disciplines
WHERE	Directions_Disciplines.discipline = Disciplines.discipline_id
AND		Directions_Disciplines.direction = Directions.direction_id
AND		Directions.direction_name LIKE('%Web%')