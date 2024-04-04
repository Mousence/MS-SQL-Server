ALTER PROCEDURE my_sp_add_stacionar_to_schedule
@group_name			NVARCHAR(10),
@discipline_name	NVARCHAR(150),
@start_date			DATE,
@time				TIME,
@teacher_name		NVARCHAR(50),
@learning_day_1		NVARCHAR(25),
@learning_day_2		NVARCHAR(25),
@learning_day_3		NVARCHAR(25)
AS

DECLARE @discipline			SMALLINT = (SELECT discipline_id	 FROM Disciplines	WHERE discipline_name LIKE (@discipline_name))
DECLARE @group				INT		 = (SELECT group_id			 FROM Groups		WHERE group_name = @group_name)
DECLARE @number_of_lessons	TINYINT  = (SELECT number_of_lessons FROM Disciplines	WHERE discipline_name LIKE (@discipline_name))
DECLARE @number_of_lesson	TINYINT	 = 0
DECLARE @teacher			SMALLINT = (SELECT teacher_id		 FROM Teachers WHERE last_name=@teacher_name)
DECLARE @date				DATE	 = @start_date

--DECLARE @interval_1			TINYINT  =

WHILE @number_of_lesson < @number_of_lessons
BEGIN
	IF dbo.isCelebration(@date)
	BEGIN
		IF DATENAME(WEEKDAY, @date) = 'Friday'
		SET @date = DATEADD(DAY, 3, @date)
	END
	BEGIN
		IF NOT EXISTS
		(
			SELECT [date], [time], [group], discipline 
			FROM Schedule 
			WHERE [date]=@date 
			AND [time]=@time 
			AND [group]=@group 
			--AND discipline=@discipline
		)
		BEGIN
			IF DATENAME(WEEKDAY, @date) IN (@learning_day_1, @learning_day_2 , @learning_day_3)
			BEGIN
				INSERT INTO Schedule
						([group], discipline, teacher, [date], [time], spent, number_of_lesson)
				VALUES	
						(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(), 1, 0), @number_of_lesson+1),
						(@group, @discipline, @teacher, @date, DATEADD(MINUTE, 95, @time), IIF(@date<GETDATE(), 1, 0), @number_of_lesson+2)
				SET @number_of_lesson = @number_of_lesson + 2
			END
		END
		ELSE
		BEGIN
			SET @number_of_lesson = @number_of_lesson + 2
		END
	END
	--SET @date = DATEADD(DAY,IIF(DATENAME(WEEKDAY, @date) IN (SELECT TOP 2 * FROM string_split(@learning_days, ',')), 2, 3), @date)
	SET @date = DATEADD(DAY, 1, @date)
END