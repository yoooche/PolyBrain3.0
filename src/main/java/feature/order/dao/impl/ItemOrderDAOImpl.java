package feature.order.dao.impl;

import core.coreDao.CoreDao;
import org.hibernate.Session;
import feature.order.dao.ItemOrderDAO;
import feature.order.vo.ItemOrderVO;

import java.util.List;

public class ItemOrderDAOImpl implements ItemOrderDAO {


    public Integer insert(ItemOrderVO itemOrderVO) {
        getSession().persist(itemOrderVO);
        return itemOrderVO.getOrderNo() ;
    }

    public Integer deleteById(Integer orderNo) {
        Session session = getSession();
        ItemOrderVO pojo = session.get(ItemOrderVO.class, orderNo);
        session.remove(pojo);
        return 1;
    }

    public Integer update(ItemOrderVO itemOrderVO) {
        return null;
    }

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
    public ItemOrderVO selectByMemberNumber(Integer memNo) {
        return getSession().get(ItemOrderVO.class, memNo );
    }

    public ItemOrderVO updateAnOrder(ItemOrderVO itemordervo){
        Session session = getSession();
        session.update(itemordervo);
        return itemordervo;
    }

    public Integer insertAnDetail(ItemOrderVO itemOrderVO){
        getSession().persist(itemOrderVO);
        return 1;
    }



}
