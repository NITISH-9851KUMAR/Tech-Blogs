package dao;

import java.sql.*;

public class LikeDao {

    static Connection connection = null;

    // Insert Like
    public static boolean insertLike(int pid, int uid) {
        boolean flag = false;
        try {
            connection = helper.ConnectionProvider.getConnection();
            String query = "INSERT INTO likes(pid, uid) VALUES(?, ?)";
            PreparedStatement pstm = connection.prepareStatement(query);
            pstm.setInt(1, pid);
            pstm.setInt(2, uid);
            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Count Like
    public static int countLikeOnPost(int pid) {
        int count = 0;
        try {
            connection = helper.ConnectionProvider.getConnection();
            String query = "SELECT count(*) FROM likes WHERE pid= ?";
            PreparedStatement pstm = connection.prepareStatement(query);
            pstm.setInt(1, pid);
            ResultSet rSet = pstm.executeQuery();
            if (rSet.next()) {
                count = rSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

//    // Checked is Already Liked By user
//    public static boolean isLikedByUser(int pid, int uid) {
//        boolean flag = false;
//        try {
//            connection = helper.ConnectionProvider.getConnection();
//            String query = "SELECT * FROM likes WHERE pid= ? and uid= ?";
//            PreparedStatement pstm = connection.prepareStatement(query);
//            pstm.setInt(1, pid);
//            pstm.setInt(2, uid);
//            ResultSet rSet = pstm.executeQuery();
//            if (rSet.next()) {
//                flag = true;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return flag;
//    }
//
//    // Delete Like
//    public static boolean disLiked(int pid, int uid) {
//        boolean flag = false;
//        try {
//            connection = helper.ConnectionProvider.getConnection();
//            String query = "DELETE * FROM likes WHERE pid= ? and uid= ?";
//            PreparedStatement pstm = connection.prepareStatement(query);
//            pstm.setInt(1, pid);
//            pstm.setInt(2, uid);
//            pstm.executeUpdate();
//            flag = true;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return flag;
//    }

}
