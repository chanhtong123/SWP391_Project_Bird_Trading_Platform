package DTO;

import java.math.BigDecimal;

public class DeliveryDTO {

    private int deliveryId;
    private int provinceId;
    private int userId;
    private BigDecimal totalAmount;
    private BigDecimal shippingCost;
    private String address;
    private String provinceName;
    private String receiverName;
    private String phoneNumber;

    public DeliveryDTO() {
    }

    public DeliveryDTO(int deliveryId, int provinceId, int userId, BigDecimal totalAmount, BigDecimal shippingCost, String address, String provinceName, String receiverName, String phoneNumber) {
        this.deliveryId = deliveryId;
        this.provinceId = provinceId;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.shippingCost = shippingCost;
        this.address = address;
        this.provinceName = provinceName;
        this.receiverName = receiverName;
        this.phoneNumber = phoneNumber;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}
