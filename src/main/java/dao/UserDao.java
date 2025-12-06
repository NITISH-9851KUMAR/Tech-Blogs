package dao;

import entities.User;
import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDao {

    private Connection connection= ConnectionProvider.getConnection();

    // Save User Details into Database
    public boolean saveUserData(User user) {
        boolean flag = false;
        try {
            String query = "INSERT INTO USER_Details(user_name, email, gender, password, reg_date, pic) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(query);
            pstm.setString(1, user.getUser_name());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getGender());
            pstm.setString(4, user.getPassword());
            pstm.setString(5, user.getBlog_date());
            pstm.setString(6, user.getImage());

            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;

    }

    // Update User Details
    public boolean updateUserDetails(User user) {
        boolean flag = false;
        try {
            connection = ConnectionProvider.getConnection();
            String sql = "UPDATE user_details set user_name=?, email= ?, gender= ?, password= ?, pic= ? WHERE id= ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            // Set the value
            pstm.setString(1, user.getUser_name());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getGender());
            pstm.setString(4, user.getPassword());
            pstm.setString(5, user.getImage());
            pstm.setInt(6, user.getUserId());
            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
