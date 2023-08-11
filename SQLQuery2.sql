CREATE DATABASE ExerciseDb
USE ExerciseDb

CREATE TABLE Publisher (
    PID INT PRIMARY KEY ,
    Publisher VARCHAR(500) NOT NULL UNIQUE
);

CREATE TABLE Category (
    CID INT PRIMARY KEY ,
    Category VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Author (
    AID INT PRIMARY KEY ,
    AuthorName VARCHAR(500) NOT NULL UNIQUE
);

CREATE TABLE Book (
    BID INT PRIMARY KEY ,
    BName VARCHAR(500) NOT NULL,
    BPrice FLOAT,
    Author INT,
    Publisher INT,
    Category INT,
    FOREIGN KEY (Author) REFERENCES Author (AID),
    FOREIGN KEY (Publisher) REFERENCES Publisher (PID),
    FOREIGN KEY (Category) REFERENCES Category (CID)
);

INSERT INTO Category (CID,Category) VALUES
    (1,'Fantasy Fiction'),
    (2,'Psychological Thriller Fiction'),
    (3,'Romance Fiction');

INSERT INTO Author (AID,AuthorName) VALUES
    (1,'J.K. Rowling'),
    (2,'Riley Sagar'),
    (3,'Jojo Moyes');

INSERT INTO Publisher(PID,Publisher) VALUES
(1,'PublisherABC'),
(2, 'PublisherLMN'),
(3, 'PublisherXYZ');

INSERT INTO Book (BID,BName, BPrice, Author, Publisher, Category) VALUES
    (1,'Harry Potter and the Sorcerer''s Stone', 500.90, 1, 1, 1),
    (2,'Home Before Dark', 255.99, 2, 2, 2),
    (3,'Me Before You', 120.90, 3, 3, 3),
    (4,'Harry Potter and the Deathly Hallows', 550.90, 1, 1, 1),
    (5,'The Only One Left', 200.50, 2, 2, 2),
    (6,'The Giver of Stars', 155.55, 3, 3, 3);

SELECT * FROM Book


SELECT b.BID, b.BName, b.BPrice, a.AuthorName, p.Publisher, c.Category
FROM Book b
JOIN Author a ON b.Author = a.AID
JOIN Publisher p ON b.Publisher = p.PID
JOIN Category c ON b.Category = c.CID;


