package com.onpier.LibraryMainService.service;

import com.onpier.LibraryMainService.bean.entity.User;
import com.onpier.LibraryMainService.dao.UserCrudRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserCrudRepo userCrudRepo;

    public List<User> getBorrowingUsers() {
        return userCrudRepo.getUsersWithAtleastOneBook();
    }

    public List<User> getNonTerminatedUsersWithCurrentlyNoBook() {
        return userCrudRepo.getNonTerminatedUsersWithCurrentlyNoBook();
    }

    public List<User> getUsersBorrowedOnGivenDate(Date givenDate) {
        return userCrudRepo.getUsersBorrowedOnGivenDate(givenDate);
    }
}
