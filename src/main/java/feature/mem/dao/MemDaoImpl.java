package feature.mem.dao;

import core.util.HibernateUtil;
import feature.mem.vo.MemVo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.jetbrains.annotations.NotNull;

import javax.servlet.ServletException;
import java.util.List;

public class MemDaoImpl implements MemDao {

    Session session = HibernateUtil.getSessionFactory().getCurrentSession();

    public Integer insert(MemVo memVo) {
        return (Integer) session.save(memVo);
    }

    public Integer deleteById(Integer memNo) {
        MemVo memVo = session.get(MemVo.class, memNo);
        session.remove(memVo);
        return -1;
    }

    public Integer update(MemVo memVo) {
        try {
            session.merge(memVo);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }


    public MemVo selectById(Integer memNo) {
        return session.get(MemVo.class, memNo);
    }

    public boolean updateById(@NotNull MemVo newMemVo) {
        MemVo oldMemVO = session.get(MemVo.class, newMemVo.getMemNo());
        try {
            final String name = newMemVo.getMemName();
            if (name != null) {
                oldMemVO.setMemName(name);
            }
            final Byte[] pic = newMemVo.getMemPic();
            if (pic != null) {
                oldMemVO.setMemPic(pic);
            }
            final String email = newMemVo.getMemEmail();
            if (email != null) {
                oldMemVO.setMemEmail(email);
            }
            final String password = newMemVo.getMemPwd();
            if (password != null) {
                oldMemVO.setMemPwd(password);
            }
            final String phone = newMemVo.getMemPh();
            if (phone != null) {
                oldMemVO.setMemPh(phone);
            }
            final String address = newMemVo.getMemAddress();
            if (address != null) {
                oldMemVO.setMemAddress(address);
            }
            final Byte authority = newMemVo.getMemAuth();
            if (authority != null) {
                oldMemVO.setMemAuth(authority);
            }
            final Byte violation = newMemVo.getMemVio();
            if (violation != null) {
                oldMemVO.setMemVio(violation);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<MemVo> selectAll() {
        final String hql = "FROM MemVo ORDER BY memNo";
        return session.createQuery(hql, MemVo.class).getResultList();
    }

    public MemVo selectByMemName(String memName) {
        final String hql = "FROM member WHERE memName = :memName";
        return session.createQuery(hql, MemVo.class)
                .setParameter("memName", memName)
                .uniqueResult();
    }

    public MemVo selectForLogin(String memEmail, String memPwd) {
        final String sql = "select * from MEMBER where MEM_EMAIL = :memEmail and MEM_PWD = :memPwd";

        return session
                .createNativeQuery(sql, MemVo.class)
                .setParameter("memEmail", memEmail)
                .setParameter("memPwd", memPwd)
                .uniqueResult();
    }

    public List<MemVo> selectByVio(MemVo memVo) {
        final String sql = "select * from MEMBER where MEM_VIO = 3";
        return session
                .createNativeQuery(sql, MemVo.class)
                .getResultList();
    }


    @Override
    public void createMember(MemVo member) {
            session.save(member);
    }

    @Override
    public MemVo getMemberById(Integer memNo) {
        return session.get(MemVo.class, memNo);
    }

    @Override
    public void updateMember(MemVo member) {
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
            MemVo member = session.get(MemVo.class, memNo);
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
    public List<MemVo> getAllMembers() {
        try {
            String hql = "FROM MemVo";
            Query<MemVo> query = session.createQuery(hql, MemVo.class);
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
            Query query = session.createQuery("SELECT COUNT(*) FROM MemVo WHERE memEmail = :email");
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
            Query query = session.createQuery("SELECT COUNT(*) FROM MemVo WHERE memPid = :pid");
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
            Query query = session.createQuery("SELECT COUNT(*) FROM MemVo WHERE memPh = :phone");
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

    @Override
    public MemVo selectByMemEmailAndPwd(String memEmail, String memPwd) {
        final String hql = "FROM MemVo WHERE memEmail = :memEmail AND memPwd = :memPwd ORDER BY memNo";
        return session
                .createQuery(hql, MemVo.class)
                .setParameter("memEmail", memEmail)
                .setParameter("memPwd", memPwd)
                .uniqueResult();
    }


    public void closeSession() {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }


}
