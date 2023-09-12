package feature.bid.controller;

import core.util.CommonUtil;
import feature.bid.dto.BidItemDto;
import feature.bid.service.BidItemPicService;
import feature.bid.service.BidItemPicServiceImpl;
import feature.bid.service.BiddingService;
import feature.bid.service.BiddingServiceImpl;
import feature.bid.vo.BidItemVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static core.util.CommonUtil.json2Pojo;

@WebServlet("/BidItemAdd")
public class BidItemAddController extends HttpServlet {
    private BidItemPicService bidItemPicService;
    private BiddingService biddingService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        bidItemPicService = new BidItemPicServiceImpl();
        biddingService = new BiddingServiceImpl();
        System.out.println(req);
        System.out.println("競標新增商品");

        BidItemDto bidItemDto = json2Pojo(req, BidItemDto.class);
        System.out.println(bidItemDto);
        BidItemVo bidItem = bidItemDto.getBidItemVo();
        System.out.println(bidItem);
        List<String> bidItemPic = bidItemDto.getBidItemPic();
        System.out.println(bidItemPic);

//        如果進來的東西是空的 代表新增失敗
        if (bidItem == null) {
            bidItem = new BidItemVo();
            bidItem.setMessage("無商品資訊");
            bidItem.setSuccess(false);
            CommonUtil.writePojo2Json(resp, bidItem);
            return;
        }
        if (bidItem.getBidItemNo() == null) {
            System.out.println("新增商品");
            BidItemVo bidItemVoAdd = biddingService.addAnItem(bidItem);
            Integer bidItemVoAddNo = bidItemVoAdd.getBidItemNo();
            System.out.println("新商品 = " + bidItemVoAdd);
            System.out.println("商品序號 = " + bidItemVoAddNo);
            bidItemPicService.addBidItemPic(bidItemPic, bidItemVoAddNo);
            CommonUtil.writePojo2Json(resp, bidItemVoAdd);
            return;
        }
    }
}
