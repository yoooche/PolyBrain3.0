package feature.mem.dao;

import core.util.HibernateUtil;
import feature.mem.vo.MemberVO;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class MemberDAOImpl implements MemberDAO {

    private Session session = HibernateUtil.getSessionFactory().openSession();

    @Override
    public void createMember(MemberVO member) {
        Transaction add = null;
        try {
            add = session.beginTransaction();
            session.save(member);
            add.commit();
        } catch (Exception e) {
            if (add != null) {
                add.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public MemberVO getMemberById(Integer memNo) {
        return session.get(MemberVO.class, memNo);
    }

    @Override
    public void updateMember(MemberVO member) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(member);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMember(Integer memNo) {
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            MemberVO member = session.get(MemberVO.class, memNo);
            if (member != null) {
                session.delete(member);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public List<MemberVO> getAllMembers() {
        try {
            String hql = "FROM MemberVO";
            Query<MemberVO> query = session.createQuery(hql, MemberVO.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void closeSession() {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }
}
