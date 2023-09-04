<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="feature.cart.dao.*"%>
<%@ page import="feature.cart.vo.*"%>
<%@ page import="feature.cart.service.*"%>


    <%CartTraceService CTSvc = new CartTraceService();%>
    <%List<CartTraceVO> list = CTSvc.getAllCartItem(1001);%>
    <%pageContext.setAttribute("listaaa",list);%>



<html>
<head>
<title>確認訂單</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">



</head>
<body bgcolor='lightpink'>

    <form method="post" action="<%=request.getContextPath()%>/view/CartTrace/ConfirmOrder" >
    <input type="hidden" name="action" value="getAll" >
    <input type="submit">
    </div>
    </form>


</body>
</html>