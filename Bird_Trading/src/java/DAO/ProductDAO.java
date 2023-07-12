package DAO;

import DTO.ProductDTO;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBHelper;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ASUS
 */
public class ProductDAO extends DBHelper {

    public ArrayList<ProductDTO> getAllProducts() {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String sql = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                    + "FROM [Product] WHERE [status] <> 'Hidden'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO();
                p.setSttPT(rs.getInt("STT_PT"));
                p.setProductId(rs.getString("product_id"));
                p.setStoreId(rs.getString("store_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image_url"));
                p.setCategoryName(rs.getString("categoryName"));
                if (p.getQuantity() == 0) {
                    p.setStatus("Out of Stock");
                } else {
                    p.setStatus(rs.getString("status"));
                }
                products.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

   public ProductDTO increaseProductQuantityBySttPT(int sttPT, int quantity) {
    ProductDTO product = null;
    try {
        String sql = "UPDATE [Product] SET [quantity] = [quantity] + ? WHERE [STT_PT] = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, quantity);
        ps.setInt(2, sttPT);
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            product = getProductBySttPT(sttPT); // Gọi hàm khác để lấy thông tin sản phẩm đã được cập nhật
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return product;
}


    public ArrayList<ProductDTO> getAllProductsByProductId(String productId) {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String categoryQuery = "SELECT [categoryName] FROM [Product] WHERE [product_id] = ?";
            PreparedStatement categoryPs = connection.prepareStatement(categoryQuery);
            categoryPs.setString(1, productId);
            ResultSet categoryRs = categoryPs.executeQuery();
            String categoryName = null;
            if (categoryRs.next()) {
                categoryName = categoryRs.getString("categoryName");
            }

            if (categoryName != null) {
                String productsQuery = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                        + "FROM [Product] WHERE [categoryName] = ? AND [status] <> 'Hidden'";
                PreparedStatement productsPs = connection.prepareStatement(productsQuery);
                productsPs.setString(1, categoryName);
                ResultSet productsRs = productsPs.executeQuery();
                while (productsRs.next()) {
                    ProductDTO p = new ProductDTO();
                    p.setSttPT(productsRs.getInt("STT_PT"));
                    p.setProductId(productsRs.getString("product_id"));
                    p.setStoreId(productsRs.getString("store_id"));
                    p.setProductName(productsRs.getString("product_name"));
                    p.setDescription(productsRs.getString("description"));
                    p.setPrice(productsRs.getBigDecimal("price"));
                    p.setQuantity(productsRs.getInt("quantity"));
                    p.setImage(productsRs.getString("image_url"));
                    p.setCategoryName(productsRs.getString("categoryName"));
                    if (p.getQuantity() == 0) {
                        p.setStatus("Out of Stock");
                    } else {
                        p.setStatus(productsRs.getString("status"));
                    }
                    products.add(p);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public ProductDTO getProductByID(String productID) {
        ProductDTO product = null;
        try {
            String sql = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                    + "FROM [Product] WHERE [product_id] = ? AND [status] <> 'Hidden'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new ProductDTO();
                product.setSttPT(rs.getInt("STT_PT"));
                product.setProductId(rs.getString("product_id"));
                product.setStoreId(rs.getString("store_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setImage(rs.getString("image_url"));
                product.setCategoryName(rs.getString("categoryName"));
                product.setStatus(rs.getString("status"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return product;
    }

    public ArrayList<ProductDTO> getAllProductsByStoreId(String storeId) {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String sql = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                    + "FROM [Product] WHERE [status] <> 'Hidden' AND [store_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, storeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO();
                p.setSttPT(rs.getInt("STT_PT"));
                p.setProductId(rs.getString("product_id"));
                p.setStoreId(rs.getString("store_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image_url"));
                p.setCategoryName(rs.getString("categoryName"));
                if (p.getQuantity() == 0) {
                    p.setStatus("Out of Stock");
                } else {
                    p.setStatus(rs.getString("status"));
                }
                products.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public ArrayList<ProductDTO> getAllProductsByStoreIdINT(int storeId) {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String sql = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                    + "FROM [Product] WHERE [status] <> 'Hidden' AND [store_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, storeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO();
                p.setSttPT(rs.getInt("STT_PT"));
                p.setProductId(rs.getString("product_id"));
                p.setStoreId(rs.getString("store_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image_url"));
                p.setCategoryName(rs.getString("categoryName"));
                if (p.getQuantity() == 0) {
                    p.setStatus("Out of Stock");
                } else {
                    p.setStatus(rs.getString("status"));
                }
                products.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public static void main(String[] args) {
        // Tạo một đối tượng DAO để sử dụng phương thức getAllProductsByStoreId
        ProductDAO productDAO = new ProductDAO();

        // Gọi phương thức getAllProductsByStoreId với store_id = 2
        ArrayList<ProductDTO> products = productDAO.getAllProductsByStoreIdINT(2);

        // Hiển thị danh sách sản phẩm
        for (ProductDTO product : products) {
            System.out.println("Product ID: " + product.getProductId());
            System.out.println("Store ID: " + product.getStoreId());
            System.out.println("Product Name: " + product.getProductName());
            System.out.println("Description: " + product.getDescription());
            System.out.println("Price: " + product.getPrice());
            System.out.println("Quantity: " + product.getQuantity());
            System.out.println("Image URL: " + product.getImage());
            System.out.println("Category Name: " + product.getCategoryName());
            System.out.println("Status: " + product.getStatus());
            System.out.println("------------------------------------");
        }
    }

    public boolean createProduct(ProductDTO product) {
        boolean success = false;
        try {
            String sql = "INSERT INTO [Product] ([store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status]) "
                    + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            // ps.setString(1, product.getProductId());
            ps.setString(1, product.getStoreId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setBigDecimal(4, product.getPrice());
            ps.setInt(5, product.getQuantity());
            ps.setString(6, product.getImage());
            ps.setString(7, product.getCategoryName());
            ps.setString(8, product.getStatus());
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public boolean updateProduct(ProductDTO product) {
        boolean success = false;
        try {
            String sql = "UPDATE [Product] SET [store_id] = ?, [product_name] = ?, [description] = ?, [price] = ?, [quantity] = ?, [image_url] = ?, [categoryName] = ?, [status] = ? WHERE [product_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getStoreId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setBigDecimal(4, product.getPrice());

            // Kiểm tra nếu status là "Out of stock", cập nhật quantity thành 0, ngược lại giữ nguyên giá trị quantity
            if (product.getStatus().equals("Out of stock")) {
                ps.setInt(5, 0);
            } else {
                ps.setInt(5, product.getQuantity());
            }

            ps.setString(7, product.getCategoryName());
            ps.setString(8, product.getStatus());
            ps.setString(9, product.getProductId());

            // Kiểm tra nếu imageUrl khác null và không rỗng, thì cập nhật image_url
            if (product.getImage() != null && !product.getImage().isEmpty()) {
                ps.setString(6, product.getImage());
            } else {
                // Nếu imageUrl là null hoặc rỗng, giữ nguyên giá trị cũ của image_url trong database
                ps.setString(6, getProductImageUrl(product.getProductId())); // Thay "getProductImageUrl" bằng phương thức lấy giá trị image_url từ database
            }

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

// Phương thức này lấy giá trị image_url từ database dựa trên product_id
    private String getProductImageUrl(String productId) {
        String imageUrl = null;
        try {
            String sql = "SELECT [image_url] FROM [Product] WHERE [product_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                imageUrl = rs.getString("image_url");
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return imageUrl;
    }

    public boolean deleteProduct(ProductDTO product) {
        boolean success = false;
        try {
            String sql = "UPDATE [Product] SET [status] = 'Hidden' WHERE [product_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getProductId());

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public ArrayList<ProductDTO> searchProductsByName(String productName) {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String[] searchTerms = productName.split("\\s+"); // Tách các từ khóa tìm kiếm theo khoảng trắng
            StringBuilder sqlBuilder = new StringBuilder("SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] ")
                    .append("FROM [Product] WHERE 1 = 1 AND [status] <> 'Hidden'");

            for (String term : searchTerms) {
                sqlBuilder.append(" AND [product_name] COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ?");
            }

            String sql = sqlBuilder.toString();
            PreparedStatement ps = connection.prepareStatement(sql);

            for (int i = 0; i < searchTerms.length; i++) {
                ps.setString(i + 1, "%" + searchTerms[i] + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO();
                p.setSttPT(rs.getInt("STT_PT"));
                p.setProductId(rs.getString("product_id"));
                p.setStoreId(rs.getString("store_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image_url"));
                p.setCategoryName(rs.getString("categoryName"));
                p.setStatus(rs.getString("status"));
                products.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public ArrayList<ProductDTO> searchProductsByPriceRange(BigDecimal minPrice, BigDecimal maxPrice) {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String sql = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                    + "FROM [Product] WHERE [price] >= ? AND [price] <= ? AND [status] <> 'Hidden'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBigDecimal(1, minPrice);
            ps.setBigDecimal(2, maxPrice);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO();
                p.setSttPT(rs.getInt("STT_PT"));
                p.setProductId(rs.getString("product_id"));
                p.setStoreId(rs.getString("store_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image_url"));
                p.setCategoryName(rs.getString("categoryName"));
                p.setStatus(rs.getString("status"));
                products.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public ArrayList<ProductDTO> searchProductsByCategory(String categoryName) {
        ArrayList<ProductDTO> products = new ArrayList<>();
        try {
            String sql = "SELECT [STT_PT], [product_id], [store_id], [product_name], [description], [price], [quantity], [image_url], [categoryName], [status] "
                    + "FROM [Product] WHERE [categoryName] = ? AND [status] <> 'Hidden'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO();
                p.setSttPT(rs.getInt("STT_PT"));
                p.setProductId(rs.getString("product_id"));
                p.setStoreId(rs.getString("store_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImage(rs.getString("image_url"));
                p.setCategoryName(rs.getString("categoryName"));
                p.setStatus(rs.getString("status"));
                products.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public List<ProductDTO> searchProductsByPriceRange(List<ProductDTO> searchResults, BigDecimal minPrice, BigDecimal maxPrice) {
        List<ProductDTO> products = new ArrayList<>();
        for (ProductDTO product : searchResults) {
            BigDecimal price = product.getPrice();
            if (price.compareTo(minPrice) >= 0 && price.compareTo(maxPrice) <= 0) {
                products.add(product);
            }
        }
        return products;
    }

    public boolean updateProductQuantity(int sttPT, int quantity) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE Product SET quantity = ?, status = CASE WHEN quantity > 0 THEN status ELSE 'Out of Stock' END WHERE STT_PT = ?");
            ps.setInt(1, quantity);
            ps.setInt(2, sttPT);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateProductQuantityAfterDelivery(int sttPT, int quantity) {
        try {
            // Lấy quantity hiện tại của product
            String getProductQuantitySql = "SELECT quantity FROM Product WHERE STT_PT = ?";
            PreparedStatement getProductQuantityPs = connection.prepareStatement(getProductQuantitySql);
            getProductQuantityPs.setInt(1, sttPT);
            ResultSet productQuantityResult = getProductQuantityPs.executeQuery();

            if (productQuantityResult.next()) {
                int currentQuantity = productQuantityResult.getInt("quantity");
                int updatedQuantity = currentQuantity - quantity;

                // Cập nhật quantity mới cho product sau khi giao hàng
                String updateProductQuantitySql = "UPDATE Product SET quantity = ? WHERE STT_PT = ?";
                PreparedStatement updateProductQuantityPs = connection.prepareStatement(updateProductQuantitySql);
                updateProductQuantityPs.setInt(1, updatedQuantity);
                updateProductQuantityPs.setInt(2, sttPT);
                updateProductQuantityPs.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ProductDTO getProductBySttPT(int sttPT) {
        ProductDTO product = null;
        try {
            String sql = "SELECT * FROM Product WHERE STT_PT = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sttPT);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new ProductDTO();
                product.setSttPT(rs.getInt("STT_PT"));
                product.setProductId(rs.getString("product_id"));
                product.setStoreId(rs.getString("store_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setImage(rs.getString("image_url"));
                product.setCategoryName(rs.getString("categoryName"));
                product.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public int countProductsByStoreId(int storeId) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM Product WHERE store_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, storeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int checkTotalProductQuantityByStoreId(int storeId) {
        int totalQuantity = 0;
        try {
            String sql = "SELECT SUM(quantity) AS total_quantity FROM Product WHERE store_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, storeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalQuantity = rs.getInt("total_quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalQuantity;
    }

    public int countVisibleProducts() {
        int count = 0;

        try {
            String query = "SELECT COUNT(product_id) AS visibleProductCount FROM Product WHERE [status] <> 'Hidden'";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt("visibleProductCount");
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

}
