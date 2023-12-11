package com.onpier.LibraryMainService.controller;

import com.onpier.LibraryMainService.bean.entity.Book;
import com.onpier.LibraryMainService.bean.requests.BookSearchRequest;
import com.onpier.LibraryMainService.service.BookService;
import io.swagger.oas.annotations.Operation;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("book")
public class BookController {
    private static final Logger LOGGER = LogManager.getLogger(BookController.class);


    @Autowired
    private BookService bookService;


    @Operation(
            summary = "returns all books borrowed by a given user in a given date range",
            description = "returns all books borrowed by a given user in a given date range",
            tags = { "books", "get" })
    @GetMapping("getCustomBooks")
    public ResponseEntity<List<Book>> getCustomBooks(@RequestBody BookSearchRequest body) throws ParseException {



        List<Book> result = new ArrayList<>();
        HttpStatus httpStatus = HttpStatus.OK;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDateFrom = dateFormat.parse(body.getBorrowedFrom().toString());
            java.util.Date parsedDateTo = dateFormat.parse(body.getBorrowedTo().toString());
            Date BorrowedFrom = new Date(parsedDateFrom.getTime());
            Date BorrowedTo = new Date(parsedDateTo.getTime());

            result = bookService.getCustomBooks(BorrowedFrom,BorrowedTo,body.getUserUUID());
            if (null == result)
                httpStatus = HttpStatus.NOT_FOUND;
        } catch (Exception e) {
            LOGGER.error("Error occurred while searching books", e);
        }

        return new ResponseEntity<>(result,httpStatus);
    }

    @Operation(
            summary = "returns all available (not borrowed) books",
            description = "returns all available (not borrowed) books",
            tags = { "books", "get" })
    @GetMapping("getAvailableBooks")
    public ResponseEntity<List<Book>> getAvailableBooks() {

        HttpStatus httpStatus = HttpStatus.OK;
        List<Book> result = bookService.getAvailableBooks();
        if (null == result)
            httpStatus = HttpStatus.NOT_FOUND;

        return new ResponseEntity<>(result,httpStatus);
    }
}