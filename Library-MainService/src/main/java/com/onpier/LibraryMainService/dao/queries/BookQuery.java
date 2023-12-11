package com.onpier.LibraryMainService.dao.queries;

public class BookQuery {

    public static final String GET_CUSTOM_BOOKS = "SELECT b.* FROM books b JOIN borrowed bo ON b.book_uuid = bo.book_id JOIN users u ON bo.borrower_id = u.user_uuid WHERE u.user_uuid = :userUUID AND bo.borrowed_from >= :borrowedFrom AND bo.borrowed_to <= :borrowedTo";

    public static final String GET_AVAILABLE_BOOKS = "SELECT distinct b.* FROM books b LEFT JOIN borrowed br ON b.book_uuid = br.book_id WHERE br.book_id IS NULL OR CURRENT_DATE NOT BETWEEN br.borrowed_from AND br.borrowed_to";

}
