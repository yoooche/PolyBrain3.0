package feature.bid.dao;

import feature.bid.vo.BidItemVo;

import java.util.List;

public interface BidItemDao {
    public void insert(BidItemVo bidItemVo);
    public List<BidItemVo> selectAll();
    public void deleteById(Integer bidItemNo);
    public BidItemVo selectById(Integer bidItemNo);
}
