/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.FeedbackDAO;
import DAO.OrderItemDAO;
import DAO.ProductDAO;
import DAO.StoreDAO;
import DAO.UserDAO;
import DTO.FeedbackDTO;
import DTO.OrderItemDTO;
import DTO.ProductDTO;
import DTO.StoreDTO;
import DTO.UserDTO;
import java.io.IOException;
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
public class ProductDetailServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();

        // Get the storeId using userId
        StoreDAO storeDAO = new StoreDAO();

        String productId = request.getParameter("productId");

        ProductDAO productDAO = new ProductDAO();
        ProductDTO product = null;
        ArrayList<ProductDTO> product2 = new ArrayList<>();
        try {
            product = productDAO.getProductByID(productId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        StoreDTO store = new StoreDTO();
        store = storeDAO.getStoreByProductId(productId);

        //lay storeId
        StoreDTO storeId = new StoreDTO();
        storeId = storeDAO.getStoreByProductId(productId);
        String id = storeId.getStore_id();
        System.out.println("id" + id);

        //lay product theo storeId
        ArrayList<ProductDTO> pro = new ArrayList<>();
        pro = productDAO.getAllProductsByStoreId(id);

        OrderItemDAO orderItemDAO = new OrderItemDAO();
        List<OrderItemDTO> orderItems = null;
        try {
            orderItems = orderItemDAO.getOrderItemsByProductId(productId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //lay category theo productid
        ArrayList<ProductDTO> productCategory = new ArrayList<>();
        productCategory = productDAO.getAllProductsByProductId(productId);

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<FeedbackDTO> feedbacks = new ArrayList<>();
        UserDAO userDAO = new UserDAO();
        List<UserDTO> users = new ArrayList<>();

        int count = 0; // Số lượng feedbacks
        int totalRating = 0; // Tổng rating

        for (OrderItemDTO orderItem : orderItems) {
            List<FeedbackDTO> orderFeedbacks = null;
            try {
                orderFeedbacks = feedbackDAO.getFeedbackByOrderItemId(orderItem.getOrderItemId());
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (orderFeedbacks != null) {
                for (FeedbackDTO feedback : orderFeedbacks) {
                    feedbacks.add(feedback);
                    UserDTO user = null;
                    try {
                        user = userDAO.getUserById(feedback.getUserId());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    if (user != null) {
                        users.add(user);
                    }

                    count++;
                    totalRating += feedback.getRating();
                }
            }
        }

        double averageRating = 0; // Đánh giá trung bình
        if (count > 0) {
            averageRating = (double) totalRating / count;
        }
        
        session.setAttribute("productCategory", productCategory);
        session.setAttribute("pro", pro);
        session.setAttribute("store", store);
        session.setAttribute("product", product);
        session.setAttribute("feedbacks", feedbacks);
        session.setAttribute("users", users);
        session.setAttribute("count", count);
        session.setAttribute("averageRating", averageRating);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productDetails.jsp");
        dispatcher.forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
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
