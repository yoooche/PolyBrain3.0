package feature.order.controller;

import core.util.CommonUtil;
import feature.bid.vo.BidOrderVo;
import feature.order.service.OrderService;
import feature.order.vo.ItemOrderVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/bidOrderConfirm")
public class BidOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CommonUtil commonUtil = new CommonUtil();
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Integer memNo = 1002; //memVo.getMemNo();

        Integer orderNo = Integer.valueOf(req.getParameter("orderNo"));
        System.out.println("orderNo: " + orderNo);

        OrderService orderService = new OrderService();
        BidOrderVo bidOrderVo = orderService.getBidOneOrder(orderNo);

        System.out.println("bidOrderVo: "+bidOrderVo);
        commonUtil.writePojo2Json(res, bidOrderVo);


    }

}



