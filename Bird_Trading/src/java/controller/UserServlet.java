
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.OrderDAO;
import DAO.OrderItemDAO;
import DAO.ProductDAO;
import DAO.StoreDAO;
import DAO.UserDAO;
import DTO.OrderDTO;
import DTO.OrderItemDTO;
import DTO.ProductDTO;
import DTO.StoreDTO;
import DTO.StoreRegisterDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.CreateError;

/**
 *
 * @author GRAM
 */
public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        try {

            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "list":
                    listUsers(request, response);
                    break;
                case "list2":
                    listUsers2(request, response);
                    break;
                case "showCreateForm":
                    showCreateForm(request, response);
                    break;
                case "addUser":
                    addUser(request, response);
                    break;
                case "showLoginForm":
                    showLoginForm(request, response);
                    break;
                case "login":
                    login(request, response);
                    break;
                case "showSignupForm":
                    showSignupForm(request, response);
                    break;
                case "signup":
                    createUser(request, response);
                    break;
                case "showEditForm":
                    showEditForm(request, response);
                    break;
                case "edit":
                    editUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "profile":
                    userProfile(request, response);
                    break;
                case "editProfile":
                    editProfile(request, response);
                    break;
                case "logout":
                    logout(request, response);
                    break;
                case "getUserList":
                    getUserList(request, response);
                    break;
//                case "loginGoogle":
//                    loginGoogle(request, response);
//                    break;
//                case "sigUpGoogle":
//                    createUserGoogle(request, response);
//                    break;
                default:
                    listUsers(request, response);
            }
        } catch (SQLException e) {
            log("UserServlet _ SQL _ " + e.getMessage());
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

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StoreDAO storeDAO = new StoreDAO();
        List<StoreRegisterDTO> storeRegisterList = storeDAO.getAllStoreRegister();
        HttpSession session = request.getSession();
        session.setAttribute("stores", storeRegisterList); // Đặt danh sách sản phẩm vào session
        ArrayList<UserDTO> users = userDAO.getAllUsers1();
        session.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("staff.jsp");
        rd.forward(request, response);

    }

    private void listUsers2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StoreDAO storeDAO = new StoreDAO();
        List<StoreRegisterDTO> storeRegisterList = storeDAO.getAllStoreRegister();
        HttpSession session = request.getSession();
        session.setAttribute("stores", storeRegisterList); // Đặt danh sách sản phẩm vào session
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

        RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
//          RequestDispatcher rd = request.getRequestDispatcher("dateTotal.jsp");
        rd.forward(request, response);

    }

    private void showSignupForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String url = "signup.jsp";
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        ArrayList<UserDTO> list = userDAO.getAllUsers();
        boolean foundError = false;
        CreateError errors = new CreateError();
        try {
            if (username.trim().equals("")) {
                foundError = true;
                errors.setUsernameBlankError("Tên người dùng không được để trống.");
            }

            if (fullname.trim().equals("")) {
                foundError = true;
                errors.setFullnameBlankError("Họ và tên  không được để trống.");
            }

            if (password.trim().equals("")) {
                foundError = true;
                errors.setPasswordBlankError("Mật khẩu không được để trống.");
            }

            if (email.trim() == null || email.trim().isEmpty()) {
                foundError = true;
                errors.setEmailBlankError("Email không được để trống.");
            } else if (!isValidEmail(email)) {
                foundError = true;
                errors.setEmailFormatError("Email không hợp lệ.");
            }

            if (phoneNumber.trim() == null || phoneNumber.trim().isEmpty()) {
                foundError = true;
                errors.setPhoneBlankError("Số điện thoại không được để trống.");
            } else if (!isValidPhoneNumber(phoneNumber)) {
                foundError = true;
                errors.setPhoneFormatError("Số điện thoại không hợp lệ(10 số)");
            }

            for (UserDTO a : list) {
                if (a.getEmail().equals(email)) {
                    foundError = true;
                    errors.setEmailIsExisted("Email đã được đăng kí.");
                }
                if (a.getPhoneNumber().equals(phoneNumber)) {
                    foundError = true;
                    errors.setPhoneNumberIsExisted("Số điện thoại đã được đăng kí.");
                }
                if (a.getUsername().equals(username)) {
                    foundError = true;
                    errors.setUsernameIsExisted("Tên người dùng đã tồn tại.");
                }
            }
            if (foundError) {
                request.setAttribute("CREATE_ERROR", errors);
            } else {
                UserDTO user = new UserDTO();
                user.setUsername(username);
                user.setFullname(fullname);
                user.setPassword(password);
                user.setEmail(email);
                user.setAddress(address);
                user.setPhoneNumber(phoneNumber);
                user.setRole("User");
                boolean result = userDAO.createUser(user);
                if (result) {
                    url = "UserServlet?action=showLoginForm";
                }
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userId = request.getParameter("userId");
            int userIdd = Integer.parseInt(userId);
            UserDTO user = userDAO.getUserById(userIdd);
            request.setAttribute("user", user);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("updateUser.jsp");
            rd.forward(request, response);
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String role = request.getParameter("role");
        int userId = Integer.parseInt(request.getParameter("userId"));
        try {
            UserDTO user = new UserDTO(userId, username, fullname, password, email, address, phoneNumber, role);
            userDAO.updateUser(user);

        } finally {
            response.sendRedirect("UserServlet?action=list2");
        }
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        String url = "UserServlet?action=profile";
        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirm = request.getParameter("confirm");
        boolean foundError = false;
        CreateError errors = new CreateError();

        try {
            // Kiểm tra mật khẩu cũ và xác nhận mật khẩu mới
            if (oldPassword.equals(userDAO.getUserById(userId).getPassword()) && newPassword.equals(confirm)) {
                // Cập nhật thông tin người dùng
                UserDTO user = new UserDTO(userId, username, fullName, newPassword, email, address, phoneNumber, role);
                boolean updateSuccess = userDAO.updateUser(user);
                if (updateSuccess) {
                    // Thông báo cập nhật thành công
                    request.setAttribute("EDIT_SUCCESS", "User information updated successfully");
                } else {
                    foundError = true;
                    errors.setNotMatchPassword("Failed to update user information");
                }
            } else {
                foundError = true;
                errors.setNotMatchPassword("Password does not match or incorrect old password");
            }

            if (foundError) {
                request.setAttribute("EDIT_ERROR", errors);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        try {

            userDAO.deleteUser(userId);

        } catch (NumberFormatException e) {

        }
        response.sendRedirect("UserServlet?action=list2");
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        PrintWriter out = response.getWriter();
        String url = "UserServlet?action=list2";
        String username = request.getParameter("username");
        String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");

        System.out.println(fullname );
        String phoneNumber = request.getParameter("phoneNumber");
        String role = request.getParameter("role");
        boolean foundError = false;
        CreateError errors = new CreateError();
        ArrayList<UserDTO> list = userDAO.getAllUsers();

        try {
            if (username.trim().equals("")) {
                foundError = true;
                errors.setUsernameBlankError("Tên người dùng không được để trống");
            }
            if (fullname.trim().equals("")) {
                foundError = true;
                errors.setFullnameBlankError("Họ và tên không được để trống");
            }
            if (password.trim().equals("")) {
                foundError = true;
                errors.setPasswordBlankError("Mật khẩu không được để trống");
            }

            if (email.trim().trim().equals("")) {
                foundError = true;
                errors.setEmailBlankError("Email không được để trống");
            } else if (!isValidEmail(email)) {
                foundError = true;
                errors.setEmailBlankError("Email không hợp lệ.");
            }

            if (phoneNumber.trim() == null || phoneNumber.trim().isEmpty()) {
                foundError = true;
                errors.setPhoneBlankError("Số điện thoại không được để trống.");
            } else if (!isValidPhoneNumber(phoneNumber)) {
                foundError = true;
                errors.setPhoneFormatError("Số điện thoại không hợp lệ.");
            }

            for (UserDTO a : list) {
                if (a.getEmail().equals(email)) {
                    foundError = true;
                    errors.setEmailIsExisted("Email đã được đăng kí.");
                }
                if (a.getPhoneNumber().equals(phoneNumber)) {
                    foundError = true;
                    errors.setPhoneNumberIsExisted("Số điện thoại đã được đăng kí.");
                }
                if (a.getUsername().equals(username)) {
                    foundError = true;
                    errors.setUsernameIsExisted("Tên người dùng đã tồn tại.");
                }
            }
            if (foundError) {
                request.setAttribute("CREATE_ERROR", errors);
            } else {
                UserDTO user = new UserDTO();
                user.setUsername(username);
                user.setFullname(fullname);
                user.setPassword(password);
                user.setEmail(email);
                user.setAddress(address);
                user.setPhoneNumber(phoneNumber);
                user.setRole(role);
                boolean result = userDAO.createUser(user);
                if (result) {
                    url = "UserServlet?action=list2";
                }
            }

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String url = "login.jsp";
        boolean foundError = false;
        CreateError errors = new CreateError();
        HttpSession session = request.getSession();
        try {

            if (email.trim().equals("")) {
                foundError = true;
                errors.setUsernameBlankError("Email không được để trống");
            }
            if (password.trim().equals("")) {
                foundError = true;
                errors.setPasswordBlankError("Mật khẩu không được để trống");
            }
            if (foundError) {
                request.setAttribute("CREATE_ERROR", errors);
            } else {
                StoreDAO storeDAO = new StoreDAO();
                ProductDAO productDAO = new ProductDAO();
                UserDTO result = userDAO.checkLogin(email, password);
                if (result != null) {
                    StoreDTO store = storeDAO.checkStoreToGetUserId(result.getUserId());
                    if (store != null) {
                        List<ProductDTO> productList = productDAO.getAllProductsByStoreId(store.getStore_id());
                        session.setAttribute("products", productList);
                    }
                    String roleId = result.getRole();
                    session.setAttribute("userlogin", result);
                    if ("Store Manager".equals(roleId)) {
                        session.setAttribute("storeManager", store);
                        url = "ShowProductsServlet";
                    } else if ("User".equals(roleId)) {
                        url = "ShowProductsServlet";
                    } else if ("Admin".equals(roleId)) {
                        url = "UserServlet?action=list2";
                    } else if ("Staff".equals(roleId)) {
                        url = "UserServlet?action=list";
                    }

                } else {
                    // Invalid username or password
                    foundError = true;
                    errors.setWrongPasswordError("Email hoặc mật khẩu không hợp lệ");
                    request.setAttribute("CREATE_ERROR", errors);
                }
            }

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }

    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void userProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO dto = (UserDTO) session.getAttribute("userlogin");
        List<OrderItemDTO> listItem = new ArrayList<>();
        UserDTO user = null;
        if (dto != null) {
            int userId = dto.getUserId();
            UserDAO userDAO = new UserDAO(); // Assuming UserDAO is available and instantiated correctly
            user = userDAO.getUserById(userId);

            OrderDAO orderDAO = new OrderDAO(); // Assuming OrderDAO is available and instantiated correctly
            List<OrderDTO> orderDTO = orderDAO.getOrdersByUserId(userId);

            OrderItemDAO orderItemDAO = new OrderItemDAO(); // Assuming OrderItemDAO is available and instantiated correctly
            for (OrderDTO order : orderDTO) {
                List<OrderItemDTO> orderItems = orderItemDAO.getOrderItemsByOrderId(order.getOrderId());
                listItem.addAll(orderItems);
                for (OrderItemDTO orderItem : orderItems) {
                    System.out.println(orderItem.getStatus());
                }
            }
        }

        request.setAttribute("orderItem", listItem);
        request.setAttribute("user", user);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = "ShowProductsServlet";
        try {
            UserDTO dto = (UserDTO) session.getAttribute("userlogin");
            if (dto != null) {
                url = "ShowProductsServlet";
                session.removeAttribute("userlogin");
                session.invalidate();
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<UserDTO> userList = userDAO.getAllUsers();

        // Set the response content type to HTML
        response.setContentType("text/html");

        // Generate the HTML for the user list
        StringBuilder htmlBuilder = new StringBuilder();

        for (UserDTO user : userList) {
            htmlBuilder.append("<tr>");
            htmlBuilder.append("<td>").append(user.getUserId()).append("</td>");
            htmlBuilder.append("<td>").append(user.getUsername()).append("</td>");
            htmlBuilder.append("<td>").append(user.getEmail()).append("</td>");
            htmlBuilder.append("<td>").append(user.getAddress()).append("</td>");
            htmlBuilder.append("<td>").append(user.getPhoneNumber()).append("</td>");
            htmlBuilder.append("<td>").append(user.getRole()).append("</td>");
            htmlBuilder.append("<td>");
            htmlBuilder.append("<a href=\"UserServlet?action=showEditForm&userId=").append(user.getUserId()).append("\" class=\"btn btn-primary btn-sm\")\">Edit</a>&nbsp;");
            htmlBuilder.append("<a href=\"UserServlet?action=delete&userId=").append(user.getUserId()).append("\" class=\"btn btn-danger btn-sm\"\" onclick=\"confirmDelete(event, ").append(user.getUserId()).append(")\">Delete</a>");
            htmlBuilder.append("</td>");
            htmlBuilder.append("</tr>");
        }

        // Write the HTML to the response
        response.getWriter().write(htmlBuilder.toString());
        return;
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return email.matches(emailRegex);
    }

    private boolean isValidPhoneNumber(String phoneNumber) {
        String phoneRegex = "^[0-9]{10}$";
        return phoneNumber.matches(phoneRegex);
    }

}
