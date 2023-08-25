<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolyBrain - 會員登入</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">歡迎回來!</h1>
                                    </div>
                                    <!-- 显示错误消息 -->
                                    <%
                                        if (request.getAttribute("error") != null) {
                                    %>
                                    <div class="text-center text-danger mb-3">
                                        信箱或密碼輸入錯誤，請重新輸入。
                                    </div>
                                    <%
                                        }
                                    %>
                                    <form class="user" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="輸入信箱" name="email">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="密碼" name="password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">記住我</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            登入
                                        </button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.jsp">忘記密碼?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.jsp">會員註冊</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // 準備 SQL 查詢
            String sql = "SELECT * FROM member WHERE MEM_EMAIL = ? AND MEM_PWD = ?";
            Connection connection = null;
            boolean loginSuccessful = false;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/polybrain";
                String dbUser = "root";
                String dbPassword = "asd347asd";
                connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);

                ResultSet resultSet = preparedStatement.executeQuery();

                // 如果有結果集，表示驗證成功
                if (resultSet.next()) {
                    loginSuccessful = true;

                    // 登入成功，設置Session以標識登入狀態
                    session.setAttribute("loggedIn", "true");
                    response.sendRedirect("Member_Information.jsp"); // 登录成功后跳转到sessionTest.jsp
                } else {
                    // 登录失败，设置错误消息属性
                    request.setAttribute("error", "true");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    %>
</body>
</html>
