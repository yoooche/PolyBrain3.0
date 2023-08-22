package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidItemVo;
import org.hibernate.Session;

import java.util.List;

public class BidItemDaoImpl implements BidItemDao {
    Session session = HibernateUtil.getSessionFactory().openSession();
    @Override
    public Integer insert(BidItemVo bidItemVo) {
        session.persist(bidItemVo);
        return 1;
    }
    @Override
    public List<BidItemVo> selectAll() {
        final String hql = "FROM BidItemVo ORDER BY BidItemNo";
        return session
                .createQuery(hql, BidItemVo.class)
                .getResultList();
    }


}
