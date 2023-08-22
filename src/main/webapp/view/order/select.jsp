<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Order: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='lightgray'>

<table id="table-1">
   <tr><td><h3>IBM Order: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Order: Home</p>

<h3>資料查詢:</h3>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='order/listAllOrder.jsp'>List</a> all orders.  <br><br></li>



  <li>
    <form method="post" action="order.tw" >
        <b>輸入訂單編號 (如1 ):</b>
        <input type="text" name="orderNo">
        <input type="hidden" name="test1" value="getOne_For_Display">
        <input type="submit" value="送出">
    </form>

  </li>
<jsp:useBean id="odSvc" scope="page" class="web.order.dao.OrderService" />

</ul>



</body>
</html>