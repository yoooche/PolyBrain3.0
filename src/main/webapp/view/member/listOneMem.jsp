<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.mem.service.*"%>
<%@page import="feature.mem.controller.*"%>
<%@page import="feature.mem.dao.*"%>
<%@page import="feature.mem.vo.*"%>

<link href="<%= request.getContextPath() %>/view/member/css/item.css" rel="stylesheet" />    <!--側邊欄的css-->
<script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>會員資料</title>

<style type="text/css">

    span {
		display: inline-block;
		width: 150px;
		text-align: left;
		font-weight: bold;
	}

</style>
</head>
<body id="page-top">
<!---------------------------------------------以下為頂板--------------------------------------------------------->
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: black;">
        <div class="container px-5">
            <img src="${pageContext.request.contextPath}/view/logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px;"></a>
        </div>
    </nav>
</main>
<!---------------------------------------------以上為頂板--------------------------------------------------------->



    <div id="layoutSidenav">  <!--勿刪到-->
<!---------------------------------------------以下為側邊攔--------------------------------------------------------->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                                <!-------------會員中心-------------->
                        <div class="sb-sidenav-menu-heading">會員</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/member/listAllmem.jsp"><div class="sb-nav-link-icon"></div>
                            所有會員管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/forum/Listallarti.jsp"><div class="sb-nav-link-icon"></div>
                            討論區文章管理
                        </a>
                                <!-------------會員中心-------------->
                                <!--------------商城---------------->
                        <div class="sb-sidenav-menu-heading">商城</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemConsole.html"><div class="sb-nav-link-icon"></div>
                            商城管理
                        </a>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemClassConsole.html"><div class="sb-nav-link-icon"></div>
                            商品類別管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/listAllOrder.jsp"><div class="sb-nav-link-icon"></div>
                            訂單管理
                        </a>
                                <!-------------商城-------------->
                                <!-------------預約-------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/book/BookTable.html"><div class="sb-nav-link-icon"></div>
                            報到管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bookingtast/Modifytimeperiod.jsp"><div class="sb-nav-link-icon"></div>
                            時段管理
                        </a>
                                <!-------------預約-------------->
                                <!-------------競標-------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bid/BidEventList.jsp"><div class="sb-nav-link-icon"></div>
                            競標活動管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bid/BidItemTable.html"><div class="sb-nav-link-icon"></div>
                            競標商品管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/bidOrderBackend.html"><div class="sb-nav-link-icon"></div>
                            競標訂單
                        </a>
                                <!-------------競標-------------->
                        <div class="sb-sidenav-menu-heading">員工</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/emp/allEmpList.jsp"><div class="sb-nav-link-icon"></div>
                            員工管理
                        </a>
                    </div>
                </div>
            </nav>
        </div>
<!---------------------------------------------以上為側邊攔--------------------------------------------------------->


        <div id="layoutSidenav_content"> <!--勿刪到-->
<!-----------------------------以下為內容---------------------------->
            <main>
                    <br>
                	<div align="center"> <h2>會員個人資料</h2>
                	<h3 style="color: gray;"><a class="navbar-brand" href="<%=request.getContextPath()%>/view/member/listAllmem.jsp">回查詢頁${success}</a></h3></div>
                    <hr>
                	<div align="center">
                	<br><br>
                    		<h3><span>查詢結果 :</span></h3>
                    		<br>
                    		<span>會員編號:</span><span>${memVo.memNo}</span><br/>
                    		<span>會員姓名:</span><span>${memVo.memName}</span><br/>
                    		<span>身分證:</span><span>${memVo.memPid}</span><br/>
                    		<span>信箱:</span><span>${memVo.memEmail}</span><br/>
                    		<span>手機:</span><span>${memVo.memPh}</span><br/>
                    		<span>地址:</span><span>${memVo.memAddress}</span><br/>
                    		<span>生日:</span><span>${memVo.memBirth}</span><br/>
                    		<span>權限:</span><span>${memVo.memAuth}</span><br/>
                    </div>
            </main>
<!-----------------------------以上為內容---------------------------->
        </div>
    </div>
</body>
</html>
