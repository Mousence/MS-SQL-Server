USE MyBase;

SELECT
    group_name AS '������',
    Disciplines.discipline_name AS '�����������'
FROM 
    Groups
JOIN
    Directions ON Groups.direction = Directions.direction_id
JOIN
    Directions_Disciplines ON Directions_Disciplines.direction = Directions.direction_id
JOIN
    Disciplines ON Disciplines.discipline_id = Directions_Disciplines.discipline;
