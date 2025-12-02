package dao;

import java.sql.*;
import java.util.ArrayList;

import entities.Category;
//import helper.ConnectionProvider;

public class CategoryDao {

    Connection connection = helper.ConnectionProvider.getConnection();

    public ArrayList<Category> getAllCategories(){

        ArrayList<Category> list= new ArrayList<>();

        try{
            String sql= "SELECT * FROM categories";
            Statement statement= connection.createStatement();
            ResultSet resultSet= statement.executeQuery(sql);

            while(resultSet.next()){
                int cId= resultSet.getInt("cid");
                String cName= resultSet.getString("name");
                String desc= resultSet.getString("description");
                Category category= new Category(cId, cName, desc);
                list.add(category);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

}
