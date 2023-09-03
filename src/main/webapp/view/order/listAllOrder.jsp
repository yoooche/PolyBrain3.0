<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="feature.order.dao.*"%>
<%@ page import="feature.order.vo.*"%>
<%@ page import="feature.order.service.*"%>

<!-- <%@ page isELIgnored="false"%> -->

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    OrderService ordSvc = new OrderService();
    List<ItemOrderVO> list = ordSvc.getAll();
    pageContext.setAttribute("listaaa",list);
%>


<html>
<head>
<title>所有員工資料 - listAllOrder.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='lightpink'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有員工資料 - listAllEmp.jsp</h3>
		 <h4><a href="select.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>訂單編號</th>
        <th>會員姓名</th>
        <th>交易日期</th>
        <th>購買總金額</th>
        <th>訂單物流狀態</th>
        <th>取件人姓名</th>
        <th>取件地址</th>
        <th>取件人電話</th>
        <th>選擇物流</th>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="itemordervo" items="${listaaa}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>

			<td>${itemordervo.orderNo}</td>
			<td>${itemordervo.memNo}</td>
			<td>${itemordervo.tranTime}</td>
			<td>${itemordervo.orderTotal}</td>
			<td>${itemordervo.orderState}</td>
			<td>${itemordervo.receiverName}</td>
			<td>${itemordervo.receiverAddress}</td>
			<td>${itemordervo.receiverPhone}</td>
			<td>${itemordervo.receiverMethod}</td>
			<td>
			  <form method="post" action="<%=request.getContextPath()%>/view/order/order.tw" style="margin-bottom: 0px;">
			     <input type="submit" value="修改" >
			     <input type="hidden" name="orderNo"  value="${itemordervo.orderNo}">
			     <input type="hidden" name="test1"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <form method="post" action="<%=request.getContextPath()%>/view/order/order.tw" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="orderNo"  value="${itemordervo.orderNo}">
			     <input type="hidden" name="test1" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


</body>
</html>