	DECLARE @day_1		NVARCHAR(15) = 'Monday'
	DECLARE @day_2		NVARCHAR(15) = 'Wednesday'
	DECLARE @day_3		NVARCHAR(15) = 'Friday'
	DECLARE @start_day	DATE		 = '2024.03.27'
	DECLARE @date		DATE		 = @start_day
	DECLARE @number_of_lessons	INT	 = 24
	DECLARE	@number_of_lesson	INT	 = 1

	WHILE @number_of_lesson < @number_of_lessons
	BEGIN
		IF DATENAME(WEEKDAY, @date) IN (@day_1,@day_2,@day_3)
		BEGIN
			PRINT(FORMATMESSAGE('%s, %s', CONVERT(NVARCHAR(25), @date), DATENAME(WEEKDAY, @date)))

			--PRINT(DATENAME(WEEKDAY, @date))
			SET @number_of_lesson = @number_of_lesson + 2
		END
			SET @date = DATEADD(DAY, 1 , @date)
END
