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

    @Override
    public boolean isEmailExists(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        boolean exists = false;

        try {
            transaction = session.beginTransaction();

            // 在这里编写查询是否存在具有相同电子邮件的会员的代码
            Query query = session.createQuery("SELECT COUNT(*) FROM MemberVO WHERE memEmail = :email");
            query.setParameter("email", email);
            long count = (long) query.uniqueResult();
            exists = count > 0;

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return exists;
    }

    @Override
    public boolean isPidExists(String pid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        boolean exists = false;

        try {
            transaction = session.beginTransaction();

            // 在这里编写查询是否存在具有相同电子邮件的会员的代码
            Query query = session.createQuery("SELECT COUNT(*) FROM MemberVO WHERE memPid = :pid");
            query.setParameter("pid", pid);
            long count = (long) query.uniqueResult();
            exists = count > 0;

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return exists;
    }

    @Override
    public boolean isPhoneExists(String phone){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        boolean exists = false;

        try {
            transaction = session.beginTransaction();

            // 在这里编写查询是否存在具有相同电子邮件的会员的代码
            Query query = session.createQuery("SELECT COUNT(*) FROM MemberVO WHERE memPh = :phone");
            query.setParameter("phone", phone);
            long count = (long) query.uniqueResult();
            exists = count > 0;

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return exists;
    }







    public void closeSession() {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }
}
