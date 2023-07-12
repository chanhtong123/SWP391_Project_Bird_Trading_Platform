<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Profile</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="path/to/star-rating.css">

        <!-- PAGE LEVEL STYLES-->
    </head>

    <body class="fixed-navbar sidebar-mini">
        <c:if test="${sessionScope.userlogin == null}">
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
                                    <a class="dropdown-item" href="storeRegister.jsp"><i class="fa fa-user"></i>Tạo của hàng</a>
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
                        <li class="active">
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-file-text"></i>
                                <span class="nav-label">Tài khoản</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse in">
                                <li>
                                    <a class="active" href="UserServlet?action=profile">Hồ sơ</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- END SIDEBAR-->
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Tài khoản của tôi</h1>

                </div>
                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-3 col-md-4">
                            <div class="ibox">
                                <div class="ibox-body text-center">
                                    <div class="m-t-20">
                                        <img class="img-circle" src="./assets/img/users/u3.jpg" />
                                    </div>
                                    <h5 class="font-strong m-b-10 m-t-10">${userlogin.username}</h5>
                                    <div class="m-b-20 text-muted">${userlogin.role}</div>
                                    <div class="profile-social m-b-20">
                                        <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                        <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                        <a href="javascript:;"><i class="fa fa-pinterest"></i></a>
                                        <a href="javascript:;"><i class="fa fa-dribbble"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8">
                            <div class="ibox">
                                <div class="ibox-body">
                                    <ul class="nav nav-tabs tabs-line">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#tab-1" data-toggle="tab"><i class="ti-settings"></i> Hồ sơ</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tab-2" data-toggle="tab"><i class="ti-bar-chart"></i> Đơn hàng</a>
                                        </li>

                                        <!--                                        <li class="nav-item">
                                                                                    <a class="nav-link" href="#tab-3" data-toggle="tab"><i class="ti-announcement"></i> Feeds</a>
                                                                                </li>-->
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="tab-1">
                                            <form action="UserServlet?action=editProfile" method="POST">
                                                <input name="userId" type="text" value="${userlogin.userId}" hidden="">
                                                <input name="username" type="text" value="${userlogin.username}" hidden="">
                                                <input name="role" type="text" value="${userlogin.role}" hidden="">
                                                <div class="form-group">
                                                    <label>Full Name</label>
                                                    <input name="fullName" class="form-control" readonly="" type="text" value="${userlogin.fullname}" placeholder="Full Name">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input name="email" class="form-control" readonly="" type="text" value="${userlogin.email}" placeholder="Email address">
                                                </div>
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input name="address" class="form-control" type="text" value="${userlogin.address}" placeholder="Address">
                                                </div>
                                                <div class="form-group">
                                                    <label>Phone Number</label>
                                                    <input name="phoneNumber" class="form-control" type="text" value="${userlogin.phoneNumber}" placeholder="Phone Number">
                                                </div>
                                                <div class="form-group">
                                                    <label>Old Password</label>
                                                    <input name="oldPassword" class="form-control" type="password" placeholder="Password">
                                                </div>
                                                <c:if test="${requestScope.EDIT_ERROR != null}">
                                                    <div class="error-message color-red">${requestScope.EDIT_ERROR.notMatchPassword}</div>
                                                </c:if>
                                                <div class="form-group">
                                                    <label>New Password</label>
                                                    <input name="newPassword" class="form-control" type="password" placeholder="New Password">
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm</label>
                                                    <input name="confirm" class="form-control" type="password" placeholder="Confirm">
                                                </div>
                                                <c:if test="${requestScope.EDIT_SUCCESS != null}">
                                                    <div class="error-message color-green">${requestScope.EDIT_SUCCESS}</div>
                                                </c:if>
                                                <div class="form-group">
                                                    <button class="btn btn-default" type="submit">Submit</button>
                                                </div>
                                            </form>

                                        </div>
                                        <div class="tab-pane fade " id="tab-2">
                                            <div class="container">

                                                <div class="row">

                                                    <c:forEach items="${orderItem}" var="order">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="order-item bg-light p-4">

                                                                    <div class="row">
                                                                        <div class="col-md-3">
                                                                            <img style="width: 100px; height: 100px;" src="${order.imageUrl}" alt="Product Image">
                                                                        </div>
                                                                        <div class="col-md-9">
                                                                            <div class="order-info">
                                                                                <div><h3>${order.productName}</h3></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-12 text-right">
                                                                            <div class="order-price color-red">$${order.price}</div>
                                                                            <div>${order.status}</div>
                                                                            <c:if test="${order.status eq 'Complete'}">
                                                                            <div class="order-feedback">
                                                                                <button onclick="openFeedbackModal(${order.orderItemId})" data-orderitemid="${order.orderItemId}" class="btn btn-primary">Feedback</button>
                                                                                <div id="feedbackStatus_${order.orderItemId}" style="display: none;"></div>
                                                                            </div>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>  
                                                    </c:forEach>


                                                </div>
                                                <!-- Modal HTML -->
                                                <div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="feedbackModalLabel">Feedback</h5>
                                                                <!-- Thêm một phần tử HTML để hiển thị thông báo -->

                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body p-4">
                                                                <!-- Feedback form or content goes here -->
                                                                <!-- Example form fields -->
                                                                <label for="feedbackText">Your Feedback:</label>
                                                                <textarea class="form-control" id="feedbackText" rows="3"></textarea>
                                                                <div class="form-group">
                                                                    <label for="rating"></label>
                                                                    <div class="star-rating">
                                                                        <input type="radio" id="rating5" name="rating" value="5">
                                                                        <label for="rating5"></label>
                                                                        <input type="radio" id="rating4" name="rating" value="4">
                                                                        <label for="rating4"></label>
                                                                        <input type="radio" id="rating3" name="rating" value="3">
                                                                        <label for="rating3"></label>
                                                                        <input type="radio" id="rating2" name="rating" value="2">
                                                                        <label for="rating2"></label>
                                                                        <input type="radio" id="rating1" name="rating" value="1">
                                                                        <label for="rating1"></label>
                                                                    </div>
                                                                </div>
                                                                <input type="text" class="form-control" value="${userlogin.userId}" hidden="" id="userId">
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="button" class="btn btn-primary" id="submitFeedbackButton">Submit</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <style>
                                .profile-social a {
                                    font-size: 16px;
                                    margin: 0 10px;
                                    color: #999;
                                }

                                .profile-social a:hover {
                                    color: #485b6f;
                                }

                                .profile-stat-count {
                                    font-size: 22px
                                }

                                .star-rating {
                                    display: inline-flex;
                                    flex-direction: row-reverse;
                                    font-size: 0;
                                    position: relative;
                                    overflow: hidden;
                                    height:  30px;
                                }

                                .star-rating input {
                                    display: none;
                                }

                                .star-rating label {
                                    display: inline-block;
                                    width: 25px;
                                    height: 25px;
                                    margin: 0;
                                    padding: 0;
                                    font-size: 25px;
                                    text-align: center;
                                    color: #ddd;
                                    cursor: pointer;
                                }

                                .star-rating label:before {
                                    content: "\2605";
                                }

                                .star-rating input:checked ~ label {
                                    color: #ffcc00;
                                }

                            </style>
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
                <script src="./assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
                <!-- CORE SCRIPTS-->
                <script src="assets/js/app.min.js" type="text/javascript"></script>
                <!-- PAGE LEVEL SCRIPTS-->
                <script src="./assets/js/scripts/profile-demo.js" type="text/javascript"></script>
                <script src="path/to/star-rating.js"></script>
                <!-- JavaScript code to control the modal -->
                <script>
                                                                                    $(document).ready(function () {
                                                                                        $('#submitFeedbackButton').click(function () {
                                                                                            // Lấy các giá trị từ các trường nhập liệu trong modal
                                                                                            var orderItemId = selectedOrderItemId; // Sử dụng giá trị từ biến selectedOrderItemId
                                                                                            var userId = $('#userId').val();
                                                                                            var rating = $('input[name="rating"]:checked').val();
                                                                                            var comment = $('#feedbackText').val();

                                                                                            // Gửi dữ liệu bằng Ajax tới Servlet
                                                                                            $.ajax({
                                                                                                url: 'FeedbackServlet',
                                                                                                type: 'POST',
                                                                                                data: {
                                                                                                    orderItemId: orderItemId,
                                                                                                    userId: userId,
                                                                                                    rating: rating,
                                                                                                    comment: comment
                                                                                                },
                                                                                                success: function (response) {
                                                                                                    // Xử lý phản hồi từ Servlet
                                                                                                    if (response === 'sent') {
                                                                                                        // Feedback đã được gửi thành công
                                                                                                        $('#feedbackStatus_' + orderItemId).text('Feedback đã được gửi.');
                                                                                                        $('#feedbackStatus_' + orderItemId).show();
                                                                                                    } else if (response === 'alreadySent') {
                                                                                                        // Feedback đã được gửi trước đó
                                                                                                        $('#feedbackStatus_' + orderItemId).text('Bạn đã gửi feedback cho mục này.');
                                                                                                        $('#feedbackStatus_' + orderItemId).show();
                                                                                                    } else {
                                                                                                        // Xử lý phản hồi khác (nếu có)
                                                                                                    }

                                                                                                    // Đóng modal
                                                                                                    $('#feedbackModal').modal('hide');
                                                                                                },
                                                                                                error: function (xhr, status, error) {
                                                                                                    // Xử lý lỗi (nếu có)
                                                                                                }
                                                                                            });
                                                                                        });
                                                                                    });
                                                                                    function openFeedbackModal(orderItemId) {
                                                                                        // Thực hiện các thao tác để mở modal feedback và thiết lập giá trị của selectedOrderItemId
                                                                                        selectedOrderItemId = orderItemId;
                                                                                        $('#feedbackModal').modal('show');
                                                                                    }


                </script>
                </body>

                </html>