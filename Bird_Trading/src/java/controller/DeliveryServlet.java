package controller;

import DAO.CartDAO;
import DAO.DeliveryDAO;
import DAO.ProductDAO;
import DAO.ProvinceDAO;
import DTO.CartDTO;
import DTO.DeliveryDTO;
import DTO.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;

public class DeliveryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");
        int userId = user.getUserId();

        CartDAO cartDAO = new CartDAO();
        ArrayList<CartDTO> cartItems = cartDAO.getCartItemsByUserId(userId);
        session.setAttribute("CART", cartItems);

        BigDecimal totalAmount = BigDecimal.ZERO;
        for (CartDTO cartItem : cartItems) {
            BigDecimal itemTotal = cartItem.getPrice().multiply(BigDecimal.valueOf(cartItem.getQuantity()));
            totalAmount = totalAmount.add(itemTotal);

        }

        String address = request.getParameter("address");
        String provinceName = request.getParameter("province_name");
        String recipientName = request.getParameter("recipient_name");
        String phoneNumber = request.getParameter("phone_number");

        // Kiểm tra xem tỉnh/thành phố có tồn tại trong bảng Province hay không
        ProvinceDAO provinceDAO = new ProvinceDAO();
        int provinceId = provinceDAO.getProvinceIdByName(provinceName);
        if (provinceId == 0) {
            response.getWriter().println("Province not found. Failed to create delivery.");
            return;
        }

        // Lấy giá shipping_cost từ bảng Province
        BigDecimal shippingCost = provinceDAO.getShippingCostByName(provinceName);
        request.setAttribute("shippingCost", shippingCost);
        if (shippingCost == null) {
            response.getWriter().println("Failed to get shipping cost. Failed to create delivery.");
            return;
        }

        // Tạo đối tượng DeliveryDTO
        DeliveryDTO delivery = new DeliveryDTO();
        delivery.setUserId(userId);
        delivery.setTotalAmount(totalAmount);
        delivery.setShippingCost(shippingCost);
        delivery.setAddress(address);
        delivery.setProvinceName(provinceName);
        delivery.setProvinceId(provinceId);
        delivery.setReceiverName(recipientName);
        delivery.setPhoneNumber(phoneNumber);

        // Thực hiện tạo giao hàng
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        boolean success = deliveryDAO.createDelivery(delivery);
        System.out.println("ship" + totalAmount);

        if (success) {
            // Truyền thông tin thành công sang trang createDelivery.jsp
            request.setAttribute("message", "Delivery created successfully.");
            request.setAttribute("delivery", delivery); // Truyền thông tin giao hàng
            // Xóa hết đơn hàng trong CartItem

            ProductDAO productDAO = new ProductDAO();
            for (CartDTO cartItem : cartItems) {
                int sttPT = cartItem.getSttPT();
                int deliveredQuantity = cartItem.getQuantity();
                productDAO.updateProductQuantityAfterDelivery(sttPT, deliveredQuantity);
            }

            cartDAO.deleteAllCartItems(userId);

            RequestDispatcher dispatcher = request.getRequestDispatcher("checkOut.jsp");
            dispatcher.forward(request, response);
        } else {
            // Truyền thông tin thất bại sang trang createDelivery.jsp
            request.setAttribute("message", "Failed to create delivery.");

            RequestDispatcher dispatcher = request.getRequestDispatcher("checkOut.jsp");
            dispatcher.forward(request, response);
        }
    }
}
