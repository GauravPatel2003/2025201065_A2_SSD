DELIMITER //

CREATE PROCEDURE find_subscriber_name()
BEGIN
    DECLARE flag INT DEFAULT FALSE;
    DECLARE sname VARCHAR(50);

    -- Declare cursor
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;

    -- Handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = TRUE;
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_sub (
        SubscriberName VARCHAR(50)
    );
    -- Open cursor
    OPEN cur;

    -- Loop through cursor
    read_loop: LOOP
        FETCH cur INTO sname;
        IF flag THEN
            LEAVE read_loop;
        END IF;
        SELECT sname AS SubscriberName;
        INSERT INTO temp_subscribers VALUES (sname);
    END LOOP;

    -- find_subscriber_namelose cursor
    CLOSE cur;
     -- Return all names at once
    SELECT * FROM temp_subscribers;
END;
//

DELIMITER ;
CALL find_subscriber_name();
