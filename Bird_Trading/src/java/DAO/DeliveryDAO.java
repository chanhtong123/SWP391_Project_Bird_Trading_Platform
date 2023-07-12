package DAO;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.DeliveryDTO;
import utils.DBHelper;

public class DeliveryDAO extends DBHelper {

    public ArrayList<DeliveryDTO> getAllDeliveries() {
        ArrayList<DeliveryDTO> deliveries = new ArrayList<>();
        try {
            String sql = "SELECT delivery_id, province_id, user_id, total_amount, shipping_cost, address, province_name, receiver_name, phone_number "
                    + "FROM Delivery";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DeliveryDTO delivery = new DeliveryDTO();
                delivery.setDeliveryId(rs.getInt("delivery_id"));
                delivery.setProvinceId(rs.getInt("province_id"));
                delivery.setUserId(rs.getInt("user_id"));
                delivery.setTotalAmount(rs.getBigDecimal("total_amount"));
                delivery.setShippingCost(rs.getBigDecimal("shipping_cost"));
                delivery.setAddress(rs.getString("address"));
                delivery.setProvinceName(rs.getString("province_name"));
                delivery.setReceiverName(rs.getString("receiver_name"));
                delivery.setPhoneNumber(rs.getString("phone_number"));
                deliveries.add(delivery);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return deliveries;
    }

    public DeliveryDTO getDeliveryById(int deliveryId) {
        DeliveryDTO delivery = null;
        try {
            String sql = "SELECT delivery_id, province_id, user_id, total_amount, shipping_cost, address, province_name, receiver_name, phone_number "
                    + "FROM Delivery WHERE delivery_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, deliveryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                delivery = new DeliveryDTO();
                delivery.setDeliveryId(rs.getInt("delivery_id"));
                delivery.setProvinceId(rs.getInt("province_id"));
                delivery.setUserId(rs.getInt("user_id"));
                delivery.setTotalAmount(rs.getBigDecimal("total_amount"));
                delivery.setShippingCost(rs.getBigDecimal("shipping_cost"));
                delivery.setAddress(rs.getString("address"));
                delivery.setProvinceName(rs.getString("province_name"));
                delivery.setReceiverName(rs.getString("receiver_name"));
                delivery.setPhoneNumber(rs.getString("phone_number"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return delivery;
    }

    public ArrayList<DeliveryDTO> getDeliveriesByUserId(int userId) {
        ArrayList<DeliveryDTO> deliveries = new ArrayList<>();
        try {
            String sql = "SELECT delivery_id, province_id, user_id, total_amount, shipping_cost, address, province_name, receiver_name, phone_number "
                    + "FROM Delivery WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DeliveryDTO delivery = new DeliveryDTO();
                delivery.setDeliveryId(rs.getInt("delivery_id"));
                delivery.setProvinceId(rs.getInt("province_id"));
                delivery.setUserId(rs.getInt("user_id"));
                delivery.setTotalAmount(rs.getBigDecimal("total_amount"));
                delivery.setShippingCost(rs.getBigDecimal("shipping_cost"));
                delivery.setAddress(rs.getString("address"));
                delivery.setProvinceName(rs.getString("province_name"));
                delivery.setReceiverName(rs.getString("receiver_name"));
                delivery.setPhoneNumber(rs.getString("phone_number"));
                deliveries.add(delivery);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return deliveries;
    }

    public boolean createDelivery(DeliveryDTO delivery) {
        boolean success = false;
        try {
            String sql = "INSERT INTO Delivery (province_id, user_id, total_amount, shipping_cost, address, province_name, receiver_name, phone_number) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, delivery.getProvinceId());
            ps.setInt(2, delivery.getUserId());
            ps.setBigDecimal(3, delivery.getTotalAmount());
            ps.setBigDecimal(4, delivery.getShippingCost());
            ps.setString(5, delivery.getAddress());
            ps.setString(6, delivery.getProvinceName());
            ps.setString(7, delivery.getReceiverName());
            ps.setString(8, delivery.getPhoneNumber());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateDelivery(DeliveryDTO delivery) {
        boolean success = false;
        try {
            String sql = "UPDATE Delivery SET province_id = ?, user_id = ?, total_amount = ?, shipping_cost = ?, address = ?, province_name = ?, receiver_name = ?, phone_number = ? "
                    + "WHERE delivery_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, delivery.getProvinceId());
            ps.setInt(2, delivery.getUserId());
            ps.setBigDecimal(3, delivery.getTotalAmount());
            ps.setBigDecimal(4, delivery.getShippingCost());
            ps.setString(5, delivery.getAddress());
            ps.setString(6, delivery.getProvinceName());
            ps.setString(7, delivery.getReceiverName());
            ps.setString(8, delivery.getPhoneNumber());
            ps.setInt(9, delivery.getDeliveryId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    // Các phương thức khác không thay đổi
    public static void main(String[] args) {
        // Tạo đối tượng DeliveryDTO mới
        DeliveryDTO delivery = new DeliveryDTO();
        delivery.setProvinceId(1);
        delivery.setUserId(1);
        delivery.setTotalAmount(new BigDecimal(100));
        delivery.setShippingCost(new BigDecimal(10));
        delivery.setAddress("123 ABC Street");
        delivery.setProvinceName("TP HCM");
        delivery.setReceiverName("John Doe");
        delivery.setPhoneNumber("123456789");

        // Tạo đối tượng DeliveryDAO và thực hiện tạo giao hàng
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        boolean success = deliveryDAO.createDelivery(delivery);
        if (success) {
            System.out.println("Delivery created successfully.");
        } else {
            System.out.println("Failed to create delivery.");
        }
    }
}
