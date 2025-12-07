package dao;

import entities.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoryDao {

    Connection connection = null;
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list= new ArrayList<>();
        try{
            connection = helper.ConnectionProvider.getConnection();
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
