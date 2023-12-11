package com.onpier.LibraryMainService.bean.mapper;

import com.onpier.LibraryMainService.bean.entity.Book;
import com.onpier.LibraryMainService.bean.entity.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class BookMapper implements RowMapper<Book> {

    @Override
    public Book mapRow(ResultSet rs, int i) throws SQLException {
        return new Book(
                rs.getString("book_uuid"),
                rs.getString("title"),
                rs.getString("author"),
                rs.getString("genre"),
                rs.getString("publisher")
        );
    }
}
