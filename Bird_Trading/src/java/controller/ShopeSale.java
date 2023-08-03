package controller;

import DAO.OrderDAO;
import DAO.OrderItemDAO;
import DAO.ProductDAO;
import DAO.StoreDAO;
import DTO.OrderDTO;
import DTO.OrderItemDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShopeSale extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            // Get the list of products from the database
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("userlogin");
            int userId = user.getUserId();

            // Get the storeId using userId
            StoreDAO storeDAO = new StoreDAO();
            int storeId = storeDAO.getStoreIdByUserId(userId);

            // Get the list of orders by storeId
            OrderItemDAO orderDAO = new OrderItemDAO();
            List<OrderItemDTO> orderList = orderDAO.getAllByStoreId(storeId);
            List<Integer> orderIds = orderDAO.getOrderIdsByStoreId(storeId);

            int quantityOrder = orderDAO.getCountByStoreId(storeId);

            ProductDAO pt = new ProductDAO();
            int quantityPTstore = pt.countProductsByStoreId(storeId);
            int quantityPT = pt.checkTotalProductQuantityByStoreId(storeId);

            BigDecimal oderPrice = orderDAO.calculateTotalPriceByStoreId(storeId);

            OrderDAO orderDAOs = new OrderDAO();
            List<OrderDTO> order = orderDAOs.getOrdersByIds(orderIds);
            
            

             session.setAttribute("ordermoi", order); // Set the order list to the session

            session.setAttribute("quantityOrder", quantityOrder);
            session.setAttribute("quantityPT", quantityPT);
            session.setAttribute("quantityPTstore", quantityPTstore);
            session.setAttribute("orderList", orderList); // Set the order list to the session
            session.setAttribute("oderPrice", oderPrice);
            // Forward the request to the JSP page for displaying the products
            request.getRequestDispatcher("chartShop.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giá trị start và end từ request parameters
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");
        int userId = user.getUserId();

        // Get the storeId using userId
        StoreDAO storeDAO = new StoreDAO();
        int storeId = storeDAO.getStoreIdByUserId(userId);

        String startParam = request.getParameter("start");
        String endParam = request.getParameter("end");
        System.out.println("g" + startParam);

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

        // Gọi phương thức tính tổng giá tiền trong OrderItemDAO
        OrderItemDAO orderItemDAO = new OrderItemDAO();
        BigDecimal totalPrice = orderItemDAO.calculateTotalPriceByDateRangeAndStoreId(formattedStartDate, formattedEndDate, storeId);
        int totalOrderItem = orderItemDAO.countOrderItemsByDateRangeAndStoreId(startParam, endParam, storeId);

        //goi danh sach orderitem theo ngay cu the
        List<OrderItemDTO> orderItems = orderItemDAO.getOrderItemsByDateRangeAndStoreId(formattedStartDate, formattedEndDate, storeId);

        // Lưu kết quả vào request attribute để sử dụng trong JSP hoặc giao diện người dùng
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("totalOrderItem", totalOrderItem);

        // Chuyển hướng đến trang JSP hoặc giao diện người dùng khác để hiển thị kết quả
        request.getRequestDispatcher("chartShop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
