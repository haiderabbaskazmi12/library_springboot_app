-- DROP TABLE library_db.books;

CREATE TABLE library_db.books (
	book_uuid varchar NOT NULL,
	title varchar NOT NULL,
	author varchar NOT NULL,
	genre varchar NOT NULL,
	publisher varchar NOT NULL,
	CONSTRAINT books_pk PRIMARY KEY (book_uuid)
);


-- DROP TABLE library_db.users;

CREATE TABLE library_db.users (
	user_uuid varchar NOT NULL,
	last_name varchar NOT NULL,
	first_name varchar NOT NULL,
	member_since date NOT NULL,
	member_till date NULL,
	gender varchar(1) NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_uuid)
);


-- DROP TABLE library_db.borrowed;

CREATE TABLE library_db.borrowed (
	borrower varchar NOT NULL,
	book varchar NOT NULL,
	borrowed_from date NULL,
	borrowed_to date NULL,
	borrower_id varchar NOT NULL,
	book_id varchar NOT NULL,
	CONSTRAINT borrowed_fk FOREIGN KEY (book_id) REFERENCES library_db.books(book_uuid),
	CONSTRAINT borrowed_fk_1 FOREIGN KEY (borrower_id) REFERENCES library_db.users(user_uuid)
);
