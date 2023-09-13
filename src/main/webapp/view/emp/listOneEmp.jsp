<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.emp.service.*"%>
<%@page import="feature.emp.controller.*"%>
<%@page import="feature.emp.dao.*"%>
<%@page import="feature.emp.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>員工資料</title>

<style type="text/css">

    span {
		display: inline-block;
		width: 150px;
		text-align: left;
		font-weight: bold;
	}

</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-success fixed-top justify-content-center">
		 <div align="center"> <h2>員工個人資料</h2>
		 <h3><a class="navbar-brand" href="<%=request.getContextPath()%>/view/emp/allEmpList.jsp">回查詢頁${success}</a></h3></div>
</nav>

	<div align="center">
		<h3><span>查詢結果 :</span></h3>
		<span>員工編號:</span><span>${empVo.empNo}</span><br/>
		<span>員工姓名:</span><span>${empVo.empName}</span><br/>
		<span>性別:</span><span>${empVo.empGender == '0' ? '女' : '男'}</span><br/>
		<span>信箱:</span><span>${empVo.empEmail}</span><br/>
		<span>密碼:</span><span>${empVo.empPwd}</span><br/>
		<span>手機:</span><span>${empVo.empPh}</span><br/>
		<span>狀態:</span><span>${empVo.empState == '0' ? '離職' : empVo.empState == '1' ? '在職中' : empVo.empState == '2' ? '停職' : ''}</span><br/>
	</div>


</body>
</html>