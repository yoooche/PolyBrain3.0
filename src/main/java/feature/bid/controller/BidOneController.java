package feature.bid.controller;

import feature.bid.service.BiddingService;
import feature.bid.service.BiddingServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;
@WebServlet("/bidEventPage")
public class BidOneController extends HttpServlet {
    public BiddingService biddingService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Integer bidEventNo = Integer.valueOf(req.getParameter("id"));

        biddingService = new BiddingServiceImpl();
        Date startTime = biddingService.getEventByNo(bidEventNo).getStartTime();
        Date closeTime = biddingService.getEventByNo(bidEventNo).getCloseTime();
        long biddingTime = closeTime.getTime() - startTime.getTime();
        long biddingTimeSec = TimeUnit.MILLISECONDS.toSeconds(biddingTime);

        req.setAttribute("biddingTimeSec", biddingTimeSec);
        RequestDispatcher biddingItemDetail = req.getRequestDispatcher("/view/bid/BidOnItemPage.jsp");
        biddingItemDetail.forward(req, resp);
    }
}
