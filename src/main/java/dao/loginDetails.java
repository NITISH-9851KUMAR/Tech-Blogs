package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDetails {

    private Connection connection= ConnectionProvider.getConnection();

    loginDetails(String userName, String password){
        try{

            String query= "SELECT * FROM USER_Details WHERE user_name= ? AND password= ?";
            PreparedStatement pstm= connection.prepareStatement(query);
            pstm.setString(1, userName);
            pstm.setString(2, password);

            ResultSet set= pstm.executeQuery();
            if(set.next()){

            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }


}
