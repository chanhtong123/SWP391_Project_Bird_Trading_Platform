<%-- 
    Document   : datatables
    Created on : Jun 14, 2023, 3:55:20 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Staff page</title>
        <!-- GLOBAL MAINLY STYLES-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->
    </head>

    <body class="fixed-navbar">
        <c:if test="${sessionScope.userlogin == null && sessionScope.userlogin.role ne 'Staff'}">
            <c:redirect url="ShowProductsServlet"></c:redirect>
        </c:if> 
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="UserServlet?action=list">
                        <span class="brand">Staff 
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
                        <li class="heading">FEATURES</li>
                        <li class="active">
                            <a href="javascript:;">
                                <i class="sidebar-item-icon fa fa-table"></i>
                                <span class="nav-label">Sản phẩm</span>
                                <i class="fa fa-angle-left arrow"></i>
                            </a>
                            <ul class="nav-2-level collapse in">
                                <li>
                                    <a onclick="showSection('user-list-section')" href="#" data-section="user-list-section">Quản lý người dùng</a>
                                </li>
                                <li>
                                    <a onclick="showSection('store-register-list-section')" href="#" data-section="store-register-list-section">Duyệt cửa hàng</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>



            <!-- END SIDEBAR-->
            <div class="content-wrapper user-list-section section" id="user-list-section">
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Danh sách người dùng</h1>
                </div>


                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox">
                            <div class="table__wrap">
                                <table class="table">
                                    <thead class="table__header">
                                        <tr class="table__row">
                                            <th class="table__cell u-text-left">Tên người dùng</th>
                                            <th class="table__cell u-text-left">Họ và tên</th>
                                            <th class="table__cell u-text-left">Email</th>
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
                                                ${user.username}
                                            </td>
                                            <td class="table__account table__cell">
                                                ${user.fullname}
                                            </td>
                                            <input type="hidden" name="password" value="${user.password}">
                                            <td class="table__account table__cell">
                                                ${user.email}
                                            </td>
                                            <td class="table__account table__cell">
                                                ${user.address}
                                            </td>
                                            <td class="table__account table__cell">
                                                ${user.phoneNumber}
                                                <c:if test="${not empty errors.phoneFormatError}">
                                                    <p class="error-message">
                                                        ${errors.phoneFormatError}
                                                    </p>
                                                </c:if>
                                            </td>
                                            <td class="table__account table__cell">
                                                ${user.role}
                                            </td>
                                        </form>
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
            <div class="content-wrapper store-register-list-section section" id="store-register-list-section" style="display: none;">
                <!-- START PAGE CONTENT-->

                <div class="page-heading">
                    <h1 class="page-title">Danh sách đăng kí cửa hàng</h1>
                </div>


                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="table__wrap">
                            <table class="table">
                                <thead class="table__header">
                                    <tr class="table__row">
                                        <th class="table__cell u-text-left">Tên cửa hàng</th>
                                        <th class="table__cell u-text-left">Địa chỉ</th>
                                        <th class="table__cell u-text-left">Số điện thoại</th>
                                        <th class="table__cell u-text-left">ID người dùng</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="storeRegister" items="${stores}">
                                    <form method="POST" action="StoreServlet?action=registerStore">
                                        <tr class="table__row">
                                        <input type="text" hidden="" value="${storeRegister.store_register_id}" name="storeRegisterId" />
                                        <td class="table__account table__cell">
                                            <input type="text" readonly="" value="${storeRegister.store_name}" class="form-input" name="storeName" />
                                        </td>
                                        <td class="table__account table__cell"><input type="text" readonly="" value="${storeRegister.address}" name="address"  class="form-input"/></td>
                                        <td class="table__account table__cell"><input type="text" readonly="" value="${storeRegister.phone_number}" name="phoneNumber" class="form-input"/></td>
                                        <td class="table__account table__cell"><input type="text" readonly="" value="${storeRegister.user_id}" name="userId" class="form-input"/></td>
                                        <td><input type="submit" class="btn btn-dark" value="Đồng ý"  /></td>            
                                        <td class="table__transfer table__cell u-text-center"><a class="btn btn-outline-danger" href="StoreServlet?action=deleteRegisterStoreForm&storeRegisterId=${storeRegister.store_register_id}">Từ chối</a></td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN THEME CONFIG PANEL-->
        <!--        <div class="theme-config">
                    <div class="theme-config-toggle"><i class="fa fa-cog theme-config-show"></i><i class="ti-close theme-config-close"></i></div>
                    <div class="theme-config-box">
                        <div class="text-center font-18 m-b-20">SETTINGS</div>
                        <div class="font-strong">LAYOUT OPTIONS</div>
                        <div class="check-list m-b-20 m-t-10">
                            <label class="ui-checkbox ui-checkbox-gray">
                                <input id="_fixedNavbar" type="checkbox" checked>
                                <span class="input-span"></span>Fixed navbar</label>
                            <label class="ui-checkbox ui-checkbox-gray">
                                <input id="_fixedlayout" type="checkbox" >
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
                </div>-->
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
        <script src="./assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL SCRIPTS-->
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



        </script>
    </body>

</html>