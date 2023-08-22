package feature.bid.controller;

import core.util.CommonUtil;
import feature.bid.service.BiddingService;
import feature.bid.service.BiddingServiceImpl;
import feature.bid.vo.BidItemVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.dgc.DGC;

@WebServlet("/BidItemList")
public class BidItemListServlet extends HttpServlet {
    private BiddingService biddingService = new BiddingServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CommonUtil.writePojo2Json(resp, biddingService.viewAll());
    }
}
