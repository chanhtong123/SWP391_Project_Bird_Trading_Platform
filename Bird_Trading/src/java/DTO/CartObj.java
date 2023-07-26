/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import DTO.ProductDTO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class CartObj {

    private Map<ProductDTO, Integer> items;

    public CartObj() {
        items = new HashMap<>();
    }

    public Map<ProductDTO, Integer> getItems() {
        return items;
    }

    public void addItem(ProductDTO product) {
        if (product == null) {
            return;
        }

        if (this.items == null) {
            this.items = new HashMap<>();
        }

        int quantity = 1;

        if (this.items.containsKey(product)) {
            quantity = this.items.get(product) + 1;
        }

        this.items.put(product, quantity);
    }

    public void updateQuantity(ProductDTO product, int quantity) {
         if (product == null || quantity <= 0) {
            return;
        }

        if (this.items == null) {
            return;
        }

        if (this.items.containsKey(product)) {
            this.items.put(product, quantity);
        }
    }

    public List<ProductDTO> showItems() {
        List<ProductDTO> productList = new ArrayList<>();
        for (Map.Entry<ProductDTO, Integer> entry : items.entrySet()) {
            ProductDTO product = entry.getKey();
            productList.add(product);
        }
        return productList;
    }

    public void removeItem(ProductDTO product) {
        if (this.items == null) {
            return;
        }

        this.items.remove(product);

        if (this.items.isEmpty()) {
            this.items = null;
        }
    }

//    public double getTotalPrice() {
//        double totalPrice = 0;
//        for (Map.Entry<ProductDTO, Integer> entry : items.entrySet()) {
//            ProductDTO product = entry.getKey();
//            int quantity = entry.getValue();
//            totalPrice += product.getPrice() * quantity;
//        }
//        return totalPrice;
//    }
    
    public boolean containsProduct(ProductDTO product) {
    List<ProductDTO> productList = showItems();
    return productList.contains(product);
    }
    
    public int getQuantityByProduct(ProductDTO product) {
        if (product == null || this.items == null) {
            return 0;
        }

        if (this.items.containsKey(product)) {
            return this.items.get(product);
        }

        return 0;
    }
    
}
//    public void addItem(ProductDTO product) {
//        if (items.containsKey(product)) {
//            int quantity = items.get(product);
//            items.put(product, quantity + 1);
//        } else {//            items.put(product, 1);
//        }
//    }
//    
//    public List<ProductDTO> showItems() {
//        List<ProductDTO> productList = new ArrayList<>();
//        for (Map.Entry<ProductDTO, Integer> entry : items.entrySet()) {
//            ProductDTO product = entry.getKey();
//            productList.add(product);
//        }
//        return productList;
//    }
//
//    public void removeItem(ProductDTO product) {
//        items.remove(product);
//    }
//
//    public double getTotalPrice() {
//        double totalPrice = 0;
//        for (Map.Entry<ProductDTO, Integer> entry : items.entrySet()) {
//            ProductDTO product = entry.getKey();
//            int quantity = entry.getValue();
//            totalPrice += product.getPrice() * quantity;
//        }
//        return totalPrice;
//    }

//    private Map<ProductDTO, Integer> items;
//    
//    public Map<ProductDTO, Integer> getItems() {
//        return items;
//    }
//
//    public void addItemToCart(String productID)
//            throws SQLException, NamingException {
//        // 1. Checking items has existed
//        if (productID == null) {
//            return;
//        }
//
//        if (productID.trim().isEmpty()) {
//            return;
//        }
//
//        if (this.items == null) {
//            this.items = new HashMap<>();
//        }
//
//        // 2. Checking item exists in items
//        int quantity = 1;
//        ProductDAO productDAO = new ProductDAO();
//        ProductDTO productDTO = productDAO.getProductByID(productID);
//
//        if (productDTO != null && this.items.containsKey(productDTO)) {
//            quantity = this.items.get(productDTO) + 1;
//        }
//
//        // 3. Update items
//        this.items.put(productDTO, quantity);
//    }
//
//    public void removeItemByProductID(String productID)
//            throws SQLException, NamingException {
//        // 1. Checking items has existed
//        if (this.items == null) {
//            return;
//        }
//
//        // 2. Checking item exists in cart
//        ProductDAO productDAO = new ProductDAO();
//        ProductDTO productDTO = productDAO.getProductByID(productID);
//
//        if (this.items.containsKey(productDTO)) {
//            this.items.remove(productDTO);
//            if (this.items.isEmpty()) {
//                this.items = null;
//            }
//        }
//    }
//
//    public void removeItemsForCheckOut(ProductDTO productDTO) {
//        if (this.items == null) {
//            return;
//        }
//
//        if (this.items.containsKey(productDTO)) {
//            this.items.remove(productDTO);
//            if (this.items.isEmpty()) {
//                this.items = null;
//            }
//        }
//    }
//
//    public Map<ProductDTO, Integer> showCheckedItems(String[] productIDs)
//            throws SQLException, NamingException {
//        if (this.items == null) {
//            return null;
//        }
////        Map<ProductDTO, Integer> list = new HashMap<>();
//        ProductDAO productDAO = new ProductDAO();
//
//        for (String productID : productIDs) {
//            ProductDTO productDTO = productDAO.getProductByID(productID);
//            if (productDTO != null) {
//                list.put(productDTO, items.get(productDTO));
//            }
//        }
//
//        return list;
//    }

//    public int checkOutItemsOfCart(String name, String address, String total,
//            Map<ProductDTO, Integer> checkedItems)
//            throws SQLException, NamingException {
//        if (this.items == null) {
//            return -1;
//        }
//
//        OrdersDAO ordersDAO = new OrdersDAO();
//        int orderID = ordersDAO.createNewOrder(name, address, total);
//        if (orderID > 0) {
//            OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
//            boolean result
//                    = orderDetailsDAO.createOrderDetails(orderID, checkedItems);
//            if (result) {
//                return orderID;
//            }
//        }
//        return -1;
//    }

//    public int getQuantityByProductID(String productID) {
//        if (productID == null || productID.trim().isEmpty()) {
//            return 0;
//        }
//
//        if (this.items == null) {
//            return 0;
//        }
//
//        int quantity = 0;
//
//        for (ProductDTO dto : this.items.keySet()) {
//            if (productID.equals(dto.getProductID())) {
//                quantity = this.items.get(dto);
//                return quantity;
//            }
//        }
//
//        return 0;
//    }

//    public List<OrderDetailsDTO> addItemsToOrderDetailsDTO(Map<ProductDTO, Integer> checkedItems, int orderID) {
//        List<OrderDetailsDTO> list = new ArrayList<>();
//
//        for (ProductDTO productDTO : checkedItems.keySet()) {
//            String productID = productDTO.getProductID();
//            String productName = productDTO.getProductName();
//            BigDecimal price = new BigDecimal(productDTO.getPrice());
//            int quantity = checkedItems.get(productDTO);
//            BigDecimal total = price.multiply(new BigDecimal(quantity));
//
//            OrderDetailsDTO orderDetailsDTO
//                    = new OrderDetailsDTO(orderID, productID, productName, price, quantity, total);
//
//            list.add(orderDetailsDTO);
//        }
//
//        return list;
//    }