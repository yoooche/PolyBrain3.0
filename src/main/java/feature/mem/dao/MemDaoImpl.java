package feature.mem.dao;

import core.util.HibernateUtil;
import org.hibernate.Session;
import org.jetbrains.annotations.NotNull;
import feature.mem.vo.MemVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.PersistenceContext;
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
    public Integer update(MemVo memVo){
        try{
            session.merge(memVo);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }


    public MemVo selectById(Integer id) {
        return null;
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
    public MemVo selectByMemName(String memName){
        final String hql = "FROM member WHERE memName = :memName";
        return session.createQuery(hql, MemVo.class)
                .setParameter("memName", memName)
                .uniqueResult();
    }
    public MemVo selectForLogin(String memEmail, String memPwd){
        final String sql = "select * from MEMBER where MEM_EMAIL = :memEmail and MEM_PWD = :memPwd";

        return session
                .createNativeQuery(sql, MemVo.class)
                .setParameter("memEmail", memEmail)
                .setParameter("memPwd", memPwd)
                .uniqueResult();
    }
    public List<MemVo> selectByVio(MemVo memVo){
        final String sql = "select * from MEMBER where MEM_VIO = 3";
        return session
                .createNativeQuery(sql, MemVo.class)
                .getResultList();
    }

}
