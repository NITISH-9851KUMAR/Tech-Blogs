package helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;
    private static String url = "jdbc:mysql://localhost:3306/TechBlog";
    private static String userName = "root";
    private static String password = "Nitish@04";

    public static Connection getConnection() {

        try {

            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, userName, password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}
