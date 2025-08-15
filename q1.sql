DELIMITER //

CREATE PROCEDURE find_subscriber_name()
BEGIN
    DECLARE flag INT DEFAULT FALSE;
    DECLARE sname VARCHAR(50);

    -- Declare cursor
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;

    -- Handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = TRUE;

    -- Open cursor
    OPEN cur;

    -- Loop through cursor
    read_loop: LOOP
        FETCH cur INTO sname;
        IF flag THEN
            LEAVE read_loop;
        END IF;
        SELECT sname AS SubscriberName;
    END LOOP;

    -- find_subscriber_namelose cursor
    CLOSE cur;
END;
//

DELIMITER ;
CALL find_subscriber_name();
