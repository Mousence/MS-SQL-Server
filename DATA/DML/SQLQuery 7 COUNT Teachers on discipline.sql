USE MyBase

SELECT
	[Дисциплина]	= discipline_name,
	[Количество преподавателей] = COUNT(teacher_id)
FROM	Teachers
--WHERE	TeacherDisciplinesRelation.teacher = Teachers.teacher_id
--AND		TeacherDisciplinesRelation.discipline = Disciplines.discipline_id
JOIN TeacherDisciplinesRelation ON (teacher = teacher_id)
RIGHT JOIN Disciplines				ON (discipline = discipline_id)
GROUP BY discipline_name
--HAVING	COUNT(teacher_id)=0