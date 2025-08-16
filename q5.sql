DELIMITER //

CREATE PROCEDURE SendData()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE sub_name VARCHAR(100);
    DECLARE total_time INT;
    DECLARE cur CURSOR FOR
        SELECT SubscriberID, SubscriberName
        FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sub_id, sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT SUM(WatchTime) INTO total_time
        FROM WatchHistory
        WHERE SubscriberID = sub_id;
        IF total_time IS NULL THEN
            SET total_time = 0;
        END IF;
        SELECT CONCAT('Subscriber: ', sub_name, ' | Total WatchTime: ', total_time) AS SubscriberInfo;
        CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

call SendData();