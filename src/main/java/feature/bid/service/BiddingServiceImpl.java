package feature.bid.service;

import feature.bid.dao.BidItemDao;
import feature.bid.dao.BidItemDaoImpl;
import feature.bid.vo.BidItemVo;

import java.util.List;

public class BiddingServiceImpl implements BiddingService{
    private BidItemDao dao;
    public BiddingServiceImpl(){
        dao = new BidItemDaoImpl();
    }
    @Override
    public List<BidItemVo> viewAll() {
        return dao.selectAll();
    }
}
