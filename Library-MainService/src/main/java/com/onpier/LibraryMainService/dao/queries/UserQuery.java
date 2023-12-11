package com.onpier.LibraryMainService.dao.queries;

public class UserQuery {

    private UserQuery(){}

    public static final String GET_ALL_USERS_WITH_ATLEAST_ONE_BOOK = "SELECT DISTINCT u.* FROM users u INNER JOIN borrowed b ON u.user_uuid = b.borrower_id";

    public static final String GET_ALL_NON_TERMINATED_USERS_WITH_CURRENTLY_NO_BOOK = "SELECT distinct u.* FROM users u LEFT JOIN borrowed b ON u.user_uuid = b.borrower_id WHERE (u.member_till IS NULL OR u.member_till > CURRENT_DATE) AND (b.book IS NULL OR (CURRENT_DATE NOT BETWEEN b.borrowed_from AND b.borrowed_to))";

    public static final String GET_ALL_USERS_BORROWED_ON_GIVEN_DATE = "SELECT DISTINCT u.* FROM users u JOIN borrowed b ON u.user_uuid = b.borrower_id WHERE DATE_TRUNC('day', b.borrowed_from) = :givenDate";

}
