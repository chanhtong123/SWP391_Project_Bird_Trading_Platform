<%-- 
    Document   : searchProducts
    Created on : Jun 10, 2023, 12:40:13 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css">

        <style>
            input[type="number"]::-webkit-inner-spin-button,
            input[type="number"]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[type="number"] {
                -moz-appearance: textfield;
                appearance: textfield;
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

                            <!--cart-->
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <a href="CartServlet?action=view" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;"></span>
                                </a>
                            </div>
                            <!--end-->


                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Shop Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <!--<div class="col-lg-3 col-md-4">-->
                    <!-- Price Start -->
                    <!--<h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>-->
                    <div class="bg-light p-4 mb-30">


                        <div class="container ">
                            <div class="title">Khoảng Giá</div>
                            <div class="input-group">                           
                                <form action="ProductSearchServlet" method="GET">
                                    <input type="hidden" name="action" value="searchByPriceRange">
                                    <label for="minPrice">Tối thiểu:</label>
                                    <input  type="number" id="minPrice" name="minPrice" onkeydown="return event.key !== '-'" step="any">
                                    <label for="maxPrice">Tối đa:</label>
                                    <input  type="number" id="maxPrice" name="maxPrice" onkeydown="return event.key !== '-'" step="any">

                                    </br>    </br> <input type="submit" value="Áp dụng" <button type="submit" class="apply-button"></button>                        
                                    <!--<input type="submit" value="Search by Name">-->
                                </form>
                            </div> 
                        </div>

                    </div>
                    <!-- Price End -->




                <!--</div>-->

                <%
                    final int PAGE_SIZE = 12; // Số sản phẩm hiển thị trên mỗi trang
                    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
                    session.setAttribute("currentPage", currentPage);
                %>

                <div class="col-lg-12 col-md-8">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <!-- Các nút và dropdown khác -->
                        </div>

                        <% List<ProductDTO> searchResultsByName = (List<ProductDTO>) session.getAttribute("searchResultsByName"); %>

                        <% if (searchResultsByName != null && !searchResultsByName.isEmpty()) { %>

                        <% int totalPages = (int) Math.ceil((double) searchResultsByName.size() / PAGE_SIZE); %>
                        <% int startIndex = (currentPage - 1) * PAGE_SIZE; %>
                        <% int endIndex = Math.min(startIndex + PAGE_SIZE, searchResultsByName.size()); %>

                        <% for (int i = startIndex; i < endIndex; i++) { %>
                        <% ProductDTO product = searchResultsByName.get(i);%>
                        <!-- Hiển thị sản phẩm -->
                        <div id="pagination" class="col-lg-3 col-md-6 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="<%= product.getImage()%>" alt="" style="width: 150px; height: 250px">
                                    <div class="product-action">
                                        
                                        
                                        <a class="btn btn-outline-dark btn-square"
                                           href="CartServlet?action=add&sttPt=<%= product.getSttPT()%>&productName=<%= product.getProductName()%>&price=<%= product.getPrice()%>&quantity=1&imageUrl=<%= product.getImage()%>&storeid=<%= product.getStoreId()%>">
                                            <i class="fa fa-shopping-cart"></i></a>
                                            
                                            
                                        <a class="btn btn-outline-dark btn-square" href="ProductDetailServlet?productId=<%=product.getProductId()%>"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href="ProductDetailServlet?productId=<%=product.getProductId()%>"><%= product.getProductName()%></a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5 style="color: red">₫<%= product.getPrice()%></h5>
                                        <h6 class="text-muted ml-2"><del></del></h6>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center mb-1">
                                        <!--                                        <small class="fa fa-star text-primary mr-1"></small>
                                                                                <small class="fa fa-star text-primary mr-1"></small>
                                                                                <small class="fa fa-star text-primary mr-1"></small>
                                                                                <small class="fa fa-star text-primary mr-1"></small>
                                                                                <small class="fa fa-star text-primary mr-1"></small>-->
                                        <small>Số Lượng: <%= product.getQuantity()%></small>
                                       
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center mb-1">
                                        <small>Đã Bán: <%= product.getSoldNumber()%></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>

                        <div class="col-12">
                            <nav>
                                <ul class="pagination justify-content-center">
                                    <% if (currentPage > 1) {%>
                                    <li class="page-item"><a class="page-link" href="?page=<%= currentPage - 1%>">Trang trước</a></li>
                                        <% } else { %>
                                    <li class="page-item disabled"><a class="page-link" href="#">Trang trước</a></li>
                                        <% } %>

                                    <% for (int i = 1; i <= totalPages; i++) { %>
                                    <% if (i == currentPage) {%>
                                    <li class="page-item active"><a class="page-link" href="?page=<%= i%>"><%= i%></a></li>
                                        <% } else {%>
                                    <li class="page-item"><a class="page-link" href="?page=<%= i%>"><%= i%></a></li>
                                        <% } %>
                                        <% } %>

                                    <% if (currentPage < totalPages) {%>
                                    <li class="page-item"><a class="page-link" href="?page=<%= currentPage + 1%>">Trang sau</a></li>
                                        <% } else { %>
                                    <li class="page-item disabled"><a class="page-link" href="#">Trang sau</a></li>
                                        <% } %>
                                </ul>
                            </nav>
                        </div>

                        <% } else { %>
                        <p class="no-results">Không có sản phẩm có từ khóa được tìm thấy.</p>
                        <% }%>
                    </div>
                </div>
                <!-- Shop Product End -->





            </div>
        </div>
        <!-- Shop End -->


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
        <!-- Trước thẻ </body> -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            $('#example-table').DataTable({
                                                paging: true, // Hiển thị phân trang
                                                lengthChange: true, // Cho phép người dùng thay đổi số hàng hiển thị trên mỗi trang
                                                pageLength: 10, // Số hàng hiển thị trên mỗi trang
                                                searching: false, // Tắt chức năng tìm kiếm
                                                info: true, // Hiển thị thông tin số trang và số lượng hàng
                                                language: {
                                                    paginate: {
                                                        first: 'Đầu', // Nút Đầu trang
                                                        last: 'Cuối', // Nút Cuối trang
                                                        next: 'Tiếp', // Nút Trang kế tiếp
                                                        previous: 'Trước' // Nút Trang trước
                                                    }
                                                }
                                            });
                                        });
        </script>

    </body>

</html>