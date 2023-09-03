package feature.bid.controller;

import com.google.gson.Gson;
import feature.bid.service.BiddingService;
import feature.bid.service.BiddingServiceImpl;
import feature.bid.vo.BidEventVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/test")
public class BiddingController extends HttpServlet {
    private BiddingService biddingService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        String bidEventId = req.getParameter("bidEventId");

        if("closed".equals(message)){
            biddingService = new BiddingServiceImpl();
            Integer bidEventNo = Integer.valueOf(bidEventId);
            biddingService.createOneOrder(bidEventNo);
        }
        if("rangeBarSetting".equals((message))){
            biddingService = new BiddingServiceImpl();
            Integer bidEventNo = Integer.valueOf(bidEventId);
            BidEventVo bidEventVo =  biddingService.getEventByNo(bidEventNo);

            Integer floorPrice =  bidEventVo.getFloorPrice();
            Integer directivePrice =  bidEventVo.getDirectivePrice();

            Map<String, Integer> priceRange = new HashMap<>();
            priceRange.put("floorPrice", floorPrice);
            priceRange.put("directivePrice", directivePrice);

            resp.setContentType("application/json");
            Gson gson = new Gson();
            String jsonPrice = gson.toJson(priceRange);
            PrintWriter out = resp.getWriter();
            out.print(jsonPrice);
            out.flush();

        }
        if("getBiddingTimer".equals(message)){
            biddingService = new BiddingServiceImpl();
            Integer bidEventNo = Integer.valueOf(bidEventId);
            Map<String, String> timer = biddingService.getStartTimeByNo(bidEventNo);
            Gson gson = new Gson();
            String jsonTimer = gson.toJson(timer);
            PrintWriter out = resp.getWriter();
            out.print(jsonTimer);
            out.flush();
        }
    }


}
