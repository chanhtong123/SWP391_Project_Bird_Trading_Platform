///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller;
//
//import DAO.OrderItemDAO;
//import DTO.OrderItemDTO;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.math.BigDecimal;
//import java.util.List;
//
//
//public class OrderItemServlet extends HttpServlet {
//   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        OrderItemDAO orderItemDAO = new OrderItemDAO();
//        List<OrderItemDTO> orderItems = orderItemDAO.getAllOrderItems();
//
//        // Gửi danh sách order items qua attribute để hiển thị trong JSP
//        request.setAttribute("orderItems", orderItems);
//
//        // Forward request đến JSP để hiển thị danh sách order items
//        request.getRequestDispatcher("storeProductSale.jsp").forward(request, response);
//    }
//}