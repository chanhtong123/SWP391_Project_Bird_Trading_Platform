package DAO;

import DTO.ProvinceDTO;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBHelper;

public class ProvinceDAO extends DBHelper {

    public List<ProvinceDTO> getAllProvinces() {
        List<ProvinceDTO> provinces = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Province";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProvinceDTO province = new ProvinceDTO();
                province.setProvinceId(rs.getInt("province_id"));
                province.setProvinceName(rs.getString("province_name"));
                province.setShippingCost(rs.getBigDecimal("shipping_cost"));
                provinces.add(province);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return provinces;
    }

    public ProvinceDTO getProvinceById(int id) {
        ProvinceDTO province = null;
        try {
            String sql = "SELECT * FROM Province WHERE province_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                province = new ProvinceDTO();
                province.setProvinceId(rs.getInt("province_id"));
                province.setProvinceName(rs.getString("province_name"));
                province.setShippingCost(rs.getBigDecimal("shipping_cost"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return province;
    }

    public boolean addProvince(ProvinceDTO province) {
        boolean success = false;
        try {
            String sql = "INSERT INTO Province (province_name, shipping_cost) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, province.getProvinceName());
            ps.setBigDecimal(2, province.getShippingCost());
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateProvince(ProvinceDTO province) {
        boolean success = false;
        try {
            String sql = "UPDATE Province SET province_name = ?, shipping_cost = ? WHERE province_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, province.getProvinceName());
            ps.setBigDecimal(2, province.getShippingCost());
            ps.setInt(3, province.getProvinceId());
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean deleteProvince(int id) {
        boolean success = false;
        try {
            String sql = "DELETE FROM Province WHERE province_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public int getProvinceIdByName(String provinceName) {
        int provinceId = 0;
        try {
            String sql = "SELECT province_id FROM Province WHERE province_name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, provinceName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                provinceId = rs.getInt("province_id");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return provinceId;
    }

    public BigDecimal getShippingCostByName(String provinceName) {
        BigDecimal shippingCost = null;
        try {
            String sql = "SELECT shipping_cost FROM Province WHERE province_name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, provinceName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                shippingCost = rs.getBigDecimal("shipping_cost");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return shippingCost;
    }
}
