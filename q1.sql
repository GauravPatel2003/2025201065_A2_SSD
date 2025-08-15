DELIMITER //

CREATE PROCEDURE find_subscriber_name()
BEGIN
    DECLARE flag INT DEFAULT FALSE;
    DECLARE sname VARCHAR(50);

    -- Declare cursor
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;

    -- Handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = TRUE;

    -- Create temporary table once
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_sub (
        SubscriberName VARCHAR(50)
    );

    -- Open cursor
    OPEN cur;

    -- Loop through cursor
    read_loop: LOOP
        FETCH cur INTO sname;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert each subscriber name into temp table
        INSERT INTO temp_sub VALUES (sname);
    END LOOP;

    -- Close cursor
    CLOSE cur;

    -- Select all names at once (single table)
    SELECT * FROM temp_sub;
END;
//

DELIMITER ;
CALL find_subscriber_name();