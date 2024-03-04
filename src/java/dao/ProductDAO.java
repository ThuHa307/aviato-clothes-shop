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
    private final String readByType = "select * from product where type = ? and Quantity > 0";

    public List<Product> readProductsByType(String typeStr) {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement(readByType);
            stm.setString(1, typeStr);
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
                String colorImage = rs.getString(12);
                Product x = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Product.removeDuplicateProducts(results);
    }

    public List<Product> readProducts(String sql) {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement(sql);
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
                String colorImage = rs.getString(12);
                Product x = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Product.removeDuplicateProducts(results);
    }

    public ArrayList<Product> search(String value) {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT TOP 5 * FROM Product WHERE ProductName LIKE ? and Quantity > 0");
            stm.setString(1, "%" + value + "%");
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
                String colorImage = rs.getString(12);
                Product x = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
    
    public ArrayList<Product> searchAll(String value) {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM Product WHERE ProductName LIKE ? and Quantity > 0");
            stm.setString(1, "%" + value + "%");
            //System.out.println(stm.toString());
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
                String colorImage = rs.getString(12);
                Product x = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                //System.out.println(x);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<String> getType(int categoryId) {
        ArrayList<String> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("select distinct Type from Product where CategoryID = ? and Quantity > 0");
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                results.add(name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Product> filter(String colorStr, String sizeStr, String priceStr, String type) {
        String filterSql = filterSql(colorStr, sizeStr, filterPrice(priceStr), type);
        List<Product> results = readProducts(filterSql);
        return results;
    }

    private String filterSql(String color, String size, String price, String type) {
        String filtersql = "";
        if (!color.equals("") && !size.equals("") && !price.equals("")) {
            filtersql = "select * from product where quantity > 0 and "
                    + "size = '" + size + "' and color = '" + color + "' and " + price + " and type = '" + type + "'";
        } else if (!color.equals("") && !price.equals("")) {
            filtersql = "select * from product where quantity > 0 and color = '" + color + "' and " + price + " and type = '" + type + "'";
        } else if (!size.equals("") && !price.equals("")) {
            filtersql = "select * from product where quantity > 0 and size = '" + size + "' and " + price + " and type = '" + type + "'";
        } else if (!color.equals("") && !size.equals("")) {
            filtersql = "select * from product where quantity > 0 and size = '" + size + "' and color = '" + color + "'" + " and type = '" + type + "'";
        } else if (!color.equals("")) {
            filtersql = "select * from product where quantity > 0 and color = '" + color + "'" + " and type = '" + type + "'";
        } else if (!size.equals("")) {
            filtersql = "select * from product where quantity > 0 and size = '" + size + "'" + " and type = '" + type + "'";
        } else if (!price.equals("")) {
            filtersql = "select * from product where quantity > 0 and " + price + " and type = '" + type + "'";
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
    
    public Product findById(String idStr) {
        
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM Product WHERE ProductID = ? and Quantity > 0");
            stm.setInt(1, Integer.parseInt(idStr));
            //System.out.println(stm.toString());
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
                String colorImage = rs.getString(12);
                Product result = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                //System.out.println(x);
                return result;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Product> findByName(String nameStr) {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM Product WHERE ProductName = ? and Quantity > 0");
            stm.setString(1, nameStr);
            //System.out.println(stm.toString());
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
                String colorImage = rs.getString(12);
                Product result = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                //System.out.println(x);
                results.add(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
    
    public List<Product> findBySizes(String nameStr, String colorStr) {
        ArrayList<Product> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("select * from Product where ProductName = ? and Color = ? and Quantity > 0");
            stm.setString(1, nameStr);
            stm.setString(2, colorStr);
            //System.out.println(stm.toString());
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
                String colorImage = rs.getString(12);
                Product result = new Product(id, name, description, price, oriPrice, type, color, size, quantity, image, categoryId, colorImage);
                //System.out.println(x);
                results.add(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
}
