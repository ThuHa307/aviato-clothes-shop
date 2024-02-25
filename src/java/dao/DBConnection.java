/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author PC
 */
public class DBConnection {
    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=Aviato;encrypt=true;trustServerCertificate=true";
    public static String userDB = "sa";
    public static String passDB = "ha3072003";
    
    public static Connection getConnection() {
        Connection connection;
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(dbURL, userDB, passDB);
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        try(Connection con = DBConnection.getConnection()) {
            System.out.println("Success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
