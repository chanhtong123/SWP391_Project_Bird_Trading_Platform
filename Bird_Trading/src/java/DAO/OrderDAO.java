package DAO;

import DTO.OrderDTO;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBHelper;
import java.time.LocalDateTime;
import java.sql.Timestamp;

public class OrderDAO extends DBHelper {


// Create an order
    public void createOrder(OrderDTO order) {
        try {
            String query = "INSERT INTO [Order] (user_id, total_amount, order_status, order_date) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, order.getUserId());
            preparedStatement.setBigDecimal(2, order.getTotalAmount());
            preparedStatement.setString(3, order.getOrderStatus());

            // Lấy ngày giờ hiện tại
            LocalDateTime currentDateTime = LocalDateTime.now();
            Timestamp timestamp = Timestamp.valueOf(currentDateTime);
            preparedStatement.setTimestamp(4, timestamp);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> orders = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Order]";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                orders.add(order);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public OrderDTO getLastOrder() {
        OrderDTO order = null;

        try {
            String query = "SELECT TOP 1 * FROM [Order] ORDER BY order_id DESC";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                // Thêm các thông tin khác của đơn hàng vào order (nếu cần)
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    public static void main(String[] args) {
        // Tạo một đối tượng OrderDAO
        OrderDAO orderDAO = new OrderDAO();

        // Gọi phương thức getLastOrder để lấy đơn hàng cuối cùng
        OrderDTO lastOrder = orderDAO.getLastOrder();

        // Kiểm tra và in thông tin đơn hàng cuối cùng
        if (lastOrder != null) {
            System.out.println("Last Order:");
            System.out.println("Order ID: " + lastOrder.getOrderId());
            System.out.println("User ID: " + lastOrder.getUserId());
            System.out.println("Total Amount: " + lastOrder.getTotalAmount());
            System.out.println("Order Status: " + lastOrder.getOrderStatus());
            // In các thông tin khác của đơn hàng (nếu có)
        } else {
            System.out.println("No order found.");
        }
    }

    public int getOrderCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS orderCount FROM [Order]";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("orderCount");
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public OrderDTO getOrderByUserId(int userId) {
        OrderDTO order = null;

        try {
            String query = "SELECT * FROM [Order] WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                // Thêm các thông tin khác của đơn hàng vào order (nếu cần)
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    public OrderDTO getOrderByOrderId(int orderId) {
        OrderDTO order = null;

        try {
            String query = "SELECT * FROM [Order] WHERE order_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                // Thêm các thông tin khác của đơn hàng vào order (nếu cần)
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    // Get all orders by user ID
    public List<OrderDTO> getOrdersByUserId(int userId) {
        List<OrderDTO> orders = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Order] WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Get order by order ID
    public OrderDTO getOrderById(int orderId) {
        OrderDTO order = null;
        try {
            String query = "SELECT * FROM [Order] WHERE order_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    // Update an order
    public void updateOrder(OrderDTO order) {
        try {
            String query = "UPDATE [Order] SET total_amount = ?, order_status = ? WHERE order_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setBigDecimal(1, order.getTotalAmount());
            preparedStatement.setString(2, order.getOrderStatus());
            preparedStatement.setInt(3, order.getOrderId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete an order
    public void deleteOrder(int orderId) {
        try {
            String query = "DELETE FROM [Order] WHERE order_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOrderTotalAmount(int orderId, BigDecimal totalAmount) {
        try {
            String query = "UPDATE [Order] SET total_amount = ? WHERE order_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setBigDecimal(1, totalAmount);
            preparedStatement.setInt(2, orderId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDTO> getAllByStoreId(int storeId) {
        List<OrderDTO> orders = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Order] WHERE store_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setTotalAmount(resultSet.getBigDecimal("total_amount"));
                order.setOrderStatus(resultSet.getString("order_status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

}
