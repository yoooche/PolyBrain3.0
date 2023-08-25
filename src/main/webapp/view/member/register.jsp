<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolyBrain - 會員註冊</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">註冊會員</h1>
                        </div>
                        <form class="user" method="POST" action="register.jsp">
                            <!-- 姓名 -->
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="fullName"
                                       name="name" placeholder="姓名" required>
                            </div>
                            <!-- 身分证 -->
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="pid"
                                       name="pid" placeholder="身分證" pattern="[a-zA-Z]\d{9}" required>
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
                            <!-- 电话 -->
                            <div class="form-group">
                                <input type="tel" class="form-control form-control-user" id="phone"
                                       name="phone" placeholder="電話" pattern="\d{10}" required>
                            </div>
                            <!-- 地址 -->
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="address"
                                       name="address" placeholder="地址">
                            </div>
                            <!-- 生日 -->
                            <div class="form-group">
                                <input type="date" class="form-control form-control-user" id="birth"
                                       name="birth">
                            </div>
                            <!-- 提交按钮 -->
                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                註冊
                            </button>
                        </form>

                        <!-- 显示错误消息 -->
                        <div class="alert alert-danger" id="nameError" style="display: none;">
                            請輸入完整格式。
                        </div>
                        <div class="alert alert-danger" id="pidError" style="display: none;">
                            請輸入完整格式。
                        </div>
                        <div class="alert alert-danger" id="pidExistsError" style="display: none;">
                            此身分證已被註冊。
                        </div>
                        <div class="alert alert-danger" id="genderError" style="display: none;">
                            請選擇性別。
                        </div>
                        <div class="alert alert-danger" id="emailError" style="display: none;">
                            請輸入完整格式。
                        </div>
                        <div class="alert alert-danger" id="emailExistsError" style="display: none;">
                            此信箱已被註冊。
                        </div>
                        <div class="alert alert-danger" id="phoneError" style="display: none;">
                            請輸入正確格式。
                        </div>
                        <div class="alert alert-danger" id="addressError" style="display: none;">
                            請輸入完整地址。
                        </div>
                        <div class="alert alert-danger" id="birthError" style="display: none;">
                            請選擇生日。
                        </div>

                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.jsp">忘記密碼?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="login.jsp">已經有帳號了 ? 點此登入 !</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%
     String mem_name = request.getParameter("name");
        if (mem_name != null) {
            mem_name = new String(mem_name.getBytes("ISO-8859-1"), "UTF-8");
        }
    String mem_pid = request.getParameter("pid");
    String mem_gender = request.getParameter("gender");
    String mem_email = request.getParameter("email");
    String mem_pwd = request.getParameter("password");
    String mem_ph = request.getParameter("phone");
    String mem_addrs = request.getParameter("address");
       if (mem_addrs != null) {
           mem_addrs = new String(mem_addrs.getBytes("ISO-8859-1"), "UTF-8");
       }
    String mem_birth = request.getParameter("birth");

    // 获取性别参数
    mem_gender = request.getParameter("gender");

    if (mem_gender != null) {
        // 数据库交互部分，需要根据你的数据库配置和代码进行修改
        try {
            // 导入数据库驱动
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/polybrain?useUnicode=true&characterEncoding=UTF-8", "root", "asd347asd");
            Statement stmt = con.createStatement();

            // 检查邮箱、身份证、电话是否已存在
            ResultSet rs = stmt.executeQuery("SELECT * FROM member WHERE MEM_EMAIL='" + mem_email + "' OR MEM_PID='" + mem_pid + "' OR MEM_PH='" + mem_ph + "'");
            if (rs.next()) {
                // 用户已存在，显示相应错误消息
                if (mem_pid.equals(rs.getString("MEM_PID"))) {
                    out.println("<script>document.getElementById('pidExistsError').style.display='block';</script>");
                }
                if (mem_email.equals(rs.getString("MEM_EMAIL"))) {
                    out.println("<script>document.getElementById('emailExistsError').style.display='block';</script>");
                }
            } else {
                // 用户不存在，插入新用户
                stmt.executeUpdate("INSERT INTO member (MEM_NAME, MEM_PID, MEM_GENDER, MEM_EMAIL, MEM_PWD, MEM_PH, MEM_ADDRS, MEM_BIRTH) VALUES ('" + mem_name + "','" + mem_pid + "','" + mem_gender + "','" + mem_email + "','" + mem_pwd + "','" + mem_ph + "','" + mem_addrs + "','" + mem_birth + "')");

                // 注册成功，跳转到註冊成功的結果反饋畫面
                response.sendRedirect("register_success.html");
            }
            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

</body>
</html>
