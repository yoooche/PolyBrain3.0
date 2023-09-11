<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="web.forum.service.ArtService"%>
<%@page import="web.forum.vo.ArtVo"%>

<%
    ArtService artSvc = new ArtService();
    List<ArtVo> list = artSvc.findByItemNo(Integer.valueOf(request.getParameter("itemNo")));
    if(request.getAttribute("ArtListData")==null) pageContext.setAttribute("ArtListData",list);
%>

<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Modern Business - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <style>
.big-slider {
    width: 100%; /* 這可以根據需要設定 */
    height: 210px; /* 稍微比圖片大一點以容納圖片 */
    margin: 0 auto; /* 使容器在其父元素中居中 */
    overflow: hidden; /* 這將隱藏容器外部的任何內容 */
    position: relative; /* 讓內部的div相對於此元素進行定位 */
}

.big-slider > div.1 {
    display: flex; /* 使用Flexbox使圖片居中 */
    align-items: center;
    justify-content: center;
}
.big-slider img {
   max-width: 100%; /* 確保圖片不會超出其容器 */
    margin: auto;
}





    </style>
</head>

<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="index.html">PolyBrain</a>
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
                            <li><a class="dropdown-item" href="blog-home.html">商品資訊</a></li>
                            <li><a class="dropdown-item" href="blog-post.html">商城訂單查詢</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="buybid" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">競標</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                            <li><a class="dropdown-item" href="blog-home.html">熱門競標</a></li>
                            <li><a class="dropdown-item" href="blog-post.html">競標訂單查詢</a></li>
                        </ul>
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
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="memberdistrict" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">會員中心</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                            <li><a class="dropdown-item" href="blog-home.html">個人資料</a></li>
                            <li><a class="dropdown-item" href="blog-post.html">設定</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="faq.html">常見問題</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">登入</a></li>

                    <li>
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </li>
                    <li class="search-right">

                        <div class="search">
                            <input class="search-bar" type="text" name="search" id="search" placeholder="Search">
                            <button class="search-btn">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</main>
<nav>

<div class="card text-center">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="../list/List.jsp?itemNo=5">回合討論區</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#douzhi">鬥智</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " data-toggle="tab" href="#huihe">回合</a>
            </li>
        </ul>
    </div>
    <div class="tab-content">
        <div id="qinzi" class="tab-pane fade show active">
            <div class="card-body">
<table id="example" class="display" style="width: 100%">
            <thead>
                <tr style="background-color:#CCCCFF">
                    <th>文章編號</th>
                    <th>貼文主題</th>
                    <th>發布時間</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="ArtVo" items="${ArtListData}" varStatus="s">
                    <tr>

                        <td>${ArtVo.artNo}</td>

                        <td><a href="../innerpage/detail.jsp?artNo=${ArtVo.artNo}">${ArtVo.artTitle}</a></td>
                        <td>
                            <fmt:formatDate value="${ArtVo.artTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- 新添加的表格結束 -->
            </div>
        </div>
        <div id="douzhi" class="tab-pane fade">
            <div class="card-body">
                <h5 class="card-title">鬥智內容</h5>
                <p class="card-text">這裡是鬥智的內容。</p>
            </div>
        </div>
        <div id="huihe" class="tab-pane fade">
            <div class="card-body">
                <h5 class="card-title">回合內容</h5>
                <p class="card-text">這裡是回合的內容。</p>
            </div>
        </div>
    </div>
</div>


</div>



</nav>




<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">Copyright © 2023 PolyBrain. All rights reserved. </div>
            </div>
            <div class="col-auto">



                <a class="link-light small" href="http://localhost:63342/PolyBrain3.0/src/main/webapp/view/head/jump.html">隱私權協定</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="http://localhost:63342/PolyBrain3.0/src/main/webapp/view/head/forus.html">關於我們</a>
                <span class="text-white mx-1">&middot;</span>
                <a href="mailto:ps66391@gmail.com?subject=聯絡我們的請求&body=請在此寫下您的問題。"
                   title="用 Email 轉寄" onclick="return confirm('您確定要前往email寄信?');">
                    <img src="images/信封.jpg" >
                </a>




            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<a>

</a>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js"
        integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g=="
        crossorigin="anonymous" referr