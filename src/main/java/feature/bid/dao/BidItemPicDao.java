package feature.bid.dao;

import feature.bid.vo.BidItemPicVo;

import java.util.List;

public interface BidItemPicDao {
    public void insert(BidItemPicVo bidItemPicVo);
    public List<byte[]> selectPicsById(Integer bidItemNo);
}
