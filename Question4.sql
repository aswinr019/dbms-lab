CREATE TABLE Publisher (
   publishercode INT PRIMARY KEY,
   publishername VARCHAR(50) NOT NULL
);

CREATE TABLE Author (
  authorid INT PRIMARY KEY,
  authorname VARCHAR(50) NOT NULL
);

CREATE TABLE Book (
  bookid INT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  publishercode INT NOT NULL,
  noofcopies INT NOT NULL,
  FOREIGN KEY (publishercode) REFERENCES Publisher(publishercode)
);

CREATE TABLE Book_Author (
  bookid INT NOT NULL,
  authorid INT NOT NULL,
  PRIMARY KEY (bookid, authorid),
  FOREIGN KEY (bookid) REFERENCES Book(bookid),
  FOREIGN KEY (authorid) REFERENCES Author(authorid)
);

CREATE TABLE Borrower (
  cardno INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Loan (
  bookid INT NOT NULL,
  cardno INT NOT NULL,
  dateout DATE NOT NULL,
  duedate DATE NOT NULL,
  status VARCHAR(10) CHECK (STATUS IN ('R', 'T')),
  PRIMARY KEY (bookid, cardno , dateout),
  FOREIGN KEY (bookid) REFERENCES Book(bookid),
  FOREIGN KEY (cardno) REFERENCES Borrower(cardno)
);

INSERT INTO Publisher VALUES
  (1, 'Penguin Books'),
  (2, 'Oxford University Press'),
  (3, 'Random House'),
  (4, 'HarperCollins'),
  (5, 'Simon & Schuster'),
  (6, 'Hachette Book Group');

INSERT INTO Author VALUES
  (1, 'Jane Austen'),
  (2, 'Ernest Hemingway'),
  (3, 'Agatha Christie'),
  (4, 'William Shakespeare'),
  (5, 'J.K. Rowling'),
  (6, 'Stephen King'),
  (7, 'George R.R. Martin'),
  (8, 'Stephenie Meyer'),
  (9, 'Dan Brown'),
  (10, 'Michael Crichton'),
  (11, 'John Grisham'),
  (12, 'Agnes Martin-Lugand');

INSERT INTO Book VALUES
  (1, 'Pride and Prejudice', 1, 5),
  (2, 'The Old Man and the Sea', 2, 3),
  (3, 'Murder on the Orient Express', 3, 4),
  (4, 'Hamlet', 2, 2),
  (5, 'Harry Potter and the Philosopher''s Stone', 1, 10),
  (6, 'A Game of Thrones', 4, 8),
  (7, 'Twilight', 5, 6),
  (8, 'The Da Vinci Code', 6, 10),
  (9, 'Jurassic Park', 4, 4),
  (10, 'The Firm', 2, 3),
  (11, 'Happy People Read and Drink Coffee', 1, 2);
  
  
INSERT INTO Book_Author VALUES
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12);

INSERT INTO Borrower VALUES
(1001, 'Alice Johnson'),
(1002, 'Bob Smith'),
(1003, 'Charlie Brown'),
(1004, 'David Lee'),
(1005, 'Emily Davis');

INSERT INTO Book_Loan VALUES
(1, 1001, '2022-01-01', '2022-01-15', 'T'),
(2, 1001, '2022-01-05', '2022-01-20', 'T'),
(3, 1002, '2022-02-10', '2022-02-25', 'T'),
(4, 1002, '2022-03-03', '2022-03-18', 'T'),
(5, 1003, '2022-04-20', '2022-05-05', 'R'),
(6, 1003, '2022-05-05', '2022-05-20', 'R'),
(7, 1004, '2022-06-01', '2022-06-16', 'T'),
(8, 1005, '2022-06-18', '2022-07-03', 'T'),
(9, 1005, '2022-07-02', '2022-07-17', 'T'),
(10, 1005, '2022-08-01', '2022-08-16', 'T'),
(11, 1004, '2022-09-15', '2022-09-30', 'T'),
(7, 1004, '2022-09-15', '2022-09-30', 'T'),
(6, 1004, '2022-09-15', '2022-09-30', 'T'),
(5, 1004, '2022-09-15', '2022-09-30', 'T'),
(3, 1004, '2022-09-15', '2022-09-30', 'T'),
(2, 1004, '2022-09-15', '2022-09-30', 'T'),
(1, 1004, '2022-09-15', '2022-09-30', 'T');


SELECT * FROM Borrower WHERE cardno NOT IN (
SELECT DISTINCT cardno FROM Book_Loan WHERE status = 'T');

 
 
SELECT Borrower.cardno, Borrower.name, COUNT(*) AS NUM_BOOKS_CHECKED_OUT FROM Borrower
JOIN Book_Loan ON Borrower.CARDNO = Book_Loan.cardno WHERE Book_Loan.status = 'T'
GROUP BY Borrower.cardno, Borrower.name HAVING COUNT(*) > 5;


CREATE INDEX idx_bookloan_bookid ON Book_Loan (bookid);


CREATE VIEW Borrower_Books_Out AS SELECT B.cardno, B.name, COUNT(*) AS NUM_BOOKS_OUT FROM Borrower B
JOIN Book_Loan BL ON B.cardno = BL.cardno WHERE BL.status = 'T'
 GROUP BY B.cardno, B.name;

DELIMITER //
CREATE PROCEDURE Author_Details(IN bookid INT)
BEGIN
   SELECT authors.authorid, authors.author_name, books.status 
   FROM authors 
   INNER JOIN books ON authors.authorid = books.authorid 
   WHERE books.bookid = bookid;
END //
DELIMITER ;




CALL Author_Details(1);

