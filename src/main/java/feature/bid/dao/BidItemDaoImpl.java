package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidItemPicVo;
import feature.bid.vo.BidItemVo;
import net.bytebuddy.asm.MemberSubstitution;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
@Transactional
public class BidItemDaoImpl implements BidItemDao {
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    @Override
    public void insert(BidItemVo bidItemVo) {
        session.persist(bidItemVo);
    }
    @Override
    public List<BidItemVo> selectAll() {
        final String hql = "FROM BidItemVo ORDER BY bidItemNo";
        return session
                .createQuery(hql, BidItemVo.class)
                .getResultList();
    }
    @Override
    public void deleteById(Integer bidItemNo) {
        BidItemVo bidItemVo = session.load(BidItemVo.class, bidItemNo);
        session.remove(bidItemVo);
    }
    @Override
    public BidItemVo selectById(Integer bidItemNo) {
        return session.get(BidItemVo.class, bidItemNo);
    }
}
