package dao;

import entities.User;
import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDao {

    private Connection connection = ConnectionProvider.getConnection();

    User user = null;

    public User getUserByUserNameAndPassword(String email, String password) {
        try {

            String query = "SELECT * FROM USER_Details WHERE email= ? AND password= ?";
            PreparedStatement pstm = connection.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);

            ResultSet RSet = pstm.executeQuery();

            if (RSet.next()) {
                // get the value from database and Set to User Entities
                user = new User();
                user.setUser_name(RSet.getString("user_name"));
                user.setEmail(RSet.getString("email"));
                user.setGender(RSet.getString("gender"));
                user.setPassword(RSet.getString("password"));
                user.setBlog_date(RSet.getString("reg_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }
}