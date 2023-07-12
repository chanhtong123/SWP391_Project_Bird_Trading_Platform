/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.OrderItemDAO;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.ParseException;

/**
 *
 * @author ASUS
 */
public class AdminChartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy giá trị start và end từ request parameters
       
        String startParam = request.getParameter("start");
        String endParam = request.getParameter("end");
      

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

        // Lưu kết quả vào request attribute để sử dụng trong JSP hoặc giao diện người dùng
        request.setAttribute("totalPrice", totalPrice);
       request.setAttribute("totalOrderItem", totalOrderItem);

        // Chuyển hướng đến trang JSP hoặc giao diện người dùng khác để hiển thị kết quả
        request.getRequestDispatcher("adminPage.jsp").forward(request, response);
    }

}
