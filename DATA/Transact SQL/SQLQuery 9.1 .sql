use MyBase

DECLARE @date DATE = '2024.03.08'

EXECUTE my_sp_add_stacionar_to_schedule 'PD_212', '������� ����������������', '2024-02-28', '14:30', '������', 'Monday', 'Wednesday', 'Friday'
EXECUTE my_sp_select_discipline_for_group_from_schedule 'PD_212', '������� ����������������'
--PRINT()
--IF @date IN (SELECT )
--SELECT * FROM MyBase.dbo.Celebrations WHERE celebration_day = DATEPART(DAY, @date) AND celebration_month = DATEPART(MONTH, @date)