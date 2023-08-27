package feature.cart.controller;


import feature.cart.service.CartTraceService;
import feature.cart.vo.CartTraceVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart.tw")
public class CartTraceServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        doPost(req, res);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        List<CartTraceVO> cartTraceVOList = new ArrayList<CartTraceVO>();
        if("getAll".equals(action)){
            Integer memNo = (Integer)session.getAttribute("memNo");
            CartTraceService cartTraceService = new CartTraceService();
            cartTraceVOList = cartTraceService.getAllCartItem(memNo);
            session.setAttribute("cartTraceVOList",cartTraceVOList);
        }
    }
}
