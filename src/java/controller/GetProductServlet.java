/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.Product;

/**
 *
 * @author PC
 */
@WebServlet(name = "GetProductServlet", urlPatterns = {"/product"})
public class GetProductServlet extends HttpServlet {

    private ProductDAO prDao = new ProductDAO();
    private String color = "";
    private String size = "";
    private ArrayList<Product> products = prDao.readProducts();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("data", products);
        request.getRequestDispatcher("collection.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("price");
        color = request.getParameter("filter2") != null ? request.getParameter("filter2") : color;
        size = request.getParameter("filter4") != null ? request.getParameter("filter4") : size;
        if (!color.equals("") || !size.equals(""))
            products = prDao.filter(color, size);
        if (products != null) {
            sort(products, option);
            request.setAttribute("data", products);
            request.setAttribute("selectedValue", option);
            request.getRequestDispatcher("collection.jsp").forward(request, response);
        }

    }

    private void sort(ArrayList<Product> products, String option) {
        switch (option) {
            case "price-asc" ->
                Collections.sort(products, Comparator.comparingInt(Product::getPrice));
            case "price-desc" ->
                Collections.sort(products, Comparator.comparingInt(Product::getPrice).reversed());
            case "name-asc" ->
                Collections.sort(products, Comparator.comparing(Product::getName));
            case "name-desc" ->
                Collections.sort(products, Comparator.comparing(Product::getName).reversed());
            default -> {
                return;
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
