package DAO;

import DTO.UserDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBHelper;
//import utils.GooglePojo;
//import utils.GoogleUtils;

/**
 *
 * @author GRAM
 */
public class UserDAO extends DBHelper {

    public boolean createUser(UserDTO user) {

        boolean result = false;
        try {
            //2. Write SQL command
            String sql = "INSERT INTO [User] (username, fullname, password, email, address, phone_number, role) VALUES ( ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getFullname());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setString(6, user.getPhoneNumber());
            stm.setString(7, user.getRole());
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        }//end connection has existed
        catch (SQLException e) {

        }
        return result;
    }

    public UserDTO checkLogin(String email, String password) {
        ResultSet rs = null;
        UserDTO result = null;
        try {

            String sql = "SELECT [username]\n"
                    + "      , [fullname]\n"
                    + "      ,[user_id]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[address]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[role]\n"
                    + "  FROM [Bird_Trading].[dbo].[User] \n"
                    + "  WHERE email = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String role = rs.getString("role");
                result = new UserDTO(userId, username, fullname, password, email, address, phoneNumber, role);
            }
        } catch (SQLException e) {

        }
        return result;
    }
//
//    public UserDTO checkGoogleLogin(String googleIdToken) {
//        ResultSet rs = null;
//        UserDTO result = null;
//        try {
//            // Verify Google ID token and get user info
//            String accessToken = GoogleUtils.getToken(googleIdToken);
//            GooglePojo userInfo = GoogleUtils.getUserInfo(accessToken);
//
//            String email = userInfo.getEmail();
//            // Check if the email exists in the database
//            // Perform any additional checks or validations if needed
//
//            // Assuming you have a database connection, you can execute a query to fetch user details
//            String sql = "SELECT [user_id], [username], [address], [phone_number], [role] FROM [Bird_Trading].[dbo].[User] WHERE email = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, email);
//            rs = stm.executeQuery();
//            if (rs.next()) {
//                int userId = rs.getInt("user_id");
//                String username = rs.getString("username");
//                String address = rs.getString("address");
//                String phoneNumber = rs.getString("phone_number");
//                String role = rs.getString("role");
//                result = new UserDTO(userId, username, "", email, address, phoneNumber, role);
//            }
//        } catch (IOException | SQLException e) {
//            // Handle any exceptions that may occur
//        }
//        return result;
//    }

    public ArrayList<UserDTO> getAllUsers() {
        ResultSet rs = null;
        ArrayList<UserDTO> users = new ArrayList<>();
        try {
            String query = "SELECT [user_id], [username], [fullname], [password], [email], [address], [phone_number], [role]\n"
                    + "FROM [User]\n"
                    + "WHERE [role] <> 'Admin'";
            PreparedStatement stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String role = rs.getString("role");
                UserDTO user = new UserDTO(userId, username, fullname, password, email, address, phoneNumber, role);
                users.add(user);
            }

        } catch (SQLException ex) {

        }
        return users;
    }

    public UserDTO getUserById(int userId) {
        ResultSet rs = null;
        UserDTO result = null;
        try {

            String sql = "SELECT [user_id]\n"
                    + "      ,[username]\n"
                    + "      ,[fullname]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[address]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[role]\n"
                    + "  FROM [Bird_Trading].[dbo].[User] "
                    + "WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            rs = stm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String role = rs.getString("role");
                result = new UserDTO(userId, username, fullname, password, email, address, phoneNumber, role);
            }
        } catch (SQLException ex) {

        }
        return result;
    }

    public UserDTO getUserByEmail(String email) {
        ResultSet rs = null;
        UserDTO result = null;
        try {

            String sql = "SELECT [user_id]\n"
                    + "      ,[username]\n"
                    + "      ,[fullname]\n"
                    + "      ,[password]\n"
                    + "      ,[user_id]\n"
                    + "      ,[address]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[role]\n"
                    + "  FROM [Bird_Trading].[dbo].[User] "
                    + "WHERE email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String password = rs.getString("password");
                int userId = rs.getInt("user_id");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phone_number");
                String role = rs.getString("role");
                result = new UserDTO(userId, username, fullname, password, email, address, phoneNumber, role);
            }
        } catch (SQLException ex) {

        }
        return result;
    }

    public boolean updateUser(UserDTO user) {
        boolean success = false;
        try {
            String sql = "UPDATE [User] SET username = ?, fullname = ?, password = ?, email = ?, address = ?, phone_number = ?, role = ? WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getFullname());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setString(6, user.getPhoneNumber());
            stm.setString(7, user.getRole());
            stm.setInt(8, user.getUserId());

            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean deleteUser(int userId) {
        boolean success = false;
        try {
            String query = "DELETE FROM [Bird_Trading].[dbo].[User] WHERE user_id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, userId);
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        ArrayList<UserDTO> users = userDAO.getAllUsers();
        for (UserDTO u : users) {
            System.out.println("User ID: " + u.getUserId());
            System.out.println("Username: " + u.getFullname());
            System.out.println("Password: " + u.getPassword());
            System.out.println("Role: " + u.getRole());
            System.out.println("-----------------------");
        }
    }
}
