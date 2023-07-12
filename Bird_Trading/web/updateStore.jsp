<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Update Product</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->

        <style>
            .gg {
                padding-right: 20px;
                padding-left: 200px;
                border-radius: 8px;
            }
        </style>
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
                                    <a href="UpdateStoreServlet?action=edit&storeId=${userlogin.userId}">Cập nhập thông tin Shop</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>




            <!-- END SIDEBAR-->




            <br><br><br>
            <div class="gg" style="">
                <div class="row"
                     style="border: 0px ; border-radius: 5px; width: 1600px; height: 860px; margin: 0 auto; padding: 10px;">
                    <div class="col-sm-6" style="height: 150%;">
                        <h2 class="myclass">Cập Nhập Thông Tin Cửa Hàng</h2>
                        <form action="UpdateStoreServlet?action=${ACTION}" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label>Tên cửa Hàng</label>
                                <input type="text" value="${INFOR.store_name}" class="form-control" name="storeName" placeholder="" >
                            </div>

                            <input type="text" value="${INFOR.user_id}" class="form-control" name="userId" hidden="" >
                            <input type="text" value="${INFOR.store_id}" class="form-control" name="storeId" hidden="">





                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" value="${INFOR.address}" class="form-control" name="adresss" placeholder="" >
                            </div>

                            <div class="form-group">
                                <label>Số điện thoại liên lạc</label>
                                <input type="text" value="${INFOR.phone_number}" class="form-control" name="phone" placeholder="Enter Product Name" style="height: 40px;">
                            </div>



                            <div>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal" >Lưu Thông Tin Mới</button>
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <a href="StoreHomeServlet" class="btn btn-primary">Quay Về Trang Quản Lý</a>
                            </div>

                    </div>

                    <div class="col-sm-6">
                        <br>

                        <div class="form-group">
                            <label>Ảnh đại diện của cửa hàng</label>
                            <br/><br/>
                            <img src="${INFOR.image}" width="500px" /><br/><br/>
                            <input type="file" class="form-control" name="photo" placeholder="Upload Image">
                        </div>

                    </div>



                    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">Xác nhận lưu thông tin mới</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Lưu ý sau khi lưu mọi thông tin cũ sẽ biến mất. Bạn có chắc chắn muốn lưu thông tin mới?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary" onclick="saveAndGoBack()">Lưu</button>

                                </div>
                            </div>
                        </div>
                    </div>



                    </form>
                </div>
            </div>
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
</script>


<script>
    function saveAndGoBack() {
        // Code xử lý lưu thông tin

        // Chờ 3 giây trước khi chuyển hướng
        setTimeout(function () {
            window.location.href = "AdminHomeServlet";
        }, 3000); // Chuyển hướng sau 3 giây (3000 milliseconds)
    }

</script>




</body>

</html>