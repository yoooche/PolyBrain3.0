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
    <style>
        html,
        body {
            font: 15px verdana, Times New Roman, arial, helvetica, sans-serif,
                Microsoft JhengHei;
            width: 90%;
            height: 90%;
            background: #75b045;
        }

        .panel {
            border: 2px solid #0078ae;
            border-radius: 5px;
            width: 100%;
        }

        .bidRecordArea {
            height: 70%;
            resize: none;
            box-sizing: border-box;
            overflow: auto;
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }
    </style>
</head>

<body onload="connect();" onunload="disconnect();">

<!-- Navigation-->



    <h1>Bidding Room</h1>
    <h3 id="statusOutput" class="statusOutput">heading</h3>
    <div id="countDown" style="margin-bottom:10px;">coming soon...</div>
    <textarea id="bidRecordArea" class="panel bidRecordArea" readonly></textarea>

    <div class="panel inputArea form-check form-switch">
        <!-- <label class="form-check-label" for="flexSwitchCheckChecked">參與競標</label>
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked> -->
        <input type="text" id="bidder" class="textField" placeholder="bidder">
        <input type="range" id="biddingRange" min="50" max="500" step="50" oninput="updateBiddingValue();">
        <input type="button" id="bidding" class="btn_bidding" value="出價 $ --" onclick="bidding();">

        <input type="button" id="connect" class="btn_connect" value="connect" onclick="connect();">
        <input type="button" id="disconnect" class="btn_disconnect" value="disconnect" onclick="disconnect();">

    </div>


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
// <!--            fetch('/BidOnePage/yoooche', {-->
// <!--                method: 'POST',-->
// <!--                headers: {'Content-Type': 'application/json'},-->
// <!--                body: JSON.stringify(jsonObj),-->
// <!--            })-->
// <!--            .then(resp => resp.json())-->
// <!--            .then(data => {-->

// <!--            })-->
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