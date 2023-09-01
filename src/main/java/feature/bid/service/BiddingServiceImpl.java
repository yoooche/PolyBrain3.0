package feature.bid.service;

import feature.bid.dao.*;
import feature.bid.vo.BidEventVo;
import feature.bid.vo.BidItemVo;
import feature.bid.vo.BidOrderVo;
import feature.mem.dao.MemDao;
import feature.mem.dao.MemDaoImpl;
import feature.mem.vo.MemVo;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

public class BiddingServiceImpl implements BiddingService{
    private final BidItemDao dao;
    private final BidEventDao bidEventDao;
    private final MemDao memDao;
    private final BidOrderDao bidOrderDao;
    private final BidOrderVo bidOrderVo;
    Jedis jedis = new Jedis("localhost", 6379);
    public BiddingServiceImpl(){
        dao = new BidItemDaoImpl();
        bidEventDao = new BidEventDaoImpl();
        memDao = new MemDaoImpl();
        bidOrderDao = new BidOrderDaoImpl();
        bidOrderVo = new BidOrderVo();
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
    public BidItemVo getOneItem(Integer bidItemNo) {
        return dao.selectById(bidItemNo);
    }

    @Override
    public void removeOneItem(Integer bidItemNo) {
        System.out.println("xxx");
        dao.deleteById(bidItemNo);
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

    @Override
    public void createOneOrder(Integer bidEventNo) {
        Set<Tuple> highestRecord =  jedis.zrevrangeWithScores(String.valueOf(bidEventNo), 0, 0);
        Stream<Tuple> tupleStream = highestRecord.stream();
        tupleStream.forEach(tuple -> {
            String member = tuple.getElement();
            int score = (int)tuple.getScore();
//            System.out.println("Member: " + member + ", Score: " + score); // 測試用
            MemVo memVo = memDao.selectByMemName(member);
            System.out.println(memVo); // 測試用
            bidOrderVo.setBidEventNo(bidEventNo); // 競標活動編號
            bidOrderVo.setMemNo(memVo.getMemNo()); // 競標參與者會員編號
            bidOrderVo.setFinalPrice(score); // 結標價
            bidOrderVo.setBidItemNo(bidEventDao.selectItemNoByEveNo(bidEventNo)); // 競標商品編號
            bidOrderDao.insert(bidOrderVo);
        });

    }

}
