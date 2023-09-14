package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidOrderVo;
import org.hibernate.Session;

import java.util.List;

public class BidOrderDaoImpl implements BidOrderDao{
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    @Override
    public BidOrderVo insert(BidOrderVo bidOrderVo) {
        session.persist(bidOrderVo);
        return bidOrderVo;
    }
    public BidOrderVo selectById(Integer bidOrderNo){
        return session.get(BidOrderVo.class, bidOrderNo);
    }
}
