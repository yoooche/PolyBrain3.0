import javax.servlet.annotation.WebFilter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*") // 拦截所有请求
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
        // 初始化操作
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        // 强制转换为HttpServletRequest和HttpServletResponse
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // 获取Session，如果不存在Session，说明用户未登录
        HttpSession session = request.getSession(false);

        // 获取请求的URI
        String uri = request.getRequestURI();

        // 检查是否是需要登录的页面
        if (uri.endsWith("Member_Information.jsp") || uri.endsWith("xxx.jsp")|| uri.endsWith("yyy.jsp")) {
            if (session == null || session.getAttribute("loggedIn") == null) {
                // 未登录，将用户重定向到登录页面
                response.sendRedirect("login.jsp");
                return; // 不要忘记 return，以防止后续的处理
            }
        }

        // 用户已登录或不需要登录，继续处理请求
        chain.doFilter(request, response);
    }

    public void destroy() {
        // 清理资源
    }
}
