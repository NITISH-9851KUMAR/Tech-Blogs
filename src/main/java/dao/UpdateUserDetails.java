package dao;

import entities.User;
import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateUserDetails {

    public boolean updateDetails(User user) {
        boolean flag = false;
        try {
            Connection connection = ConnectionProvider.getConnection();
            String sql = "UPDATE user_details set user_name=?, email= ?, gender= ?, password= ?, pic= ? WHERE id= ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            // Set the value
            pstm.setString(1, user.getUser_name());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getGender());
            pstm.setString(4, user.getPassword());
            pstm.setString(5, user.getImage());
            pstm.setInt(6, user.getId());

            pstm.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
