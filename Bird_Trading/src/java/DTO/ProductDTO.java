package DTO;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProductDTO implements Serializable {

    private int sttPT;
    private String productId;
    private String storeId;
    private String productName;
    private String description;
    private BigDecimal price;
    private int quantity;
    private String image;
    private String categoryName;
    private String status;
    private int soldNumber;

    public ProductDTO() {
    }

    public ProductDTO(int sttPT, String productId, String storeId, String productName, String description, BigDecimal price, int quantity, String image, String categoryName, String status, int soldNumber) {
        this.sttPT = sttPT;
        this.productId = productId;
        this.storeId = storeId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categoryName = categoryName;
        this.status = status;
        this.soldNumber = soldNumber;
    }

    
    
    public ProductDTO(int sttPT, String productId, String storeId, String productName, String description, BigDecimal price, int quantity, String image, String categoryName, String status) {
        this.sttPT = sttPT;
        this.productId = productId;
        this.storeId = storeId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categoryName = categoryName;
        this.status = status;
    }

    public int getSttPT() {
        return sttPT;
    }

    public void setSttPT(int sttPT) {
        this.sttPT = sttPT;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSoldNumber() {
        return soldNumber;
    }

    public void setSoldNumber(int soldNumber) {
        this.soldNumber = soldNumber;
    }
    
    

}
