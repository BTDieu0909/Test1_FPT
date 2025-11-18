package vn.fpt.dao;

import vn.fpt.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestDao {

    public void printAllTruong() {
        String sql = "SELECT MaTruong, TenTruong FROM TRUONG";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                System.out.println(
                        rs.getString("MaTruong") + " - " + rs.getString("TenTruong")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
