package feature.bid.service;

import feature.bid.dao.BidItemPicDao;
import feature.bid.dao.BidItemPicDaoImpl;
import feature.bid.vo.BidItemPicVo;

import java.util.Base64;
import java.util.List;

public class BidItemPicServiceImpl implements BidItemPicService {

    private BidItemPicDao bidItemPicDao;

    public BidItemPicServiceImpl() {
        bidItemPicDao = new BidItemPicDaoImpl();
    }

    @Override
    public void addBidItemPic(List<String> bidItemPic, Integer bidItemNo) {

        System.out.println("競標圖片新增");

        for (String base64String : bidItemPic) {
            byte[] file = Base64.getDecoder().decode(base64String);
            System.out.println(file);
            BidItemPicVo bidItemPicVo = new BidItemPicVo();
            bidItemPicVo.setBidItemPic(file);
            bidItemPicVo.setBidItemNo(bidItemNo);
            bidItemPicDao.insert(bidItemPicVo);

        }
    }
}
