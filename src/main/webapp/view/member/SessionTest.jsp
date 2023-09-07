<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session 測試</title>
</head>
<body>
    <div id="sessionStatus">
        <%
            // 從 Session 中獲取 "account" 屬性
            String account = (String) session.getAttribute("account");

            // 檢查 "account" 是否為 null
            if (account != null) {
        %>
            <!-- 如果 "account" 不為 null，則顯示用戶的帳號 -->
            用戶帳號：<%= account %>
        <%
            } else {
        %>
            <!-- 如果 "account" 為 null，則顯示未登入 -->
            未登入
        <%
            }
        %>
    </div>
</body>
</html>