package com.onpier.LibraryMainService.bean.mapper;
import com.onpier.LibraryMainService.bean.entity.User;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class UserMapper  implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
        return new User(
                rs.getString("user_uuid"),
                rs.getString("last_name"),
                rs.getString("first_name"),
                rs.getObject("member_since", Date.class),
                rs.getObject("member_till", Date.class),
                rs.getString("gender")
        );
    }

}
