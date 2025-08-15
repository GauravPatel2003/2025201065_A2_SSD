DELIMITER //

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT Shows.Title, WatchHistory.WatchTime
    FROM WatchHistory
    JOIN Shows ON WatchHistory.ShowID = Shows.ShowID
    JOIN Subscribers ON Subscribers.SubscriberID = WatchHistory.SubscriberID
    WHERE Subscribers.SubscriberID = sub_id;
END //

DELIMITER ;
CALL GetWatchHistoryBySubscriber(1);