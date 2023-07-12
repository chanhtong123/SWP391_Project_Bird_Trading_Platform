<%-- 
    Document   : table_basic
    Created on : Jun 14, 2023, 2:36:51 AM
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
        <title>Create Product</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
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
                    <h1 class="page-title">Tạo mới sản phẩm</h1>
                </div>


                <div class="page-content fade-in-up">
                    <div class="ibox">

                        <!--<a href="AdminHomeServlet">Home</a>-->
                        <div class="ibox-body"> 
                            <form action="ProductCreateServlet" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="productName">Tên sản phẩm:</label>
                                    <input type="text" id="productName" name="productName" required><br>
                                </div>             

                                <input type="text" id="storeId" name="storeId" hidden="" value="${storeManager.store_id}"><br>                       

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="price">Giá:</label>
                                    <input type="number" id="price" name="price" step="0.0000000001" min="0"
                                           required oninput="validatePrice(this)" onkeydown="return event.keyCode !== 189;"><br>
                                </div>




                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="quantity">Số lượng:</label>
                                    <input type="number" id="quantity" name="quantity" required min="1" step="1" oninput="this.value = Math.abs(this.value)" onkeydown="return event.keyCode !== 189;"><br>
                                </div>



                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="description">Mô tả:</label>
                                    <textarea id="description" name="description" required></textarea>
                                </div>

                                <div class="form-group row">
                                    <label for="categoryName">Danh mục:</label>
                                    <select id="categoryName" name="categoryName" required>
                                        <option value="Bird">Chim</option>
                                        <option value="Food">Thức ăn</option>
                                        <option value="Bird cage">Lồng Chim</option>
                                        <option value="Accessory">Phụ kiện</option>
                                    </select>
                                </div>


                                <div class="form-group row" style="display: none;">
                                    <label for="status">Trạng thái:</label>
                                    <input type="hidden" id="status" name="status" value="Available">
                                </div>


                                <div class="form-group row">
                                    <label  for="image">Hình ảnh:</label>
                                    <div class="col-sm-10">
                                        <input type="file" id="image" name="image"   onchange="previewImage(event)">
                                        <img id="preview" src="#" alt="Hình ảnh xem trước" style="max-width: 200px; max-height: 200px; display: none;">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-10 ">
                                        <button type="button" class="btn btn-info" type="submit" data-toggle="modal" data-target="#confirmModal">Tạo sản phẩm</button>
                                        <!--<input class="btn btn-info" type="submit" value="Create Product">-->

                                    </div>
                                </div>
                                <!--                            <input type="submit" value="Create Product">-->



                                <!-- Modal -->
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



                        <!<!-- thong tin san pham moi tao -->
                        <br><br>
                        <div class="col-xl-6">
                            <div class="ibox">
                                <c:if test="${not empty createdProduct}">
                                    <div class="ibox-head">
                                        <div class="ibox-title">Sản phẩm mới tạo</div>
                                    </div>
                                    <div class="ibox-body">
                                        <table class="table table-bordered">
                                            <thead class="thead-default">
                                                <tr>
                                                    <th>Product Name</th>                                              
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Category </th>
                                                    <th>Image</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td>${createdProduct.productName}</td>                                          
                                                <td>${createdProduct.price}</td>
                                                <td>${createdProduct.quantity}</td>
                                                <td>${createdProduct.categoryName}</td>
                                                <td><img src="${createdProduct.image}" alt="Product Image" style="width: 100px"></td>
                                            </tr>
                                            <tbody>
                                        </table>
                                    </c:if>                           
                                </div>
                            </div>
                        </div>  
                        <!-- end -->
                    </div>
                </div>
            </div>

            <!--                    <div>
                                    <a class="adminca-banner" href="http://admincast.com/adminca/" target="_blank">
                                        <div class="adminca-banner-ribbon"><i class="fa fa-trophy mr-2"></i>PREMIUM TEMPLATE</div>
                                        <div class="wrap-1">
                                            <div class="wrap-2">
                                                <div>
                                                    <img src="./assets/img/adminca-banner/adminca-preview.jpg" style="height:160px;margin-top:50px;" />
                                                </div>
                                                <div class="color-white" style="margin-left:40px;">
                                                    <h1 class="font-bold">ADMINCA</h1>
                                                    <p class="font-16">Save your time, choose the best</p>
                                                    <ul class="list-unstyled">
                                                        <li class="m-b-5"><i class="ti-check m-r-5"></i>High Quality Design</li>
                                                        <li class="m-b-5"><i class="ti-check m-r-5"></i>Fully Customizable and Easy Code</li>
                                                        <li class="m-b-5"><i class="ti-check m-r-5"></i>Bootstrap 4 and Angular 5+</li>
                                                        <li class="m-b-5"><i class="ti-check m-r-5"></i>Best Build Tools: Gulp, SaSS, Pug...</li>
                                                        <li><i class="ti-check m-r-5"></i>More layouts, pages, components</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div style="flex:1;">
                                                <div class="d-flex justify-content-end wrap-3">
                                                    <div class="adminca-banner-b m-r-20">
                                                        <img src="./assets/img/adminca-banner/bootstrap.png" style="width:40px;margin-right:10px;" />Bootstrap v4</div>
                                                    <div class="adminca-banner-b m-r-10">
                                                        <img src="./assets/img/adminca-banner/angular.png" style="width:35px;margin-right:10px;" />Angular v5+</div>
                                                </div>
                                                <div class="dev-img">
                                                    <img src="./assets/img/adminca-banner/sprite.png" />
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>-->
        </div>
        <!-- END PAGE CONTENT-->
        <!--                <footer class="page-footer">
                            <div class="font-13">2018 © <b>AdminCAST</b> - All rights reserved.</div>
                            <a class="px-4" href="http://themeforest.net/item/adminca-responsive-bootstrap-4-3-angular-4-admin-dashboard-template/20912589" target="_blank">BUY PREMIUM</a>
                            <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
                        </footer>-->
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
    function validatePrice(input) {
        if (input.value < 0) {
            input.value = "";
        }
    }
</script>

<script>
    function validatePrice(input) {
        if (input.value < 0) {
            input.value = Math.abs(input.value);
        }
    }
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


<style>
    #description {
        height: 150px;
        width: 900px;
    }
</style>


<script>
    function saveAndGoBack() {
        // Code xử lý lưu thông tin

        // Chờ 3 giây trước khi chuyển hướng
        setTimeout(function () {
            window.location.href = "AdminHomeServlet";
        }, 3000); // Chuyển hướng sau 3 giây (3000 milliseconds)
    }

</script>

<!-- JavaScript -->
<script>
    function validateKey(event) {
        if (event.key === 'e' || event.key === '-' || event.key === 'E') {
            return false;
        }
        return true;
    }
</script>

</body>

</html>