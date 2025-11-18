package dao;

import entities.SignupDetailsEn;
import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SignupDetailsDao {

    private Connection con= ConnectionProvider.getConnection();

    // Method to insert user data into table

    public boolean saveSignupData(SignupDetailsEn detailsEn) {

        boolean flag = false;
        try {

            String query = "INSERT INTO USER_Details(user_name, email, gender, password, reg_date) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, detailsEn.getUser_name());
            pstm.setString(2, detailsEn.getEmail());
            pstm.setString(3, detailsEn.getGender());
            pstm.setString(4, detailsEn.getPassword());
            pstm.setString(5, detailsEn.getBlog_date());

            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;

    }

}
