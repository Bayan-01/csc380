package dbconnection;

import java.sql.*;
import javax.swing.*;
import java.util.*;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/ConventionManagementSystem";
    private static final String USER = "root"; 
    private static final String PASS = "SQLidk!90"; 


    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, 
                    "connection failed " + e.getMessage(), 
                    "Error", JOptionPane.ERROR_MESSAGE);
            return null;
        }
    }
}
