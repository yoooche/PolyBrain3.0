package feature.item.service;

import core.coreService.CoreService;
import feature.item.vo.Item;

import java.util.List;


public interface ItemService extends CoreService {
    //新增商品資訊
    Item AddItem(Item item);
    //移除商品資訊
    boolean remove(Integer itemNo);
    //編輯商品資訊
    Item edit(Item item);
    //取得全部商品資訊
    List<Item> getAllItems();


    Item FindByItemId(Integer itemid);
//    Integer updateItem(Item item);
//    boolean updateItemByItemName(Item newItem);

}
