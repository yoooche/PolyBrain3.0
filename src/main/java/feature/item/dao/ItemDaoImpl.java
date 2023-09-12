package feature.item.dao;

import feature.item.vo.Item;
import org.hibernate.Session;
import org.jetbrains.annotations.NotNull;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;


public class ItemDaoImpl implements ItemDao{

    //增加商品
    public Integer insert(Item item) {
        getSession().persist(item);
        return 1;
    }
    //依照ID搜尋刪除商品
    public Integer deleteById(Integer itemNo){
        Item item = getSession().get(Item.class, itemNo);
        if (item != null) {
            getSession().remove(item);
            return 1;
        } else {
            return -1; // 表示找不到對應的記錄
        }
    }
    //更新商品
    public Integer update(Item item){
        try{
            getSession().merge(item);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    //單筆查詢
    public Item SelectByItemId(Integer itemid) {
        return getSession().get(Item.class,itemid);}
    //搜尋依照商品名稱搜尋
    public Item SelectByItemName(String itemName) {
        Session session = getSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Item> criteriaQuery = criteriaBuilder.createQuery(Item.class);
        Root<Item> root = criteriaQuery.from(Item.class);
        criteriaQuery.where(criteriaBuilder.equal(root.get("itemName"), itemName));
        return session
                .createQuery(criteriaQuery)
                .uniqueResult();
    }
    //搜尋全部商品
    public List<Item> selectAll() {
        final String hql = "FROM Item ORDER BY itemNo";
        return getSession()
                .createQuery(hql, Item.class)
                .getResultList();
    }






    //更新商品 未使用
    public int updateById(Item newItem) {
        Session session = getSession();
        Item oldItemVO = session.get(Item.class, newItem.getItemNo());
        try {
            final  Integer ClassNo = newItem.getItemClassNo();

            final Integer Price = newItem.getItemPrice();
            if (Price != null) {
                oldItemVO.setItemPrice(Price);
            }

            final Integer State = newItem.getItemState();
            if (State != null) {
                oldItemVO.setItemState(State);
            }

            final Integer Qty = newItem.getItemQty();
            if (Qty != null) {
                oldItemVO.setItemQty(Qty);
            }

            final String Des = newItem.getItemProdDescription();
            if (Des != null) {
                oldItemVO.setItemProdDescription(Des);
            }

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    //搜尋依照類別分類商品 未使用
    public Item SelectByItemClass(@NotNull Item itemclassno) {
        final String hql = "FROM Item WHERE itemClassNo = :icn";
        return getSession()
                .createQuery(hql, Item.class)
                .setParameter("icn", itemclassno.getItemClassNo())
                .getSingleResult();
    }

    public static void main(String[] args) {
//        List<Item> list = new ItemDaoImpl().selectAll();
//        String s1 = .toString();
//        System.out.println(list.get(0).getItemImg().get(0).getItemImg());


        List<Item> listAAA = new ArrayList<Item>();
        listAAA.add(new ItemDaoImpl().SelectByItemId(195));
        listAAA.add(new ItemDaoImpl().SelectByItemId(196));

        for(Item item: listAAA){
            System.out.println(item.getItemNo());
            System.out.println(item.getGameTime());
        }

    }
 }
