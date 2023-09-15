<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.forum.service.ArtService"%>
<%@page import="feature.forum.vo.ArtVo"%>
<%
    String itemNo = request.getParameter("itemNo");
    if (itemNo==null) itemNo="1";
    ArtService artSvc = new ArtService();
    List<ArtVo> list = artSvc.findByItemNo(Integer.valueOf(itemNo));
    if(request.getAttribute("ArtListData")==null) pageContext.setAttribute("ArtListData",list);
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Carousel Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <style>
        @charset "utf-8";

        /******* Fonts Import Start **********/
        @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");
        /********* Fonts Face CSS End **********/

        /******* Common Element CSS Start ******/
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            font-family: "Roboto", sans-serif;
            font-size: 16px;
        }

        .clear {
            clear: both;
        }

        img {
            max-width: 100%;
            border: 0px;
        }

        ul,
        ol {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
            outline: none;
            transition: all 0.4s ease-in-out;
            -webkit-transition: all 0.4s ease-in-out;
        }

        a:focus,
        a:active,
        a:visited,
        a:hover {
            text-decoration: none;
            outline: none;
        }

        a:hover {
            color: #e73700;
        }

        h2 {
            margin-bottom: 48px;
            padding-bottom: 16px;
            font-size: 20px;
            line-height: 28px;
            font-weight: 700;
            position: relative;
            text-transform: capitalize;
        }

        h3 {
            margin: 0 0 10px;
            font-size: 28px;
            line-height: 36px;
        }

        button {
            outline: none !important;
        }

        /******* Common Element CSS End *********/

        /* -------- title style ------- */
        .line-title {
            position: relative;
            width: 400px;
        }

        .line-title::before,
        .line-title::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            height: 4px;
            border-radius: 2px;
        }

        .line-title::before {
            width: 100%;
            background: #f2f2f2;
        }

        .line-title::after {
            width: 32px;
            background: #e73700;
        }

        /******* Middle section CSS Start ******/
        /* -------- Landing page ------- */
        .game-section {
            padding: 60px 50px;
        }

        .game-section .owl-stage {
            margin: 15px 0;
            display: flex;
            display: -webkit-flex;
        }

        .game-section .item {
            margin: 0 15px 60px;
            width: 320px;
            height: 400px;
            display: flex;
            display: -webkit-flex;
            align-items: flex-end;
            -webkit-align-items: flex-end;
            background: #343434 no-repeat center center / cover;
            border-radius: 16px;
            overflow: hidden;
            position: relative;
            transition: all 0.4s ease-in-out;
            -webkit-transition: all 0.4s ease-in-out;
            cursor: pointer;
        }

        .game-section .item.active {
            width: 500px;
            box-shadow: 12px 40px 40px rgba(0, 0, 0, 0.25);
            -webkit-box-shadow: 12px 40px 40px rgba(0, 0, 0, 0.25);
        }

        .game-section .item:after {
            content: "";
            display: block;
            position: absolute;
            height: 100%;
            width: 100%;
            left: 0;
            top: 0;
            background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 1));
        }

        .game-section .item-desc {
            padding: 0 24px 12px;
            color: #fff;
            position: relative;
            z-index: 1;
            overflow: hidden;
            transform: translateY(calc(100% - 54px));
            -webkit-transform: translateY(calc(100% - 54px));
            transition: all 0.4s ease-in-out;
            -webkit-transition: all 0.4s ease-in-out;
        }

        .game-section .item.active .item-desc {
            transform: none;
            -webkit-transform: none;
        }

        .game-section .item-desc p {
            opacity: 0;
            -webkit-transform: translateY(32px);
            transform: translateY(32px);
            transition: all 0.4s ease-in-out 0.2s;
            -webkit-transition: all 0.4s ease-in-out 0.2s;
        }

        .game-section .item.active .item-desc p {
            opacity: 1;
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }

        .game-section .owl-theme.custom-carousel .owl-dots {
            margin-top: -20px;
            position: relative;
            z-index: 5;
        }

        /******** Middle section CSS End *******/

        /***** responsive css Start ******/

        @media (min-width: 992px) and (max-width: 1199px) {
            h2 {
                margin-bottom: 32px;
            }

            h3 {
                margin: 0 0 8px;
                font-size: 24px;
                line-height: 32px;
            }

            /* -------- Landing page ------- */
            .game-section {
                padding: 50px 30px;
            }

            .game-section .item {
                margin: 0 12px 60px;
                width: 260px;
                height: 360px;
            }

            .game-section .item.active {
                width: 400px;
            }

            .game-section .item-desc {
                transform: translateY(calc(100% - 46px));
                -webkit-transform: translateY(calc(100% - 46px));
            }
        }

        @media (min-width: 768px) and (max-width: 991px) {
            h2 {
                margin-bottom: 32px;
            }

            h3 {
                margin: 0 0 8px;
                font-size: 24px;
                line-height: 32px;
            }

            .line-title {
                width: 330px;
            }

            /* -------- Landing page ------- */
            .game-section {
                padding: 50px 30px 40px;
            }

            .game-section .item {
                margin: 0 12px 60px;
                width: 240px;
                height: 330px;
            }

            .game-section .item.active {
                width: 360px;
            }

            .game-section .item-desc {
                transform: translateY(calc(100% - 42px));
                -webkit-transform: translateY(calc(100% - 42px));
            }
        }

        @media (max-width: 767px) {
            body {
                font-size: 14px;
            }

            h2 {
                margin-bottom: 20px;
            }

            h3 {
                margin: 0 0 8px;
                font-size: 19px;
                line-height: 24px;
            }

            .line-title {
                width: 250px;
            }

            /* -------- Landing page ------- */
            .game-section {
                padding: 30px 15px 20px;
            }

            .game-section .item {
                margin: 0 10px 40px;
                width: 200px;
                height: 280px;
            }

            .game-section .item.active {
                width: 270px;
                box-shadow: 6px 10px 10px rgba(0, 0, 0, 0.25);
                -webkit-box-shadow: 6px 10px 10px rgba(0, 0, 0, 0.25);
            }

            .game-section .item-desc {
                padding: 0 14px 5px;
                transform: translateY(calc(100% - 42px));
                -webkit-transform: translateY(calc(100% - 42px));
            }
        }

        #timer {
            font-size: 1em;
            font-weight: 400;
            color: rgb(143, 143, 143);
            padding: 10px 10px 10px 0;
            color: rgb(255, 255, 255);
            margin-top: 20px;

        }

        #timer span {
            display: inline-block;
            min-width: 3px;
            padding: 2px 8px;
            background: #464545;
            border-radius: 5px;
            margin: 3px;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .carousel-fade .carousel-item {
            opacity: 0;
            transition-duration: .6s;
            transition-property: opacity;
        }

        .carousel-fade .carousel-item.active {
            opacity: 1;
        }
         /* 會員名稱調整 */
      #memName {
        line-height: 2.3;  /* 调整为所需的值 */
        text-shadow: 2px 2px 2px rgba(0,0,0,0.3);
        color: white;
        margin-left: 12px;
    }
    /* 调整图片容器的position属性，以便其子元素（包括Sale标签）可以使用z-index */
    .image-container {
            position: relative;
            width: 100%;
            padding-top: 100%;
            overflow: hidden;
        }

        .image-container img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            /* 图像宽度占满容器 */
            height: 100%;
            /* 高度占满容器 */
            object-fit: contain;
            /* 保持原始比例并填充容器 */
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="./css/carousel.css" rel="stylesheet">
    <link href="./css/all.min.css" rel="stylesheet" type="text/css">
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="http://localhost:8080/PolyBrain/view/bid/BidOnHomePage.jsp" style="margin-left: -50px;">
                    <img src="../logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px; "></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 nav-list"> 添加 nav-list 類別 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="buyitem" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">商城</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="../item/search.html">商品資訊</a></li>
                                <li><a class="dropdown-item" href="../order/memberOrder.html">商城訂單查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="buybid" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">競標</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="../bid/BidOnHomePage.html">熱門競標</a></li>
                                <li><a class="dropdown-item" href="../order/bidOrderFront.html">競標訂單查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="mybooking" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">預約場地</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="../book/Calendar.html">現在預約</a></li>
                                <li><a class="dropdown-item" href="../book/BookingCheck.html">預約場地查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="discuss" href="../forum/mainpage/index.jsp" role="button">討論區</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="memberdistrict" href="../member/Member_Information.jsp"
                                role="button">會員中心</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="../head/question.html">常見問題</a></li>
                        <li>
                            <form method="post" action="http://localhost:8080/PolyBrain/loginRequired/CartServlet">
                                <input type="hidden" name="action" value="getAll" id="actionInput">
                                <button type="submit" class="btn text-white">
                                    <i class="bi-cart-fill me-1" style="color: #ffffff"></i>
                                    購物車
                                </button>
                            </form>
                        </li>
                        <span id="memName" style="margin-left:12px;"></span>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <ul id="dropdown-menu" class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdown">
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="../logo/PolyBrain_Logo.png"
                        style="width: 110px; height: auto; margin-bottom: 5px;"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="buyitem" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">商城</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="blog-home.html">商品資訊</a></li>
                                <li><a class="dropdown-item" href="blog-post.html">商城訂單查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" id="buybid" href="#" role="button" aria-expanded="false">競標</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="mybooking" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">預約場地</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                <li><a class="dropdown-item" href="blog-home.html">現在預約</a></li>
                                <li><a class="dropdown-item" href="blog-post.html">預約場地查詢</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="discuss" href="#" role="button">討論區</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="faq.html">常見問題</a></li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"
                                style="color: #ffffff;"></i></button>
                    </form>
                    <span id="memName" style="margin-left:12px;"></span>
                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <ul id="dropdown-menu" class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdown">
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> -->
    </header>

    <main>
        <div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" style="margin-bottom:0;">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">

              <div class="carousel-item active">
                <img src="../image/auction.png" style="max-width: none; max-height: none; object-fit: cover;">
                <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> -->
        
                <div class="container">
                  <div class="carousel-caption text-start">
                    <h1 style="font-weight: 600;">稀有珍寶 X 限時競標</h1>
                    <p>Some representative placeholder content for the first slide of the carousel.</p>
                    <p><a class="btn btn-lg btn-primary" href="#">開始競標</a></p>
                  </div>
                </div>
              </div>

              <div class="carousel-item ">
                <img src="../image/polydice-unsplash.png" style="max-width: none; max-height: none; object-fit: cover;">
                <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> -->
        
                <div class="container">
                  <div class="carousel-caption">
                    <h1 style="font-weight: 600;">無限暢遊 X 桌遊宇宙</h1>
                    <p>Some representative placeholder content for the second slide of the carousel.</p>
                    <p><a class="btn btn-lg btn-primary" href="#">前往商城</a></p>
                  </div>
                </div>
              </div>
              
              <div class="carousel-item">
                <img src="../image/unsplash.png" style="max-width: 100%; max-height: 100%; object-fit: cover;">
                <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> -->
        
                <div class="container">
                  <div class="carousel-caption text-end">
                    <h1 style="font-weight: 600;">集體智慧 X 多人連結</h1>
                    <p>呼朋引伴集結多人的智慧，彼此合作、互相對壘</p>
                    <p><a class="btn btn-lg btn-primary" href="#">立即預約</a></p>
                  </div>
                </div>
              </div>
            </div>
            <!--第一組輪播圖左右兩邊-->
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
            </div>
        <div class="container marketing">
        </div>

        </nav>
    </main>
    <div>
        <section class="game-section" style="background-color: #343434; margin-bottom: 150px;">
            <h2 class="line-title" style=" color: #fff;">競標商品列表</h2>
            <div class="owl-carousel custom-carousel owl-theme"></div>
        </section>
    </div>

    <nav>
        <article class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
                    id="itemList">
                <div class="col mb-5">
                    <div class="card">
                        <div class="image-container">
                            <a href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=1060">
                                <img class="card-img-top" src="../item/img/25.png" />
                            </a>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder">多諾米王國</h5>
                                $2500
                            </div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <button class="btn btn-outline-dark mt-auto">加入購物車</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card">
                        <div class="image-container">
                            <a href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=1052">
                                <img class="card-img-top" src="../item/img/22.jpg" />
                            </a>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder">卡卡頌</h5>
                                $1500
                            </div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <button class="btn btn-outline-dark mt-auto">加入購物車</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card">
                        <div class="image-container">
                            <a href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=1105">
                                <img class="card-img-top" src="../item/img/21.jpg" />
                            </a>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder">富饒之城2</h5>
                                $850
                            </div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <button class="btn btn-outline-dark mt-auto">加入購物車</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card">
                        <div class="image-container">
                            <a href="http://localhost:8080/PolyBrain/view/item/itemDetail.html?itemNo=1104">
                                <img class="card-img-top" src="../item/img/24.jpg" />
                            </a>
                        </div>
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder">矮人礦坑</h5>
                                $350
                            </div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <button class="btn btn-outline-dark mt-auto">加入購物車</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </article>

            <!-- START THE FEATURETTES -->

            <hr class="featurette-divider">

            <section class="py-5">
                <h2 class="fw-bolder">討論區話題</h2>
                    <!-- Call to action-->
                        <!-- Call to action-->
                                 <nav>
                                     <div class="card text-center">
                                        <div class="card-header">
                                            <ul class="nav nav-tabs card-header-tabs centered-tabs">
                                                <li><a href="<%=request.getContextPath()%>/view/head/Facepage.jsp?itemNo=1">策略型討論區</a></li>
                                                <li><a href="<%=request.getContextPath()%>/view/head/Facepage.jsp?itemNo=2">派對型討論區</a></li>
                                                <li><a href="<%=request.getContextPath()%>/view/head/Facepage.jsp?itemNo=3">親子型討論區</a></li>
                                                <li><a href="<%=request.getContextPath()%>/view/head/Facepage.jsp?itemNo=4">陣營型討論區</a></li>
                                                <li><a href="<%=request.getContextPath()%>/view/head/Facepage.jsp?itemNo=5">其他型討論區</a></li>
                                            </ul>
                                        </div>
                                         <div class="tab-content">
                                             <div id="<%=request.getContextPath()%>/view/head/123.jsp?itemNo=1" class="tab-pane fade show active">
                                                 <div class="card-body">
                                                     <h5 class="card-title">策略型討論區</h5>
                                         <table class="table">
                                                     <thead>
                                                          <tr>
                                                               <th>編號</th>
                                                               <th>標題</th>
                                                          </tr>
                                                     </thead>
                                                     <tbody>
                                                          <c:forEach var="ArtVo" items="${ArtListData}" begin="0" end="2">
                                                          <tr>
                                                                <td>${ArtVo.artNo}</td>
                                                                <td class="table-title"><a href="../forum/innerpage/detail.jsp?artNo=${ArtVo.artNo}">${ArtVo.artTitle}</a></td>
                                                          </tr>
                                                          </c:forEach>
                                                     </tbody>
                                         </table>
                                                                 <div class="text-center mt-3">
                                                         <a href="../forum/list/List.jsp?itemNo=1" class="btn btn-primary">查看更多</a>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div id="<%=request.getContextPath()%>/view/head/123.jsp?itemNo=2" class="tab-pane fade">
                                                 <div class="card-body">
                                                     <h5 class="card-title">派對型討論區</h5>
                                             <table class="table">
                                                     <thead>
                                                          <tr>
                                                               <th>編號</th>
                                                               <th>標題</th>
                                                          </tr>
                                                     </thead>
                                                     <tbody>
                                                          <c:forEach var="ArtVo" items="${ArtListData}" begin="0" end="2">
                                                          <tr>
                                                                <td>${ArtVo.artNo}</td>
                                                                <td class="table-title"><a href="..../forum/innerpage/detail.jsp?artNo=${ArtVo.artNo}">${ArtVo.artTitle}</a></td>
                                                          </tr>
                                                          </c:forEach>
                                                     </tbody>
                                         </table>
                                                     <div class="text-center mt-3">
                                                         <a href="#" class="btn btn-primary">查看更多</a>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div id="<%=request.getContextPath()%>/view/head/123.jsp?itemNo=3" class="tab-pane fade">
                                                 <div class="card-body">
                                                     <h5 class="card-title">親子型討論區</h5>
                                       <table class="table">
                                                     <thead>
                                                          <tr>
                                                               <th>編號</th>
                                                               <th>標題</th>
                                                          </tr>
                                                     </thead>
                                                     <tbody>
                                                          <c:forEach var="ArtVo" items="${ArtListData}" begin="0" end="2">
                                                          <tr>
                                                                <td>${ArtVo.artNo}</td>
                                                                <td class="table-title"><a href="..../forum/innerpage/detail.jsp?artNo=${ArtVo.artNo}">${ArtVo.artTitle}</a></td>
                                                          </tr>
                                                          </c:forEach>
                                                     </tbody>
                                         </table>
                                                     <div class="text-center mt-3">
                                                         <a href="#" class="btn btn-primary">查看更多</a>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div id="<%=request.getContextPath()%>/view/head/123.jsp?itemNo=4" class="tab-pane fade">
                                                 <div class="card-body">
                                                     <h5 class="card-title">陣營型討論區</h5>
                                           <table class="table">
                                                      <thead>
                                                           <tr>
                                                                <th>編號</th>
                                                                <th>標題</th>
                                                           </tr>
                                                      </thead>
                                                      <tbody>
                                                           <c:forEach var="ArtVo" items="${ArtListData}" begin="0" end="2">
                                                           <tr>
                                                                 <td>${ArtVo.artNo}</td>
                                                                 <td class="table-title"><a href="..../forum/innerpage/detail.jsp?artNo=${ArtVo.artNo}">${ArtVo.artTitle}</a></td>
                                                           </tr>
                                                           </c:forEach>
                                                      </tbody>
                                          </table>
                                                     <div class="text-center mt-3">
                                                         <a href="#" class="btn btn-primary">查看更多</a>
                                                     </div>
                                                 </div>
                                             </div>
                                             <div id="<%=request.getContextPath()%>/view/head/123.jsp?itemNo=5" class="tab-pane fade">
                                                 <div class="card-body">
                                                     <h5 class="card-title">其他型討論區</h5>
                                           <table class="table">
                                                       <thead>
                                                            <tr>
                                                                 <th>編號</th>
                                                                 <th>標題</th>
                                                            </tr>
                                                       </thead>
                                                       <tbody>
                                                            <c:forEach var="ArtVo" items="${ArtListData}" begin="0" end="2">
                                                            <tr>
                                                                  <td>${ArtVo.artNo}</td>
                                                                  <td class="table-title"><a href="..../forum/innerpage/detail.jsp?artNo=${ArtVo.artNo}">${ArtVo.artTitle}</a></td>
                                                            </tr>
                                                            </c:forEach>
                                                       </tbody>
                                           </table>
                                                     <div class="text-center mt-3">
                                                         <a href="#" class="btn btn-primary">查看更多</a>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </nav>
                             </div>
                 </section>
    
               </nav>
                </div>
            </section>
                <div class="col-md-5">
                    <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                         height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500"
                         preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa"
                                                                             dy=".3em">500x500</text>
                    </svg>

                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for
                            yourself.</span></h2>
                    <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of
                        how this layout would work with some actual real-world content in place.</p>
                </div>
                <div class="col-md-5 order-md-1">
                    <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                         height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500"
                         preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                    </svg>

                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
                    <p class="lead">And yes, this is the last block of representative placeholder content. Again, not
                        really intended to be actually read, simply here to give you a better view of what this would
                        look like with some actual content. Your content.</p>
                </div>
                <div class="col-md-5">
                    <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                         height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500"
                         preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#eee" /><text x="50%" y="50%" fill="#aaa"
                                                                             dy=".3em">500x500</text>
                    </svg>

                </div>
            </div>
    </nav>


        <!-- FOOTER -->
        <footer class="container">
            <p class="float-end"><a href="#">Back to top</a></p>
            <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>

    <script>
        $(document).ready(function () {
            validateMemStatus();
            getBidItemList();
            // owl();

        });
        $(".custom-carousel").owlCarousel({
            autoWidth: true,
            loop: true,
            // nav: true,
            dots: true
        });


        function getBidItemList() {
            fetch('/PolyBrain/general/bidHomePageList', {
                method: 'POST',
                headers: { 'content-type': 'application/x-www-form-urlencoded; charset:utf-8' },
                body: new URLSearchParams({
                    message: 'getBidHomePageList'
                })
            })
                .then(resp => resp.json())
                .then(data => {

                    // for(let i = 0; i < data.length; i++){
                    //     let div = document.createElement('div');
                    //     let divItem = div.classList('item');
                        
                        
                    //     let str = `
                    //         <h3>${data[i].bidItemVo.bidItemName}</h3>
                    //         <p>${data[i].bidItemVo.bidItemDescribe}</p>
                    //         <span>底價 $ ${data[i].floorPrice} | 直購價 $ ${data[i].directivePrice}</span><br>
                    //         <p><a href="http://localhost:8080/PolyBrain/view/bid/BidOnItemPage2.jsp?bidEventId=${data[i].bidEventNo}" style=" color: rgb(144, 144, 234); font-weight: bold; text-decoration: underline;">More Detail >></a></p>
                    //         <span id="timer"></span>
                    //     `;

                    //     let d = divItem.append(str);
                    //     document.getElementsByClassName('owl-carousel')[i].innerHTML += d;
                    // }

                    for (let i = 0; i < data.length; i++) {
                        if (Array.isArray(data[i].bidItemPic) && data[i].bidItemPic.length > 0) {

                            let str = `
                                    <div class="owl-item active" style="width: auto;">
                                        <div class="item" style="background-image: url(data:image/jpeg;base64,${data[i].bidItemPic[0]})" onclick="owlItem(this);">
                                            <div class="item-desc">
                                                <h3>${data[i].bidItemVo.bidItemName}</h3>
                                                <p>${data[i].bidItemVo.bidItemDescribe}</p>
                                                <span>底價 $ ${data[i].floorPrice} | 直購價 $ ${data[i].directivePrice}</span><br>
                                                <p><a href="http://localhost:8080/PolyBrain/view/bid/BidOnItemPage2.jsp?bidEventId=${data[i].bidEventNo}" style=" color: rgb(144, 144, 234); font-weight: bold; text-decoration: underline;">More Detial >></a></p>
                                                <span id="timer"></span>
                                            </div>
                                        </div>
                                    </div>
                                        `;
                            let dot = `
                                    <button role="button" class="owl-dot" onclick="owlDots(this)">
                                        <span></span>
                                    </button>
                            `;
                            document.querySelector('.owl-stage').innerHTML += str;
                            $('.owl-dots').append(dot);
                        } else {
                            console.log("Not defined yet");
                        }
                    }
                    
                    // $('.item').eq(0).addClass('active');
                    $('.owl-dots').removeClass('disabled');
                    $('.owl-dot').eq(0).addClass('active');
                    // $('.owl-nav').removeClass('disabled');
                    $('.owl-item').removeClass('active');

                    
                })
        }


        function owl() {
            $(".custom-carousel .item").click(function () {
                $(".custom-carousel .item").not($(this)).removeClass("active");
                $(this).toggleClass("active");
            });
        }

        function owlItem(ele) {
            console.log("mmm");
            $(".custom-carousel .item").not($(ele)).removeClass("active");
            $(ele).toggleClass("active");
        }
        // function owlDots(ele){
        //     console.log("ppp");
        //     $(ele).toggleClass("active");
        //     $('.owl-item').eq(3).addClass('active');

        // }
        

        async function validateMemStatus() {
            const response = await fetch('/PolyBrain/general/validateMemStatus', {
                method: 'POST',
                headers: { 'content-type': 'application/json; charset:utf-8' },
            })
                .then(resp => resp.json())
                .then(data => {
                    console.log(data);
                    const { memNo, memName, loginStatus } = data;
                    $('ul#dropdown-menu').append(`
                <li><a class="dropdown-item" href="#!">會員專區</a></li>
                <li><a class="dropdown-item" href="#!">購物車</a></li>
                <li><hr class="dropdown-divider" /></li>
            `);
                    if (loginStatus) {
                        $('span#memName').text(memName);
                        $('ul#dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/logout.html">登出</a></li>');
                        let memDetail = [memNo, memName];
                        return memDetail;
                    } else {
                        $('ul#dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/login.html">登入</a></li>');
                    }
                });
            return response;
        }

        let bidEventList = document.querySelectorAll('.bidEventList');
        bidEventList.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                const biddingEvent = link.getAttribute('data-event-id');
                const bidEventURL = 'http://localhost:8080/PolyBrain/view/bid/BidOnItemPage2.jsp';
                const url = `${bidEventURL}?bidEventId=${biddingEvent}`;
                window.location.href = url;
            });
        });


    </script>
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>



</body>

</html>