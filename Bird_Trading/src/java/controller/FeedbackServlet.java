/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.FeedbackDAO;
import DTO.FeedbackDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GRAM
 */
public class FeedbackServlet extends HttpServlet {

    private FeedbackDAO feedbackDAO;

    @Override
    public void init() {
        feedbackDAO = new FeedbackDAO();
    }

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
        // Retrieve form data and create FeedbackDTO object
        try {
            int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            FeedbackDTO feedback = new FeedbackDTO();
            feedback.setOrderItemId(orderItemId);
            feedback.setUserId(userId);
            feedback.setRating(rating);
            feedback.setComment(request.getParameter("comment"));

            boolean isFeedbackSent = feedbackDAO.isFeedbackSent(orderItemId);
            if (isFeedbackSent) {
                System.out.println("ok");
                // Feedback đã được gửi trước đó
                response.getWriter().write("alreadySent");
            } else {
                // Gửi feedback vào cơ sở dữ liệu
                boolean result = feedbackDAO.createFeedback(feedback);
                if (result) {
                    // Feedback được gửi thành công
                    response.getWriter().write("sent");
                } else {
                    // Xử lý lỗi (nếu có)
                    response.getWriter().write("error");
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("error");
        } catch (NullPointerException e) {
            e.printStackTrace();
            response.getWriter().write("error");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
