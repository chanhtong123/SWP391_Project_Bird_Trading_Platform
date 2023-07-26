<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Bird Trading</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">


        <style>
            .custom-button {
                background-color: #ffcc00 ;
                color: black;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-weight: bold;
                /* Các thuộc tính CSS khác tùy chỉnh theo nhu cầu */
            }
        </style>
    </head>

  <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-1 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center h-100">

                        <!--<a class="text-body mr-3" href="">Contact</a>
                            <a class="text-body mr-3" href="">Help</a>-->

                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <!--                        <div class="btn-group">
                                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <button class="dropdown-item" onclick="location.href = 'UserServlet?action=showLoginForm';" type="button">Sign in</button>
                                                        <button class="dropdown-item" onclick="location.href = 'UserServlet?action=showSignupForm';" type="button">Sign up</button>
                                                    </div>
                                                </div>-->


                        <c:if test="${empty userlogin}">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Tài Khoản Của Tôi</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <button class="dropdown-item" onclick="location.href = 'UserServlet?action=showLoginForm';" type="button">Đăng Nhập</button>
                                    <button class="dropdown-item" onclick="location.href = 'UserServlet?action=showSignupForm';" type="button">Đăng Ký</button>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty userlogin}">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">${userlogin.username}</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <button class="dropdown-item" onclick="location.href = 'UserServlet?action=profile';" type="button">Tài Khoản Của Tôi</button>

                                    <c:if test="${userlogin != null && userlogin.role eq 'User'}">
                                        <a class="dropdown-item" href="storeRegister.jsp">Đăng Ký Cửa Hàng</a>
                                    </c:if>
                                    <c:if test="${userlogin != null && userlogin.role eq 'Store Manager'}">
                                        <a class="dropdown-item" href="StoreHomeServlet">Cửa Hàng Của Tôi</a>
                                    </c:if>
                                    <button class="dropdown-item" onclick="location.href = 'UserServlet?action=logout';" type="button">Đăng Xuất</button>
                                </div>
                            </div>
                        </c:if>


                        <div class="btn-group mx-2">
                            <!--                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">USD</button>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <button class="dropdown-item" type="button">EUR</button>
                                                            <button class="dropdown-item" type="button">GBP</button>
                                                            <button class="dropdown-item" type="button">CAD</button>
                                                        </div>-->
                        </div>
                        <div class="btn-group">
                            <!--                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">EN</button>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <button class="dropdown-item" type="button">FR</button>
                                                            <button class="dropdown-item" type="button">AR</button>
                                                            <button class="dropdown-item" type="button">RU</button>
                                                        </div>-->
                        </div>
                    </div>
                    <div class="d-inline-flex align-items-center d-block d-lg-none">
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-heart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-shopping-cart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <a href="ShowProductsServlet" class="text-decoration-none">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">Bird</span>
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Trading</span>
                    </a>
                </div>
                <div class="col-lg-4 col-6 text-left">


                    <form action="ProductSearchServlet" method="GET">
                        <div class="input-group">
                            <input type="hidden" name="action" value="searchByName">
                            <label for="productName"></label>
                            <input type="text" class="form-control" name="productName" placeholder="Tìm Sản Phẩm"> 

                            <div class="input-group-append">

                                <input  class="input-group-text bg-transparent text-primary" type="submit" value="Tìm Kiếm">

                            </div>
                        </div>
                    </form>


                </div>
                <div class="col-lg-4 col-6 text-right">
                    <!--                    <p class="m-0">Customer Service</p>
                                        <h5 class="m-0">+012 345 6789</h5>-->
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Mục lục</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <div class="navbar-nav w-100">
                            <div class="nav-item dropdown dropright">


                                <a href="ProductSearchServlet?action=searchByName&search=Chim" 
                                   class="nav-link dropdown-toggle" data-toggle="dropdown">Chim<i class="fa fa-angle-right float-right mt-1"></i></a>

                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">

                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Chim chào mào" class="dropdown-item">Chim chào mào</button>
                                    </form>

                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> <!-- Thêm hidden input để truyền giá trị action -->
                                        <button type="submit" name="productName" value="Chim sáo" class="dropdown-item">Chim sáo</button>
                                    </form>

                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> <!-- Thêm hidden input để truyền giá trị action -->
                                        <button type="submit" name="productName" value="Vẹt" class="dropdown-item">Vẹt</button>
                                    </form>
                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Thức ăn<i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">


                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> <!-- Thêm hidden input để truyền giá trị action -->
                                        <button type="submit" name="productName" value="Chim non" class="dropdown-item">Chim non</button>
                                    </form>


                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Chim non" class="dropdown-item">Chim trưởng thành</button>
                                    </form>

                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Lồng Chim<i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">

                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Lồng tre" class="dropdown-item">Lồng tre</button>
                                    </form>
                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Lồng gỗ" class="dropdown-item">Lồng gỗ</button>
                                    </form>
                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Lồng inox" class="dropdown-item">Lồng inox</button>
                                    </form>


                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Phụ kiện<i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">

                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Còi" class="dropdown-item">Còi</button>
                                    </form>
                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Găng tay" class="dropdown-item">Găng tay</button>
                                    </form>
                                    <form action="ProductSearchServlet" method="GET">
                                        <input type="hidden" name="action" value="searchByName"> 
                                        <button type="submit" name="productName" value="Hũ dựng thức ăn" class="dropdown-item">Hũ dựng thức ăn</button>
                                    </form>

                                </div>
                            </div>
                            <!--<a href="" class="nav-item nav-link">Thêm sau</a>-->
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">Bird</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Trading</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="homePage.jsp" class="nav-item nav-link active">Trang chủ</a>
                                <a href="ProductSearchServlet?action=searchByCategory&categoryName=Bird" class="nav-item nav-link">Loài chim</a>
                                <a href="ProductSearchServlet?action=searchByCategory&categoryName=Food" class="nav-item nav-link">Thức ăn cho chim</a>
                                <a href="ProductSearchServlet?action=searchByCategory&categoryName=Bird cage" class="nav-item nav-link">Lồng chim</a>
                                <a href="ProductSearchServlet?action=searchByCategory&categoryName=Accessory" class="nav-item nav-link">Phụ kiện</a>
                                <!--                                <div class="nav-item dropdown">
                                                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down mt-1"></i></a>
                                                                    <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                                                        <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                                                        <a href="checkout.html" class="dropdown-item">Checkout</a>
                                                                    </div>
                                                                </div>
                                                                <a href="contact.html" class="nav-item nav-link">Contact</a>-->
                            </div>
                            
                              <!--search store-->
                            <div class="col-lg-4 col-6 text-left">
                                <form action="ShopSearchServlet" method="GET">
                                    <div class="input-group">
                                        <input type="hidden" name="action" value="searchStoreByName">
                                        <label for="storeName"></label>
                                        <input type="text" class="form-control input-sm" name="storeName" placeholder="Tìm Cửa Hàng">

                                        <div class="input-group-append">
                                            <input class="input-group-text bg-transparent text-primary btn-sm" type="submit" value="Tìm Kiếm">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--search end-->
                            
                            
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <!--                                <a href="" class="btn px-0">
                                                                    <i class="fas fa-heart text-primary"></i>
                                                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                                                </a>-->
                                <a href="CartServlet?action=view" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;"></span>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Cart Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <thead class="thead-dark">
                            <tr>
                                <th>        </th>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>                             
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <%-- Lặp qua từng mục trong giỏ hàng --%>
                            <c:forEach var="cartItem" items="${CART}">
                                <tr>
                                    <td class="align-middle">
                                        <img src="${cartItem.imageUrl}" alt="" style="width: 50px; height: 50px;">
                                    </td>
                                    <td class="align-middle" style="text-align: middle;">${cartItem.productName}</td>
                                    <td class="align-middle">₫${cartItem.price}</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                           
                                            <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center cart-quantity-input" data-cartItemId="${cartItem.cartItemId}" value="${cartItem.quantity}">
                                           
                                    </td>

                                    <td class="align-middle">₫${cartItem.price * cartItem.quantity}</td>
                                   
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <!--                    <form class="mb-30" action="">
                                            <div class="input-group">
                                                <input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary">Apply Coupon</button>
                                                </div>
                                            </div>
                                        </form>-->
                    <!--                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>-->
                    <!--                    <div class="bg-light p-30 mb-5">
                                            <div class="border-bottom pb-2">
                                                <div class="d-flex justify-content-between mb-3">
                                                    <h6>Subtotal</h6>
                                                    <h6>$<%= session.getAttribute("total_price")%></h6>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h6 class="font-weight-medium">Shipping</h6>
                                                    <h6 class="font-weight-medium">$<%= session.getAttribute("shipping_cost")%></h6>
                                                </div>
                                            </div>
                                            <div class="pt-2">
                                                <div class="d-flex justify-content-between mt-2">
                    
                                                    <h5>Total</h5>
                                                    <h5>$<%= session.getAttribute("total_amount")%></h5>                           
                                                </div>-->
                    <form method="POST" action="CheckoutServlet">
                        <button class="btn btn-block btn-primary font-weight-bold my-3 py-3" type="submit">Proceed To Checkout</button>
                    </form>
                    <!--                        </div>
                                        </div>-->
                </div>
            </div>
        </div>
        <!-- Cart End -->





        <!-- Checkout Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-8">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <form action="DeliveryServlet" method="post">
                            <div class="row">

                                <div class="col-md-6 form-group">
                                    <label for="recipient_name">Ho Ten</label>
                                    <input class="form-control" type="text"  id="recipient_name" name="recipient_name" required>
                                </div>

                                <div class="col-md-6 form-group">
                                    <label for="phone_number">so dt</label>
                                    <input class="form-control" type="number" id="phone_number" name="phone_number"  placeholder="+123 456 789">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label for="address">Address Line 1</label>
                                    <input class="form-control" type="text" id="address" name="address" placeholder="123 Street">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label for="province_name">tinh</label>
                                    <select class="custom-select" id="province_name" name="province_name" required>
                                        <option selected>TP HCM</option>
                                        <option value="TP HCM">TP HCM</option>
                                        <option value="Ha Noi">Hà Nội</option>
                                        <option value="Da Nang">Đà Nẵng</option>
                                        <option value="An Giang">An Giang</option>
                                        <option value="Ba Ria - Vung Tau">Bà Rịa - Vũng Tàu</option>
                                        <option value="Bac Lieu">Bạc Liêu</option>
                                        <option value="Bac Kan">Bắc Kạn</option>
                                        <option value="Bac Giang">Bắc Giang</option>
                                        <option value="Bac Ninh">Bắc Ninh</option>
                                        <option value="Ben Tre">Bến Tre</option>
                                        <option value="Binh Duong">Bình Dương</option>
                                        <option value="Binh Dinh">Bình Định</option>
                                        <option value="Binh Phuoc">Bình Phước</option>
                                        <option value="Binh Thuan">Bình Thuận</option>
                                        <option value="Ca Mau">Cà Mau</option>
                                        <option value="Cao Bang">Cao Bằng</option>
                                        <option value="Dak Lak">Đắk Lắk</option>
                                        <option value="Dak Nong">Đắk Nông</option>
                                        <option value="Dien Bien">Điện Biên</option>
                                        <option value="Dong Nai">Đồng Nai</option>
                                        <option value="Dong Thap">Đồng Tháp</option>
                                        <option value="Gia Lai">Gia Lai</option>
                                        <option value="Ha Giang">Hà Giang</option>
                                        <option value="Ha Nam">Hà Nam</option>
                                        <option value="Ha Tinh">Hà Tĩnh</option>
                                        <option value="Hai Dương">Hải Dương</option>
                                        <option value="Hai Phong">Hải Phòng</option>
                                        <option value="Hoa Binh">Hòa Bình</option>
                                        <option value="Hung Yen">Hưng Yên</option>
                                        <option value="Khanh Hoa">Khánh Hòa</option>
                                        <option value="Kien Giang">Kiên Giang</option>
                                        <option value="Kon Tum">Kon Tum</option>
                                        <option value="Lai Chau">Lai Châu</option>
                                        <option value="Lam Dong">Lâm Đồng</option>
                                        <option value="Lang Son">Lạng Sơn</option>
                                        <option value="Lao Cai">Lào Cai</option>
                                        <option value="Long An">Long An</option>
                                        <option value="Nam Dinh">Nam Định</option>
                                        <option value="Nghe An">Nghệ An</option>
                                        <option value="Ninh Binh">Ninh Bình</option>
                                        <option value="Ninh Thuan">Ninh Thuận</option>
                                        <option value="Phu Tho">Phú Thọ</option>
                                        <option value="Phu Yen">Phú Yên</option>
                                        <option value="Quang Binh">Quảng Bình</option>
                                        <option value="Quang Nam">Quảng Nam</option>
                                        <option value="Quang Ngai">Quảng Ngãi</option>
                                        <option value="Quang Ninh">Quảng Ninh</option>
                                        <option value="Quang Tri">Quảng Trị</option>
                                        <option value="Soc Trang">Sóc Trăng</option>
                                        <option value="Sơn La">Sơn La</option>
                                        <option value="Tay Ninh">Tây Ninh</option>
                                        <option value="Thai Binh">Thái Bình</option>
                                        <option value="Thai Nguyen">Thái Nguyên</option>
                                        <option value="Thanh Hoa">Thanh Hóa</option>
                                        <option value="Thua Thien Hue">Thừa Thiên Huế</option>
                                        <option value="Tien Giang">Tiền Giang</option>
                                        <option value="Tra Vinh">Trà Vinh</option>
                                        <option value="Tuyen Quang">Tuyên Quang</option>
                                        <option value="Vinh Long">Vĩnh Long</option>
                                        <option value="Vinh Phuc">Vĩnh Phúc</option>
                                        <option value="Yen Bai">Yên Bái</option>
                                    </select>


                                </div>

                                <!--<input type="submit" value="Đặt Hàng" class="custom-button ml-2">-->
                                <div class="col-md-12 form-group">
                                    <input type="submit" value="Đặt Hàng" class="custom-button ml-2" onclick="return confirmOrder();">
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-lg-4">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom">

                        </div>


                        <c:if test="${message eq 'Delivery created successfully.'}">
                            <div class="border-bottom pt-3 pb-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Tên Người Nhận</h6>
                                    <h6>${delivery.receiverName}</h6>
                                </div>

                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Số Điện Thoại</h6>
                                    <h6>${delivery.phoneNumber}</h6>
                                </div>

                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Địa Chỉ</h6>
                                    <h6>${delivery.address} ${delivery.provinceName}</h6>

                                </div>

                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Tổng tiền hàng</h6>
                                    <h6>₫${delivery.totalAmount}</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Phí vận chuyển</h6>
                                    <h6 class="font-weight-medium">₫${delivery.shippingCost}</h6>
                                </div>

                            </div>
                            <div class="pt-2">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5>Tổng thanh toán:</h5>
                                    <h5 style="color: red">₫${delivery.totalAmount + delivery.shippingCost}</h5>
                                </div>

                            </div>
                        </c:if>
                    </div>
                    <div class="mb-5">
                    </div>
                </div>
            </div>
        </div>
        <!-- Checkout End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <h5 class="text-secondary text-uppercase mb-4">Thông tin liên lạc</h5>
                    <p class="mb-4">Chuyên cung cấp các loại chim</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Tp.Hồ Chí Minh</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>binhdxse160***@fpt.edu.vn</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+84999999999</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">Bird Shop</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="homePage.jsp"><i class="fa fa-angle-right mr-2"></i>Trang chủ</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Kênh bán hàng</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Của hàng</a>                               
                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Liên lạc với chúng tôi</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">Tài khoản của tôi</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Hồ sơ</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Giỏ hàng</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Đơn hàng</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h6 class="text-secondary text-uppercase mt-4 mb-3">Theo dõi chúng tôi</h6>
                            <div class="d-flex">
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>


        <script>
                                        function confirmOrder() {
                                            return confirm("Bạn có chắc chắn xác nhận đặt hàng với thông tin phía dưới?");
                                        }
        </script>
    </body>

</html>