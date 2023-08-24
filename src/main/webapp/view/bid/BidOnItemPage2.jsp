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
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./css/styles-item-detail.css" rel="stylesheet" />
    </head>
    <body onload="connect();" onunload="disconnect();">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: BST-498</div>
                        <h1 class="display-5 fw-bolder">Shop item template</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">$45.00</span>
                            <span>$40.00</span>
                        </div>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!-- Related items section-->
        <section class="py-5 bg-light">
           <h1>Bidding Room</h1>
           <h3 id="statusOutput" class="statusOutput">heading</h3>
           <div id="countDown" style="margin-bottom:10px;">coming soon...</div>
           <textarea id="bidRecordArea" class="panel bidRecordArea" style="width:100%; height:300px; resize:none; overflow:auto; box-sizing: border-box;" readonly></textarea>
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
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container panel inputArea form-check form-switch">
            <!-- <label class="form-check-label" for="flexSwitchCheckChecked">參與競標</label>
                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked> -->
                    <input type="text" id="bidder" class="textField" placeholder="bidder">
                    <input type="range" id="biddingRange" min="50" max="500" step="50" oninput="updateBiddingValue();">
                    <input type="button" id="bidding" class="btn_bidding" value="出價 $ --" onclick="bidding();">
                    <input type="button" id="connect" class="btn_connect" value="connect" onclick="connect();">
                    <input type="button" id="disconnect" class="btn_disconnect" value="disconnect" onclick="disconnect();">
            </div>
        </footer>
        <Script>
                let myEndPoint = "/BidOnePage/yoooche";
                let host = window.location.host;
                let path = window.location.pathname;
                let webctx = path.substring(0, path.indexOf("/", 1));
                let endPointURL = "ws://" + window.location.host + webctx + myEndPoint;
                let statusOutput = document.querySelector("#statusOutput");
                let webSocket;

                function connect() {
                    //create a websocket
                    webSocket = new WebSocket(endPointURL)

                    webSocket.onopen = function (event) {
                        updateStatus("Websocket Connected");
                        document.querySelector("#bidding").disabled = false;
                        document.querySelector("#connect").disabled = true;
                        document.querySelector("#disconnect").disabled = false;
                    }
                    webSocket.onmessage = function (event) {
                        let bidRecordArea = document.querySelector("#bidRecordArea");
                        let jsonObj = JSON.parse(event.data);
                        let bidRecord = jsonObj.bidder + ":" + jsonObj.biddingRange + "\r\n";
                        bidRecordArea.value = bidRecordArea.value + bidRecord;
                        bidRecordArea.scrollTop = bidRecordArea.scrollHeight;
                    }
                    webSocket.onclose = function (event) {
                        updateStatus("Websocket Disconnected");
                    }
                }
                let bidder = document.querySelector("#bidder");
                bidder.focus();

                function bidding() {
                    let bidderName = bidder.value.trim();
                    if (bidderName === "") {
                        alert("請輸入姓名");
                        bidder.focus();
                        return;
                    }
                    let biddingRange = document.querySelector("#biddingRange");
                    let biddingRangeValue = biddingRange.value;
                    console.log(biddingRangeValue);
                    let jsonObj = {
                        "bidder": bidderName,
                        "biddingRange": biddingRangeValue
                    }
                    webSocket.send(JSON.stringify(jsonObj));
        <!--            fetch('/BidOnePage/yoooche', {-->
        <!--                method: 'POST',-->
        <!--                headers: {'Content-Type': 'application/json'},-->
        <!--                body: JSON.stringify(jsonObj),-->
        <!--            })-->
        <!--            .then(resp => resp.json())-->
        <!--            .then(data => {-->

        <!--            })-->
                }
                function disconnect() {
                    webSocket.close();
                    document.querySelector("#bidding").disabled = true;
                    document.querySelector("#connect").disabled = false;
                    document.querySelector("#disconnect").disabled = true;
                }

                function updateStatus(newStatus) {
                    statusOutput.innerHTML = newStatus;
                }

                function updateBiddingValue() {
                    const biddingRange = document.querySelector("#biddingRange");
                    const bidding = document.querySelector("#bidding");

                    bidding.value = `出價 $${biddingRange.value}`;
                }

                function updateCountDown()  {
                    let biddingTimeSecs = ${biddingTimeSec};
                    const countDown = document.querySelector('#countDown');

                    let hrs = Math.floor(biddingTimeSecs / 3600);
                    let mins = Math.floor((biddingTimeSecs % 3600) / 60);
                    let secs = biddingTimeSecs % 60;

                    countDown.textContent = hrs + ":" + mins + ":" + secs;

                    if(biddingTimeSecs > 0){
                        biddingTimeSecs--;
                        setTimeout(updateCountDown, 1000);
                    } else{
                        countDown.textContent = "bidding is over";
                    }

                }
                window.onload = function(){
                    updateCountDown();
                }
            </Script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>
</html>
