package controller;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;
import DAO.ProductDAO;
import DAO.StoreDAO;
import DTO.CartDTO;
import DTO.UserDTO;
import java.util.ArrayList;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");

        if (user != null) {
            String action = request.getParameter("action");

            if (action != null && action.equals("add")) {
                addToCart(request, response);
            } else if (action != null && action.equals("update")) {
                updateCartItemQuantity(request, response);
            } else if (action != null && action.equals("view")) {
                viewCart(request, response);
            } else if (action != null && action.equals("remove")) {
                removeCartItem(request, response);
            } else if (action != null && action.equals("showCart")) {
                showCart(request, response);
            } else {
                response.sendRedirect("cart.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
    

    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");
        System.out.println("check add" + user);
        if (user != null) {
            int userId = user.getUserId();
            
            int sttPt = Integer.parseInt(request.getParameter("sttPt"));
            String productName = request.getParameter("productName");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            CartDAO cartDAO = new CartDAO();
            int quantityProduct = cartDAO.getProductQuantity(sttPt);
            String imageUrl = request.getParameter("imageUrl");
            String store_id = request.getParameter("storeid");
            
            StoreDAO storedao = new StoreDAO();
            String store_name = storedao.getStoreNameByStoreId(store_id);

            System.out.println("check store name" + store_name);
            System.out.println("storeid" + store_id);
            
            // Kiểm tra quantity
            if (quantityProduct > 0) {

                CartDTO cartItem = new CartDTO();
                cartItem.setSttPT(sttPt);
                cartItem.setProductName(productName);
                cartItem.setPrice(price);
                cartItem.setQuantity(quantity);
                cartItem.setImageUrl(imageUrl);
                cartItem.setUserId(userId);
                cartItem.setStorename(store_name);

                cartDAO.addToCart(cartItem);

                // Thêm thành công
                ArrayList<CartDTO> cartItems = cartDAO.getCartItemsByUserId(userId);
                session.setAttribute("CART", cartItems);
                response.sendRedirect("ShowProductsServlet");
            } else {
                // quantity <= 1
                response.sendRedirect("ShowProductsServlet"); // Chuyển tới trang cart.jsp m à không thêm vào giỏ hàng
            }
        } else {
            //chua dang nhap           
            String referer = request.getRequestURI();
            System.out.println(referer);
            session.setAttribute("originalURL", referer);
            response.sendRedirect("login.jsp");
        }
    }

    protected void updateCartItemQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");

        if (user != null) {
            int userId = user.getUserId();
            int sttPT = Integer.parseInt(request.getParameter("sttPT"));
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            CartDAO cartDAO = new CartDAO();

            // Lấy quantity của Product từ CartItem;
            int productQuantity = cartDAO.getProductQuantity(sttPT);

            // So sánh quantity trong CartItem với quantity trong Product
            if (quantity > productQuantity) {
                // Nếu quantity trong CartItem lớn hơn quantity trong Product,
                // giữ nguyên quantity trong CartItem và cập nhật lại quantity
                // thành quantity của Product
                quantity = productQuantity;
            }

            boolean success = cartDAO.updateCartItemQuantity(cartItemId, quantity);

            if (quantity < 1) {
                cartDAO.deleteCartItem(cartItemId);
            }

            // Cập nhật thành công
            if (success) {
                ArrayList<CartDTO> cartItems = cartDAO.getCartItemsByUserId(userId);
                session.setAttribute("CART", cartItems);
                response.sendRedirect("cart.jsp");
            } else {
                // Cập nhật thất bại
                response.sendRedirect("error.jsp");
            }
        } else {
            // Chưa đăng nhập
            response.sendRedirect("login.jsp");
        }
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");

        if (user != null) {
            int userId = user.getUserId();
            CartDAO cartDAO = new CartDAO();

            ArrayList<CartDTO> cartItems = cartDAO.getCartItemsByUserId(userId);
            session.setAttribute("CART", cartItems);
            double total = 0;
            for (CartDTO item : cartItems) {
                total += item.getPrice().doubleValue()* item.getQuantity();
            }
            session.setAttribute("total",total);
            response.sendRedirect("CartServlet?action=showCart");
        } else {
            // Chưa đăng nhập
            response.sendRedirect("login.jsp");
        }
    }

    private void removeCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userlogin");
        System.out.println("check" + user);
        if (user != null) {
            int userId = user.getUserId();
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

            CartDAO cartDAO = new CartDAO();
            boolean success = cartDAO.deleteCartItem(cartItemId);

            // Cập nhật thành công
            if (success) {
                ArrayList<CartDTO> cartItems = cartDAO.getCartItemsByUserId(userId);
                session.setAttribute("CART", cartItems);
                response.sendRedirect("cart.jsp");
            } else {
                // Cập nhật thất bại
                response.sendRedirect("error.jsp");
            }
        } else {
            // Chưa đăng nhập
            response.sendRedirect("login.jsp");
        }
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

}
