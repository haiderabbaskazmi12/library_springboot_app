package com.onpier.LibraryMainService.service;

import com.onpier.LibraryMainService.bean.entity.Book;
import com.onpier.LibraryMainService.dao.BookCrudRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class BookService {

    @Autowired
    BookCrudRepo bookCrudRepo;

    public List<Book> getCustomBooks(Date borrowedFrom, Date borrowedTo, String userUUID) {
        return bookCrudRepo.getCustomBooks(borrowedFrom,borrowedTo,userUUID);
    }

    public List<Book> getAvailableBooks() {
        return bookCrudRepo.getAvailableBooks();
    }
}
