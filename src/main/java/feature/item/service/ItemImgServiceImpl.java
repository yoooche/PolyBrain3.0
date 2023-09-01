package feature.item.service;

import feature.item.dao.ItemImgDao;
import feature.item.dao.ItemImgDaoImpl;
import feature.item.vo.ItemImg;

import java.util.Base64;
import java.util.List;


public class ItemImgServiceImpl implements ItemImgService{
    private ItemImgDao Dao;

    public ItemImgServiceImpl(){
            Dao = new ItemImgDaoImpl();
    }
    //新增商品資訊
    public void AddItemImg(List<String> itemImageList, Integer itemNo){
        System.out.println("新增圖片");
        for(String str : itemImageList) {
            ItemImg itemImg = new ItemImg();
            itemImg.setItemNo(itemNo);
            itemImg.setItemImg(str);
            final int resultCount = Dao.insert(itemImg);
        }
    }
}
