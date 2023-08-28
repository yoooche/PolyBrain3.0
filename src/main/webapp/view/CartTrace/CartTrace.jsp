<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="feature.cart.dao.*"%>
<%@ page import="feature.cart.vo.*"%>
<%@ page import="feature.item.vo.*"%>
<%@ page import="feature.cart.service.*"%>
<%@ page import="feature.item.dao.impl.*"%>

<!-- <%@ page isELIgnored="false"%> -->

<%-- 此頁練習採用 EL 的寫法取值 --%>


    <%CartTraceService CTSvc = new CartTraceService();%>
    <%List<CartTraceVO> list = CTSvc.getAllCartItem(1001);%>
    <%ItemDAOimpl iopl = new ItemDAOimpl();%>
      <%List<itemVO> itemVOList = iopl.selectAll();%>
      <%List<itemVO> newList = new ArrayList<>();%>
             <% for(CartTraceVO lista : list){
                  for(itemVO itemVOs : itemVOList){
                      if(lista.getItemNo()==itemVOs.getItemNo()){
                          newList.add(itemVOs);
                      }
                  }
              }%>
    <%pageContext.setAttribute("listabcccccc",newList);%>


<html>
<head>
<title>確認訂單</title>

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

<table id="table-1">
	<tr><td>
		 <h3>確認訂單</h3>
		 <h4><a href="select.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>會員編號</th>
        <th>商品編號</th>
        <th>數量</th>
	</tr>
	<c:forEach var="itemordervo" items="${listabcccccc}" >
		<tr>
			<td>${itemordervo.itemName}</td>
			<td>${itemordervo.itemPrice}</td>
			<td>${itemordervo.itemProdDescription}</td>

		</tr>
	</c:forEach>
</table>


</body>
</html>