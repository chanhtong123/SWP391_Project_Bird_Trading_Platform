<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <!-- Add your CSS and JavaScript files -->
</head>
<body>
    <div class="container">
        <h1>Order Successful!</h1>
        <p>Your order has been placed successfully. Thank you for your purchase!</p>
        <h2>Order Details</h2>
        <table>
            <tr>
                <th>Order ID:</th>
                <td>${order.orderId}</td>
            </tr>
            <tr>
                <th>User ID:</th>
                <td>${order.userId}</td>
            </tr>
            <tr>
                <th>Shipping Address:</th>
                <td>${order.shippingAddress}</td>
            </tr>
            <tr>
                <th>Total Amount:</th>
                <td>${order.totalAmount}</td>
            </tr>
            <tr>
                <th>Status:</th>
                <td>${order.orderStatus}</td>
            </tr>
        </table>
    </div>
</body>
</html>
