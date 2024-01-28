package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

    private static Connection con;

    static {
        try {
            // This block runs when the class is loaded.
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String username = "harish";
            String password = "harish123";
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connection is Established");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return con;
    }
}
