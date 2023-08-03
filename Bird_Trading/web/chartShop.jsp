<%@page import="DTO.OrderItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Statistic</title>
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
        <c:if test="${sessionScope.userlogin == null && sessionScope.userlogin.role ne 'Store Manager'}">
            <c:redirect url="ShowProductsServlet"></c:redirect>
        </c:if> 
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="ShowProductsServlet">
                        <span class="brand">
                            <span class="h5 text-uppercase text-dark bg-light px-2">Bird</span>
                            <span class="h5 text-uppercase text-light bg-primary px-2 ml-n1">Trading</span>
                        </span>
                        <span class="brand-mini">
                            BT
                        </span>
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
                                <c:if test="${userlogin != null && userlogin.role eq 'User'}">
                                    <a class="dropdown-item" href="storeRegister.jsp"><i class="fa fa-user"></i>Đăng ký của hàng</a>
                                </c:if>
                                <c:if test="${userlogin != null && userlogin.role eq 'Store Manager'}">
                                    <a class="dropdown-item" href="StoreHomeServlet"><i class="fa fa-file"></i>Cửa hàng</a>
                                </c:if>
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
                        <li>
                            <form action="ShopeSale" method="post">
                                <a class="active" href="javascript:void(0)" onclick="this.parentNode.submit()">
                                    <i class="sidebar-item-icon fa fa-th-large"></i>
                                    <span class="nav-label">Thống Kê Cửa Hàng</span>
                                </a>
                            </form>

                        </li>
                    </ul>
                    <ul class="side-menu metismenu">
                        <li class="heading">FEATURES</li>
                        <li class="active">
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-table"></i>
                                <span class="nav-label">Quản lí</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse in">
                                <li>
                                    <a class="active" href="storePage.jsp">Quản lý sản phẩm</a>
                                </li>
                                <li>
                                    <a href="createNewProduct.jsp">Tạo sản phẩm mới</a>
                                </li>

                                <li>
                                    <a href="UpdateStoreServlet?action=edit&userid=${userlogin.userId}">Cập nhập thông tin Shop</a>
                                </li>


                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>



            <!-- END SIDEBAR-->
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-success color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">${quantityOrder}</h2>
                                    <div class="m-b-5">Các đơn đặt hàng</div><i class="ti-shopping-cart widget-stat-icon"></i>
                                    <div><i class="fa fa-level-up m-r-5"></i><small>25% higher</small></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-info color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">${quantityPTstore}</h2>
                                    <div class="m-b-5">Loại Sản Phẩm</div><i class="ti-bar-chart widget-stat-icon"></i>
                                    <div><i class="fa fa-level-up m-r-5"></i><small></small></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-warning color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">₫${oderPrice}</h2>
                                    <div class="m-b-5">Tổng Doanh Thu Thực Tế</div><i class="fa fa-money widget-stat-icon"></i>
                                    <div><i class="fa fa-level-up m-r-5"></i><small>22% higher</small></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-danger color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">${quantityPT}</h2>
                                    <div class="m-b-5">Tổng tất cả số lượng sản phẩm</div><i class="ti-user widget-stat-icon"></i>
                                    <div><i class="fa fa-level-down m-r-5"></i><small>Tổng tất cả số lượng sản phẩm</small></div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-8">
                            <div class="ibox">
                                <div class="ibox-body">
                                    <div class="flexbox mb-4">
                                        
                                    </div>
                                    <div>
                                        <canvas id="line_chart" style="height: 150px;"></canvas>

                                    </div>
                                </div>
                            </div>
                        </div>
                       
</div>

                    <!--Date Start-->
                    <div class="ibox">
                        <div class="ibox-body">
                            <form action="ShopeSale" method="get">
                                <div class="form-group" id="date_5">
                                    <label class="font-normal"></label>
                                    <div class="input-daterange input-group" id="datepicker">
                                        <input class="input-sm form-control" type="text" id="start" name="start" value="07/28/2023">
                                        <span class="input-group-addon p-l-10 p-r-10">đến</span>
                                        <input class="input-sm form-control" type="text" id="end" name="end" value="07/28/2023">
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





                    <!-- START PAGE CONTENT-->
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
                                        <th>Mã hóa đơn</th>
                                        <th>Tên khách hàng</th>
                                        <th>Điện thoại liên lạc</th>                                       
                                        <th>Địa chỉ</th>
                                        <th>Ngày đặt hàng</th>
                                      


                                    </tr>
                                </thead>                             

                                <tbody>
                                    <tr>
                                        <td></td><td></td>
                                        <td></td> <td></td>
                                        <td></td><td></td>
                                        <td></td> <td></td>
                                         <td></td> <td></td>
                                    </tr>
                                    <c:forEach var="ordermoi" items="${ordermoi}" varStatus="status">
                                        <tr class="main-row" data-order-id="${ordermoi.orderId}">
                                            <td>${status.index + 1}</td>
                                            <td>${ordermoi.orderId}</td>
                                            <td>${ordermoi.user_name}</td>
                                            <td>${ordermoi.phone_number}</td>
                                            <td>${ordermoi.address} (${ordermoi.province_name})</td>
                                            <td>${ordermoi.orderDate}</td>
                                                               

                                        </tr>


                                        <tr class="sub-row" style="display: none;">
                                            <td colspan="8"> <!-- Cột mới chứa bảng con -->
                                                <table>
                                                    <thead>
                                                        <tr>                                      
                                                            <th>STT</th>
                                                            <th>Mã Sản Phẩm</th>
                                                            <th>Mã Hàng Cửa</th>
                                                            <th>Ảnh Sản Phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Loại</th>
                                                            <th>Số Lượng</th>
                                                            <th>Giá Tiền</th>
                                                            <th>Ngày Đặt Hàng</th>
                                                            <th>Trạng Thái Đơn Hàng</th>
                                                        </tr>
                                                    </thead>
                                                    <c:forEach items="${orderList}" var="orderList">
                                                         <c:if test="${orderList.orderId eq ordermoi.orderId}"> <!-- Lọc theo orderId -->
                                                        <tr>
                                                            <td>${orderList.orderItemId}</td>
                                                            <td>${orderList.sttPT}</td>
                                                            <td>${orderList.storeId}</td>
                                                            <td><img src="${orderList.imageUrl}" alt="Product Image" width="100px" height="100px"></td>                                         
                                                            <td>${orderList.productName}</td>
                                                            <td>${orderList.categoryName}</td>
                                                            <td>${orderList.quantity}</td>
                                                            <td>${orderList.price}</td>                              
                                                            <td>${orderList.orderItem_date}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${orderList.status eq 'Order confirmation'}">
                                                                        <a href="UpdateStatusOrderItemServlet?orderItemId=${orderList.orderItemId}" class="btn btn-bitbucket btn-sm">Xác nhận đơn hàng</a>
                                                                        <a href="UpdateStatusOrderItemServlet3?orderItemId=${orderList.orderItemId}" class="btn btn-danger btn-sm">Hủy Đơn Hàng</a>
                                                                    </c:when>
                                                                    <c:when test="${orderList.status eq 'Delivery in progress'}">
                                                                        <a href="UpdateStatusOrderItemServlet2?orderItemId=${orderList.orderItemId}" class="btn btn-openid btn-sm"> Đang Giao Hàng</a>
                                                                        <a href="UpdateStatusOrderItemServlet3?orderItemId=${orderList.orderItemId}" class="btn btn-danger btn-sm">Hủy Đơn Hàng</a>
                                                                    </c:when>
                                                                    <c:when test="${orderList.status eq 'Complete'}">                         
                                                                        <div class="btn btn-github btn-sm">Đã Hoàn Thành</div>
                                                                    </c:when>
                                                                    <c:when test="${orderList.status eq 'Delete'}">                         
                                                                        <div class="btn btn-danger btn-sm">Đã Hủy Đơn</div>
                                                                    </c:when>
                                                                </c:choose>

                                                            </td>
                                                        </tr>
                                                          </c:if>
                                                    </c:forEach>
                                                </table>
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
            <style>
                .visitors-table tbody tr td:last-child {
                    display: flex;
                    align-items: center;
                }

                .visitors-table .progress {
                    flex: 1;
                }

                .visitors-table .progress-parcent {
                    text-align: right;
                    margin-left: 10px;
                }
            </style>

        </div>

    </div>
</div>
<!-- BEGIN THEME CONFIG PANEL-->
<div class="theme-config">
    <div class="theme-config-toggle"><i class="fa fa-cog theme-config-show"></i><i class="ti-close theme-config-close"></i></div>
    <div class="theme-config-box">
        <div class="text-center font-18 m-b-20">SETTINGS</div>
        <div class="font-strong">LAYOUT OPTIONS</div>
        <div class="check-list m-b-20 m-t-10">
            <label class="ui-checkbox ui-checkbox-gray">
                <input id="_fixedNavbar" type="checkbox" checked>
                <span class="input-span"></span>Fixed navbar</label>
            <label class="ui-checkbox ui-checkbox-gray">
                <input id="_fixedlayout" type="checkbox">
                <span class="input-span"></span>Fixed layout</label>
            <label class="ui-checkbox ui-checkbox-gray">
                <input class="js-sidebar-toggler" type="checkbox">
                <span class="input-span"></span>Collapse sidebar</label>
        </div>
        <div class="font-strong">LAYOUT STYLE</div>
        <div class="m-t-10">
            <label class="ui-radio ui-radio-gray m-r-10">
                <input type="radio" name="layout-style" value="" checked="">
                <span class="input-span"></span>Fluid</label>
            <label class="ui-radio ui-radio-gray">
                <input type="radio" name="layout-style" value="1">
                <span class="input-span"></span>Boxed</label>
        </div>
        <div class="m-t-10 m-b-10 font-strong">THEME COLORS</div>
        <div class="d-flex m-b-20">
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Default">
                <label>
                    <input type="radio" name="setting-theme" value="default" checked="">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-white"></div>
                    <div class="color-small bg-ebony"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Blue">
                <label>
                    <input type="radio" name="setting-theme" value="blue">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-blue"></div>
                    <div class="color-small bg-ebony"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Green">
                <label>
                    <input type="radio" name="setting-theme" value="green">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-green"></div>
                    <div class="color-small bg-ebony"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Purple">
                <label>
                    <input type="radio" name="setting-theme" value="purple">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-purple"></div>
                    <div class="color-small bg-ebony"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Orange">
                <label>
                    <input type="radio" name="setting-theme" value="orange">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-orange"></div>
                    <div class="color-small bg-ebony"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Pink">
                <label>
                    <input type="radio" name="setting-theme" value="pink">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-pink"></div>
                    <div class="color-small bg-ebony"></div>
                </label>
            </div>
        </div>
        <div class="d-flex">
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="White">
                <label>
                    <input type="radio" name="setting-theme" value="white">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color"></div>
                    <div class="color-small bg-silver-100"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Blue light">
                <label>
                    <input type="radio" name="setting-theme" value="blue-light">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-blue"></div>
                    <div class="color-small bg-silver-100"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Green light">
                <label>
                    <input type="radio" name="setting-theme" value="green-light">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-green"></div>
                    <div class="color-small bg-silver-100"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Purple light">
                <label>
                    <input type="radio" name="setting-theme" value="purple-light">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-purple"></div>
                    <div class="color-small bg-silver-100"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Orange light">
                <label>
                    <input type="radio" name="setting-theme" value="orange-light">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-orange"></div>
                    <div class="color-small bg-silver-100"></div>
                </label>
            </div>
            <div class="color-skin-box" data-toggle="tooltip" data-original-title="Pink light">
                <label>
                    <input type="radio" name="setting-theme" value="pink-light">
                    <span class="color-check-icon"><i class="fa fa-check"></i></span>
                    <div class="color bg-pink"></div>
                    <div class="color-small bg-silver-100"></div>
                </label>
            </div>
        </div>
    </div>
</div>
<!-- END THEME CONFIG PANEL-->
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
<script>
                                    // Lắng nghe sự kiện khi giá trị của các phần tử input thay đổi
                                    document.getElementById("start").addEventListener("change", sendDateRange);
                                    document.getElementById("end").addEventListener("change", sendDateRange);

                                    // Hàm xử lý sự kiện khi ngày tháng thay đổi
                                    function sendDateRange() {
                                        var start = document.getElementById("start").value;
                                        var end = document.getElementById("end").value;

                                        // Gửi giá trị ngày tháng về trang "AdminChartServlet"
                                        var url = "ShopeSale?start=" + encodeURIComponent(start) + "&end=" + encodeURIComponent(end);
                                        window.location.href = url;
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


<script>
    function showDeleteConfirmationModal(productId) {
        var deleteProductLink = document.getElementById("deleteProductLink");
        deleteProductLink.href = "DeleteProductServlet?productId=" + productId;
        $('#confirmDeleteModal').modal('show');
    }
</script>



<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy tất cả các hàng chính (main-row) trong bảng
        const mainRows = document.querySelectorAll(".main-row");

        // Lặp qua từng hàng chính và thêm sự kiện click
        mainRows.forEach((mainRow) => {
            mainRow.addEventListener("click", function () {
                // Lấy hàng con (sub-row) của hàng chính đó
                const subRow = mainRow.nextElementSibling;

                // Kiểm tra và điều khiển hiển thị bảng con
                if (subRow.style.display === "none") {
                    subRow.style.display = "table-row";
                } else {
                    subRow.style.display = "none";
                }
            });
        });
    });
</script>

 <script>
                // Hàm tính tổng số đơn hàng bán được theo ngày
                function getTotalOrdersByDate(date, orderData) {
                    // Chuyển ngày thành chuỗi định dạng YYYY-MM-DD
                    const formattedDate = moment(date, "MMM D, YYYY h:mm:ss A").format("YYYY-MM-DD");

                    // Lọc dữ liệu đơn hàng theo ngày cụ thể
                    const ordersByDate = orderData.filter(order => moment(order.orderDate, "MMM D, YYYY h:mm:ss A").format("YYYY-MM-DD") === formattedDate);

                    // Tính tổng số đơn hàng bán được cho ngày cụ thể
                    const totalOrders = ordersByDate.length;
                    return totalOrders;
                }

                // Dữ liệu đơn hàng từ session sẽ được đưa vào đây
                const orderDataString = '${sessionScope.orderData}';
                const orderData = orderDataString ? JSON.parse(orderDataString) : [];

                // Chuyển định dạng số totalAmount và orderDate thành dạng đúng
                orderData.forEach(order => {
                    order.totalAmount = parseFloat(order.totalAmount.toString().replace(/\./g, '').replace(',', '.'));
                    order.orderDate = moment(order.orderDate, "MMM D, YYYY h:mm:ss A").format("YYYY-MM-DD h:mm:ss");
                });

                // Tạo dữ liệu cho biểu đồ đường
                const startDate = moment("2023-08-01"); // Ngày bắt đầu
                const endDate = moment("2023-08-15"); // Ngày kết thúc
                const labels = [];
                const data = [];
                const tooltipData = [];
                let currentDate = startDate.clone();
                while (currentDate.isSameOrBefore(endDate, 'day')) {
                    const formattedDate = currentDate.format("YYYY-MM-DD");
                    labels.push(formattedDate);
                    const totalRevenue = orderData.reduce((sum, order) => {
                        if (moment(order.orderDate).format("YYYY-MM-DD") === formattedDate) {
                            return sum + order.totalAmount;
                        } else {
                            return sum;
                        }
                    }, 0);
                    data.push(totalRevenue);
                    const totalOrders = getTotalOrdersByDate(formattedDate, orderData);
                    tooltipData.push({date: formattedDate, orders: totalOrders});
                    currentDate.add(1, 'day');
                }

                // Dữ liệu biểu đồ đường
                const chartData = {
                    labels: labels,
                    datasets: [{
                            label: 'Doanh thu hàng ngày',
                            data: data,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Màu cho đường
                            borderColor: 'rgba(75, 192, 192, 1)', // Màu viền cho đường
                            borderWidth: 1 // Độ dày viền cho đường
                        }]
                };

                // Tạo biểu đồ đường
                const ctx = document.getElementById('line_chart').getContext('2d');
                const myLineChart = new Chart(ctx, {
                    type: 'line',
                    data: chartData,
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true // Bắt đầu trục y từ giá trị 0
                            }
                        },
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: (context) => {
                                        const data = tooltipData[context.dataIndex];
                                        return `Doanh thu: ${context.dataset.data[context.dataIndex].toLocaleString()} VND\nSố đơn hàng: ${data.orders}`;
                                    }
                                }
                            }
                        }
                    }
                });
            </script>


</body>

</html>