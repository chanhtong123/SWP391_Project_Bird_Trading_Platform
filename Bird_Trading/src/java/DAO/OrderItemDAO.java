package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.OrderItemDTO;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import utils.DBHelper;

public class OrderItemDAO extends DBHelper {
    // Create an order item

    public void createOrderItem(OrderItemDTO orderItem) {
        try {
            String query = "INSERT INTO OrderItem (order_id, STT_PT, store_id, quantity, price, product_name, image_url, categoryName, orderItem_date,  status_orderItem) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderItem.getOrderId());
            preparedStatement.setInt(2, orderItem.getSttPT());
            preparedStatement.setInt(3, orderItem.getStoreId());
            preparedStatement.setInt(4, orderItem.getQuantity());
            preparedStatement.setBigDecimal(5, orderItem.getPrice());
            preparedStatement.setString(6, orderItem.getProductName());
            preparedStatement.setString(7, orderItem.getImageUrl());
            preparedStatement.setString(8, orderItem.getCategoryName());

            // Lấy ngày giờ hiện tại
            LocalDateTime currentDateTime = LocalDateTime.now();
            Timestamp timestamp = Timestamp.valueOf(currentDateTime);
            preparedStatement.setTimestamp(9, timestamp);

            preparedStatement.setString(10, "Order confirmation");

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public OrderItemDTO getOrderItem(int orderItemId) {
        OrderItemDTO orderItem = null;
        try {
            String query = "SELECT quantity, STT_PT FROM OrderItem WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderItemId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int quantity = resultSet.getInt("quantity");
                int sttPT = resultSet.getInt("STT_PT");

                orderItem = new OrderItemDTO();
                orderItem.setQuantity(quantity);
                orderItem.setSttPT(sttPT);
            }

            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    public BigDecimal calculateTotalPriceByDateRange(String startDate, String endDate) {
        BigDecimal totalPrice = BigDecimal.ZERO;
        try {
            String query = "SELECT SUM(price) AS total_price FROM OrderItem WHERE orderItem_date >= ? AND orderItem_date <= ? AND status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate + " 00:00:00");
            preparedStatement.setString(2, endDate + " 23:59:59");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                BigDecimal sumPrice = resultSet.getBigDecimal("total_price");
                if (sumPrice != null) {
                    totalPrice = sumPrice.multiply(BigDecimal.valueOf(0.15));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    public BigDecimal calculateTotalPriceByDateRangeAndStoreId(String startDate, String endDate, int storeId) {
        BigDecimal totalPrice = BigDecimal.ZERO;
        try {
            String query = "SELECT SUM(price) AS total_price FROM OrderItem WHERE orderItem_date >= ? AND orderItem_date <= ? AND status_orderItem = 'Complete' AND store_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate + " 00:00:00");
            preparedStatement.setString(2, endDate + " 23:59:59");
            preparedStatement.setInt(3, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                BigDecimal sumPrice = resultSet.getBigDecimal("total_price");
                if (sumPrice != null) {
                    totalPrice = sumPrice.multiply(BigDecimal.valueOf(0.85));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    public int countOrderItemsByDateRange(String startDate, String endDate) {
        int itemCount = 0;
        try {
            String query = "SELECT COUNT(order_item_id) AS item_count FROM OrderItem WHERE orderItem_date >= ? AND orderItem_date <= ? AND status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate + " 00:00:00");
            preparedStatement.setString(2, endDate + " 23:59:59");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                itemCount = resultSet.getInt("item_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itemCount;
    }

    public int countOrderItemsByDateRangeAndStoreId(String startDate, String endDate, int storeId) {
        int itemCount = 0;
        try {
            String query = "SELECT COUNT(order_item_id) AS item_count FROM OrderItem WHERE orderItem_date >= ? AND orderItem_date <= ? AND status_orderItem = 'Complete' AND store_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate + " 00:00:00");
            preparedStatement.setString(2, endDate + " 23:59:59");
            preparedStatement.setInt(3, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                itemCount = resultSet.getInt("item_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itemCount;
    }

    public boolean updateStatusByOrderItemId(int orderItemid) {
        boolean success = false;
        try {
            String query = "UPDATE OrderItem SET status_orderItem = 'Delivery in progress' WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, orderItemid);
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateStatusByOrderItemIdDelete(int orderItemid) {
        boolean success = false;
        try {
            String query = "UPDATE OrderItem SET status_orderItem = 'Delete' WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, orderItemid);
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateStatusByOrderItemId2(int orderItemid) {
        boolean success = false;
        try {
            String query = "UPDATE OrderItem SET status_orderItem = 'Complete' WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, orderItemid);
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
        //gg
    }

    public List<OrderItemDTO> getAllOrderItems() {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM OrderItem";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id")); // Thêm dòng này để lấy giá trị của order_item_id
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItem.setOrderItem_date(resultSet.getDate("orderItem_date"));
                orderItems.add(orderItem);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    public List<OrderItemDTO> getOrderItemsByDateRangeAndStoreId(String startDate, String endDate, int storeId) {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        try {
            String query = "SELECT oi.order_item_id, oi.order_id, oi.STT_PT, oi.store_id, oi.quantity, oi.price, oi.product_name, oi.image_url, oi.categoryName, oi.orderItem_date "
                    + "FROM OrderItem oi "
                    + "WHERE oi.orderItem_date >= ? AND oi.orderItem_date <= ? "
                    + "AND oi.store_id = ? AND oi.status_orderItem = 'Complete'";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate + " 00:00:00");
            preparedStatement.setString(2, endDate + " 23:59:59");
            preparedStatement.setInt(3, storeId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItem.setOrderItem_date(resultSet.getTimestamp("orderItem_date"));
                orderItems.add(orderItem);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    public List<OrderItemDTO> getOrderItemsByDateRange(String startDate, String endDate) {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        try {
            String query = "SELECT oi.order_item_id, oi.order_id, oi.STT_PT, oi.store_id, oi.quantity, oi.price, oi.product_name, oi.image_url, oi.categoryName, oi.orderItem_date "
                    + "FROM OrderItem oi "
                    + "WHERE oi.orderItem_date >= ? AND oi.orderItem_date <= ? "
                    + "AND  oi.status_orderItem = 'Complete'";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate + " 00:00:00");
            preparedStatement.setString(2, endDate + " 23:59:59");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItem.setOrderItem_date(resultSet.getTimestamp("orderItem_date"));
                orderItems.add(orderItem);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    public List<OrderItemDTO> getCompletedOrderItems() {
        List<OrderItemDTO> completedOrderItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM OrderItem WHERE status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItem.setOrderItem_date(resultSet.getDate("orderItem_date"));
                completedOrderItems.add(orderItem);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return completedOrderItems;
    }

// Retrieve all order items by order ID
    public ArrayList<OrderItemDTO> getOrderItemsByOrderId(int orderId) {
        ArrayList<OrderItemDTO> orderItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM OrderItem WHERE order_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }

// Update an order item
    public void updateOrderItem(OrderItemDTO orderItem) {
        try {
            String query = "UPDATE OrderItem SET STT_PT = ?, store_id = ?, quantity = ?, price = ?, product_name = ?, image_url = ?, categoryName = ? WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderItem.getSttPT());
            preparedStatement.setInt(2, orderItem.getStoreId());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setBigDecimal(4, orderItem.getPrice());
            preparedStatement.setString(5, orderItem.getProductName());
            preparedStatement.setString(6, orderItem.getImageUrl());
            preparedStatement.setString(7, orderItem.getCategoryName());
            preparedStatement.setInt(8, orderItem.getOrderItemId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

// Delete an order item
    public void deleteOrderItem(int orderItemId) {
        try {
            String query = "DELETE FROM OrderItem WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderItemId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<OrderItemDTO> getOrderItemsByStoreId(int storeId) {
        ArrayList<OrderItemDTO> orderItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM OrderItem WHERE store_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }

    public OrderItemDTO getOrderItemBySttPT(int sttPT) {
        OrderItemDTO orderItem = null;
        try {
            String query = "SELECT * FROM OrderItem WHERE STT_PT = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, sttPT);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItem;
    }

    public void updateOrderItem(int orderItemId, int quantity, BigDecimal price) {
        try {
            String query = "UPDATE OrderItem SET quantity = ?, price = ? WHERE order_item_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setBigDecimal(2, price);
            preparedStatement.setInt(3, orderItemId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderItemDTO> getAllByStoreId(int storeId) {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM OrderItem WHERE store_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));
                orderItem.setOrderItem_date(resultSet.getDate("orderItem_date"));
                orderItem.setStatus(resultSet.getString("status_orderItem"));
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }

    public BigDecimal calculateTotalPriceByStoreId(int storeId) {
        BigDecimal totalPrice = BigDecimal.ZERO;
        try {
            String query = "SELECT SUM(price) AS total_price FROM OrderItem WHERE store_id = ? AND status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                BigDecimal sumPrice = resultSet.getBigDecimal("total_price");
                if (sumPrice != null) {
                    totalPrice = sumPrice.multiply(BigDecimal.valueOf(0.85)).setScale(3, RoundingMode.HALF_UP);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    
     public static void main(String[] args) {
        // Tạo kết nối tới cơ sở dữ liệu
   

        // Tạo đối tượng DAO
        OrderItemDAO orderItemDAO = new OrderItemDAO();

        // Gọi phương thức getOrderItem để lấy số lượng và STT_PT dựa trên order_item_id
        int orderItemId = 1; // Thay thế bằng order_item_id bạn muốn kiểm tra
        OrderItemDTO orderItem = orderItemDAO.getOrderItem(orderItemId);

        // Kiểm tra kết quả
        if (orderItem != null) {
            int quantity = orderItem.getQuantity();
            int sttPT = orderItem.getSttPT();
            System.out.println("Số lượng: " + quantity);
            System.out.println("STT_PT: " + sttPT);
        } else {
            System.out.println("Không tìm thấy order_item_id: " + orderItemId);
        }

        // Đóng kết nối
       
    }
    
    
    
    
    public BigDecimal calculateTotalPrice() {
        BigDecimal totalPrice = BigDecimal.ZERO;
        try {
            String query = "SELECT SUM(price) AS total_price FROM OrderItem WHERE status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                BigDecimal sumPrice = resultSet.getBigDecimal("total_price");
                if (sumPrice != null) {
                    totalPrice = sumPrice.multiply(BigDecimal.valueOf(0.85)).setScale(3, RoundingMode.HALF_UP);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    public BigDecimal pricePT() {
        BigDecimal totalPrice = BigDecimal.ZERO;
        try {
            String query = "SELECT SUM(price) AS total_price FROM OrderItem WHERE status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                BigDecimal sumPrice = resultSet.getBigDecimal("total_price");
                if (sumPrice != null) {
                    totalPrice = sumPrice.multiply(BigDecimal.valueOf(0.15)).setScale(3, RoundingMode.HALF_UP);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    public int getCountByStoreId(int storeId) {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS count FROM OrderItem WHERE store_id = ? AND status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, storeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countOrderItemId() {
        int count = 0;

        try {
            String query = "SELECT COUNT(order_item_id) AS orderItemCount FROM OrderItem WHERE status_orderItem = 'Complete'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt("orderItemCount");
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public List<OrderItemDTO> getOrderItemsByProductId(String productId) throws SQLException {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM OrderItem WHERE STT_PT = (SELECT STT_PT FROM Product WHERE product_id = ?)");
        statement.setString(1, productId);
        try ( ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setOrderItemId(resultSet.getInt("order_item_id"));
                orderItem.setOrderId(resultSet.getInt("order_id"));
                orderItem.setSttPT(resultSet.getInt("STT_PT"));
                orderItem.setStoreId(resultSet.getInt("store_id"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getBigDecimal("price"));
                orderItem.setProductName(resultSet.getString("product_name"));
                orderItem.setImageUrl(resultSet.getString("image_url"));
                orderItem.setCategoryName(resultSet.getString("categoryName"));

                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }
}
