<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.emp.service.*"%>
<%@page import="feature.emp.controller.*"%>
<%@page import="feature.emp.dao.*"%>
<%@page import="feature.emp.vo.*"%>

<link href="<%= request.getContextPath() %>/view/emp/css/item.css" rel="stylesheet" />    <!--側邊欄的css-->
<script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>

<%
    allEmpListService empSvc = new allEmpListService();
    List<EmpVo> list = empSvc.getAll();
    pageContext.setAttribute("empList",list);
%>

<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolyBrain - 後台所有員工查詢</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>                                    <!-- ●●js  for jquery datatables 用 -->
    <script	src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>              <!-- ●●js  for jquery datatables 用 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" /> <!-- ●●css for jquery datatables 用 -->

    <script>
    	$(document).ready(function() {
    		$('#example').DataTable({
    			"lengthMenu": [3 ,5, 10, 20, 50, 100],
    			"searching": true,  //搜尋功能, 預設是開啟
    		    "paging": true,     //分頁功能, 預設是開啟
    		    "ordering": true,   //排序功能, 預設是開啟
    		    "language": {
    		        "processing": "處理中...",
    		        "loadingRecords": "載入中...",
    		        "lengthMenu": "顯示 _MENU_ 筆結果",
    		        "zeroRecords": "沒有符合的結果",
    		        "info": "顯示第 _START_ 至 _END_ 筆結果，共<font color=red> _TOTAL_ </font>筆",
    		        "infoEmpty": "顯示第 0 至 0 筆結果，共 0 筆",
    		        "infoFiltered": "(從 _MAX_ 筆結果中過濾)",
    		        "infoPostFix": "",
    		        "search": "搜尋:",
    		        "paginate": {
    		            "first": "第一頁",
    		            "previous": "上一頁",
    		            "next": "下一頁",
    		            "last": "最後一頁"
    		        },
    		        "aria": {
    		            "sortAscending":  ": 升冪排列",
    		            "sortDescending": ": 降冪排列"
    		        }
    		    }
    		});
    	});
    </script>
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
        <nav >
            <div align="center"> <h2>員工資料管理</h2><a href="addNewEmp.jsp">新增</a>
        </nav>

        <h4><span>資料查詢:</span></h4>
            <table id="example" class="display" style="width: 100%">
                <thead>
             	    <tr style="background-color:#CCCCFF">
             		    <th>員工編號</th>
             		    <th>姓名</th>
             		    <th>性別</th>
             		    <th>信箱</th>
             		    <th>密碼</th>
             		    <th>手機</th>
                        <th>狀態</th>
             		    <th>修改</th>
             		    <th>刪除</th>
             		</tr>
                </thead>
                <tbody>
                <c:forEach var="mm" items="${empList}" >
             		<tr>
             		    <td>${mm.empNo}</td>
             			<td>${mm.empName}</td>
             			<td>${mm.empGender == '0' ? '女' : '男'}</td>
             			<td>${mm.empEmail}</td>
             			<td>${mm.empPwd}</td>
             			<td>${mm.empPh}</td>
             			<td>${mm.empState == 0 ? '離職' : mm.empState == 1 ? '在職中' : mm.empState == 2 ? '停職' : ''}</td>
             			<td>
                            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/general/allEmpListServlet/do" style="margin-bottom: 0px;">
                       	    <input type="submit" value="修改">
                       	    <input type="hidden" name="empNo" value="${mm.empNo}">
                       	    <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
                        </td>
                        <td>
                            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/general/allEmpListServlet/do" style="margin-bottom: 0px;">
                       	    <input type="submit" value="刪除">
                       	    <input type="hidden" name="empNo" value="${mm.empNo}">
                       	    <input type="hidden" name="action" value="delete"></FORM>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    </main>
<!-----------------------------以上為內容---------------------------->
        </div>
    </div>
</body>
</html>