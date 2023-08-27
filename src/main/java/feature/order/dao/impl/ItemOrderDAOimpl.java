package feature.order.dao.impl;

import org.hibernate.Session;
import feature.order.dao.ItemOrderDAO;
import feature.order.vo.ItemOrderVO;

import java.util.List;

public class ItemOrderDAOimpl implements ItemOrderDAO {

    @Override
    public Integer insert(ItemOrderVO pojo) {
        getSession().persist(pojo);
        return 1 ;
    }

    @Override
    public Integer deleteById(Integer orderNo) {
        Session session = getSession();
        ItemOrderVO pojo = session.get(ItemOrderVO.class, orderNo);
        session.remove(pojo);
        return 1;
    }

    @Override
    public Integer update(ItemOrderVO itemOrderVO) {
        return null;
    }

    @Override
    public ItemOrderVO selectById(Integer orderNo) {

        return getSession().get(ItemOrderVO.class, orderNo );
    }

    @Override
    public List<ItemOrderVO> selectAll() {
        final String hql = "FROM ItemOrderVO ORDER BY ORDER_NO";
        return getSession().createQuery(hql, ItemOrderVO.class).getResultList() ;
    }

    @Override
    public ItemOrderVO selectByOrderNumber(Integer orderNo) {
        return null;
    }

    @Override
    public ItemOrderVO selectByMemberNumber(Integer memberNo) {
        return getSession().get(ItemOrderVO.class, memberNo );
    }

    public ItemOrderVO updateAnOrder(ItemOrderVO itemordervo){
        Session session = getSession();
        session.update(itemordervo);
        return itemordervo;
    }


}
