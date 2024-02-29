/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author PC
 */
public class ProductDAO {

    //private final String readAll = "SELECT ProductName, description, price, type, color, Image AS UniqueColor "
    //                                + "FROM Product GROUP BY ProductName, description, price, type, color, Image";
    private final String readAll = "select * from product";

    public List<Product> readProducts() {
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

    public ArrayList<Product> filter(String colorStr, String sizeStr, String priceStr) {
        ArrayList<Product> results = new ArrayList<>();       
        StringBuilder sql = new StringBuilder();
        String filterSql = filterSql(colorStr, sizeStr, filterPrice(priceStr));
        try (Connection con = DBConnection.getConnection()) {
            
            PreparedStatement stm = con.prepareStatement(filterSql);
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

    private String filterSql(String color, String size, String price) {
        String filtersql = "";
        if (!color.equals("") && !size.equals("") && !price.equals("")) {
            filtersql = "select * from product where quantity > 0 and "
                    + "size = '" + size + "' and color = '" + color + "' and " + price;
        }
        else if (!color.equals("") && !price.equals("")) {
            filtersql = "select * from product where quantity > 0 and color = '" + color + "' and " + price;
        }
        else if (!size.equals("") && !price.equals("")) {
            filtersql = "select * from product where quantity > 0 and size = '" + size + "' and " + price;
        }
        else if (!color.equals("") && !size.equals("")) {
            filtersql = "select * from product where quantity > 0 and size = '" + size + "' and color = '" + color + "'";
        } else if (!color.equals("")) {
            filtersql = "select * from product where quantity > 0 and color = '" + color + "'";
        } else if (!size.equals("")) {
            filtersql = "select * from product where quantity > 0 and size = '" + size + "'";
        } else if (!price.equals("")) {
            filtersql = "select * from product where quantity > 0 and " + price;
        }
        return filtersql;
    }

    private String filterPrice(String price) {
        switch (price) {
            case "sm1000000":
                return "price < 1000000";
            case "bt1000000-2000000":
                return "(price between 1000000 and 2000000)";
            case "bt2000000-3000000":
                return "(price between 2000000 and 3000000)";
            case "lg3000000":
                return "price > 3000000";
            default:
                return "";
        }
    }
}
