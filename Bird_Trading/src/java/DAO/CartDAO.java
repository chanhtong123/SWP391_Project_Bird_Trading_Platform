/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author ASUS
 */
import DTO.CartDTO;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBHelper;

public class CartDAO extends DBHelper {

    public ArrayList<CartDTO> getCartItemsByUserId(int userId) {
        ArrayList<CartDTO> cartItems = new ArrayList<>();
        try {
            String sql = "SELECT [cart_item_id], [STT_PT], [product_name], [price], [quantity], [image_url], [user_id], [store_name] "
                    + "FROM [CartItem] WHERE [user_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartDTO cartItem = new CartDTO();
                cartItem.setCartItemId(rs.getInt("cart_item_id"));
                cartItem.setSttPT(rs.getInt("STT_PT"));
                cartItem.setProductName(rs.getString("product_name"));
                cartItem.setPrice(rs.getBigDecimal("price"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setImageUrl(rs.getString("image_url"));
                cartItem.setUserId(rs.getInt("user_id"));
                cartItem.setStorename(rs.getString("store_name"));
                cartItems.add(cartItem);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cartItems;
    }

    public boolean addToCart(CartDTO cartItem) {
        boolean success = false;
        try {
            // Check if the STT_PT exists in the user's cart
            String checkSql = "SELECT COUNT(*) FROM [CartItem] WHERE STT_PT = ? AND user_id = ?";
            PreparedStatement checkPs = connection.prepareStatement(checkSql);
            checkPs.setInt(1, cartItem.getSttPT());
            checkPs.setInt(2, cartItem.getUserId());
            ResultSet checkRs = checkPs.executeQuery();
            if (checkRs.next()) {
                int count = checkRs.getInt(1);
                if (count > 0) {
                    // If the STT_PT exists, update the quantity
                    String updateSql = "UPDATE [CartItem] SET quantity = quantity + ? WHERE STT_PT = ? AND user_id = ?";
                    PreparedStatement updatePs = connection.prepareStatement(updateSql);
                    updatePs.setInt(1, cartItem.getQuantity());
                    updatePs.setInt(2, cartItem.getSttPT());
                    updatePs.setInt(3, cartItem.getUserId());
                    int rowsUpdated = updatePs.executeUpdate();
                    if (rowsUpdated > 0) {
                        success = true;
                    }
                } else {
                    // If the STT_PT doesn't exist, insert a new cart item
                    String insertSql = "INSERT INTO [CartItem] (STT_PT, product_name, price, quantity, image_url, user_id, store_name ) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement insertPs = connection.prepareStatement(insertSql);
                    insertPs.setInt(1, cartItem.getSttPT());
                    insertPs.setString(2, cartItem.getProductName());
                    insertPs.setBigDecimal(3, cartItem.getPrice());
                    insertPs.setInt(4, cartItem.getQuantity());
                    insertPs.setString(5, cartItem.getImageUrl());
                    insertPs.setInt(6, cartItem.getUserId());
                    insertPs.setString(7, cartItem.getStorename());
                    int rowsInserted = insertPs.executeUpdate();
                    if (rowsInserted > 0) {
                        success = true;
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateCartItemQuantity(int cartItemId, int quantity) {
        boolean success = false;
        try {
            // Lấy giá trị quantity từ bảng Product
            String getProductQuantitySql = "SELECT quantity FROM Product "
                    + "WHERE STT_PT = "
                    + "(SELECT STT_PT FROM CartItem "
                    + "WHERE cart_item_id = ?)";
            PreparedStatement getProductQuantityPs = connection.prepareStatement(getProductQuantitySql);
            getProductQuantityPs.setInt(1, cartItemId);
            ResultSet productQuantityResult = getProductQuantityPs.executeQuery();

            if (productQuantityResult.next()) {
                int productQuantity = productQuantityResult.getInt("quantity");

                // Kiểm tra nếu quantity trong CartItem không lớn hơn quantity trong bảng Product
                if (quantity <= productQuantity) {
                    String updateCartItemQuantitySql = "UPDATE CartItem SET quantity = ? "
                            + "WHERE cart_item_id = ?";
                    PreparedStatement updateCartItemQuantityPs = connection.prepareStatement(updateCartItemQuantitySql);

                    // Kiểm tra nếu quantity trong CartItem lớn hơn quantity trong bảng Product
                    if (quantity > productQuantity) {
                        quantity = productQuantity; // Đặt quantity bằng giá trị của productQuantity
                    }

                    updateCartItemQuantityPs.setInt(1, quantity);
                    updateCartItemQuantityPs.setInt(2, cartItemId);
                    int rowsUpdated = updateCartItemQuantityPs.executeUpdate();
                    if (rowsUpdated > 0) {
                        success = true;
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean deleteCartItem(int cartItemId) {
        boolean success = false;
        try {
            String sql = "DELETE FROM [CartItem] WHERE cart_item_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartItemId);
            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean deleteAllCartItems(int userId) {
        boolean success = false;
        try {
            String sql = "DELETE FROM [CartItem] Where user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public BigDecimal calculateTotalPrice(int userId) {
        BigDecimal totalPrice = BigDecimal.ZERO;
        try {
            String sql = "SELECT SUM(price * quantity) AS total_price "
                    + "FROM [CartItem] WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalPrice = rs.getBigDecimal("total_price");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return totalPrice;
    }

    public int getProductQuantity(int sttPT) {
        int productQuantity = 0;
        try {
            // Thực hiện truy vấn để lấy giá trị quantity từ bảng Product
            String sql = "SELECT quantity FROM Product WHERE STT_PT = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sttPT);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productQuantity = rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return productQuantity;
    }

}
