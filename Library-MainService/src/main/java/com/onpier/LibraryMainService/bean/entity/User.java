package com.onpier.LibraryMainService.bean.entity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private String userUUID;
    private String lastName;
    private String firstName;
    private Date memberSince;
    private Date memberTill;
    private String gender;

    public User(User user) {
        userUUID = user.getUserUUID();
        lastName = user.getLastName();
        firstName = user.getFirstName();
        memberSince = user.getMemberSince();
        memberTill = user.getMemberTill();
        gender = user.getGender();
    }

}
