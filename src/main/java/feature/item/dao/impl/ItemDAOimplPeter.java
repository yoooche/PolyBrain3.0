package feature.item.dao.impl;

import core.coreDao.CoreDao;
import feature.item.vo.itemVOPeter;
import feature.order.vo.ItemOrderVO;
import org.hibernate.Session;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ItemDAOimplPeter implements CoreDao {
    private static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/project_3");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    public Object insert(Object o) {
        return null;
    }

    public Integer deleteByItemNo(Integer memNo ,Integer itemNo ) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement("delete from item_trace where mem_no = ? AND item_no =?");
            pstmt.setInt(1, memNo);
            pstmt.setInt(2, itemNo);

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return 1;
    }

    public Object update(Object o) {
        return null;
    }

    public Object selectById(Object id) {
        return null;
    }

    @Override
    public List<itemVOPeter> selectAll() {
        final String hql = "FROM itemVOPeter ORDER BY ITEM_NO";
        return getSession().createQuery(hql, itemVOPeter.class).getResultList();
    }
    public List<itemVOPeter> selectAll1(Integer itemNo) {

        final String hql = "FROM itemVOPeter WHERE ITEM_NO ="+ itemNo ;
        return getSession().createQuery(hql, itemVOPeter.class).getResultList();
    }


    public static void main(String[] args) {
        ItemDAOimplPeter iopl = new ItemDAOimplPeter();
        List<itemVOPeter> itemVOS = iopl.selectAll1(101);
        for(itemVOPeter list :itemVOS){
            System.out.println(list.getItemName());
        }
    }
}
