package feature.item.dao;


import core.coreDao.CoreDao;
import feature.item.vo.ItemImg;

public interface ItemImgDao extends CoreDao<ItemImg, Integer> {
    //新增圖片
    Integer insert(ItemImg itemImgNo);
}
