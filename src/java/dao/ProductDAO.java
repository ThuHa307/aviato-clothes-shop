/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import model.Product;
/**
 *
 * @author PC
 */
public class ProductDAO {
    //private final String readAll = "SELECT ProductName, description, price, type, color, Image AS UniqueColor "
    //                                + "FROM Product GROUP BY ProductName, description, price, type, color, Image";
    private final String readAll = "select * from product";
    
    public ArrayList<Product> readProducts() {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement(readAll);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int oriPrice = rs.getInt(5);
                String type = rs.getString(6);
                String color = rs.getString(7);
                String size = rs.getString(8);
                int quantity = rs.getInt(9);                
                String image = rs.getString(10);
                int categoryId = rs.getInt(11);
                        
                Product x = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Product.removeDuplicateProducts(results);
    }
    
    public ArrayList<Product> filter(String colorStr, String sizeStr) {
        ArrayList<Product> results = new ArrayList<>();
        String filtersql = "";
        StringBuilder sql = new StringBuilder();
        try (Connection con = DBConnection.getConnection()) {   
            if (!colorStr.equals("") && !sizeStr.equals("")) {
                filtersql = "select * from product where quantity > 0 and size = '" + sizeStr + "' and color = '" + colorStr + "'";
            }
            else if (!colorStr.equals("")) {
                filtersql = "select * from product where quantity > 0 and color = '" + colorStr + "'";
            }
            else if (!sizeStr.equals("")) {
                filtersql = "select * from product where quantity > 0 and size = '" + sizeStr + "'";
            }
            System.out.println(filtersql);
            PreparedStatement stm = con.prepareStatement(filtersql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                int price = rs.getInt(4);
                int oriPrice = rs.getInt(5);
                String type = rs.getString(6);
                String color = rs.getString(7);
                String size = rs.getString(8);
                int quantity = rs.getInt(9);                
                String image = rs.getString(10);
                int categoryId = rs.getInt(11);
                        
                Product x = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Product.removeDuplicateProducts(results);
    }
}
