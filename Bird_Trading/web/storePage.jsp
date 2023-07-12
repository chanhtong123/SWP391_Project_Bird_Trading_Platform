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
        <title>Store Management</title>
        <!-- GLOBAL MAINLY STYLES-->
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
                        <li class="heading">Tính năng</li>
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
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Quản lý sản phẩm</h1>
                </div>


                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox-head">
                            <div class="ibox-title"> <a href="createNewProduct.jsp" class="btn btn-primary">Thêm sản phẩm</a></div>
                        </div>
                        <div class="ibox-body">
                            <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Cửa hàng</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Mô tả</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Loại</th>
                                        <th>Trạng thái</th>
                                        <th>Ảnh</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td></td><td></td>
                                        <td></td><td></td>
                                        <td></td><td></td>
                                        <td></td><td></td>
                                        <td></td><td></td>
                                    </tr>

                                    <c:forEach var="product" items="${products}">
                                        <tr>                                         
                                            <td>${product.productId}</td>
                                            <td>${product.storeId}</td>                                              
                                            <td>${product.productName}</td>
                                            <td>${product.description}</td>
                                            <td>${product.price}</td>
                                            <td>${product.quantity}</td>
                                            <td>
                                                <%-- Apply category name mapping --%>
                                                <c:set var="categoryName" value="${product.categoryName}" />
                                                <c:choose>
                                                    <c:when test="${categoryName eq 'Bird'}">
                                                        Chim
                                                    </c:when>
                                                    <c:when test="${categoryName eq 'Bird cage'}">
                                                        Lồng Chim
                                                    </c:when>
                                                    <c:when test="${categoryName eq 'Accessory'}">
                                                        Phụ Kiện
                                                    </c:when>
                                                    <c:when test="${categoryName eq 'Food'}">
                                                        Cám Chim
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${categoryName}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <%-- Apply status mapping --%>
                                                <c:set var="status" value="${product.status}" />
                                                <c:choose>
                                                    <c:when test="${status eq 'Available'}">
                                                        Có Sẵn
                                                    </c:when>
                                                    <c:when test="${status eq 'Out of Stock'}">
                                                        Hết Hàng
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${status}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><img src="${product.image}" alt="Product Image" width="100px" height="100px"></td>
                                            <td>
                                                <div class="btn-group" role="group">
                                                    <a href="ProductUpdateServlet?action=edit&productId=${product.productId}" class="btn btn-primary btn-sm">Chỉnh Sửa</a>
                                                    <span style="margin-left: 10px;"></span> <!-- Khoảng trống giữa các nút -->
                                                    <a href="#" class="btn btn-danger btn-sm" onclick="showDeleteConfirmationModal('${product.productId}')">Xóa</a>
                                                </div>
                                            </td>


                                        </tr>



                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa sản phẩm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa sản phẩm này khỏi hệ thống bán hàng? Lưu ý sau khi xóa sẽ không thể khôi phục.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <a id="deleteProductLink" href="#" class="btn btn-danger">Xóa</a>
                                </div>
                            </div>
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
            function showDeleteConfirmationModal(productId) {
                var deleteProductLink = document.getElementById("deleteProductLink");
                deleteProductLink.href = "DeleteProductServlet?productId=" + productId;
                $('#confirmDeleteModal').modal('show');
            }
        </script>

    </body>

</html>
