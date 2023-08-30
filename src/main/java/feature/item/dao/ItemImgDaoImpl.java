package feature.item.dao;


import feature.item.vo.ItemImg;

import java.util.List;

public class ItemImgDaoImpl implements ItemImgDao{
    public Integer insert(ItemImg item) {
        getSession().persist(item);
        return 1;
    }

    public Integer deleteById(Integer itemImgNo){
        ItemImg itemImgVo = getSession().get(ItemImg.class, itemImgNo);
        getSession().remove(itemImgVo);
        return -1;
    }

    public Integer update(ItemImg itemImgVo){
        try{
            getSession().merge(itemImgVo);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public List<ItemImg> selectAll() {
        final String hql = "FROM ItemImgVo ORDER BY ITEMIMGNO";
        return getSession().createQuery(hql, ItemImg.class).getResultList();
    }
    public ItemImg selectByItemImgName(String itemImgName){
        final String hql = "FROM ItemVo WHERE itemImgName = :itemImgName";
        return getSession().createQuery(hql, ItemImg.class)
                .setParameter("itemImgName", itemImgName)
                .uniqueResult();
    }

}
