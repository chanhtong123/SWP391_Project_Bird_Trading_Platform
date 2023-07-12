package DTO;

import java.math.BigDecimal;
import java.util.Date;

public class OrderItemDTO {

    private int orderItemId;
    private int orderId;
    private int sttPT;
    private int storeId;
    private int quantity;
    private BigDecimal price;
    private String productName;
    private String imageUrl;
    private String categoryName;
    private Date orderItem_date;
    private String status;

    public OrderItemDTO() {
    }

    public OrderItemDTO(int orderItemId, int orderId, int sttPT, int storeId, int quantity, BigDecimal price, String productName, String imageUrl, String categoryName, Date orderItem_date, String status) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.sttPT = sttPT;
        this.storeId = storeId;
        this.quantity = quantity;
        this.price = price;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.categoryName = categoryName;
        this.orderItem_date = orderItem_date;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

  
    
    
    public Date getOrderItem_date() {
        return orderItem_date;
    }

    public void setOrderItem_date(Date orderItem_date) {
        this.orderItem_date = orderItem_date;
    }

   

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getSttPT() {
        return sttPT;
    }

    public void setSttPT(int sttPT) {
        this.sttPT = sttPT;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

  
}
