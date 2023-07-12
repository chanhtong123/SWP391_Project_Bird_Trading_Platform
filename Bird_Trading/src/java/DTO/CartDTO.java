package DTO;

import java.math.BigDecimal;

public class CartDTO {

    private int cartItemId;
    private int sttPT;
    private String productName;
    private BigDecimal price;
    private int quantity;
    private String imageUrl;
    private int userId;

    public CartDTO() {
    }

    public CartDTO(int cartItemId, int sttPT, String productName, BigDecimal price, int quantity, String imageUrl, int userId) {
        this.cartItemId = cartItemId;
        this.sttPT = sttPT;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.userId = userId;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getSttPT() {
        return sttPT;
    }

    public void setSttPT(int sttPT) {
        this.sttPT = sttPT;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
