package feature.bid.service;

import feature.bid.dao.*;
import feature.bid.dto.BidItemDto;
import feature.bid.dto.BidItemListDto;
import feature.bid.vo.BidEventVo;
import feature.bid.vo.BidItemPicVo;
import feature.bid.vo.BidItemVo;
import feature.bid.vo.BidOrderVo;
import feature.mem.dao.MemDao;
import feature.mem.dao.MemDaoImpl;
import feature.mem.vo.MemVo;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Stream;

public class BiddingServiceImpl implements BiddingService{
    private final BidItemDao bidItemDao;
    private final BidEventDao bidEventDao;
    private final MemDao memDao;
    private final BidOrderDao bidOrderDao;
    private final BidOrderVo bidOrderVo;
    private final BidItemPicDao bidItemPicDao;
    Jedis jedis = new Jedis("localhost", 6379);
    public BiddingServiceImpl(){
        bidItemDao = new BidItemDaoImpl();
        bidEventDao = new BidEventDaoImpl();
        memDao = new MemDaoImpl();
        bidOrderDao = new BidOrderDaoImpl();
        bidOrderVo = new BidOrderVo();
        bidItemPicDao = new BidItemPicDaoImpl();
    }
    @Override
    public List<BidItemVo> viewAll() {
        return bidItemDao.selectAll();
    }
    @Override
    public void addAnItem(BidItemVo bidItemVo) {
        bidItemDao.insert(bidItemVo);
    }

    @Override
    public BidItemVo getOneItem(Integer bidItemNo) {
        return bidItemDao.selectById(bidItemNo);
    }

    @Override
    public void removeOneItem(Integer bidItemNo) {
        bidItemDao.deleteById(bidItemNo);
    }

    @Override
    public List<String> viewAllName() {
        List<BidItemVo> all = bidItemDao.selectAll();
        List<String> allName = new ArrayList<>();
        for(BidItemVo bidItemVo : all){
            allName.add(bidItemVo.getBidItemName());
        }
        return allName;
    }

    @Override
    public void addPics(BidItemPicVo bidItemPicVo) {
        bidItemPicDao.insert(bidItemPicVo);
    }

    @Override
    public List<BidItemListDto> getHomePageList() {
        List<BidItemListDto> bidItemListDtoList = new ArrayList<>();
        List<BidEventVo> bidEventVoList = bidEventDao.selectAll();
        List<BidItemVo> bidItemVoList = bidItemDao.selectAll();
        List<BidItemPicVo> bidItemPicVoList = bidItemPicDao.selectAllPics();

        for (BidEventVo bidEventVo : bidEventVoList) {
            BidItemListDto dto = new BidItemListDto();
            dto.setBidEventNo(bidEventVo.getBidEventNo());
            dto.setFloorPrice(bidEventVo.getFloorPrice());
            dto.setDirectivePrice(bidEventVo.getDirectivePrice());
            dto.setStartTime(bidEventVo.getStartTime());
            dto.setCloseTime(bidEventVo.getCloseTime());

            for (BidItemVo bidItemVo : bidItemVoList) {
                if (bidItemVo.getBidItemNo().intValue() == bidEventVo.getBidItemNo().intValue()) {
                    dto.setBidItemVo(bidItemVo);

                    for (BidItemPicVo bidItemPicVo : bidItemPicVoList) {
                        if (bidItemVo.getBidItemNo().intValue() == bidItemPicVo.getBidItemNo().intValue()) {
                            List<byte[]> str =  bidItemPicDao.selectPicsById(bidItemVo.getBidItemNo());
                            for(byte[] str1 : str){
                                List<String> base64 = new ArrayList<>();
                                String base64Img = Base64.getEncoder().encodeToString(str1);
                                base64.add(base64Img);
                                dto.setBidItemPic(base64);
                            }
                            break;
                        }
                    }
                    break;
                }
            }
            bidItemListDtoList.add(dto);
        }

        return bidItemListDtoList;
    }

    @Override
    public List<BidItemDto> getTableData() {
        List<BidItemDto> itemDto = new ArrayList<>();
        List<BidItemVo> bidItemVoList = bidItemDao.selectAll();
        List<BidItemPicVo> bidItemPicVoList = bidItemPicDao.selectAllPics();
        for(BidItemVo bidItemVo : bidItemVoList) {
            BidItemDto dto = new BidItemDto();
            dto.setBidItemVo(bidItemVo);
            for (BidItemPicVo bidItemPicVo : bidItemPicVoList) {
                if (bidItemVo.getBidItemNo().intValue() == bidItemPicVo.getBidItemNo().intValue()) {
                    List<byte[]> str = bidItemPicDao.selectPicsById(bidItemVo.getBidItemNo());
                    for (byte[] str1 : str) {
                        List<String> base64 = new ArrayList<>();
                        String base64Img = Base64.getEncoder().encodeToString(str1);
                        base64.add(base64Img);
                        dto.setBidItemPic(base64);
                    }
                    break;
                }
            }
            itemDto.add(dto);
        }
        return itemDto;
    }

    @Override
    public List<String> selectAllPicsB64() {
       List<BidItemPicVo> bidItemPics =  bidItemPicDao.selectAllPics();
        List<String> imgB64 = new ArrayList<>();
        bidItemPics.forEach(bidItemPicVo -> {
          byte[] imgs =  bidItemPicVo.getBidItemPic();
          String img64 = Base64.getEncoder().encodeToString(imgs);
          imgB64.add(img64);
       });
       return imgB64;
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
    public Map<String, String> getStartTimeByNo(Integer bidEventNo) {
        BidEventVo bidEventVo = bidEventDao.selectById(bidEventNo);
        Timestamp startTimeOrigin = bidEventVo.getStartTime();
        Timestamp closeTimeOrigin = bidEventVo.getCloseTime();

        SimpleDateFormat timerTrans = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startTime = timerTrans.format(startTimeOrigin);
        String closeTime = timerTrans.format(closeTimeOrigin);

        Map<String, String> timer = new HashMap<>();
        timer.put("startTime", startTime);
        timer.put("closeTime", closeTime);
        return timer;
    }

    @Override
    public void removeEventById(Integer bidEventNo) {
        bidEventDao.deleteById(bidEventNo);
    }

    @Override
    public void createOneOrder(Integer bidEventNo) {
        Set<Tuple> highestRecord =  jedis.zrevrangeWithScores(String.valueOf(bidEventNo), 0, 0);
        Stream<Tuple> tupleStream = highestRecord.stream();
        tupleStream.forEach(tuple -> {
            String member = tuple.getElement();
            int score = (int)tuple.getScore();

            MemVo memVo = memDao.selectByMemName(member);
            bidOrderVo.setBidEventNo(bidEventNo); // 競標活動編號
            bidOrderVo.setMemNo(memVo.getMemNo()); // 競標參與者會員編號
            bidOrderVo.setFinalPrice(score); // 結標價
            bidOrderVo.setBidItemNo(bidEventDao.selectItemNoByEveNo(bidEventNo)); // 競標商品編號
            bidOrderDao.insert(bidOrderVo);
        });
//            System.out.println("Member: " + member + ", Score: " + score); // 測試用
//            String message = "Hi" + member + "! 您好，您以" +  score + "元的高價得標，請到訂單確認頁面完成後續的出貨流程。";
//            jedis.select(1);
//            jedis.set("bidOrder" + bidEventNo, message);
    }

    @Override
    public BidOrderVo orderWithoutBid(Integer bidEventNo, Integer memNo) {
        BidOrderVo bidOrderVoWithoutBid = new BidOrderVo();
        BidEventVo bidEventVo = bidEventDao.selectById(bidEventNo);

        bidOrderVoWithoutBid.setBidEventNo(bidEventNo);
        bidOrderVoWithoutBid.setBidItemNo(bidEventVo.getBidItemNo());
        bidOrderVoWithoutBid.setFinalPrice(bidEventVo.getDirectivePrice());
        bidOrderVoWithoutBid.setMemNo(memNo);

        bidOrderDao.insert(bidOrderVoWithoutBid);

        return bidOrderVoWithoutBid;
    }


    @Override
    public List<byte[]> getItemPicsByEveNo(Integer bidEventNo) {
        Integer bidItemNo = bidEventDao.selectItemNoByEveNo(bidEventNo);
        return bidItemPicDao.selectPicsById(bidItemNo);
    }

}
