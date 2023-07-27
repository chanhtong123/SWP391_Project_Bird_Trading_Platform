<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" />
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

            body {
                margin: 0;
                padding: 0;
                background-color: #f7f8f9;
                font-family: 'Roboto', sans-serif;
                font-size: 14px;
            }
            header {
                position: relative;
                z-index: 9999;
            }

            .auth-container {
                position: fixed;
                top: 74px;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 1;
            }

            .auth-image {
                overflow: hidden;
            }
            .auth-image-container {
                height: 100%;
                display: flex;
                align-items: center;
            }

            .auth-image img {
                width: 100%;
                height: 100vh;
            }
            .auth-action-right {
                width: 320px;
            }
            .auth-action-left {
                flex: 2;
            }

            .auth-form-outer {
                padding: 2rem 4rem;
                display: block;
            }

            h1.auth-form-title {
                text-align: center;
                color: #fd5353;
                font-size: 2.3rem;
            }

            .auth-form-outer input {
                border: 1px solid #56aef485;
                margin-bottom: 1rem;
                width: 100%;
                padding: 13px;
                border-radius: 5px;
                box-sizing: border-box;
                background: #f7f8f97a;
            }

            .auth-form-outer input:hover,
            .auth-form-outer input:focus {
                outline: none;
                box-shadow: none;
            }

            .auth-form-outer input:focus {
                background-color: #fff;
                border: 1px solid #fd5353;
            }


            input.auth-form-input::placeholder {
                color: #0f82dd4d;
            }



            input[type="checkbox"] {
                display: none;
            }
            label input[type="checkbox"] ~ i.fa.fa-square-o{
                color: #fd5353;    display: inline;
            }
            label input[type="checkbox"] ~ i.fa.fa-check-square-o{
                display: none;
            }
            label input[type="checkbox"]:checked ~ i.fa.fa-square-o{
                display: none;
            }
            label input[type="checkbox"]:checked ~ i.fa.fa-check-square-o{
                color: #fd5353;    display: inline;
            }
            label:hover input[type="checkbox"] ~ i.fa {
                color: #fd5353;
            }

            div[data-toggle="buttons"] label.active{
                color: #fd5353;
            }

            .auth-wrapper a {
                text-decoration: none;
                color: #fd5353;
            }

            a.auth-btn-direct {
                flex: 1;
                border: 1px solid #fd5353;
                text-align: center;
                height: 40px;
                border-radius: 5px;
                line-height: 40px;
                font-weight: 500;
                margin-left: 5px;
            }

            input.auth-submit {
                background: #fe5454;
                border: none;
                width: auto;
                color: #fff;
                font-weight: 500;
                border-radius: 5px!important;
                flex: 1;
                margin-right: 5px;
                cursor: pointer;
            }

            input.auth-submit:focus {
                background: #fe5454;
                color: #fff;
            }

            input.auth-submit:hover {
                box-shadow: 3px 3px 7px 2px #f443362b;
            }
            a.auth-btn-direct:hover {
                box-shadow: -2px 3px 0px 0px #F44336;
            }

            .auth-external-list ul li a:hover {
                color: #fd5353;
                border-color: #fd5353;
            }

            .footer-action {
                display: flex;
                width: 100%;
                margin-top: 2rem;
                box-sizing: border-box;
                overflow: hidden;
            }

            .auth-external-list ul {
                margin: 0;
                padding: 0;
                list-style-type: none;
            }

            .auth-external-list ul li {
                float: left;
            }

            .auth-external-list {
                display: flex;
                justify-content: center;
                margin-bottom: 1rem;
            }

            .auth-external-list ul li a {
                width: 26px;
                height: 26px;
                margin: 7px;
                display: block;
                text-align: center;
                line-height: 27px;
                border-radius: 50%;
                border: 1px solid #00000078;
                color: #555;
            }

            p.auth-sgt {
                text-align: center;
            }

            .auth-forgot-password a {
                text-align: center;
                display: block;
                border-top: 1px dashed #f4433633;
                padding: 20px;
                margin-top: 20px;
            }


            .input-icon {
                position: relative;
            }

            .input-icon input {
                padding-right: 4rem;
            }

            .input-icon i {
                position: absolute;
                top: 38%;
                right: 1.2rem;
                transform: translateY(-50%);
                color: #2196f3b5;
                cursor: pointer;
            }

            /* responsive */
            @media screen and (max-width: 720px) {
                body {
                    background-color: #fff;
                }
                .auth-container {
                    max-width: 100%;
                    max-height: 100vh;
                    margin: 0 auto;
                    background: #fff;
                    border-radius: 0;
                    box-shadow: none;
                    display: block;
                    margin-top: 0;
                }
                .auth-action-left {
                    width: 100%;
                }

                .auth-action-right {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="ShowProductsServlet">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Bird</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
                </a>
            </nav>
        </header>
        <div class="auth-wrapper">
            <div class="auth-container row">
                <div class="auth-action-left col-3">
                    <div class="auth-form-outer">
                        <h1 class="auth-form-title">
                            Đăng nhập
                        </h1><br>
                        <form action="UserServlet?action=login" method="POST" id="form"  class="login-form">
                            <c:set var="errors" value="${requestScope.CREATE_ERROR}"/>
                            <input class="auth-form-input" type="text" name="email" value="${param.email}" id="email" placeholder="Nhập email"/>
                            <c:if test="${not empty errors.usernameBlankError}">
                                <p class="error-message">
                                    ${errors.usernameBlankError}
                                </p>
                            </c:if>

                            <div class="input-icon">
                                <input class="auth-form-input" type="password" name="password" id="password" placeholder="Nhập mật khẩu"/>
                                <i class="fa fa-eye show-password"></i>
                            </div>
                            <c:if test="${not empty errors.passwordBlankError}">
                                <p class="error-message">
                                    ${errors.passwordBlankError}
                                </p>
                            </c:if>
                            <c:if test="${not empty errors.wrongPasswordError}">
                                <p class="error-message">
                                    ${errors.wrongPasswordError}
                                </p>
                            </c:if>
                            <div class="g-recaptcha" data-sitekey="6LdO3P4mAAAAAH8CBTo8PalbHgQC3ePdpXZpc6s2"></div>
                            <div id ="error"></div>
                            <div class="footer-action">
                                <input type="submit" value="Đăng nhập" class="auth-submit"/>
                            </div>
                            <p>Tạo tài khoản mới?<a href="UserServlet?action=showSignupForm">Đăng ký</a></p>
                        </form>
                    </div>
                </div>
                <div class="auth-action-right col-9">
                    <div class="auth-image">
                        <img src="img/hinh_nen_2.jpg" alt="login">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/common.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        window.onload = function () {
            let isValid = false;
            const form = document.getElementById("form");
            const error = document.getElementById("error");

            form.addEventListener("submit", function (event) {
                const response = grecaptcha.getResponse();
                if (!response) {
                    event.preventDefault(); // Ngăn chặn việc gửi form khi captcha không hợp lệ
                    error.innerHTML = "Check Recaptcha Please!";
                }
            });
        }
    </script>
</body>
</html>
