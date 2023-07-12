/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.OrderItemDAO;
import DAO.ProductDAO;
import DAO.StoreDAO;
import DAO.UserDAO;
import DTO.OrderItemDTO;
import DTO.StoreRegisterDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class AdminChartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StoreDAO storeDAO = new StoreDAO();
        List<StoreRegisterDTO> storeRegisterList = storeDAO.getAllStoreRegister();
        HttpSession session = request.getSession();
        session.setAttribute("stores", storeRegisterList); // Đặt danh sách sản phẩm vào session
        UserDAO userDAO = new UserDAO();
        ArrayList<UserDTO> users = userDAO.getAllUsers();
        request.setAttribute("users", users);

        OrderItemDAO orderDAO = new OrderItemDAO();
        List<OrderItemDTO> orderList = orderDAO.getCompletedOrderItems();
        BigDecimal PriceAdmin = orderDAO.pricePT();

        int quantityStore = storeDAO.countStoreId();
        int countStore = orderDAO.countOrderItemId();

        ProductDAO pt = new ProductDAO();
        int countCate = pt.countVisibleProducts();

        session.setAttribute("countCate", countCate);
        session.setAttribute("countStore", countStore);
        session.setAttribute("quantityStore", quantityStore);
        session.setAttribute("PriceAdmin", PriceAdmin);
        session.setAttribute("orderList", orderList);

// Lấy giá trị start và end từ request parameters
        String startParam = request.getParameter("start");
        String endParam = request.getParameter("end");

//gg
        // Chuyển đổi giá trị start và end thành đối tượng Date
        Date startDate = null;
        Date endDate = null;

        SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");

        try {
            startDate = inputFormat.parse(startParam);

            endDate = inputFormat.parse(endParam);
        } catch (java.text.ParseException ex) {
            Logger.getLogger(AdminChartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Định dạng lại ngày tháng thành chuỗi yyy-MM-dd
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedStartDate = outputFormat.format(startDate);
        String formattedEndDate = outputFormat.format(endDate);
        System.out.println("ggg" + formattedStartDate);

        // Gọi phương thức tính tổng giá tiền trong OrderItemDAO
        OrderItemDAO orderItemDAO = new OrderItemDAO();
        BigDecimal totalPrice = orderItemDAO.calculateTotalPriceByDateRange(formattedStartDate, formattedEndDate);
        int totalOrderItem = orderItemDAO.countOrderItemsByDateRange(startParam, endParam);

        //goi danh sach orderitem theo ngay cu the
        List<OrderItemDTO> orderItems = orderItemDAO.getOrderItemsByDateRange(formattedStartDate, formattedEndDate);

        // Lưu kết quả vào request attribute để sử dụng trong JSP hoặc giao diện người dùng
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("totalOrderItem", totalOrderItem);

        // Chuyển hướng đến trang JSP hoặc giao diện người dùng khác để hiển thị kết quả
        request.getRequestDispatcher("adminPage.jsp").forward(request, response);
    }

}
