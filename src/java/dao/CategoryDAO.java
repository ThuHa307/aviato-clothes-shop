/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author PC
 */
public class CategoryDAO {
    private final String READ = "select * from category";
    
    public List<Category> readProducts() {
        ArrayList<Category> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement(READ);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);                
                Category x = new Category(id, name);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
}
