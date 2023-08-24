package feature.bid.dao;

import feature.bid.vo.BidEventVo;

import java.util.List;

public interface BidEventDao {
    public void insert(BidEventVo bidEventVo);
    public List<BidEventVo> selectAll();
    public BidEventVo selectById(Integer bidEventNo);
}
