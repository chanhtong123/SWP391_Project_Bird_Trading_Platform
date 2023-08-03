package controller;

import DAO.CartDAO;
import DAO.OrderDAO;
import DAO.OrderItemDAO;
import DAO.ProductDAO;
import DTO.CartDTO;
import DTO.OrderDTO;
import DTO.OrderItemDTO;
import DTO.ProductDTO;
import DTO.UserDTO;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");

        // Kiểm tra đăng nhập
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();

        // Tạo đơn hàng
        OrderDTO order = new OrderDTO();
        order.setUserId(userId);
        order.setTotalAmount(BigDecimal.ZERO); // Khởi tạo tổng số tiền là 0
        order.setOrderStatus("Pending");
        order.setOrderDate(new java.util.Date());

        // Lưu đơn hàng vào CSDL
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.createOrder(order);

        // Lấy đơn hàng vừa được tạo từ CSDL
        OrderDTO createdOrder = orderDAO.getLastOrder();

        // Lấy orderId từ đơn hàng vừa tạo
        int orderId = createdOrder.getOrderId();

        // Cập nhật lại orderID trong đối tượng order
        order.setOrderId(orderId);

        // Lấy danh sách sản phẩm trong giỏ hàng từ session
        ArrayList<CartDTO> cartItems = (ArrayList<CartDTO>) session.getAttribute("CART");

        // Tạo chi tiết đơn hàng cho từng sản phẩm trong giỏ hàng
        OrderItemDAO orderItemDAO = new OrderItemDAO();
        ProductDAO productDAO = new ProductDAO();

        for (CartDTO cartItem : cartItems) {
            OrderItemDTO orderItem = new OrderItemDTO();
            orderItem.setOrderId(order.getOrderId());
            orderItem.setSttPT(cartItem.getSttPT());

            // Lấy thông tin sản phẩm từ CSDL
            ProductDTO product = productDAO.getProductBySttPT(cartItem.getSttPT());
            if (product != null) {
                orderItem.setStoreId(Integer.parseInt(product.getStoreId()));
                orderItem.setProductName(product.getProductName());
                orderItem.setImageUrl(product.getImage());
                orderItem.setCategoryName(product.getCategoryName());
            }

            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPrice(cartItem.getPrice().multiply(BigDecimal.valueOf(cartItem.getQuantity())));

            // Kiểm tra xem sản phẩm đã tồn tại trong đơn hàng chưa
            // Nếu sản phẩm chưa tồn tại, tạo mới chi tiết đơn hàng
            orderItemDAO.createOrderItem(orderItem);

            // Cập nhật tổng số tiền của đơn hàng
            BigDecimal itemTotal = cartItem.getPrice().multiply(BigDecimal.valueOf(orderItem.getQuantity()));
            order.setTotalAmount(order.getTotalAmount().add(itemTotal));
        }

        // Cập nhật tổng số tiền của đơn hàng trong CSDL
        orderDAO.updateOrderTotalAmount(order.getOrderId(), order.getTotalAmount());

        // Xóa giỏ hàng sau khi tạo đơn hàng thành công
        session.removeAttribute("CART");
        session.setAttribute("OLD_CART", cartItems);
        // Chuyển hướng đến trang hoàn thành đơn hàng
        response.sendRedirect("checkOut.jsp");
    }
//gg
}
