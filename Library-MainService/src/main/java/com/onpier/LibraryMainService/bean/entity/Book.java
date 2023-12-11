package com.onpier.LibraryMainService.bean.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Book {

    private String bookUUID;
    private String title;
    private String author;
    private String genre;
    private String publisher;

    public Book(Book book) {
        bookUUID = book.getBookUUID();
        title = book.getTitle();
        author = book.getAuthor();
        genre = book.getGenre();
        publisher = book.getPublisher();
    }
}
