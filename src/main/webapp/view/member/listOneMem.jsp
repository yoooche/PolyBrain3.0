<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="feature.mem.service.*"%>
<%@page import="feature.mem.controller.*"%>
<%@page import="feature.mem.dao.*"%>
<%@page import="feature.mem.vo.*"%>

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
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-success fixed-top justify-content-center">
		 <div align="center"> <h2>會員個人資料</h2>
		 <h3><a class="navbar-brand" href="<%=request.getContextPath()%>/view/member/listAllmem.jsp">回查詢頁${success}</a></h3></div>
</nav>

	<div align="center">
		<h3><span>查詢結果 :</span></h3>
		<span>會員編號:</span><span>${memVo.memNo}</span><br/>
		<span>會員姓名:</span><span>${memVo.memName}</span><br/>
		<span>身分證:</span><span>${memVo.memPid}</span><br/>
		<span>信箱:</span><span>${memVo.memEmail}</span><br/>
		<span>手機:</span><span>${memVo.memPh}</span><br/>
		<span>地址:</span><span>${memVo.memAddress}</span><br/>
		<span>生日:</span><span>${memVo.memBirth}</span><br/>
		<span>權限:</span><span>${memVo.memAuth}</span><br/>
	</div>


</body>
</html>