<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.mem.service.*"%>
<%@page import="feature.mem.controller.*"%>
<%@page import="feature.mem.dao.*"%>
<%@page import="feature.mem.vo.*"%>

<%
       Integer memNo = (Integer) session.getAttribute("memNo");
    if (memNo != null) {
        MemDaoImpl memDao = new MemDaoImpl(); // 实例化你的 DAO 类
        MemVo memVo = memDao.getMemberByMemNo(memNo);
        pageContext.setAttribute("memVo", memVo);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolyBrain - 會員個人資訊</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .main-container {
            width: 95%;
            height: 85%;
            border-radius: 20px;
            background-color: lightblue;
            margin: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .info {
            border: 1px solid black;
            width: 100%;
            height: 85%;
            background-color: white;
            text-align: center;
            padding: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header {
            text-align: center;
            color: black;
        }

        .info-row {
            border: 1.5px solid black;
            padding: 13.5px;
            margin-top: 20px;
            border-radius: 10px;
            width: 500px;
            font-weight: bold;
            display: flex;
            /* 使用 flex 布局 */
            align-items: center;
            /* 垂直居中对齐 */
        }

        .info-label {
            font-weight: bold;
            width: 80px;
            flex-shrink: 0;
            /* 防止缩小，保持固定宽度 */
            margin-right: 10px;
            /* 向右边留出一些间距 */
            transition: margin-right 0.3s ease;
            /* 添加过渡效果 */
        }

        .info-value-box {
            flex-grow: 1;
            /* 占满剩余空间 */
            text-align: left;
            display: flex;
            align-items: center;
            /* 垂直居中对齐 */
            border-radius: 5px;
        }

        .info-row:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body id="page-top">

<!-- ----------------------------     左側導覽列     -----------------------------------  -->
    <div id="wrapper">
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="homepage.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">PolyBrain</div>
            </a>
                     <hr class="sidebar-divider my-0">
            <!-- 會員導航 -->
            <li class="nav-item active">
                <a class="nav-link"  data-target="#collapseMember" aria-expanded="true"aria-controls="collapseMember">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>會員中心</span>
                </a>
                <div id="collapseMember" class="collapse show" aria-labelledby="headingMember"data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">會員</h6>
                        <a class="collapse-item" href="Member_Information.jsp">會員資訊</a>
                        <a class="collapse-item" href="change_Member_Information.jsp">修改會員資訊</a>
                        <a class="collapse-item" href="">查看錢包</a>
                        <a class="collapse-item" href="">討論區</a>
                        <hr>
                        <a class="collapse-item" href="logout.jsp">登出</a>
                    </div>
                </div>
            </li>
            <!-- 會員導航結束 -->
             <hr class="sidebar-divider my-0">
            <!-- 商城導航 -->
            <li class="nav-item active">
                <a class="nav-link"  data-target="#collapseShop" aria-expanded="true"aria-controls="collapseShop">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>功能列表</span>
                </a>
                <div id="collapseShop" class="collapse show" aria-labelledby="headingShop"data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">商城</h6>
                        <a class="collapse-item" href="Shop_Homepage.html">商城首頁</a>
                        <a class="collapse-item" href="Favorite_Items.html">商品收藏</a>
                        <a class="collapse-item" href="#" id="shoppingCartLink">購物車</a>
                        <hr>
                        <h6 class="collapse-header">競標</h6>
                        <a class="collapse-item" href="#" id="shoppingCartLink">競標總攬</a>
                        <a class="collapse-item" href="#" id="shoppingCartLink">收藏的競標</a>
                        <hr>
                        <h6 class="collapse-header">預約</h6>
                        <a class="collapse-item" href="#" id="shoppingCartLink">瀏覽預約</a>
                        <a class="collapse-item" href="#" id="shoppingCartLink">查詢預約紀錄</a>
                    </div>
                </div>
            </li>
            <!-- 商城導航 -->
            <li class="nav-item active">
                 <a class="nav-link"  data-target="#collapseShop" aria-expanded="true"aria-controls="collapseShop">
                     <i class="fas fa-fw fa-folder"></i>
                     <span>系統</span>
                 </a>
                 <div id="collapseShop" class="collapse show" aria-labelledby="headingShop"data-parent="#accordionSidebar">
                     <div class="bg-white py-2 collapse-inner rounded">
                         <h6 class="collapse-header">系統</h6>
                         <a class="collapse-item" href="#" id="shoppingCartLink">客服中心</a>
                         <a class="collapse-item" href="#" id="shoppingCartLink">意見申訴</a>
                         <a class="collapse-item" href="#" id="shoppingCartLink">常見問題</a>
                     </div>
                 </div>
            </li>
        </ul>
<!------------------------------     左側導覽列     -----------------------------------  -->
         <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

            <!--網頁頂部(頭像那邊)-->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="#">
                            </a>
                        </li>
                    </ul>
                </nav>
            <!--網頁頂部(頭像那邊)-->

            <!--網頁內容-->
                <div class="main-container">
                    <h1 class="header">會員個人資料</h1>
                    <div class="info">
                        <div class="info-row">
                            <span class="info-label">姓名:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memName}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">信箱:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memEmail}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">手機:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memPh}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">密碼:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memPwd}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">身分證:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memPid}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">地址:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memAddress}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">生日:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memBirth}</span></div>
                        </div>
                        <div class="info-row">
                            <span class="info-label">性別:</span>
                            <div class="info-value-box"><span class="info-value">${memVo.memGender == '0' ? '女' : '男'}</span></div>
                        </div>
                    </div>
                </div>
            <!--網頁內容-->
            </div>
         </div>








    </div>
</body>
</html>