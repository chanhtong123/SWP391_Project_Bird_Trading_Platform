<%-- 
    Document   : form_validation
    Created on : Jun 14, 2023, 1:13:04 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Admincast bootstrap 4 &amp; angular 5 admin template, Шаблон админки | Form Validation</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="index.html">
                        <span class="brand">Admin
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
                                        <a class="pull-right" href="mailbox.html">view all</a>
                                    </div>
                                </li>
                                <li class="list-group list-group-divider scroller" data-height="240px" data-color="#71808f">
                                    <div>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <img src="./assets/img/users/u1.jpg" />
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-strong"> </div>Jeanne Gonzalez<small class="text-muted float-right">Just now</small>
                                                    <div class="font-13">Your proposal interested me.</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <img src="./assets/img/users/u2.jpg" />
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-strong"></div>Becky Brooks<small class="text-muted float-right">18 mins</small>
                                                    <div class="font-13">Lorem Ipsum is simply.</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <img src="./assets/img/users/u3.jpg" />
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-strong"></div>Frank Cruz<small class="text-muted float-right">18 mins</small>
                                                    <div class="font-13">Lorem Ipsum is simply.</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="list-group-item">
                                            <div class="media">
                                                <div class="media-img">
                                                    <img src="./assets/img/users/u4.jpg" />
                                                </div>
                                                <div class="media-body">
                                                    <div class="font-strong"></div>Rose Pearson<small class="text-muted float-right">3 hrs</small>
                                                    <div class="font-13">Lorem Ipsum is simply.</div>
                                                </div>
                                            </div>
                                        </a>
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
                            <div class="font-strong">James Brown</div><small>Administrator</small></div>
                    </div>
                    <ul class="side-menu metismenu">
                        <li>
                            <a href="index.html"><i class="sidebar-item-icon fa fa-th-large"></i>
                                <span class="nav-label">Dashboard</span>
                            </a>
                        </li>
                        <li class="heading">FEATURES</li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-bookmark"></i>
                                <span class="nav-label">Basic UI</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="colors.html">Colors</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="panels.html">Panels</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="tabs.html">Tabs</a>
                                </li>
                                <li>
                                    <a href="alerts_tooltips.html">Alerts &amp; Tooltips</a>
                                </li>
                                <li>
                                    <a href="badges_progress.html">Badges &amp; Progress</a>
                                </li>
                                <li>
                                    <a href="lists.html">List</a>
                                </li>
                                <li>
                                    <a href="cards.html">Card</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                                <span class="nav-label">Forms</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse in">
                                <li>
                                    <a href="form_basic.html">Basic Forms</a>
                                </li>
                                <li>
                                    <a href="form_advanced.html">Advanced Plugins</a>
                                </li>
                                <li>
                                    <a href="form_masks.html">Form input masks</a>
                                </li>
                                <li>
                                    <a class="active" href="form_validation.html">Form Validation</a>
                                </li>
                                <li>
                                    <a href="text_editors.html">Text Editors</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-table"></i>
                                <span class="nav-label">Tables</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="table_basic.html">Basic Tables</a>
                                </li>
                                <li>
                                    <a href="datatables.html">Datatables</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-bar-chart"></i>
                                <span class="nav-label">Charts</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="charts_flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="charts_morris.html">Morris Charts</a>
                                </li>
                                <li>
                                    <a href="chartjs.html">Chart.js</a>
                                </li>
                                <li>
                                    <a href="charts_sparkline.html">Sparkline Charts</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-map"></i>
                                <span class="nav-label">Maps</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="maps_vector.html">Vector maps</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="icons.html"><i class="sidebar-item-icon fa fa-smile-o"></i>
                                <span class="nav-label">Icons</span>
                            </a>
                        </li>
                        <li class="heading">PAGES</li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-envelope"></i>
                                <span class="nav-label">Mailbox</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="mailbox.html">Inbox</a>
                                </li>
                                <li>
                                    <a href="mail_view.html">Mail view</a>
                                </li>
                                <li>
                                    <a href="mail_compose.html">Compose mail</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="calendar.html"><i class="sidebar-item-icon fa fa-calendar"></i>
                                <span class="nav-label">Calendar</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-file-text"></i>
                                <span class="nav-label">Pages</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="invoice.html">Invoice</a>
                                </li>
                                <li>
                                    <a href="profile.html">Profile</a>
                                </li>
                                <li>
                                    <a href="login.html">Login</a>
                                </li>
                                <li>
                                    <a href="register.html">Register</a>
                                </li>
                                <li>
                                    <a href="lockscreen.html">Lockscreen</a>
                                </li>
                                <li>
                                    <a href="forgot_password.html">Forgot password</a>
                                </li>
                                <li>
                                    <a href="error_404.html">404 error</a>
                                </li>
                                <li>
                                    <a href="error_500.html">500 error</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-sitemap"></i>
                                <span class="nav-label">Menu Levels</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="javascript:;">Level 2</a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="nav-label">Level 2</span><i class="fa fa-angle-left arrow"></i></a>
                                    <ul class="nav-3-level collapse">
                                        <li>
                                            <a href="javascript:;">Level 3</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">Level 3</a>
                                        </li>
                                    </ul>
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
                    <h1 class="page-title">Form Validation</h1>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="la la-home font-20"></i></a>
                        </li>
                        <li class="breadcrumb-item">Form Validation</li>
                    </ol>
                </div>
                <div class="page-content fade-in-up">
                    <div class="alert bg-white">
                        <h4>jQuery Validation Plugin</h4>
                        <p>This jQuery plugin makes simple clientside form validation easy, whilst still offering plenty of customization options. For more info please check out</p>
                        <p>
                            <a class="btn btn-success" href="https://jqueryvalidation.org/" target="_blank">Official Site</a>
                        </p>
                    </div>
                    <div class="ibox">
                        <div class="ibox-head">
                            <div class="ibox-title">Basic Validation</div>
                            <div class="ibox-tools">
                                <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                            </div>
                        </div>
                        <div class="ibox-body">

                            <form action="ProductCreateServlet" class="form-horizontal" id="form-sample-1" method="post" novalidate="novalidate">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="productName">Tên Sản Phẩm</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" id="productName" name="productName" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="storeId">Mã cửa hàng:</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" id="storeId" name="storeId" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="price">Giá:</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="number" id="price" name="price" step="0.01" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="quantity">Số lượng:</label>
                                    <div class="col-sm-10">
                                        <input class="form-control"  type="number" id="quantity" name="quantity" required>
                                    </div>
                                </div>

                                <div class="form-group row" >
                                    <label class="col-sm-2 col-form-label" for="description">Mô tả:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="description" name="description" required></textarea>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="categoryName">Danh mục:</label>
                                    <div class="col-sm-10">
                                        <select  id="categoryName" name="categoryName" required>
                                            <option value="Bird">Chim</option>
                                            <option value="Food">Thức ăn</option>
                                            <option value="Bird cage">Lồng Chim</option>
                                            <option value="Accessory">Phụ kiện</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="status">Trạng thái:</label>
                                    <div class="col-sm-10">
                                        <select id="status" name="status" required>
                                            <option value="Available">Có sẵn</option>
                                            <option value="Out of stock">Hết hàng</option>
                                            <option value="Hidden">Ẩn</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="image">Hình ảnh:</label>
                                    <div class="col-sm-10">
                                        <input type="file" id="image" name="image" onchange="previewImage(event)">
                                        <img id="preview" src="#" alt="Hình ảnh xem trước" style="max-width: 200px; max-height: 200px; display: none;">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10 ml-sm-auto">
                                        <!--<button class="btn btn-info" type="submit">Submit</button>-->
                                        <input class="btn btn-info" type="submit" value="Create Product">
                                    </div>
                                </div>
                            </form>


                        </div>
                    </div>

                </div>
                <!-- END PAGE CONTENT-->

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
        <script src="./assets/vendors/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL SCRIPTS-->
        <script type="text/javascript">
                                            $("#form-sample-1").validate({
                                                rules: {
                                                    name: {
                                                        minlength: 2,
                                                        required: !0
                                                    },
                                                    email: {
                                                        required: !0,
                                                        email: !0
                                                    },
                                                    url: {
                                                        required: !0,
                                                        url: !0
                                                    },
                                                    number: {
                                                        required: !0,
                                                        number: !0
                                                    },
                                                    min: {
                                                        required: !0,
                                                        minlength: 3
                                                    },
                                                    max: {
                                                        required: !0,
                                                        maxlength: 4
                                                    },
                                                    password: {
                                                        required: !0
                                                    },
                                                    password_confirmation: {
                                                        required: !0,
                                                        equalTo: "#password"
                                                    }
                                                },
                                                errorClass: "help-block error",
                                                highlight: function (e) {
                                                    $(e).closest(".form-group.row").addClass("has-error")
                                                },
                                                unhighlight: function (e) {
                                                    $(e).closest(".form-group.row").removeClass("has-error")
                                                },
                                            });
        </script>


        <script>
            function previewImage(event) {
                var input = event.target;
                var preview = document.getElementById('preview');

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </body>

</html>