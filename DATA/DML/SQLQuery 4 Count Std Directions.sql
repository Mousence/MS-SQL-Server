USE MyBase;

SELECT
    Directions.direction_name AS '�����������',
    COUNT(Students.stud_id) AS '���������� ���������'
FROM
    Directions
JOIN
    Groups ON Directions.direction_id = Groups.direction
JOIN
    Students ON Groups.group_id = Students.[group]
GROUP BY
    Directions.direction_name;