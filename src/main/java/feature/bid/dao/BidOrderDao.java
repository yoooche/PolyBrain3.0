package feature.bid.dao;

import feature.bid.vo.BidOrderVo;

import java.util.List;

public interface BidOrderDao {
    public void insert(BidOrderVo bidOrderVo);
    public BidOrderVo selectById(Integer bidOrderNo);

}
