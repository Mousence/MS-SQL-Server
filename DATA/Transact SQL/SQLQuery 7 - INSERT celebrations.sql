USE MyBase

--DELETE FROM Celebrations WHERE Celebrations.clebration_month = 5

DECLARE @day		TINYINT = 8
DECLARE @end_day	TINYINT = 8
DECLARE @month		TINYINT = 3
DECLARE @name		NVARCHAR(50) = 'Международный женский день'

WHILE @day <= @end_day
BEGIN
	IF(NOT EXISTS (SELECT * FROM Celebrations WHERE @day = celebration_day AND @month = celebration_month))
	BEGIN
		INSERT INTO  Celebrations
					(celebration_day, celebration_month, celebration_name)
		VALUES		(@day, @month, @name)
	END
	SET @day = @day + 1
END

SELECT * FROM Celebrations ORDER BY Celebrations.celebration_month