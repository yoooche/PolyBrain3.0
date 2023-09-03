package feature.item.dao.impl;

import core.coreDao.CoreDao;
import feature.item.vo.itemVOPeter;

import java.util.List;

public class ItemDAOimplPeter implements CoreDao {

    public Object insert(Object o) {
        return null;
    }

    public Object deleteById(Object id) {
        return null;
    }

    public Object update(Object o) {
        return null;
    }

    public Object selectById(Object id) {
        return null;
    }

    @Override
    public List<itemVOPeter> selectAll() {
        final String hql = "FROM itemVO ORDER BY ITEM_NO";
        return getSession().createQuery(hql, itemVOPeter.class).getResultList();
    }
    public List<itemVOPeter> selectAll1(Integer itemNo) {

        final String hql = "FROM itemVO WHERE ITEM_NO ="+itemNo;
        return getSession().createQuery(hql, itemVOPeter.class).getResultList();
    }


    public static void main(String[] args) {
        ItemDAOimplPeter iopl = new ItemDAOimplPeter();
        List<itemVOPeter> itemVOS = iopl.selectAll1(101);
        for(itemVOPeter list :itemVOS){
            System.out.println(list.getItemName());
        }
    }
}
