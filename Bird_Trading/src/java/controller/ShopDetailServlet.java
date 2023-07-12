/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProductDAO;
import DAO.StoreDAO;
import DTO.ProductDTO;
import DTO.StoreDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class ShopDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDAO();
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
        // Lấy giá trị productId từ request parameter
        String storeId = request.getParameter("storeId");

        StoreDAO storeDAO = new StoreDAO();
        // Xử lý logic để lấy thông tin chi tiết sản phẩm dựa trên productId
        StoreDTO store = null;
        try {
            store = storeDAO.getStoreById(storeId);
        } catch (SQLException ex) {
            Logger.getLogger(ShopDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        List<ProductDTO> product = productDAO.getAllProductsByStoreId(storeId);

        // Gửi thông tin sản phẩm đến trang productDetail.jsp để hiển thị
        HttpSession session = request.getSession();
        session.setAttribute("product", product);
        session.setAttribute("store", store);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("shopDetailPage.jsp");
//
//        dispatcher.forward(request, response);
    
         response.sendRedirect("shopDetailPage.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
}
