package com.onpier.LibraryMainService.controller;
import com.onpier.LibraryMainService.bean.entity.User;
import com.onpier.LibraryMainService.service.UserService;
import io.swagger.oas.annotations.Operation;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;


@RestController
@RequestMapping("user")
public class UserController {
    private static final Logger LOGGER = LogManager.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    @Operation(
            summary = "returns all users who have actually borrowed at least one book",
            description = "returns all users who have actually borrowed at least one book",
            tags = { "users", "get" })
    @GetMapping("borrower")
    public ResponseEntity<List<User>> getBorrowingUsers() {
        List<User> result = userService.getBorrowingUsers();
        HttpStatus httpStatus = HttpStatus.OK;
        if (null == result)
            httpStatus = HttpStatus.NOT_FOUND;

        return new ResponseEntity<>(result,httpStatus);
    }

    @Operation(
            summary = "returns all non-terminated users who have not currently borrowed anything",
            description = "returns all non-terminated users who have not currently borrowed anything",
            tags = { "users", "get" })
    @GetMapping("nonReader")
    public ResponseEntity<List<User>> getNonReaders() {
        List<User> result = userService.getNonTerminatedUsersWithCurrentlyNoBook();
        HttpStatus httpStatus = HttpStatus.OK;
        if (null == result)
            httpStatus = HttpStatus.NOT_FOUND;

        return new ResponseEntity<>(result,httpStatus);
    }

    @Operation(
            summary = "returns all users who have borrowed a book on a given date",
            description = "returns all users who have borrowed a book on a given date",
            tags = { "users", "get" })
    @GetMapping("usersWithBorrowDate")
    public ResponseEntity<List<User>> getUsersBorrowedOnGivenDate(@RequestParam String dateString) {

        List<User> result = new ArrayList<>();
        HttpStatus httpStatus = HttpStatus.OK;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dateString);
            Date givenDate = new Date(parsedDate.getTime());
            result = userService.getUsersBorrowedOnGivenDate(givenDate);
            if (null == result)
                httpStatus = HttpStatus.NOT_FOUND;
        } catch (Exception e) {
            LOGGER.error("Error occurred while searching users", e);
        }

        return new ResponseEntity<>(result,httpStatus);
    }

}
