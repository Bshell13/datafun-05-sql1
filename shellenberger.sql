-- Start by deleting any tables if the exist already
-- We want to be able to re-run this script as needed.
-- DROP tables in reverse order of creation 
-- DROP dependent tables (with foreign keys) first

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- Create the authors table 
-- Note that the author table has no foreign keys, so it is a standalone table

CREATE TABLE authors (
    author_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    year_born INTEGER
);

-- Create the books table
-- Note that the books table has a foreign key to the authors table
-- This means that the books table is dependent on the authors table
-- Be sure to create the standalone authors table BEFORE creating the books table.

CREATE TABLE books (
    book_id TEXT PRIMARY KEY,
    title TEXT,
    year_published INTEGER,
    author_id TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Insert  a single author
Insert into authors (name) values ("John Doe");

-- Insert multiple authors in a single statement
insert into authors (name) values ("Alice Smith"), ("Bob Johnson"), ("Eva Brown");

-- Insert an author and retrieve the auto-generated ID (SQLite specific)
insert into authors (name) values ("Jane Green");
Select last_insert_rowid();