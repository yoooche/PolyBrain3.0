package feature.bid.controller;

import feature.bid.service.BiddingService;
import feature.bid.service.BiddingServiceImpl;
import feature.bid.vo.BidItemVo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/bid/BidItemList")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class BidItemListServlet extends HttpServlet {
    public BiddingService biddingService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        //---------- insert an item into bid_item table ----------

        if("insert".equals(action)){
            String bidItemName = req.getParameter("bidItemName");
            Integer itemClassNo = Integer.valueOf(req.getParameter("itemClassNo"));
            String gamePublisher = req.getParameter("gamePublisher");
            String bidItemDescribe = req.getParameter("bidItemDescribe");

            BidItemVo bidItemVo = new BidItemVo();
            bidItemVo.setBidItemName(bidItemName);
            bidItemVo.setItemClassNo(itemClassNo);
            bidItemVo.setGamePublisher(gamePublisher);
            bidItemVo.setBidItemDescribe(bidItemDescribe);

            InputStream inputStream = req.getPart("bidItemPic").getInputStream();
            byte[] bidItemPic = inputStream.readAllBytes();

            bidItemVo.setBidItemPic(bidItemPic);

            biddingService = new BiddingServiceImpl();
            biddingService.addAnItem(bidItemVo);

            resp.sendRedirect(req.getContextPath() + "/view/bid/BidItemList.jsp");
        }
        if("delete".equals(action)){
            Integer bidItemNo = Integer.valueOf(req.getParameter("bidItemNo"));
            System.out.println(bidItemNo);
            biddingService = new BiddingServiceImpl();
            biddingService.removeOneItem(bidItemNo);

            resp.sendRedirect(req.getContextPath() + "/view/bid/BidItemList.jsp");
        }
    }
}
