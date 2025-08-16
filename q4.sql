
DELIMITER //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE cur CURSOR FOR 
        SELECT DISTINCT SubscriberID
        FROM WatchHistory
        WHERE WatchTime > 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sub_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;
CALL SendWatchTimeReport();
