package feature.bid.service;

import feature.bid.dao.BidEventDao;
import feature.bid.dao.BidEventDaoImpl;
import feature.bid.dao.BidItemDao;
import feature.bid.dao.BidItemDaoImpl;
import feature.bid.vo.BidEventVo;
import feature.bid.vo.BidItemVo;

import java.util.List;

public class BiddingServiceImpl implements BiddingService{
    private final BidItemDao dao;
    private final BidEventDao bidEventDao;
    public BiddingServiceImpl(){
        dao = new BidItemDaoImpl();
        bidEventDao = new BidEventDaoImpl();
    }
    @Override
    public List<BidItemVo> viewAll() {
        return dao.selectAll();
    }
    @Override
    public void addAnItem(BidItemVo bidItemVo) {
        dao.insert(bidItemVo);
    }
    @Override
    public List<BidEventVo> viewAllEvent() {
        return bidEventDao.selectAll();
    }
    @Override
    public void addAnEvent(BidEventVo bidEventVo) {
        bidEventDao.insert(bidEventVo);
    }

    @Override
    public BidEventVo getEventByNo(Integer bidEventNo) {
        return bidEventDao.selectById(bidEventNo);
    }

}
