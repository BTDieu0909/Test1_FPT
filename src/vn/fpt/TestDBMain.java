package vn.fpt;

import vn.fpt.utils.DBConnection;
import java.sql.Connection;

public class TestDBMain {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("Kết nối MySQL (Docker, DB Test2) THÀNH CÔNG!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
