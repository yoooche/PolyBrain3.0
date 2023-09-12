<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>員工資料新增 </title>

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
		 <div align="center"> <h2>會員資料新增</h2>
		 <h3><a class="navbar-brand" href="<%=request.getContextPath()%>/view/mem/listAllmem.jsp">回查詢頁${success}</a></h3></div>
</nav>

	<div align="center">
		<h3><b>所有欄位皆為必填欄位</b></h3>
		<form action="<%=request.getContextPath()%>/addEmpServlet/do" method="post"

                            <!-- 姓名 -->
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="fullName"
                                       name="name" placeholder="姓名" required>
                            </div>

                            <!-- 性别 -->
                            <div class="form-group" style="width: 100%; height: auto;">
                                <select class="form-control form-control-user" id="gender" name="gender" required>
                                    <option value="" disabled selected>選擇性別</option> <!-- 默认选项 -->
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </div>

                            <!-- 信箱 -->
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="email"
                                       name="email" placeholder="輸入信箱" required>
                            </div>

                            <!-- 密码 -->
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user"
                                       id="password" name="password" placeholder="密碼" required>
                            </div>

                            <!-- 手機 -->
                            <div class="form-group">
                                <input type="tel" class="form-control form-control-user" id="phone"
                                       name="phone" placeholder="手機" pattern="\d{10}" required>
                            </div>

                            <!-- 狀態 -->
                            <div class="form-group" style="width: 100%; height: auto;">
                                <select class="form-control form-control-user" id="state" name="state" required>
                                    <option value="" disabled selected>請選擇</option> <!-- 默认选项 -->
                                    <option value="0">離職</option>
                                    <option value="1">在職中</option>
                                    <option value="2">停職</option>
                                </select>
                            </div>


                            <!-- 显示错误消息 -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>


                            <!-- 提交按钮 -->
                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                送出新增
                            </button>
                        </form>

</script>

</body>
</html>