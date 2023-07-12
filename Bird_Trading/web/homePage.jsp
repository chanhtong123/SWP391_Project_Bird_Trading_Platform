<%-- 
    Document   : index
    Created on : Jun 8, 2023, 4:44:14 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <link rel="png" href="logo.png" type="img/logo.png">
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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->

        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css">




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


        <!-- Carousel Start -->
        <div class="container-fluid mb-3">
            <div class="row px-xl-5">
                <div class="col-lg-8">
                    <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#header-carousel" data-slide-to="1"></li>
                            <li data-target="#header-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item position-relative active" style=" height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/hinh-anh-chim-vet-43.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Loài Chim</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Nơi bán những chim cảnh đẹp, độc lạ và giá cả phù hợp nhất trên thị trường.</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                           href="ProductSearchServlet?action=searchByCategory&categoryName=Bird">Bird Shop</a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/hinh_nen_2.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Thức ăn</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Những thức ăn đến từ những nhà cung cấp uy tín, có độ dinh dưỡng cao cho các loài chim.</p>
                                      
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" 
                                            href="ProductSearchServlet?action=searchByCategory&categoryName=Food">Bird Shop</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/anh_nen_3.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Lồng Chim</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Nơi có những lồng chim đẹp đầy nghệ thuật trên cả thế giới, tạo nên vè đẹp sang trọng quý tộc.</p>
                                       
                                          <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                             href="ProductSearchServlet?action=searchByCategory&categoryName=Bird cage">Bird Shop</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="img/anh1.jpg" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Thức ăn cho chim</h6>
                            <h3 class="text-white mb-3"></h3>
                             <a  class="btn btn-primary"
                                            href="ProductSearchServlet?action=searchByCategory&categoryName=Food">Bird Shop</a>
                            
                        </div>
                    </div>
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="img/anh2.jpg" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Phụ kiện cho chim</h6>
                            <h3 class="text-white mb-3"></h3>
                             <a class="btn btn-primary" href="ProductSearchServlet?action=searchByCategory&categoryName=Accessory">Bird Shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->





        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Danh Mục</span></h2>
            <div class="row px-xl-5 pb-3">
              


                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">                                            
                    <a class="text-decoration-none" href="ProductSearchServlet?action=searchByCategory&categoryName=Bird">
                        <div class="cat-item d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="img/chim.jpg" alt="" style="width: 100px; height: 100px ">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Loài Chim</h6>
                                <!--<small class="text-body">100 Products</small>-->
                            </div>
                        </div>
                    </a>                                    
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="ProductSearchServlet?action=searchByCategory&categoryName=Food">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="img/caiques-best-bird-food.jpg" alt="" style="width: 100px; height: 100px;">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Thức ăn</h6>
                                <!--<small class="text-body">100 Products</small>-->
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="ProductSearchServlet?action=searchByCategory&categoryName=Bird cage">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="img/long_nuoi_chim.jpg" alt="" style="width: 100px; height: 100px;">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Lồng chim</h6>
                                <!--<small class="text-body">100 Products</small>-->
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="ProductSearchServlet?action=searchByCategory&categoryName=Accessory">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="img/phu_kien.jpg" alt="" style="width: 100px; height: 100px;">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Phụ kiện</h6>
                                <!--<small class="text-body">100 Products</small>-->
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <!-- Categories End -->





        <!--Products Start--> 
        <div class="container-fluid pt-5 pb-3">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Những Sản Phẩm Nổi Bật</span></h2>



            <div class="row px-xl-5"  >
                <!--<table id="productTable">-->
                <table id="example-table" >

                    <c:forEach var="product" items="${products}" end="15">
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">                             
                                    <img class="img-fluid w-100" src="${product.image}" alt="" style="width: 150px; height: 250px">                          
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
                        </div>   

                    </c:forEach>
                </table>
            </div>


        </div>
        <!--Products End--> 


        <!--            <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>-->









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


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            $('#productTable').DataTable({
                                                "paging": true,
                                                "pageLength": 20,
                                                "lengthMenu": [20, 50, 100],
                                                "language": {
                                                    "lengthMenu": "Display _MENU_ products per page",
                                                    "zeroRecords": "No products found",
                                                    "info": "Showing page _PAGE_ of _PAGES_",
                                                    "infoEmpty": "No products available",
                                                    "infoFiltered": "(filtered from _MAX_ total products)"
                                                }
                                            });
                                        });
        </script>


        <script>
            function addToCart(productId, productName, price, quantity, imageUrl) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "CartServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                        // Xử lý phản hồi thành công
                        window.location.reload(); // Tải lại trang để cập nhật giỏ hàng
                    }
                };
                xhr.send("action=add&productId=" + encodeURIComponent(productId) +
                        "&productName=" + encodeURIComponent(productName) +
                        "&price=" + encodeURIComponent(price) +
                        "&quantity=" + encodeURIComponent(quantity) +
                        "&imageUrl=" + encodeURIComponent(imageUrl));
            }
        </script>




        <script type="text/javascript">
            $(function () {
                $('#example-table').DataTable({
                    pageLength: 10,
                    //"ajax": './assets/demo/data/table_data.json',
                    /*"columns": [
                     { "data": "name" },
                     { "data": "office" },
                     { "data": "extn" },
                     { "data": "start_date" },
                     { "data": "salary" }
                     ]*/
                });
            })
        </script>


    </body>

</html>