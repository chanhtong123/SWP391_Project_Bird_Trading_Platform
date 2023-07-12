<%-- 
    Document   : storeRegisterList
    Created on : Jun 11, 2023, 10:37:27 PM
    Author     : MSl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách cửa hàng</title>
        <link href="css/storeRegisterList.css" rel="stylesheet" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">

        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
    </head>
    <body class="fixed-navbar">   
        <c:if test="${sessionScope.userlogin == null || sessionScope.userlogin.role ne 'Staff'}">
            <c:redirect url="ShowProductsServlet"></c:redirect>
        </c:if>   
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="UserServlet?action=list">
                        <span class="brand">Staff
                            <span class="brand-tip">CAST</span>
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
                        <li class="dropdown dropdown-inbox">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope-o"></i>
                                <span class="badge badge-primary envelope-badge">9</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media">
                                <li class="dropdown-menu-header">
                                    <div>
                                        <span><strong>9 New</strong> Messages</span>
                                        <a class="pull-right" href="mailbox.jsp">view all</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-notification">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell-o rel"><span class="notify-signal"></span></i></a>
                            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media">
                                <li class="dropdown-menu-header">
                                    <div>
                                        <span><strong>5 New</strong> Notifications</span>
                                        <a class="pull-right" href="javascript:;">view all</a>
                                    </div>
                                </li>
                                <li class="list-group list-group-divider scroller" data-height="240px" data-color="#71808f">
                                    <div>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <span class="badge badge-success badge-big"><i class="fa fa-check"></i></span>
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-13">4 task compiled</div><small class="text-muted">22 mins</small></div>
                                            </div>
                                        </a>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <span class="badge badge-default badge-big"><i class="fa fa-shopping-basket"></i></span>
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-13">You have 12 new orders</div><small class="text-muted">40 mins</small></div>
                                            </div>
                                        </a>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <span class="badge badge-danger badge-big"><i class="fa fa-bolt"></i></span>
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-13">Server #7 rebooted</div><small class="text-muted">2 hrs</small></div>
                                            </div>
                                        </a>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <span class="badge badge-success badge-big"><i class="fa fa-user"></i></span>
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-13">New user registered</div><small class="text-muted">2 hrs</small></div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-user">
                            <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                                <img src="./assets/img/admin-avatar.png" />
                                <span></span>${userlogin.username}<i class="fa fa-angle-down m-l-5"></i></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="profile.html"><i class="fa fa-user"></i>Profile</a>
                                <a class="dropdown-item" href="profile.html"><i class="fa fa-cog"></i>Settings</a>
                                <a class="dropdown-item" href="javascript:;"><i class="fa fa-support"></i>Support</a>
                                <li class="dropdown-divider"></li>
                                <a class="dropdown-item" href="UserServlet?action=logout"><i class="fa fa-power-off"></i>Logout</a>
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
                        <li class="heading">FEATURES</li>
                        <li class="active">
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-table"></i>
                                <span class="nav-label">Tables</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse in">                                <li>
                                    <a  href="UserServlet?action=list">Quản lý người dùng</a>
                                </li>
                                <li>
                                    <a class="active" href="ShowStoreRegisterServlet">Duyệt cửa hàng</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- END SIDEBAR-->

        </div>
    </body>
</html>