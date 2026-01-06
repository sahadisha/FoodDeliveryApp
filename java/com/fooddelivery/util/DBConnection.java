package com.fooddelivery.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/food_delivery_db", "root", "1234");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}

