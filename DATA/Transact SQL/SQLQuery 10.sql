USE MyBase

GO

--CREATE TABLE my_t_complete_discipline

SELECT 
	--[������] = group_name,
	--[����������] = discipline_name,
	[���������� ����������� �������] = COUNT(Schedule.spent)
FROM Schedule
--JOIN Disciplines ON  (discipline = discipline_id)
--JOIN Groups ON ([group] = group_id)
WHERE spent = 1
GROUP BY discipline, [group]