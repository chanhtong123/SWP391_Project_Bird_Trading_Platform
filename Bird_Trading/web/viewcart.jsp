<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/product-content.css">
        <link rel="stylesheet" href="styles/body.css">
        <link rel="stylesheet" href="styles/view-cart.css">
    </head>
    <body>
        <header class="header"> 
            <nav class="nav-bar">
                <div class="left-section">                
                    <a href="ProductServlet?action=list">Quản lý sản phẩm</a>
                </div>
                <div class="right-section">
                    <div class="subnav">
                        <a href="" class="right-section-item">Thông báo</a>
                        <div class="subnav-content">            
                            <h4 class="notification-message">Đăng nhập để xem thông báo</h4>
                            <div class="link-login">
                                <a class="subnav-login" href="UserServlet?action=showSignupForm">Đăng ký</a>
                                <a href="UserServlet?action=showLoginForm">Đăng nhập</a>       
                            </div> 
                        </div>  
                    </div>
                    <a href="" class="right-section-item">Hỗ trợ</a>
                    <a href="UserServlet?action=showSignupForm" class="right-section-item">Đăng ký</a>
                    <a href="UserServlet?action=showLoginForm" class="right-section-item">Đăng nhập</a>
                </div>
            </nav>
            <div class="container-header-with-search">
                <div class="header-with-search">
                    <a href="HomeServlet"><img src="images/logo.svg" alt="" class="logo-image"></a>
                    <div class="middle-search-section">      
                        <div class="search-bar">
                            <form action="">
                                <input type="text" class="search-input" placeholder="Tìm kiếm">         
                            </form>
                            <button class="search-button"><img class="search-button-logo" src="images/search-button1.png" alt=""></button>   
                        </div>                 
                    </div>
                    <div class="cart-section">
                        <a href="viewcart.jsp" class="cart-link"><img class="cart-logo" src="images/cart-logo.jfif" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="category-section">
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
            </div>
        </header>

        <style>
            body {
                margin: 0;
                padding: 0;
            }

            .main-grid {
                display: grid;
                place-items: center;
                min-height: 100vh;
            }

            .cart-container {
                width: 80%;
                max-width: 1200px;
                padding: 20px;
                margin: 0 auto;
                background-color: #f5f5f5;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .cart-title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .cart-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .cart-table th,
            .cart-table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .cart-table th {
                background-color: #f2f2f2;
            }

            .product-image {
                max-width: 100px;
                max-height: 100px;
            }

            .total-price {
                font-size: 18px;
                font-weight: bold;
            }
        </style>

        <div class="main-grid">
            <h1>Giỏ hàng</h1>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th></th> <!-- Added column for remove button -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${CART.items}">
                        <tr>
                            <td><img src="${item.key.image_url}" alt="Hình ảnh sản phẩm" class="product-image"></td>
                            <td>${item.key.product_name}</td>
                            <td>${item.key.price}</td>
                            <td>
                                <form action="CartServlet?action=update" method="POST"> <!-- Updated form action to CartServlet -->
                                    <input type="hidden" name="productID" value="${item.key.product_id}">
                                    <input type="number" name="quantity" value="${item.value}" min="1" max="100">
                                    <input type="submit" value="Cập nhật">
                                </form>
                            </td>

                            </td>
                            <td>
                                <form action="CartServlet?action=remove" method="POST"> <!-- Added form for remove action -->
                                    <input type="hidden" name="productID" value="${item.key.product_id}">
                                    <input type="submit" value="Xóa">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3 class="total-price">Tổng giá: ${CART.totalPrice}</h3>
            <a href="CheckoutServlet">Thanh toán</a>
        </div>


    </body>
</html>

</body>
</html>


<%--
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/product-content.css">
    <link rel="stylesheet" href="styles/body.css">
    <link rel="stylesheet" href="styles/view-cart.css">
</head>
<body>
    <header class="header"> 
        <nav class="nav-bar">
          <div class="left-section">                
            <a href="ProductServlet?action=list">Quản lý sản phẩm</a>
          </div>
          <div class="right-section">
            <div class="subnav">
            <a href="" class="right-section-item">Thông báo</a>
            <div class="subnav-content">            
                <h4 class="notification-message">Đăng nhập để xem thông báo</h4>
                <div class="link-login">
                <a class="subnav-login" href="UserServlet?action=showSignupForm">Đăng ký</a>
              <a  href="UserServlet?action=showLoginForm">Đăng nhập</a>       
            </div> 
            </div>  
          </div>
            <a href="" class="right-section-item">Hỗ trợ</a>
            <a href="UserServlet?action=showSignupForm" class="right-section-item">Đăng ký</a>
            <a href="UserServlet?action=showLoginForm" class="right-section-item">Đăng nhập</a>
          </div>
        </nav>
        <div>       
            <div class="container-header-with-search">
                <div class="header-with-search">
                    <a href="HomeServlet"><img src="images/logo.svg" alt="" class="logo-image"></a>
                    <div class="middle-search-section">      
                        <div class="search-bar">
                            <form action="">
                                <input type="text" class="search-input" placeholder="Tìm kiếm">         
                            </form>
                            <button class="search-button"><img class="search-button-logo" src="images/search-button1.png" alt=""></button>   
                        </div>                 
                    </div>
                    <div>          
                    </div>      
                    <div class="cart-section">
<a href="viewcart.jsp" class="cart-link"><img class="cart-logo" src="images/cart-logo.jfif" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="category-section">
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
                <a class="category" href="">category</a>
            </div>
        </header>
    
    <main>
        <h1>Giỏ hàng</h1>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${CART.items}">
                    <tr>
                        <td><img src="${item.key.image_url}" alt="Hình ảnh sản phẩm" height="50"></td>
                        <td>${item.key.product_name}</td>
                        <td>${item.key.price}</td>
                        <td>${item.value}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p>Tổng giá trị đơn hàng: ${CART.totalPrice}</p>
    </main>
</body>
</html>
--%>