
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.StoreDAO;
import DAO.UserDAO;
import DTO.StoreDTO;
import DTO.StoreRegisterDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GRAM
 */
public class StoreServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private StoreDAO storeDAO;
    private UserDAO userDAO;
    
    @Override
    public void init() {
        storeDAO = new StoreDAO();
        userDAO = new UserDAO();
        
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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "registerStore":
                registerStore(request, response);
                break;
            case "updateStore":
                updateStore(request, response);
                break;
            case "createRegisterStoreForm":
                createRegisterStoreForm(request, response);
                break;
            case "deleteRegisterStoreForm":
                deleteRegisterStoreForm(request, response);
                break;
            default:
                updateStore(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StoreServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(StoreServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    private void registerStore(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String storeRegisterId = request.getParameter("storeRegisterId");
            String storeName = request.getParameter("storeName");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            int userId = Integer.parseInt(request.getParameter("userId"));
            StoreDTO store = new StoreDTO(storeName, storeName, address, phoneNumber, userId, address);            
            UserDTO user = new UserDTO(userId);
            storeDAO.createStore(store);
            storeDAO.updateUserRole(user);
            storeDAO.deleteStoreForm(storeRegisterId);
        } finally {
            response.sendRedirect("UserServlet?action=list2");
        }
    }
    
    private void updateStore(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String storeName = request.getParameter("storeName");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String storeId = request.getParameter("storeId");
            StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, 0, storeId);
            storeDAO.updateStore(store);
        } finally {
            response.sendRedirect("UserServlet?action=logout");
        }
    }
    
    private void createRegisterStoreForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        try {
            String storeName = request.getParameter("storeNameRegister");
            String address = request.getParameter("addressRegister");
            String phoneNumber = request.getParameter("phoneNumberRegister");
            int userID = Integer.parseInt(request.getParameter("userID"));
            StoreDTO checkStore = storeDAO.checkStoreRegister(storeName);
            if (checkStore != null) {
                request.setAttribute("message", "Username is already exist");
                request.getRequestDispatcher("storeRegister.jsp").forward(request, response);
            } else {
                StoreRegisterDTO storeRegister = new StoreRegisterDTO(storeName, address, phoneNumber, userID);
                storeDAO.createStoreForm(storeRegister);
            }
            
        } finally {
            response.sendRedirect("ShowProductsServlet");
        }
    }
    
    private void deleteRegisterStoreForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String storeRegisterId = request.getParameter("storeRegisterId");
            storeDAO.deleteStoreForm(storeRegisterId);
        } finally {
            response.sendRedirect("ShowStoreRegisterServlet");
        }
    }
    
}
