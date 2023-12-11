package com.onpier.LibraryMainService.dao;

import com.onpier.LibraryMainService.bean.entity.Book;
import com.onpier.LibraryMainService.bean.mapper.BookMapper;
import com.onpier.LibraryMainService.dao.queries.BookQuery;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BookCrudRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    private static final Logger LOGGER = LogManager.getLogger(BookCrudRepo.class);


    public List<Book> getCustomBooks(Date borrowedFrom, Date borrowedTo, String userUUID) {

        String query= BookQuery.GET_CUSTOM_BOOKS;

        MapSqlParameterSource inQueryParam = new MapSqlParameterSource();
        inQueryParam.addValue("borrowedFrom", borrowedFrom);
        inQueryParam.addValue("borrowedTo", borrowedTo);
        inQueryParam.addValue("userUUID", userUUID);

        return namedParameterJdbcTemplate.query(query, inQueryParam, new BookMapper());
    }

    public List<Book> getAvailableBooks() {

        String query= BookQuery.GET_AVAILABLE_BOOKS;
        List<Book> bookList = new ArrayList<>();
        try {
            jdbcTemplate.query(query.toString(), rs -> {
                while (rs.next()) {
                    Book book = new BookMapper().mapRow(rs, rs.getRow());
                    bookList.add(book);
                }
                return bookList;
            });
        } catch (Exception e) {
            LOGGER.error("Error occurred while searching users", e);
        }
        return bookList;
    }
}
