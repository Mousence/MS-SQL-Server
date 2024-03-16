USE MyBase

SELECT 
	last_name + ' ' + first_name + ' ' + middle_name AS '��� ��������������',
	DATEDIFF(hour, birth_date, GETDATE())/8766	AS '�������',
	DATEDIFF(hour, word_since, GETDATE())/8766	AS '���� ������������',
	Disciplines.discipline_name					AS '���������� �������������'
FROM Teachers
JOIN
    TeacherDisciplinesRelation ON Teachers.teacher_id = TeacherDisciplinesRelation.teacher
JOIN
    Disciplines ON Disciplines.discipline_id = TeacherDisciplinesRelation.discipline
--ORDER BY Disciplines.discipline_name	