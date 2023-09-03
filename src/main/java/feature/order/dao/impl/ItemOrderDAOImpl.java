package feature.order.dao.impl;

import feature.order.vo.ItemOrderDetailVO;
import org.hibernate.Session;
import feature.order.dao.ItemOrderDAO;
import feature.order.vo.ItemOrderVO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.util.List;

public class ItemOrderDAOImpl implements ItemOrderDAO {
    private static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Integer insert(ItemOrderVO itemOrderVO) {
        getSession().persist(itemOrderVO);
        return itemOrderVO.getOrderNo() ;
    }

    public Integer deleteById(Integer orderNo) {
        Session session = getSession();
        ItemOrderVO pojo = session.get(ItemOrderVO.class, orderNo);
        session.remove(pojo);
        return 1;
    }

    public Integer update(ItemOrderVO itemOrderVO) {
        return null;
    }

    public ItemOrderVO selectById(Integer orderNo) {
        return getSession().get(ItemOrderVO.class, orderNo );
    }

    @Override
    public List<ItemOrderVO> selectAll() {
        final String hql = "FROM ItemOrderVO ORDER BY ORDER_NO";
        return getSession().createQuery(hql, ItemOrderVO.class).getResultList() ;
    }

    @Override
    public ItemOrderVO selectByOrderNumber(Integer orderNo) {
        return null;
    }

    public List<ItemOrderVO> selectByMemberNumber(Integer memNo) {
        final  String hql = "FROM ItemOrderVO WHERE MEM_NO ="+ memNo +"ORDER BY MEM_NO";
        return getSession().createQuery(hql, ItemOrderVO.class ).getResultList();
    }

    public ItemOrderVO updateAnOrder(ItemOrderVO itemordervo){
        Session session = getSession();
        session.update(itemordervo);
        return itemordervo;
    }

    public void insertAnDetail(ItemOrderDetailVO itemOrderDetailVO){
        getSession().persist(itemOrderDetailVO);
        System.out.println("新增訂單明細成功");
    }




}
