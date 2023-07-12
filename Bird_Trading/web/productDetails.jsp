<%-- 
    Document   : detail
    Created on : Jun 8, 2023, 9:14:43 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
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
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
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
                            <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="homePage.jsp" class="nav-item nav-link active">Home</a>
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
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <!--                    <nav class="breadcrumb bg-light mb-30">
                                            <a class="breadcrumb-item text-dark" href="#">Home</a>
                                            <a class="breadcrumb-item text-dark" href="#">Shop</a>
                                            <span class="breadcrumb-item active">Shop Detail</span>
                                        </nav>-->
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Detail Start -->
        <div class="container-fluid pb-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 mb-30">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner bg-light">
                            <div class="carousel-item active">
                                <img style="width: 600px; height: 400px" src="${product.image}" alt="Image" >
                            </div>
                            <!--                            <div class="carousel-item">
                                                            <img class="w-100 h-100" src="${product.image}" alt="Image">
                                                        </div>
                                                        <div class="carousel-item">
                                                            <img class="w-100 h-100" src="" alt="Image">
                                                        </div>
                                                        <div class="carousel-item">
                                                            <img class="w-100 h-100" src="" alt="Image">
                                                        </div>-->
                        </div>
                        <!--                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                                                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                                                </a>
                                                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                                                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                                                </a>-->
                    </div>
                </div>

                <div class="col-lg-7 h-auto mb-30">

                    <c:if test="${not empty product}">
                        <div class="h-100 bg-light p-30">
                            <h3>${product.productName}</h3>
                            <div class="d-flex mb-3">
                                <div class="text-primary mr-2">
                                
                                </div>
                                <small class="pt-1">(${count} Reviews)</small>
                            </div>
                            <h3 class="font-weight-semi-bold mb-4" style="color: red">₫${product.price}</h3>
<!--                            <p class="mb-4">${product.description}</p>-->

                            <div class="d-flex align-items-center mb-4 pt-2">

                                <button class="btn btn-primary px-3" onclick="location.href = 'CartServlet?action=add&sttPt=${product.sttPT}&productName=${product.productName}&price=${product.price}&quantity=1&imageUrl=${product.image}'"><i class="fa fa-shopping-cart mr-1"></i> Add To
                                    Cart</button>
                            </div>

                        </div>

                    </c:if>


                </div>
            </div>


            <div class="row px-xl-5">
                <div class="col">
                    <div class="bg-light p-30">
                        <div style="display: flex; align-items: center;">

                            <a style="color: blue" href="ShopDetailServlet?storeId=${store.store_id}">  
                                <img style="width: 200px; height: 100px" src="${store.image}" alt="Image" ></a>  
                            <div style="margin-left: 10px;">
                                <a style="color: blue" href="ShopDetailServlet?storeId=${store.store_id}">${store.store_name}</a>                             
                            </div>

                        </div>

                        <h6>
                            Số điện thoại: ${store.phone_number}
                        </h6>
                        <h6>Địa chỉ: ${store.address}</h6>

                    </div>
                </div>
            </div>





            <div class="row px-xl-5">
                <div class="col">
                    <div class="bg-light p-30">
                        <div class="nav nav-tabs mb-4">
                            <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1" role="tab">Description</a>
                            <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2" role="tab">Reviews (<c:out value="${count}" />)</a>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab-pane-1">
                                <p class="mb-3"><c:out value="${product.description}" /></p>
                            </div>
                            <div class="tab-pane fade" id="tab-pane-2">
                                <div class="row">
                                    <div>
                                        <h4 class="mb-4"><c:out value="${count}" /> review for "<c:out value="${product.productName}" />"</h4><c:set var="displayedUserIds" value="${sessionScope.displayedUserIds}" />
                                        <c:forEach var="feedback" items="${feedbacks}">
                                            <div class="media mb-4">
                                                <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                <div class="media-body">
                                                    <c:set var="isFirst" value="true" />
                                                    <c:forEach var="user" items="${users}">
                                                        <c:if test="${user.userId == feedback.userId}">
                                                            <c:if test="${isFirst}">
                                                                <h6><c:out value="${user.username}" /><small> - <i><c:out value="${feedback.timestamp}" /></i></small></h6>
                                                                <c:set var="isFirst" value="false" />
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                    <div class="text-primary mb-2">
                                                        <!-- Hiển thị đánh giá dưới dạng các ngôi sao -->
                                                        <c:forEach var="i" begin="1" end="${feedback.rating}">
                                                            <i class="fas fa-star"></i>
                                                        </c:forEach>
                                                        <c:if test="${feedback.rating % 1 != 0}">
                                                            <i class="fas fa-star-half-alt"></i>
                                                        </c:if>
                                                        <c:forEach var="i" begin="${Math.ceil(feedback.rating)+1}" end="5">
                                                            <i class="far fa-star"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <p><c:out value="${feedback.comment}" /></p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- Shop Detail End -->






    </div>
    <!-- Shop Detail End -->


   

    <!-- San pham cung shop -->
    <div class="container-fluid py-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">CÁC SẢN PHẨM KHÁC CỦA SHOP</span></h2>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">


                    <c:forEach items="${pro}" var="product">
                        <div class="product-item bg-light">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${product.image}" alt="" style="width: 50px; height: 180px">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square"
                                       href="CartServlet?action=add&sttPt=${product.sttPT}&productName=${product.productName}&price=${product.price}&quantity=1&imageUrl=${product.image}">
                                        <i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="ProductDetailServlet?productId=${product.productId}"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="ProductDetailServlet?productId=${product.productId}">${product.productName}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5 style="color: red">₫${product.price}</h5><h6 class="text-muted ml-2"><del></del></h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">

                                    <small>Số Lượng: ${product.quantity}</small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->
    
    
    
     <!-- San pham  cung loai -->
    <div class="container-fluid py-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Sản Phẩm Cùng Loại</span></h2>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">


                    <c:forEach items="${productCategory}" var="product">
                        <div class="product-item bg-light">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${product.image}" alt="" style="width: 50px; height: 180px">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square"
                                       href="CartServlet?action=add&sttPt=${product.sttPT}&productName=${product.productName}&price=${product.price}&quantity=1&imageUrl=${product.image}">
                                        <i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="ProductDetailServlet?productId=${product.productId}"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="ProductDetailServlet?productId=${product.productId}">${product.productName}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5 style="color: red">₫${product.price}</h5><h6 class="text-muted ml-2"><del></del></h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">

                                    <small>Số Lượng: ${product.quantity}</small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->




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
</body>

</html>