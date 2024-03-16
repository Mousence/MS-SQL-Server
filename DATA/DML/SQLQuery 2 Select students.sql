Use MyBase

SELECT
	last_name + ' ' + first_name + ' ' + middle_name	AS '��� ��������',
	DATEDIFF(hour, birth_date, getdate())/8766			AS '�������',
	group_name											AS '������',
	Directions.direction_name							AS '�����������'
FROM Students
JOIN 
    Groups ON Students.[group] = Groups.group_id
JOIN
    Directions ON Groups.direction = Directions.direction_id;
--ORDER BY last_name