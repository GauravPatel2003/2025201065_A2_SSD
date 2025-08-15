
DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Subscribers WHERE SubscriberName = subName) THEN
        INSERT INTO Subscribers (SubscriberName) VALUES (subName);
    ELSE
        SELECT 'Subscriber already exists' AS Message;
    END IF;
END //

DELIMITER ;
CALL AddSubscriberIfNotExists('Amit');
CALL AddSubscriberIfNotExists('John');
