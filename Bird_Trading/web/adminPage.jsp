<%-- 
    Document   : datatables
    Created on : Jun 14, 2023, 3:55:20 AM
    Author     : ASUS
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="DTO.OrderItemDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Admin page</title>
        <!-- GLOBAL MAINLY STYLES-->
       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
        <link href="./assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
        <link href="./assets/vendors/select2/dist/css/select2.min.css" rel="stylesheet" />
        <link href="./assets/vendors/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
        <link href="./assets/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
        <link href="./assets/vendors/jquery-minicolors/jquery.minicolors.css" rel="stylesheet" />
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->
        
        
        
        
    </head>

    <body class="fixed-navbar">
        <c:if test="${sessionScope.userlogin == null && sessionScope.userlogin.role ne 'Admin'}">
            <c:redirect url="ShowProductsServlet"></c:redirect>
        </c:if> 
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="UserServlet?action=list2">
                        <span class="brand">Admin 
                            <span class="brand-tip"> Page</span>
                        </span>
                        <span class="brand-mini">AC</span>
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                     <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                        </li>
                        <li>
                            <form class="navbar-search" action="javascript:;">
                                <div class="rel">
                                    <span class="search-icon"><i class="ti-search"></i></span>
                                    <input class="form-control" placeholder="Search here...">
                                </div>
                            </form>
                        </li>
                    </ul>
                    <!-- END TOP-LEFT TOOLBAR-->
                    <!-- START TOP-RIGHT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li class="dropdown dropdown-user">
                            <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                                <img src="./assets/img/admin-avatar.png" />
                                <span></span>${userlogin.username}<i class="fa fa-angle-down m-l-5"></i></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="UserServlet?action=profile"><i class="fa fa-user"></i>Hồ sơ</a>
                               
                                <a class="dropdown-item" href="UserServlet?action=logout"><i class="fa fa-power-off"></i>Đăng xuất</a>
                            </ul>

                        </li>
                    </ul>
                    <!-- END TOP-RIGHT TOOLBAR-->
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar">
                <div id="sidebar-collapse">
                    <div class="admin-block d-flex">
                        <div>
                            <img src="./assets/img/admin-avatar.png" width="45px" />
                        </div>
                        <div class="admin-info">
                            <div class="font-strong">${userlogin.username}</div><small>${userlogin.role}</small></div>
                    </div>
                    <ul class="side-menu metismenu">

                    </ul>
                    <ul class="side-menu metismenu">
                        <li class="heading"></li>
                        <li class="active">
                            <a href="javascript:;">
                                <i class="sidebar-item-icon fa fa-table"></i>
                                <span class="nav-label">Quản Lý</span>
                                <i class="fa fa-angle-left arrow"></i>
                            </a>
                            <ul class="nav-2-level collapse in">

                                <li>
                                    <a onclick="showSection('abc-section')" href="#" data-section="abc-section">Thống Kê Cửa Hàng</a>
                                </li>
                                <li>
                                    <a onclick="showSection('user-list-section')" href="#" data-section="user-list-section">Quản lý người dùng</a>
                                </li>
                                <li>
                                    <a onclick="showSection('add-user-section')" href="#" data-section="add-user-section">Thêm người dùng</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>



            <!-- END SIDEBAR-->
            <div class="content-wrapper abc-section section" id="abc-section">
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                 
               



                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="ibox bg-success color-white widget-stat">
                            <div class="ibox-body">
                                <h2 class="m-b-5 font-strong">${countStore}</h2>
                                <div class="m-b-5">Các đơn đặt hàng</div><i class="ti-shopping-cart widget-stat-icon"></i>
                                <div><i class="fa fa-level-up m-r-5"></i><small>25% higher</small></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="ibox bg-info color-white widget-stat">
                            <div class="ibox-body">
                                <h2 class="m-b-5 font-strong">${countCate}</h2>
                                <div class="m-b-5">Tổng Loại Sản Phẩm</div><i class="ti-bar-chart widget-stat-icon"></i>
                                <div><i class="fa fa-level-up m-r-5"></i><small></small></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="ibox bg-warning color-white widget-stat">
                            <div class="ibox-body">
                                <h2 class="m-b-5 font-strong">₫${PriceAdmin}</h2>
                                <div class="m-b-5">Tổng Doanh Thu Thực Tế</div><i class="fa fa-money widget-stat-icon"></i>
                                <div><i class="fa fa-level-up m-r-5"></i><small>15%/Tổng giá trị</small></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="ibox bg-danger color-white widget-stat">
                            <div class="ibox-body">
                                <h2 class="m-b-5 font-strong">${quantityStore}</h2>
                                <div class="m-b-5">Tổng số lượng cửa hàng</div><i class="ti-user widget-stat-icon"></i>
                                <div><i class="fa fa-level-down m-r-5"></i><small></small></div>
                            </div>
                        </div>
                    </div>
                </div>



                <!--Date Start-->
                <div class="ibox">
                    <div class="ibox-body">
                        <form action="AdminChartServlet" method="get">
                            <div class="form-group" id="date_5">
                                <label class="font-normal"></label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input class="input-sm form-control" type="text" id="start" name="start" value="07/27/2023">
                                    <span class="input-group-addon p-l-10 p-r-10">đến</span>
                                    <input class="input-sm form-control" type="text" id="end" name="end" value="07/27/2023">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Tra Cứu</button>
                        </form>
                        </br></br>

                        <div class="col-lg-3 col-md-6">
                            <% BigDecimal totalPrice = (BigDecimal) request.getAttribute("totalPrice"); %>
                            <% if (totalPrice != null) {%>
                            <div class="ibox bg-warning color-white widget-stat">
                                <div class="ibox-body">

                                    <h2 class="m-b-5 font-strong">₫<%= totalPrice%></h2>
                                    <div class="m-b-5">Doanh thu</div><i class="fa fa-money widget-stat-icon"></i>

                                </div>
                            </div>
                            <% }%>
                        </div>


                        <div class="col-lg-3 col-md-6">
                            <% Integer totalOrderItem = (Integer) request.getAttribute("totalOrderItem"); %>
                            <% if (totalOrderItem != null) { %>
                            <div class="ibox bg-success color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">${totalOrderItem}</h2>
                                    <div class="m-b-5">Tổng Số Đơn</div>
                                    <i class="ti-shopping-cart widget-stat-icon"></i>
                                </div>
                            </div>
                            <% }%>
                        </div>    


                       
                        <!-- Add this code inside the <div class="ibox-body"> -->
                        <% if (totalPrice != null) {%>
                        <% List<OrderItemDTO> orderItems = (List<OrderItemDTO>) request.getAttribute("orderItems");%>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>                                      
                                    <th>Mã Hóa Đơn</th>
                                    <th>Mã Sản Phẩm</th>
                                    <th>Mã Hàng Cửa</th>
                                    <th>Ảnh Sản Phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Loại</th>
                                    <th>Số Lượng</th>
                                    <th>Giá Tiền</th>
                                    <th>Ngày Đặt Hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orderItems}" var="orderItem">
                                    <tr>
                                        <td>${orderItem.orderItemId}</td>
                                        <td>${orderItem.sttPT}</td>
                                        <td>${orderItem.storeId}</td>
                                        <td><img src="${orderItem.imageUrl}" alt="Product Image" width="100px" height="100px"></td>                                         
                                        <td>${orderItem.productName}</td>
                                        <td>${orderItem.categoryName}</td>
                                        <td>${orderItem.quantity}</td>
                                        <td>${orderItem.price}</td>                              
                                        <td>${orderItem.orderItem_date}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <% }%>
                      
                    </div>
                    <!--date end-->

                </div>
</div>

                <!-- END SIDEBAR-->

                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Tổng Tất Cả Chi Tiết Đơn Hàng</h1>
                </div>
                <div class="page-content fade-in-up">
                    <div class="ibox">

                        <div class="ibox-body">
                            <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Ảnh Sản Phẩm</th>
                                        <th>Số Lượng Đặt Hàng</th>
                                        <th>Loại Sản Phẩm</th>
                                        <th>Thành Tiền</th>
                                        <th>Ngày Đăt Hàng</th>
                                        <th>Trạng Thái Đơn Hàng</th>

                                    </tr>
                                </thead>                             

                                <tbody>
                                    <tr>
                                        <td></td><td></td>
                                        <td></td> <td></td>
                                        <td></td><td></td>
                                        <td></td> <td></td>
                                    </tr>
                                    <c:forEach var="order" items="${orderList}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${order.productName}</td>
                                            <td><img src="${order.imageUrl}" alt="Product Image" width="100px" height="100px"></td>
                                            <td>${order.quantity}</td>
                                            <td>${order.categoryName}</td>
                                            <td>${order.price}</td>
                                            <td>${order.orderItem_date}</td>
                                            <td  >
                                                <c:choose>
                                                    <c:when test="${order.status eq 'Order confirmation'}">
                                                        <a href="UpdateStatusOrderItemServlet?orderItemId=${order.orderItemId}" class="btn btn-bitbucket btn-sm">Xác nhận đơn hàng</a>

                                                    </c:when>
                                                    <c:when test="${order.status eq 'Delivery in progress'}">
                                                        <a href="UpdateStatusOrderItemServlet2?orderItemId=${order.orderItemId}" class="btn btn-openid btn-sm"> Đang Giao Hàngg</a>

                                                    </c:when>
                                                    <c:when test="${order.status eq 'Complete'}">
                                                        <!-- Trường hợp mặc định khi không khớp với bất kỳ giá trị nào -->
                                                        <div class="btn btn-danger btn-sm">Đã Hoàn Thành</div>
                                                    </c:when>
                                                </c:choose>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>


                <!--end-->

            </div>
            <div class="content-wrapper user-list-section section" id="user-list-section">
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Danh sách người dùng</h1>
                </div>


                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox-head">
                            <div class="ibox-title"> <a onclick="showSection('add-user-section')" href="#" data-section="add-user-section" class="btn btn-primary">Thêm người dùng</a></div>
                        </div>
                        <div class="ibox">
                            <div class="table__wrap">
                                <table class="table">
                                    <thead class="table__header">
                                        <tr class="table__row">
                                            <th class="table__cell u-text-left">Username</th>
                                            <th class="table__cell u-text-left">Họ tên </th>
                                            <th class="table__cell u-text-left ">Email</th>
                                            <th class="table__cell u-text-left">Địa chỉ</th>
                                            <th class="table__cell u-text-left">Số điện thoại</th>
                                            <th class="table__cell u-text-left">Role</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    <tbody>
                                        <c:forEach items="${users}" var="user">

                                        <form action="UserServlet" method="POST">
                                            <tr class="table__row"> 
                                            <input type="hidden" value="${user.userId}" name="userId" />
                                            <td class="table__account table__cell">
                                                <input type="text" readonly="" value="${user.username}" id="username" class="form-control" name="username" size="10" />
                                            </td>
                                            <td class="table__account table__cell">
                                                <input type="text" readonly="" value="${user.fullname}" id="fullname" class="form-control" name="fullname" />
                                            </td>
                                            <input type="hidden" name="password" value="${user.password}">
                                            <td class="table__account table__cell">
                                                <input type="email" readonly="" value="${user.email}" id="email" name="email"  class="form-control"/>
                                            </td>
                                            <td class="table__account table__cell">
                                                <input type="text" readonly="" value="${user.address}" id="address" name="address"  class="form-control"/>
                                            </td>
                                            <td class="table__account table__cell">
                                                <input type="text" readonly=""  value="${user.phoneNumber}" id="phoneNumber" name="phoneNumber" class="form-control" size="10"/>
                                                <c:if test="${not empty errors.phoneFormatError}">
                                                    <p class="error-message">
                                                        ${errors.phoneFormatError}
                                                    </p>
                                                </c:if>
                                            </td>
                                            <td class="table__account table__cell">
                                                <select id="role" name="role" required class="form-control">
                                                    <option value="Staff" ${user.role == 'Staff' ? 'selected' : ''}>Staff</option>
                                                    <option value="Store Manager" ${user.role == 'Store Manager' ? 'selected' : ''}>Store Manager</option>
                                                    <option value="User" ${user.role == 'User' ? 'selected' : ''}>User</option>
                                                </select>
                                            </td>
                                            <td class="table__transfer table__cell u-text-center">
                                                <button type="submit" name="action" value="edit" class="btn btn-outline-success form-control">Sửa</button>
                                            </td> 
                                        </form>
                                        <td class="table__transfer table__cell u-text-center">
                                            <button class="btn btn-outline-danger form-control" onclick="confirmDelete(${user.userId})">Xóa</button>
                                        </td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- END PAGE CONTENT-->

            </div>
            <div class="content-wrapper add-user-section section" id="add-user-section">
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Thêm người dùng</h1>
                </div>


                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox">
                            <div class="table__wrap">
                                <div class="form-control">
                                    <form action="UserServlet?action=addUser" method="post">
                                        <c:set var="errors" value="${requestScope.CREATE_ERROR}"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="username">Tên người dùng</label>
                                                    <input type="text" id="username" name="username" placeholder="Tên người dùng" class="form-control">
                                                    <c:if test="${not empty errors.usernameBlankError}">
                                                        <p class="error-message color-red">
                                                            ${errors.usernameBlankError}
                                                        </p>
                                                    </c:if>
                                                    <c:if test="${not empty errors.usernameIsExisted}">
                                                        <p class="error-message color-red">
                                                            ${errors.usernameIsExisted}
                                                        </p>
                                                    </c:if>
                                                </div>
                                                <div class="form-group">
                                                    <label for="fullname">Họ và tên</label>
                                                    <input type="text" id="fullname" name="fullname" placeholder="Họ và tên" class="form-control">
                                                    <c:if test="${not empty errors.fullnameBlankError}">
                                                        <p class="error-message color-red">
                                                            ${errors.fullnameBlankError}
                                                        </p>
                                                    </c:if>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Mật khẩu</label>
                                                    <input type="password" id="password" name="password" placeholder="Mật khẩu" class="form-control">
                                                    <c:if test="${not empty errors.passwordBlankError}">
                                                        <p class="error-message color-red">
                                                            ${errors.passwordBlankError}
                                                        </p>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="email">Email</label>
                                                    <input type="email" id="email" name="email" placeholder="Email" class="form-control">
                                                    <c:if test="${not empty errors.emailIsExisted}">
                                                        <p class="error-message color-red">
                                                            ${errors.emailIsExisted}
                                                        </p>
                                                    </c:if>
                                                    <c:if test="${not empty errors.emailBlankError}">
                                                        <p class="error-message color-red">
                                                            ${errors.emailBlankError}
                                                        </p>
                                                    </c:if>
                                                    <c:if test="${not empty errors.emailFormatError}">
                                                        <p class="error-message color-red">
                                                            ${errors.emailFormatError}
                                                        </p>
                                                    </c:if>
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Địa chỉ</label>
                                                    <input type="text" id="address" name="address" placeholder="Địa chỉ" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label for="phoneNumber">Số điện thoại</label>
                                                    <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Số điện thoại" class="form-control">
                                                    <c:if test="${not empty errors.phoneFormatError}">
                                                        <p class="error-message color-red">
                                                            ${errors.phoneFormatError}
                                                        </p>
                                                    </c:if>
                                                    <c:if test="${not empty errors.phoneNumberIsExisted}">
                                                        <p class="error-message color-red">
                                                            ${errors.phoneNumberIsExisted}
                                                        </p>
                                                    </c:if>
                                                    <c:if test="${not empty errors.phoneBlankError}">
                                                        <p class="error-message color-red">
                                                            ${errors.phoneBlankError}
                                                        </p>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="role">Role:</label>
                                                    <select id="role" name="role" required class="form-control">
                                                        <option value="Staff">Staff</option>
                                                        <option value="Store Manager">Store Manager</option>
                                                        <option value="User">User</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <button type="submit" name="action" value="addUser" class="btn btn-primary">Thêm</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- END PAGE CONTENT-->

            </div>

        </div>
        <!-- BEGIN PAGA BACKDROPS-->
        <div class="sidenav-backdrop backdrop"></div>
        <div class="preloader-backdrop">
            <div class="page-preloader">Loading</div>
        </div>
        <!-- END PAGA BACKDROPS-->
        <!-- CORE PLUGINS-->
        <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL PLUGINS-->
        <script src="./assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL SCRIPTS-->
        <script type="text/javascript">
                                              
                                                function confirmDelete(userId) {
                                                    Swal.fire({
                                                        title: 'Xác nhận xóa',
                                                        text: 'Bạn có chắc muốn xóa người dùng này?',
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Xóa',
                                                        cancelButtonText: 'Hủy'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            // Nếu người dùng xác nhận xóa, thực hiện yêu cầu xóa người dùng
                                                            window.location.href = 'UserServlet?action=delete&userId=' + userId;
                                                        }
                                                    });
                                                }

                                                function showSection(sectionName) {
                                                    var sections = document.getElementsByClassName("section");
                                                    var buttons = document.querySelectorAll(".nav-2-level li a");

                                                    for (var i = 0; i < sections.length; i++) {
                                                        sections[i].style.display = "none";
                                                    }
                                                    document.getElementById(sectionName).style.display = "block";

                                                    for (var i = 0; i < buttons.length; i++) {
                                                        buttons[i].classList.remove("active");
                                                    }

                                                    document.querySelector(".nav-2-level li a[data-section='" + sectionName + "']").classList.add("active");
                                                }
                                                document.addEventListener("DOMContentLoaded", function () {
                                                    var buttons = document.querySelectorAll(".nav-2-level li a");
                                                    var addButton = document.getElementById("add-button");
                                                    var activeSection = localStorage.getItem("activeSection");

                                                    for (var i = 0; i < buttons.length; i++) {
                                                        buttons[i].addEventListener("click", function (event) {
                                                            event.preventDefault();
                                                            var sectionName = this.getAttribute("data-section");
                                                            showSection(sectionName);

                                                            for (var j = 0; j < buttons.length; j++) {
                                                                buttons[j].classList.remove("active");
                                                            }

                                                            this.classList.add("active");

                                                            // Lưu trạng thái của phần tử vào Local Storage
                                                            localStorage.setItem("activeSection", sectionName);
                                                        });
                                                    }

                                                    if (activeSection) {
                                                        showSection(activeSection);
                                                        var activeButton = document.querySelector(".nav-2-level li a[data-section='" + activeSection + "']");
                                                        activeButton.classList.add("active");
                                                    }

                                                    addButton.addEventListener("click", function (event) {
                                                        event.preventDefault();
                                                        this.removeAttribute("onclick");
                                                        this.form.submit();
                                                    });
                                                });

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


        <script>
            function showDeleteConfirmationModal(productId) {
                var deleteProductLink = document.getElementById("deleteProductLink");
                deleteProductLink.href = "DeleteProductServlet?productId=" + productId;
                $('#confirmDeleteModal').modal('show');
            }
        </script>
        
     
        <!-- CORE PLUGINS-->


<script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL PLUGINS-->
<script src="./assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<script src="./assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
<script src="./assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
<script src="./assets/vendors/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jquery-knob/dist/jquery.knob.min.js" type="text/javascript"></script>
<script src="./assets/vendors/moment/min/moment.min.js" type="text/javascript"></script>
<script src="./assets/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="./assets/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jquery-minicolors/jquery.minicolors.min.js" type="text/javascript"></script>

<!-- CORE SCRIPTS-->
<script src="assets/js/app.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script src="./assets/js/scripts/dashboard_1_demo.js" type="text/javascript"></script>
<script src="./assets/js/scripts/form-plugins.js" type="text/javascript"></script>





<!-- CORE PLUGINS-->





    </body>

</html>