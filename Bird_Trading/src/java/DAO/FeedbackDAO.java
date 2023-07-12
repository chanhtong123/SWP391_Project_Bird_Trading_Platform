/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.FeedbackDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.DBHelper;

/**
 *
 * @author GRAM
 */
public class FeedbackDAO extends DBHelper {

    public boolean createFeedback(FeedbackDTO feedback) {
        boolean success = false;
        try {
            String sql = "INSERT INTO Feedback (order_item_id, user_id, rating, comment) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, feedback.getOrderItemId());
            statement.setInt(2, feedback.getUserId());
            statement.setInt(3, feedback.getRating());
            statement.setString(4, feedback.getComment());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public List<FeedbackDTO> getFeedbackByOrderItemId(int orderItemId) {
        List<FeedbackDTO> feedbackList = new ArrayList<>();
        try {
            String sql = "SELECT [feedback_id]\n"
                    + "      ,[order_item_id]\n"
                    + "      ,[user_id]\n"
                    + "      ,[rating]\n"
                    + "      ,[comment]\n"
                    + "      ,[timestamp] "
                    + "FROM Feedback WHERE order_item_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderItemId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int feedbackId = resultSet.getInt("feedback_id");
                int userId = resultSet.getInt("user_id");
                int rating = resultSet.getInt("rating");
                String comment = resultSet.getString("comment");
                Date timstamp = resultSet.getDate("timestamp");
                FeedbackDTO feedback = new FeedbackDTO(feedbackId, orderItemId, userId, rating, comment, timstamp);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public boolean isFeedbackSent(int orderItemId) {
        boolean isSent = false;
        try {
            String sql = "SELECT COUNT(*) FROM Feedback WHERE order_item_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderItemId);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                isSent = (count > 0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSent;
    }

}
