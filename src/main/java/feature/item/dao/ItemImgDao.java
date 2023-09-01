package feature.item.dao;


import core.coreDao.CoreDao;
import feature.item.vo.Item;
import feature.item.vo.ItemImg;

import java.util.List;

public interface ItemImgDao extends CoreDao<ItemImg, Integer> {
    //新增圖片
    Integer insert(ItemImg itemImg);
//    json.stringify(item)
//    Item item json2pojo(req, Item.class)
//        List<ItemImg> itemimg1 = item.getItemImg();
//    byte[] itemimg = item.getItemImg()[0].getItemImg();
    //刪除圖片
    Integer deleteById(Integer itemImgNo);
    //更新圖片
    Integer update(ItemImg itemImg);
    List<ItemImg> selectAll();
}
