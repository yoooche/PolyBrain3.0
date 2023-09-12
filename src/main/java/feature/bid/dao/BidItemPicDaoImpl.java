package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidItemPicVo;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class BidItemPicDaoImpl implements BidItemPicDao{
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    @Override
    public void insert(BidItemPicVo bidItemPicVo) {
        session.persist(bidItemPicVo);
    }

    @Override
    public List<byte[]> selectPicsById(Integer bidItemNo) {
        String hql = "SELECT bidItemPic FROM BidItemPicVo WHERE bidItemNo = :bidItemNo";
        Query<byte[]> query = session.createQuery(hql, byte[].class);
        query.setParameter("bidItemNo", bidItemNo);
        return query.getResultList();
    }

    @Override
    public List<BidItemPicVo> selectAllPics() {
        final String hql = "FROM BidItemPicVo ORDER BY bidItemPicNo";
        return session.createQuery(hql, BidItemPicVo.class).getResultList();
    }

}
