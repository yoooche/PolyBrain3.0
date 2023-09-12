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
<title>會員資料修改</title>

<style type="text/css">

	button {
		padding: 5px;
	}
	form {
		display: table;
	}
	form div {
		display: table-row;
	}
	label, input, span, select {
		display: table-cell;
		margin: 5px;
		text-align: left;
	}
	input[type=text], input[type=password], select, textarea {
		width: 200px;
		margin: 5px;
	}
	form div div {
		display: table-cell;
	}
	.center {
        margin-left: auto;
        margin-right: auto;
    }
</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-success fixed-top justify-content-center">
		 <div align="center"> <h2>會員資料修改</h2>
</nav>

	<div align="center">
		<h3><b>所有欄位皆為必填欄位</b></h3>
		<form action="<%=request.getContextPath()%>/listAllmemServlet/do" method="post">
			<div>
			<label for="memNo">會員編號:</label>
			<input id ="memNo" name="memNo" type="text" value="${param.memNo}" style="border:0px ; font-weight: bold;" readonly />
			</div>

			<div>
			<label for="memName">會員姓名:</label>
			<input id ="memName" name="memName" type="text" value="${param.memName}" onclick="hideContent('memName.errors');" />
			<span  id ="memName.errors" class="error">${errorMsgs.memName}<br/></span>
			</div>

			<div>
			<label for="memPid">身分證:</label>
			<input id ="memPid" name="memPid" type="text" value="${param.memPid}" onclick="hideContent('memPid.errors');" />
			<span  id ="memPid.errors" class="error">${errorMsgs.memPid}</span>
			</div>

			<div>
			<label for="memEmail">信箱:</label>
			<input id ="memEmail" name="memEmail" type="text" value="${param.memEmail}" onclick="hideContent('memEmail.errors');" />
			<span  id ="memEmail.errors" class="error">${errorMsgs.memEmail}</span>
			</div>

			<div>
			<label for="memPh">手機:</label>
			<input id ="memPh" name="memPh" type="text" value="${param.memPh}" onclick="hideContent('memPh.errors');" />
			<span  id ="memPh.errors" class="error">${errorMsgs.memPh}</span>
			</div>

            <div>
			<label for="memAddress">地址:</label>
			<input id ="memAddress" name="memAddress" type="text" value="${param.memAddress}" onclick="hideContent('memAddress.errors');" />
			<span  id ="memAddress.errors" class="error">${errorMsgs.memAddress}</span>
			</div>

			<div>
            <label for="memBirth">生日:</label>
            <input id ="memBirth" name="memBirth" type="date" value="${param.memBirth}" onclick="hideContent('memBirth.errors');" />
            <span  id ="memBirth.errors" class="error">${errorMsgs.memBirth}</span>
            </div>

            <div>
                <label for="memAuth">權限:</label>
                <select id="memAuth" name="memAuth" onclick="hideContent('memAuth.errors');">
                    <option value="0" ${param.memAuth == '0' ? 'selected' : ''}>會員</option>
                    <option value="1" ${param.memAuth == '1' ? 'selected' : ''}>黑名單</option>
                </select>

            </div>


			<div>
            	<div></div>
            	<input  type="hidden" name="action" value="update1">
            	<button type="submit" id="submit"> 送出修改 </button>
            	<div></div>
            </div>
		</form>
	</div>



<script type="text/javascript">

//清除提示信息
function hideContent(d) {
     document.getElementById(d).style.display = "none";
}

</script>

</body>
</html>