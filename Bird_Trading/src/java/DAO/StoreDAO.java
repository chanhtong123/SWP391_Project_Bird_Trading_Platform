package DAO;

import DTO.ProductDTO;
import DTO.StoreDTO;
import DTO.StoreRegisterDTO;
import DTO.UserDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBHelper;

public class StoreDAO extends DBHelper {

    public StoreDTO checkStoreToGetUserId(int userId) throws SQLException {
        try {
            String sql = "SELECT Store.store_id, Store.store_name, Store.address, Store.phone_number, Store.image, [User].user_id\n"
                    + "FROM     Store INNER JOIN\n"
                    + "                  [User] ON Store.user_id = [User].user_id\n"
                    + "WHERE [User].user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String storeId = rs.getString("store_id");
                String storeName = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, userId, image);
                return store;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getStoreNameByStoreId(String storeId) {
    try {
        String sql = "SELECT store_name FROM Store WHERE store_id = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, storeId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getString("store_name");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}

    public List<StoreDTO> getAllStores() throws SQLException {
        List<StoreDTO> stores = new ArrayList<>();
        try {
            String sql = "SELECT Store.store_id, Store.store_name, Store.address, Store.phone_number, Store.image, [User].user_id\n"
                    + "FROM     Store INNER JOIN\n"
                    + "                  [User] ON Store.user_id = [User].user_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String storeId = rs.getString("store_id");
                String storeName = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                int userId = rs.getInt("user_id");
                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, userId, image);
                stores.add(store);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stores;
    }

    public StoreDTO getStoreByIdStore(String storeId) throws SQLException {
        try {
            String sql = "SELECT store_id, store_name, address, phone_number, image, user_id FROM Store WHERE store_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String storeName = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                int userId = rs.getInt("user_id");
                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, userId, image);
                return store;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getUserIdByStoreId(String storeId) throws SQLException {
        try {
            String sql = "SELECT user_id FROM Store WHERE store_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                return userId;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Trả về giá trị mặc định hoặc một giá trị đại diện cho việc không tìm thấy userId.
    }

    

    public StoreDTO getStoreByIdUser(int userId) throws SQLException {
        try {
            String sql = "SELECT store_id, store_name, address, phone_number, image FROM Store WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String storeId = rs.getString("store_id");
                String storeName = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, userId, image);
                return store;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int countStoreId() {
        int count = 0;

        try {
            String query = "SELECT COUNT(store_id) AS storeCount FROM Store";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt("storeCount");
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public int getStoreIdByUserId(int userId) {
        int storeId = 0;
        try {
            String query = "SELECT store_id FROM Store WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                storeId = resultSet.getInt("store_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return storeId;
    }

    public ArrayList<StoreRegisterDTO> getAllStoreRegister() {
        ArrayList<StoreRegisterDTO> storeForm = new ArrayList<>();
        try {
            String sql = "SELECT [store_register_id], [store_name], [address], [phone_number], [user_id] "
                    + "FROM [StoreRegister]";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StoreRegisterDTO storeRegister = new StoreRegisterDTO();
                storeRegister.setStore_register_id(rs.getString("store_register_id"));
                storeRegister.setStore_name(rs.getString("store_name"));
                storeRegister.setAddress(rs.getString("address"));
                storeRegister.setPhone_number(rs.getString("phone_number"));
                storeRegister.setUser_id(rs.getInt("user_id"));
                storeForm.add(storeRegister);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return storeForm;
    }

    public boolean createStoreForm(StoreRegisterDTO storeForm) {
        boolean result = false;
        try {
            //2. Write SQL command
            String sql = "INSERT INTO StoreRegister (store_name, [address], phone_number, user_id)\n"
                    + "VALUES \n"
                    + "  (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeForm.getStore_name());
            stm.setString(2, storeForm.getAddress());
            stm.setString(3, storeForm.getPhone_number());
            stm.setInt(4, storeForm.getUser_id());
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        }//end connection has existed
        catch (SQLException e) {

        }
        return result;
    }

    public boolean deleteStoreForm(String storeRegisterId) {
        boolean result = false;
        try {
            //2. Write SQL command
            String sql = "DELETE FROM StoreRegister WHERE store_register_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeRegisterId);
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        }//end connection has existed
        catch (SQLException e) {

        }
        return result;
    }

    public boolean createStore(StoreDTO store) {
        boolean result = false;
        try {
            //2. Write SQL command
            String sql = "INSERT INTO Store (store_name, [address], phone_number, user_id)\n"
                    + "VALUES \n"
                    + "  (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, store.getStore_name());
            stm.setString(2, store.getAddress());
            stm.setString(3, store.getPhone_number());
            stm.setInt(4, store.getUser_id());
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        }//end connection has existed
        catch (SQLException e) {

        }
        return result;
    }

    public boolean updateUserRole(UserDTO user) {
        boolean success = false;
        try {
            String sql = "UPDATE [User] SET role = 'Store Manager' WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user.getUserId());
            stm.executeUpdate();
            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateStore(StoreDTO store) {
        boolean success = false;
        try {
            String sql = "UPDATE [Store] SET store_name = ?, [address] = ?, phone_number = ?, image = ? WHERE store_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, store.getStore_name());
            stm.setString(2, store.getAddress());
            stm.setString(3, store.getPhone_number());

            // Kiểm tra nếu imageUrl khác null và không rỗng, thì cập nhật image
            if (store.getImage() != null && !store.getImage().isEmpty()) {
                stm.setString(4, store.getImage());
            } else {
                // Nếu imageUrl là null hoặc rỗng, giữ nguyên giá trị cũ của image trong database
                stm.setString(4, getStoreImage(store.getStore_id())); // Thay "getStoreImage" bằng phương thức lấy giá trị image từ database
            }

            stm.setString(5, store.getStore_id());

            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public String getStoreImage(String storeId) {
        String imageUrl = null;
        try {
            String sql = "SELECT image FROM [Store] WHERE store_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                imageUrl = rs.getString("image");
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return imageUrl;
    }

    public ArrayList<StoreDTO> searchStoreByName(String storeName) throws SQLException {
        ArrayList<StoreDTO> searchResults = new ArrayList<>();

        try {
            String sql = "SELECT store_id, store_name, address, phone_number, user_id, image "
                    + "FROM Store "
                    + "WHERE store_name LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + storeName + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String storeId = rs.getString("store_id");
                String name = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                int userId = rs.getInt("user_id");

                StoreDTO store = new StoreDTO(storeId, name, address, phoneNumber, userId, image);
                searchResults.add(store);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return searchResults;
    }

    public StoreDTO checkStoreRegister(String storeName) throws SQLException {
        try {
            String sql = "SELECT [store_id]\n"
                    + "      ,[store_name]\n"
                    + "      ,[address]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[user_id]\n"
                    + "  FROM [Store] \n"
                    + "  WHERE [store_name] = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String storeId = rs.getString("store_id");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, 0, sql);
                return store;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public StoreDTO getStoreById(String storeId) throws SQLException {
        try {
            String sql = "SELECT store_id, store_name, address, phone_number, image, user_id "
                    + "FROM Store "
                    + "WHERE store_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, storeId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                String storeName = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                int userId = rs.getInt("user_id");

                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, userId, image);
                return store;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public StoreDTO getStoreByProductId(String productId) throws SQLException {
        try {
            String sql = "SELECT s.store_id, s.store_name, s.address, s.phone_number, s.image, s.user_id "
                    + "FROM Store s "
                    + "INNER JOIN Product p ON s.store_id = p.store_id "
                    + "WHERE p.product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                String storeId = rs.getString("store_id");
                String storeName = rs.getString("store_name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String image = rs.getString("image");
                int userId = rs.getInt("user_id");

                StoreDTO store = new StoreDTO(storeId, storeName, address, phoneNumber, userId, image);
                return store;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public String getStoreIdByProductId(String productId) throws SQLException {
        try {
            String sql = "SELECT s.store_id "
                    + "FROM Store s "
                    + "INNER JOIN Product p ON s.store_id = p.store_id "
                    + "WHERE p.product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                String storeId = rs.getString("store_id");
                return storeId;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    ArrayList<ProductDTO> getAllProductsByStoreId(String storeId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
