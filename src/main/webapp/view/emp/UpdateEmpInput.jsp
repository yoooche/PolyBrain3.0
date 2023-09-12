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
<title>員工資料修改</title>

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
		 <div align="center"> <h2>員工資料修改</h2>
</nav>

	<div align="center">
		<h3><b>所有欄位皆為必填欄位</b></h3>
		<form action="<%=request.getContextPath()%>/allEmpListServlet/do" method="post">
			<div>
			<label for="empNo">會員編號:</label>
			<input id ="empNo" name="empNo" type="text" value="${param.empNo}" style="border:0px ; font-weight: bold;" readonly />
			</div>

			<div>
			<label for="empName">員工姓名:</label>
			<input id ="empName" name="empName" type="text" value="${param.empName}" onclick="hideContent('empName.errors');" />
			<span  id ="empName.errors" class="error">${errorMsgs.empName}<br/></span>
			</div>

            <div>
                <label for="empGender">性別:</label>
                <select id="empGender" name="empGender" onclick="hideContent('empGender.errors');">
                    <option value="0" ${param.empGender == '0' ? 'selected' : ''}>女</option>
                    <option value="1" ${param.empGender == '1' ? 'selected' : ''}>男</option>
                </select>
            </div>

			<div>
			<label for="empEmail">信箱:</label>
			<input id ="empEmail" name="empEmail" type="text" value="${param.empEmail}" onclick="hideContent('empEmail.errors');" />
			<span  id ="empEmail.errors" class="error">${errorMsgs.empEmail}</span>
			</div>

			<div>
			<label for="empPwd">密碼:</label>
			<input id ="empPwd" name="empPwd" type="text" value="${param.empPwd}" onclick="hideContent('empPwd.errors');" />
			<span  id ="empPwd.errors" class="error">${errorMsgs.empPwd}</span>
			</div>

			<div>
            <label for="empPh">手機:</label>
            <input id ="empPh" name="empPh" type="text" value="${param.empPh}" onclick="hideContent('empPh.errors');" />
            <span  id ="empPh.errors" class="error">${errorMsgs.empPh}</span>
            </div>

            <div>
                <label for="empState">狀態:</label>
                <select id="empState" name="empState" onclick="hideContent('empState.errors');">
                    <option value="0" ${param.empState == '0' ? 'selected' : ''}>離職</option>
                    <option value="1" ${param.empState == '1' ? 'selected' : ''}>在職中</option>
                    <option value="2" ${param.empState == '2' ? 'selected' : ''}>停職</option>
                </select>
            </div>

			<div>
            	<div></div>
            	<input  type="hidden" name="action" value="update">
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