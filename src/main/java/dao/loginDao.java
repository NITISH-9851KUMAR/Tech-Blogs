package dao;

import entities.User;
import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDao {

    private Connection connection = null;
    User user = null;

    public User getUserByUserNameAndPassword(String email, String password) {
        try {
            connection= ConnectionProvider.getConnection();
            String query = "SELECT * FROM USER_Details WHERE email= ? AND password= ?";
            PreparedStatement pstm = connection.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);

            ResultSet rSet = pstm.executeQuery();
            if (rSet.next()) {
                // get the value from database and Set to User Entities
                user = new User();
                user.setUserId(rSet.getInt("id"));
                user.setUser_name(rSet.getString("user_name"));
                user.setEmail(rSet.getString("email"));
                user.setGender(rSet.getString("gender"));
                user.setPassword(rSet.getString("password"));
                user.setBlog_date(rSet.getString("reg_date"));
                user.setImage(rSet.getString("pic"));
            }

        } catch (Exception e) {e.printStackTrace();}

        return user;

    }
}