package feature.bid.service;

import core.coreService.CoreService;
import feature.bid.vo.BidItemVo;

import java.util.List;

public interface BiddingService extends CoreService {
    List<BidItemVo> viewAll();
    public void addAnItem(BidItemVo bidItemVo);
}
