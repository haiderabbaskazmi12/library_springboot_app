package com.onpier.LibraryMainService.dao;

import com.onpier.LibraryMainService.bean.entity.User;
import com.onpier.LibraryMainService.bean.mapper.UserMapper;
import com.onpier.LibraryMainService.dao.queries.UserQuery;
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
public class UserCrudRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    private static final Logger LOGGER = LogManager.getLogger(UserCrudRepo.class);


    public List<User> getUsersWithAtleastOneBook() {

        String query= UserQuery.GET_ALL_USERS_WITH_ATLEAST_ONE_BOOK;
        List<User> userList = new ArrayList<>();
        try {
            jdbcTemplate.query(query.toString(), rs -> {
                while (rs.next()) {
                    User user = new UserMapper().mapRow(rs, rs.getRow());
                    userList.add(user);
                }
                return userList;
            });
        } catch (Exception e) {
            LOGGER.error("Error occurred while searching users", e);
        }
        return userList;
    }

    public List<User> getNonTerminatedUsersWithCurrentlyNoBook() {

        String query= UserQuery.GET_ALL_NON_TERMINATED_USERS_WITH_CURRENTLY_NO_BOOK;
        List<User> userList = new ArrayList<>();
        try {
            jdbcTemplate.query(query.toString(), rs -> {
                while (rs.next()) {
                    User user = new UserMapper().mapRow(rs, rs.getRow());
                    userList.add(user);
                }
                return userList;
            });
        } catch (Exception e) {
            LOGGER.error("Error occurred while searching users", e);
            System.out.println("Error occurred while searching users, "+ e);
        }
        return userList;
    }

    public List<User> getUsersBorrowedOnGivenDate(Date givenDate) {

        String query= UserQuery.GET_ALL_USERS_BORROWED_ON_GIVEN_DATE;
        MapSqlParameterSource inQueryParam = new MapSqlParameterSource();
        inQueryParam.addValue("givenDate", givenDate);
        return namedParameterJdbcTemplate.query(query, inQueryParam, new UserMapper());
    }
}
