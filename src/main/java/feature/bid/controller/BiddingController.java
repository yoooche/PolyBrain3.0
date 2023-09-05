package feature.bid.controller;

import com.google.gson.Gson;
import feature.bid.service.BiddingService;
import feature.bid.service.BiddingServiceImpl;
import feature.bid.vo.BidEventVo;
import feature.bid.vo.BidItemVo;
import feature.item.service.ItemClassService;
import feature.item.service.ItemClassServiceImpl;
import feature.item.vo.ItemClass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static core.util.CommonUtil.json2Pojo;

@WebServlet("/test")
public class BiddingController extends HttpServlet {
    private BiddingService biddingService;
    private ItemClassService itemClassService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        String bidEventId = req.getParameter("bidEventId");
        biddingService = new BiddingServiceImpl();
        itemClassService = new ItemClassServiceImpl();

        if("closed".equals(message)){ //結標時間到，發請求到後端自動生成訂單
            Integer bidEventNo = Integer.valueOf(bidEventId);
            biddingService.createOneOrder(bidEventNo);
        }
        if("rangeBarSetting".equals((message))){ //讓 Range Bar自動根據競標活動的編號設置對應的底價、直購價等
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
        if("getBiddingTimer".equals(message)){ //根據活動編號自動帶入競標時間
            Integer bidEventNo = Integer.valueOf(bidEventId);
            Map<String, String> timer = biddingService.getStartTimeByNo(bidEventNo);
            Gson gson = new Gson();
            String jsonTimer = gson.toJson(timer);
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            out.print(jsonTimer);
            out.flush();
        }
        if("selectItem".equals(message)){ //在新增競標活動時，選競標商品用的下拉式選單可以自動生成內容
            List<BidItemVo> allItem = biddingService.viewAll();
            Gson gson = new Gson();
            String jsonItem = gson.toJson(allItem);
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            out.print(jsonItem);
            out.flush();
        }
        if("selectClass".equals(message)){ //在新增競標商品時，選競標類別用的下拉式選單可以自動生成內容
            List<ItemClass> itemClass = itemClassService.getAllClasses();
            Gson gson = new Gson();
            String jsonItemClass = gson.toJson(itemClass);
            resp.setContentType("text/html; charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.print(jsonItemClass);
            out.flush();
        }
        if("selectAllEvent".equals(message)){
            List<BidEventVo> allEvent = biddingService.viewAllEvent();
            Gson gson = new Gson();
            String jsonEvent = gson.toJson(allEvent);
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            out.print(jsonEvent);
            out.flush();
        }
        BidEventVo bidEventVo = json2Pojo(req, BidEventVo.class);
        System.out.println(bidEventVo);
        System.out.println("xxx");
        biddingService.addAnEvent(bidEventVo);
    }


}
