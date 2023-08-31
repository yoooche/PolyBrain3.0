package feature.item.service;


import feature.item.dao.ItemDao;
import feature.item.dao.ItemDaoImpl;
import feature.item.vo.Item;

import java.util.List;

public class ItemServiceImpl implements ItemService{
    private ItemDao Dao;

    public  ItemServiceImpl(){
        Dao = new ItemDaoImpl();
    }

    //增加商品
    public Item AddItem(Item item){
        System.out.println("進行新增商品");
        if(item.getItemClassNo() == null){
            item.setMessage("商品類別未選擇");
            return item;
        }
        if(item.getItemName() == null){
            item.setMessage("商品名稱未輸入");
            return item;
        }
        if (Dao.SelectByItemName(item.getItemName()) != null) {
            item.setMessage("該商品賣場已存在，請重新確認輸入的資料");
            item.setSuccess(false);
            return item;
        }
        if(item.getItemPrice() == null){
            item.setMessage("商品價格未輸入");
            return item;
        }
        if(item.getMaxPlayer() == null || item.getMaxPlayer() == null){
            item.setMessage("玩家人數未選擇");
            return item;
        }
        if(item.getGameTime() == null){
            item.setMessage("遊戲時間未選擇");
            return item;
        }
        final int resultCount = Dao.insert(item);
        if(resultCount < 1){
            item.setMessage("新增失敗，請聯絡管理員!");
            item.setSuccess(false);
        }
        item.setMessage("新增成功");
        item.setSuccess(true);
        return item;
    }

    //刪除商品
    public boolean remove(Integer itemNo) {
        // 交易機制由Filter掌管，這邊不執行交易
        System.out.println("啟動刪除");
        return Dao.deleteById(itemNo) > 0;
    }

    //編輯商品
    public Item edit(Item item) {
        final int resultCount = Dao.update(item);
        item.setSuccess(resultCount > 0);
        item.setMessage(resultCount > 0 ? "修改成功" : "修改失敗");
        return item;
    }


    //拿取全部
    @Override
    public List<Item> getAllItems() {
        System.out.println("查詢所有遊戲");
        return Dao.selectAll();
    }

    //拿取單筆
    @Override
    public Item FindByItemId(Item itemid) {
        System.out.println("以編號查詢遊戲");
        return Dao.SelectByItemId(itemid);
    }
}
