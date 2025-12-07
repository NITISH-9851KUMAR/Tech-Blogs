package dao;

import entities.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDao {

    static Connection connection= null;
    // Save User Post to the Database
    public static boolean savePost(Post post) {
        boolean flag = false;
        connection = helper.ConnectionProvider.getConnection();

        try {

            String sql = "INSERT INTO posts(pTitle, pContent, pCode, pPic, catId, userId) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, post.getpTitle());
            preparedStatement.setString(2, post.getpContent());
            preparedStatement.setString(3, post.getpCode());
            preparedStatement.setString(4, post.getpPic());
            preparedStatement.setInt(5, post.getCatId());
            preparedStatement.setInt(6, post.getUserId());

            preparedStatement.executeUpdate();
            flag= true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    // Return All Post by UserId
    public ArrayList<Post> allPost(int id){
        ArrayList<Post> list= new ArrayList<>();

        try{
            connection= helper.ConnectionProvider.getConnection();
            String sql= "SELECT * FROM posts WHERE userId= ? ORDER BY pid DESC";
            PreparedStatement pstm= connection.prepareStatement(sql);
            pstm.setInt(1, id);

            ResultSet rSet= pstm.executeQuery();
            while (rSet.next()) {
                int pId= rSet.getInt("pId");
                String pTitle= rSet.getString("pTitle");
                String pContent= rSet.getString("pContent");
                String pCode= rSet.getString("pCode");
                String pPic= rSet.getString("pPic");
                String pDate= rSet.getString("pDate");
                int catId= rSet.getInt("catId");
                int userId= rSet.getInt("userId");

                Post p= new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(p);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // Get All Post By CatId and UserId
    public ArrayList<Post> allPostByCatId(int cId, int uId){
        ArrayList<Post> list= new ArrayList<>();

        try{
            connection= helper.ConnectionProvider.getConnection();
            String sql= "SELECT * FROM posts WHERE catId=? AND userId= ? ";
            PreparedStatement pstm= connection.prepareStatement(sql);
            pstm.setInt(1, cId);
            pstm.setInt(2, uId);

            ResultSet rSet= pstm.executeQuery();
            while (rSet.next()) {
                int pId= rSet.getInt("pId");
                String pTitle= rSet.getString("pTitle");
                String pContent= rSet.getString("pContent");
                String pCode= rSet.getString("pCode");
                String pPic= rSet.getString("pPic");
                String pDate= rSet.getString("pDate");
                int catId= rSet.getInt("catId");
                int userId= rSet.getInt("userId");

                Post p= new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(p);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // Get all Post Details by postId
    public static Post allPostByPostId(int post_Id){
        Post post= null;

        try{
            connection= helper.ConnectionProvider.getConnection();
            String sql= "SELECT * FROM posts WHERE pid=?";
            PreparedStatement pstm= connection.prepareStatement(sql);
            pstm.setInt(1, post_Id);

            ResultSet rSet= pstm.executeQuery();
            while (rSet.next()) {
                int pId= rSet.getInt("pId");
                String pTitle= rSet.getString("pTitle");
                String pContent= rSet.getString("pContent");
                String pCode= rSet.getString("pCode");
                String pPic= rSet.getString("pPic");
                String pDate= rSet.getString("pDate");
                int catId= rSet.getInt("catId");
                int userId= rSet.getInt("userId");

                post= new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return post;
    }

    // Get all post without any id , it shows on index page
    public static ArrayList<Post> allPost(){
        ArrayList<Post> list= new ArrayList<>();

        try{
            connection= helper.ConnectionProvider.getConnection();
            String sql= "SELECT * FROM posts ORDER BY pid DESC LIMIT 6";
            PreparedStatement pstm= connection.prepareStatement(sql);


            ResultSet rSet= pstm.executeQuery();
            while (rSet.next()) {
                int pId= rSet.getInt("pId");
                String pTitle= rSet.getString("pTitle");
                String pContent= rSet.getString("pContent");
                String pCode= rSet.getString("pCode");
                String pPic= rSet.getString("pPic");
                String pDate= rSet.getString("pDate");
                int catId= rSet.getInt("catId");
                int userId= rSet.getInt("userId");

                Post p= new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(p);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

}
