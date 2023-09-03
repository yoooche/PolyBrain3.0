package feature.order.controller;

import com.google.gson.Gson;
import feature.mem.vo.MemVo;
import feature.order.service.OrderService;
import feature.order.vo.ItemOrderVO;
import org.hibernate.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet("/order/findAllOrder")
public class MemberOrderServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession httpSession = req.getSession();
        req.setCharacterEncoding("UTF-8");

        MemVo memVo = (MemVo) httpSession.getAttribute("MemVo");
        if( memVo == null){
            String url = "/view/member/XXX.html";// 會員登入頁面
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(url);
            requestDispatcher.forward(req, res);
        }

        Integer memNo = 1001; //memVo.getMemNo();
        OrderService orderService = new OrderService();
        List<ItemOrderVO> itemMemOrderVOS = orderService.serlectFromMemNo(memNo);
        System.out.println(itemMemOrderVOS);

        Gson gson = new Gson();
        String json = gson.toJson(itemMemOrderVOS);
        res.setContentType("application/json");

    }

}
