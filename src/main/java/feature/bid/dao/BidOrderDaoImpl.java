package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidOrderVo;
import org.hibernate.Session;

public class BidOrderDaoImpl implements BidOrderDao{
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    @Override
    public void insert(BidOrderVo bidOrderVo) {
        session.persist(bidOrderVo);
    }
}
