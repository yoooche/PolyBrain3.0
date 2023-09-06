package feature.mem.controller;



import feature.mem.service.loginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    // 注入MemberDAO的實例
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 取得表單提交的email和password
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 在Controller中調用Service來執行登入驗證
        loginService authService = new loginService();

        boolean isValidUser = authService.isValidUser(email, password);

        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("account", email);
            // 登入成功，執行相關操作（例如：設定Session、重定向到其他頁面）
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // 登入失敗，可以重新導向回登入頁面或顯示錯誤信息
            String encodedMessage = URLEncoder.encode(" ", "UTF-8");
            response.sendRedirect(request.getContextPath() +"/view/member/login.jsp?error=true&message=" + encodedMessage);
        }
    }
}
