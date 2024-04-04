CREATE PROCEDURE my_sp_add_stacionar_to_schedule
	@group_name NVARCHAR(10),
	@discipline_name_pattern NVARCHAR(150),
    @time		TIME,
    @start_date DATE,
	@teacher_first_name NVARCHAR(50),
	@learning_day_1	NVARCHAR(10),
	@learning_day_2	NVARCHAR(10),
	@learning_day_3	NVARCHAR(10)
AS
BEGIN
    DECLARE @group              INT          = (SELECT group_id FROM Groups WHERE group_name = @group_name)
    DECLARE @discipline         SMALLINT     = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name_pattern)
    DECLARE @number_of_lessons  TINYINT      = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE @discipline_name_pattern)
    DECLARE @number_of_lesson   TINYINT      = 0
    DECLARE @teacher            SMALLINT     = (SELECT teacher_id FROM Teachers WHERE first_name = @teacher_first_name)
    DECLARE @date               DATE         = @start_date

    WHILE @number_of_lesson < @number_of_lessons - 1
    BEGIN
        IF NOT EXISTS
        (
            SELECT [group], discipline, teacher, [date], [time], spent
            FROM Schedule
            JOIN Groups ON [group] = group_id
            JOIN Disciplines ON discipline = discipline_id
            JOIN Teachers ON teacher = teacher_id
            WHERE [group] = @group
            AND discipline = @discipline
            AND teacher = @teacher
            AND [date] = @date
            AND [time] = @time
        )
        BEGIN
            INSERT INTO Schedule ([group], discipline, teacher, [date], [time], spent, number_of_lesson)
            VALUES
                (@group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0), @number_of_lesson + 1),
                (@group, @discipline, @teacher, @date, DATEADD(MINUTE, 95, @time), IIF(@date < GETDATE(), 1, 0), @number_of_lesson + 2);
        END
		SET	@date = DATEADD(DAY, IIF(DATENAME(WEEKDAY, @date) IN (SELECT TOP 2 * FROM string_split(@learning_days, ',')),2,3), @date)
        SET @number_of_lesson = @number_of_lesson + 2
    END
END


