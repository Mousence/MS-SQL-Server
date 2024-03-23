USE MyBase;

SELECT
			Groups.group_name AS 'Направление',
			COUNT(Students.stud_id) AS 'Количество студентов'
FROM		Groups, Students
WHERE		Students.[group] = Groups.group_id
GROUP BY	group_name
HAVING COUNT(stud_id) < 10
ORDER BY	[Количество студентов] DESC