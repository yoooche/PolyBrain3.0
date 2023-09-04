<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="feature.order.vo.*"%>

<%ItemOrderVO itemordervo = (ItemOrderVO) request.getAttribute("itemorder");%>

<html>
<head>
<title>訂單資料但是名字還是Emp - listOneEmp.jsp</title>

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
	width: 600px;
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
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneEmp.jsp</h3>
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
	<tr>
		<td><%=itemordervo.getOrderNo()%></td>
		<td><%=itemordervo.getMemNo()%></td>
		<td><%=itemordervo.getTranTime()%></td>
		<td><%=itemordervo.getOrderTotal()%></td>
		<td><%=itemordervo.getOrderState()%></td>
		<td><%=itemordervo.getReceiverName()%></td>
		<td><%=itemordervo.getReceiverAddress()%></td>
		<td><%=itemordervo.getReceiverPhone()%></td>
		<td><%=itemordervo.getReceiverMethod()%></td>
	</tr>
</table>

</body>
</html>