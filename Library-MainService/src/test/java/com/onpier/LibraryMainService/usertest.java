package com.onpier.LibraryMainService;

import com.onpier.LibraryMainService.bean.entity.User;
import com.onpier.LibraryMainService.dao.UserCrudRepo;
import com.onpier.LibraryMainService.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@RunWith(PowerMockRunner.class)
@PrepareForTest(fullyQualifiedNames = "com.onpier.LibraryMainService.*")
public class usertest {

    @Mock
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Mock
    private JdbcTemplate jdbcTemplate;

    @Mock
    private UserCrudRepo userCrudRepo;

    @InjectMocks
    private UserService userService;

    private User user = new User();

    List<User> userList = new ArrayList<>();

    @BeforeClass
    @PrepareForTest({LogManager.class})
    public static void setup() {

        Logger loggerMockSetup = PowerMockito.mock(Logger.class);
        PowerMockito.doNothing().when(loggerMockSetup).info(ArgumentMatchers.anyString());
        PowerMockito.doNothing().when(loggerMockSetup).debug(ArgumentMatchers.anyString());
        PowerMockito.doNothing().when(loggerMockSetup).error(ArgumentMatchers.anyString(), ArgumentMatchers.any(Exception.class));
        PowerMockito.when(loggerMockSetup.isDebugEnabled()).thenReturn(false);

        PowerMockito.mockStatic(LogManager.class);
        PowerMockito.when(LogManager.getLogger(UserCrudRepo.class)).thenReturn(loggerMockSetup);
    }

    @Before
    public void setupThis() {
        user.setFirstName("Chish");
        user.setLastName("Elijah");
        user.setGender("Munich");
        user.setMemberSince(Date.valueOf("2008-05-14"));
        user.setUserUUID("2a6a6e71-d8d6-4b82-bfd2-6ea9d5fb0c82");
        user.setMemberTill(Date.valueOf("2010-05-14"));

        userList.add(user);
    }

    @Test
    @PrepareForTest({LogManager.class})
    public void getBorrowingUsersTest() {

        try {
            PowerMockito.when(userCrudRepo.getUsersWithAtleastOneBook()).thenReturn(userList);
            Assert.assertEquals(user, userService.getBorrowingUsers().get(0));


        } catch (Exception e) {
            System.out.println("Some exception occurred while executing test case");
            e.printStackTrace();
            Assert.fail();
        }

    }

}
