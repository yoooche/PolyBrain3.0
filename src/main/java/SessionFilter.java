import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter(urlPatterns = { "*.jsp", "*.html" })
public class SessionFilter implements Filter {


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // 获取请求的页面路径
        String requestPath = httpRequest.getServletPath();

        // 检查是否是需要排除的页面
        if ("/view/member/login.jsp".equals(requestPath)
                || "/view/member/loginplz.html".equals(requestPath)
                || "/view/member/register.jsp".equals(requestPath)
                || "/view/member/register_success.html".equals(requestPath)
                || "/view/member/register_fail.html".equals(requestPath)
                || "/index.jsp".equals(requestPath)
        ) {
            chain.doFilter(request, response);
        } else {
            // 需要验证的页面，检查用户是否已登录
            HttpSession session = httpRequest.getSession(false); // 不创建新的 Session
            boolean isLoggedIn = (session != null && session.getAttribute("account") != null);

            if (isLoggedIn) {
                // 用户已登录，允许请求继续执行
                chain.doFilter(request, response);
            } else {
                // 用户未登录，重定向到登录页面
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/view/member/loginplz.html");
            }
        }
    }


    @Override
    public void destroy() {
        // 销毁代码
    }
}