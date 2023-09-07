package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidItemPicVo;
import org.hibernate.Session;

public class BidItemPicDaoImpl implements BidItemPicDao{
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    @Override
    public void insert(BidItemPicVo bidItemPicVo) {
        session.persist(bidItemPicVo);
    }
}
