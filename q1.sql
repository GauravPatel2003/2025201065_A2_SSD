DELIMITER //

CREATE PROCEDURE find_subscriber_name()
BEGIN
    DECLARE flag INT DEFAULT FALSE;
    DECLARE sname VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = TRUE;

    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_sub (
        SubscriberName VARCHAR(50)
    );

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sname;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO temp_sub VALUES (sname);
    END LOOP;
    CLOSE cur;
    SELECT * FROM temp_sub;
END;
//

DELIMITER ;
CALL find_subscriber_name();