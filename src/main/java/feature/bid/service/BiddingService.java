package feature.bid.service;

import core.coreService.CoreService;
import feature.bid.vo.BidEventVo;
import feature.bid.vo.BidItemPicVo;
import feature.bid.vo.BidItemVo;

import java.util.List;
import java.util.Map;

public interface BiddingService extends CoreService {

    // ========== about bidding item ==========
    List<BidItemVo> viewAll();
    public void addAnItem(BidItemVo bidItemVo);
    public BidItemVo getOneItem(Integer bidItemNo);
    public void removeOneItem(Integer bidItemNo);
    List<String> viewAllName();
    public void addPics(BidItemPicVo bidItemPicVo);

    // ========== about bidding event ==========
    List<BidEventVo> viewAllEvent();
    public void addAnEvent(BidEventVo bidEventVo);
    public BidEventVo getEventByNo(Integer bidEventNo);
    public Map<String, String> getStartTimeByNo(Integer bidEventNo);
    public void removeEventById(Integer bidEventNo);
    // ========== about bidding order ==========
    public void createOneOrder(Integer bidEventNo);
}
