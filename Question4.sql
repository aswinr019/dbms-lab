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
  FOREIGN KEY (bookid) REFERENCES Book(BOOKID),
  FOREIGN KEY (authorid) REFERENCES Author(authorid)
);

CREATE TABLE Borrower (
  cardno INT PRIMARY KEY,
  NAME VARCHAR(50) NOT NULL
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
  (3, 'Random House');

INSERT INTO Author VALUES
  (1, 'Jane Austen'),
  (2, 'Ernest Hemingway'),
  (3, 'Agatha Christie'),
  (4, 'William Shakespeare'),
  (5, 'J.K. Rowling'),
  (6, 'Stephen King');

INSERT INTO Book VALUES
  (1, 'Pride and Prejudice', 1, 5),
  (2, 'The Old Man and the Sea', 2, 3),
  (3, 'Murder on the Orient Express', 3, 4),
  (4, 'Hamlet', 2, 2),
  (5, 'Harry Potter and the Philosopher''s Stone', 1, 10);
  
  
  
  
 SELECT * FROM Borrower WHERE Cardno NOT IN (
 SELECT DISTINCT Cardno FROM Book_Loan WHERE STATUS = 'T');
 
 
SELECT Borrower.cardno, Borrower.name, COUNT(*) AS NUM_BOOKS_CHECKED_OUT FROM Borrower
JOIN Book_Loan ON Borrower.CARDNO = Book_Loan.cardno WHERE Book_Loan.status = 'T'
GROUP BY Borrower.cardno, Borrower.name HAVING COUNT(*) > 5;


CREATE INDEX idx_bookloan_bookid ON Book_Loan (bookid);


CREATE VIEW Borrower_Books_Out AS SELECT B.cardno, B.name, COUNT(*) AS NUM_BOOKS_OUT FROM Borrower B
JOIN Book_Loan BL ON B.cardno = BL.cardno WHERE BL.status = 'T' GROUP BY B.cardno, B.name;

CREATE PROCEDURE Author_Details(@BookID INT)
AS
BEGIN
  SELECT A.authorid, A.authorname, BL.status
  FROM Author A
  JOIN Book_Author BA ON A.auhtorid = BA.auhtorid
  JOIN Book_Loan BL ON BL.bookid = BA.bookid
  WHERE BA.bookid = @BookID;
END

