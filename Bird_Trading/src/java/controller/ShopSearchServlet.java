/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.StoreDAO;
import DTO.StoreDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShopSearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StoreDAO storeDAO;

    public void init() {
        storeDAO = new StoreDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("searchStoreByName")) {
            String storeName = request.getParameter("storeName");
            try {
                ArrayList<StoreDTO> searchResults = storeDAO.searchStoreByName(storeName);

                // Gửi kết quả tìm kiếm về trang JSP hoặc HTML
                HttpSession session = request.getSession();
                session.setAttribute("searchResults", searchResults);
                response.sendRedirect("shopHomePage.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                // Xử lý lỗi tìm kiếm cửa hàng
            }
        }
    }
}
