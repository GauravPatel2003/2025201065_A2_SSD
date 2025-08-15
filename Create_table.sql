CREATE DATABASE IF NOT EXISTS Youtube;
USE Youtube;
-- Create Shows table
CREATE TABLE Shows (
    ShowID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT
);

-- Create Subscribers table
CREATE TABLE Subscribers (
    SubscriberID INT PRIMARY KEY,
    SubscriberName VARCHAR(100),
    SubscriptionDate DATE
);

-- Create WatchHistory table
CREATE TABLE WatchHistory (
    HistoryID INT PRIMARY KEY,
    ShowID INT,
    SubscriberID INT,
    WatchTime INT, -- Duration in minutes
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
);
-- Insert data into Shows
INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1, 'Stranger Things', 'Sci-Fi', 2016),
(2, 'The Crown', 'Drama', 2016),
(3, 'The Witcher', 'Fantasy', 2019),
(4, 'Breaking Bad', 'Crime', 2008),
(5, 'Money Heist', 'Thriller', 2017),
(6, 'The Mandalorian', 'Sci-Fi', 2019),
(7, 'Friends', 'Comedy', 1994),
(8, 'Loki', 'Superhero', 2021);

-- Insert data into Subscribers
INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES
(1, 'Emily Clark', '2023-01-10'),
(2, 'Chris Adams', '2023-02-15'),
(3, 'Jordan Smith', '2023-03-05'),
(4, 'Alice Johnson', '2023-04-10'),
(5, 'Bob Martin', '2023-05-12'),
(6, 'Diana Prince', '2023-06-01'),
(7, 'Ethan Hunt', '2023-07-20'),
(8, 'Fiona Gallagher', '2023-08-15');
-- Insert data into WatchHistory
INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES
(1, 1, 1, 100),
(2, 1, 2, 10),
(3, 2, 1, 20),
(4, 2, 2, 40),
(5, 2, 3, 10),
(6, 3, 2, 10),
(7, 3, 1, 10),
(8, 1, 4, 50),
(9, 1, 5, 30),
(10, 2, 4, 60),
(11, 2, 6, 45),
(12, 3, 7, 25),
(13, 3, 8, 40),
(14, 4, 1, 20),
(15, 4, 2, 15),
(16, 5, 3, 50),
(17, 5, 5, 35),
(18, 6, 6, 60),
(19, 6, 7, 45),
(20, 7, 8, 30),
(21, 7, 1, 25),
(22, 8, 2, 50),
(23, 8, 3, 20);
show tables;

SELECT * FROM Shows;
SELECT * FROM Subscribers;
SELECT * FROM WatchHistory;