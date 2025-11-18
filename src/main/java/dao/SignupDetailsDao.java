package dao;

import entities.User;
import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SignupDetailsDao {

    private Connection con= ConnectionProvider.getConnection();

    // Method to insert user data into table

    public boolean saveSignupData(User user) {

        boolean flag = false;
        try {

            String query = "INSERT INTO USER_Details(user_name, email, gender, password, reg_date) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, user.getUser_name());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getGender());
            pstm.setString(4, user.getPassword());
            pstm.setString(5, user.getBlog_date());

            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;

    }

}
