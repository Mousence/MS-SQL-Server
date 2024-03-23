CREATE PROCEDURE my_sp_add_stacionar_to_schedule
    @discipline_name_pattern NVARCHAR(50),
    @group_name NVARCHAR(50),
    @teacher_first_name NVARCHAR(50),
    @start_date DATE
AS
BEGIN
    DECLARE @group              INT          = (SELECT group_id FROM Groups WHERE group_name = @group_name)
    DECLARE @discipline         SMALLINT     = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name_pattern)
    DECLARE @number_of_lessons  TINYINT      = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE @discipline_name_pattern)
    DECLARE @number_of_lesson   TINYINT      = 0
    DECLARE @teacher            SMALLINT     = (SELECT teacher_id FROM Teachers WHERE first_name = @teacher_first_name)
    DECLARE @date               DATE         = @start_date
    DECLARE @time               TIME         = '13:30'

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
        SET @number_of_lesson = @number_of_lesson + 2
        IF DATENAME(WEEKDAY, @date) IN ('Tuesday', 'Thursday')
            SET @date = DATEADD(DAY, 2, @date)
        ELSE
            SET @date = DATEADD(DAY, 3, @date)
    END
END


