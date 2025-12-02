package dao;

import entities.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PostDao {

    public static boolean savePost(Post post) {
        boolean flag = false;

        Connection connection = helper.ConnectionProvider.getConnection();
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

}
