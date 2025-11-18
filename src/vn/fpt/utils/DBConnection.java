package vn.fpt.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // 🔹 CHỖ NÀY EM GHI CHUỖI KẾT NỐI (URL)
    // mysql-test2 đang map: 3307 -> 3306 nên host dùng localhost:3307
    private static final String URL =
            "jdbc.url=jdbc:mysql://localhost:3307/mysql-test2?useSSL=false";



    // 🔹 Tài khoản MySQL trong container
    private static final String USER = "root";
    private static final String PASSWORD = "123456";  // đổi đúng password khi tạo container

    static {
        try {
            // Nạp Driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
