package feature.cart.dao.impl;

import feature.cart.dao.CartTraceDAO;
import feature.cart.vo.CartTraceVO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartTraceDAOimpl implements CartTraceDAO {
    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/project_3");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<CartTraceVO> selectCartByMemNo(Integer memNo) {


//        final String hql = "From CartTraceVO where mem_no ="+ memNo ;
//        Session session = getSession();
//
//        //////////////////
//        Query<CartTraceVO> query = session.createQuery(hql,CartTraceVO.class);
//        //////////////////
//        List<CartTraceVO> returnList = query.getResultList();
//        //
//        System.out.println(returnList);
//
//        return returnList;

//        List<CartTraceVO> ctList = new ArrayList<CartTraceVO>();
//        CartTraceVO cartTraceVO = null;
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs =null;
//        final String sql = "Select * From CartTraceVO where mem_no = ?" ;
//        try{
//            con = ds.getConnection();
//            pstmt = con.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//
//            while(rs.next()){
//                cartTraceVO = new CartTraceVO();
//                cartTraceVO.setMemNo(rs.getInt("MEM_NO"));
//                cartTraceVO.setItemNo(rs.getInt("ITEM_NO"));
//                cartTraceVO.setQuantity(rs.getInt("Quantity"));
//                ctList.add(cartTraceVO);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return null;

    }

    @Override
    public CartTraceVO selectByMemberNumber(Integer memNo) {
        return null;
    }

    @Override
    public List<CartTraceVO> selectAll(Integer memNo) {
        List<CartTraceVO> list = new ArrayList<CartTraceVO>();
        CartTraceVO cartTraceVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        final String sql = "Select * From item_trace where mem_no = ?";
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,memNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                cartTraceVO = new CartTraceVO();
                cartTraceVO.setMemNo(rs.getInt("MEM_NO"));
                cartTraceVO.setItemNo(rs.getInt("ITEM_NO"));
                cartTraceVO.setQuantity(rs.getInt("Quantity"));
                list.add(cartTraceVO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public Integer insert(CartTraceVO pojo) {
        return 0;
    }

    @Override
    public Integer deleteById(Integer id) {
        return 0;
    }

    @Override
    public Integer update(CartTraceVO cartTraceVO) {
        return null;
    }

    @Override
    public CartTraceVO selectById(Integer id) {
        return null;
    }

    @Override
    public List<CartTraceVO> selectAll() {
        return null;
    }


}
