<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="feature.bid.vo.*" %>
<%@ page import="feature.bid.service.*" %>
<%@ page import="feature.bid.dao.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="./css/styles-item-detail.css" rel="stylesheet" />
        <link rel="stylesheet" href="./css/bidding.css">
        <link rel="stylesheet" href="./css/slider.css">
    </head>
    <body onload="connect();" onunload="disconnect();">
        <!-- Navigation-->
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"><img src="../logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px;"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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
                                <a class="nav-link" id="buybid" href="#" role="button"
                                     aria-expanded="false">競標</a>
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
                            <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i></button>
                        </form>
                        <span id="memName" style="margin-left:12px;"></span>
                        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                                <ul id="dropdown-menu" class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="card-wrapper">
                <div class="card" style="border: none;">
                    <div class="product-imgs">
                        <div class="img-display">
                            <div id="img-showcase" class="img-showcase">
                                <!-- 大圖串接的區塊 -->
                                <!-- <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_1.jpg"
                            alt="shoe image">
                        <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_2.jpg"
                            alt="shoe image">
                        <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_3.jpg"
                            alt="shoe image">
                        <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_4.jpg"
                            alt="shoe image"> -->
                            </div>
                        </div>
                        <div id="img-select" class="img-select">
                            <!-- 小圖串接的區塊 -->
                            <!-- <div class="img-item">
                                <a href="#" data-id="1">
                                    <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_1.jpg"
                                        alt="shoe image">
                                </a>
                            </div>
                            <div class="img-item">
                                <a href="#" data-id="2">
                                    <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_2.jpg"
                                        alt="shoe image">
                                </a>
                            </div>
                            <div class="img-item">
                                <a href="#" data-id="3">
                                    <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_3.jpg"
                                        alt="shoe image">
                                </a>
                            </div>
                            <div class="img-item">
                                <a href="#" data-id="4">
                                    <img src="https://fadzrinmadu.github.io/hosted-assets/product-detail-page-design-with-image-slider-html-css-and-javascript/shoe_4.jpg"
                                        alt="shoe image">
                                </a>
                            </div> -->
                        </div>
                    </div>
                    
                    <!-- card right -->
                    <div class="product-content">
                        <h2 class="product-title"></h2>
                        <h3></h3>
                        <!-- <div class="product-price">
                            <p class="last-price">Old Price: <span>$257.00</span></p>
                            <p class="new-price">New Price: <span>$249.00</span></p>
                        </div> -->
                        <!-- <div class="product-detail">
                            <h4>about this item: </h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo eveniet veniam tempora fuga tenetur
                                placeat sapiente architecto illum soluta consequuntur, aspernatur quidem at sequi ipsa!</p>
                        </div> -->

                            <div class="fs-5" style="text-align: left; margin-bottom:15px;">
                                <span>距離結標時間還有:</span>
                                <div id="timer"></div>
                                <ul id="biddingRoom" class="list-group bid-record">
                                    <li id="statusOutput" class="list-group-item list-group-item-action" ></li>
                                </ul>
                            </div>

                        <div class="purchase-info" style="margin-top: 3px;">
                            <button id="btn_directivePrice" type="button" class="btn" onclick="buyWithoutBidding()">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                            <button id="btn_class" type="button" class="btn"></button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>

        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ------------------------------------------------------------footer------------------------------------------------------------ -->
        <footer class="bg-dark">
            <div id="biddingFooter" class="container panel inputArea form-check form-switch">
                    <!-- <input type="text" id="bidder" class="textField" style="height: 38px;" placeholder="bidder"> -->
                    <input type="range" id="biddingRange" style="width:40%; height: 14px; margin-left: 20px;" min="" max="" value="" step="50" oninput="updateBiddingValue();">
                    <button type="submit" id="bidding" class="btn_bidding btn btn-primary" style="float: right; width:160px; border: none;" onclick="bidding();">出價＄--</button>
                </div>
        </footer>
        <script>
            $(document).ready(function(){
                validateMemStatus();
            });
                async function validateMemStatus(){
                const response = await fetch('/PolyBrain/general/validateMemStatus',{
                    method: 'POST',
                    headers: {'content-type': 'application/json; charset:utf-8'},
            })
            .then(resp => resp.json())
            .then(data => {
            console.log(data);
            const {memNo, memName, loginStatus} = data;
            $('ul.dropdown-menu').append(`
                        <li><a class="dropdown-item" href="#!">會員專區</a></li>
                        <li><a class="dropdown-item" href="#!">購物車</a></li>
                        <li><hr class="dropdown-divider" /></li>
            `);
            if(loginStatus){
                $('span#memName').text(memName);
                $('ul.dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/logout.html">登出</a></li>');
                $(`<span id="bidder" style="height: 38px;"><i class="fas fa-user fa-fw"></i>` + memName + '</span>').insertBefore('input#biddingRange');
                $('button#bidding').prop('disabled', false);
                let memDetail = [memNo, memName];
                return memDetail;
            }else{
                $('button#bidding').prop('disabled', true);
                $('button#bidding').css('background-color', 'gray');
                $('ul.dropdown-menu').append('<li><a id="logOut" class="dropdown-item" href="http://localhost:8080/PolyBrain/view/member/logout.html">登出</a></li>');
            }
    });
    return response;
}
        </script>
        <script src="./js/bidding.js"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"/>

    </body>
</html>
