/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author ASUS
 */
public class ProvinceDTO {
     private int provinceId;
    private String provinceName;
    private BigDecimal shippingCost;
  

    public ProvinceDTO() {
    }

    public ProvinceDTO(int provinceId, String provinceName, BigDecimal shippingCost ) {
        this.provinceId = provinceId;
        this.provinceName = provinceName;
        this.shippingCost = shippingCost;
      
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public BigDecimal getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
    }

    
}
