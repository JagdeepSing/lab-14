
-- Create new table
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Insert bookshelf names from books to new table bookshelves (no duplicates) 
INSERT INTO bookshelves (name) SELECT DISTINCT bookshelf FROM books;

-- add a bookshelf_id column to books table
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- add the id for each bookshelf in bookshelves table to books table
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- delete the bookshelf names column from books
ALTER TABLE books DROP COLUMN bookshelf;

-- link the bookshelf id in books to the bookshelf id in bookshelves table
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
