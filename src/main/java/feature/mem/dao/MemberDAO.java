package feature.mem.dao;

import feature.mem.vo.MemberVo;

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

public class MemberDao implements MemberDaoImpl{

    private static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    private static final String GET_ALL_MEM =  //查詢全部會員資料(不包含照片、密碼、性別、黑名單)
            "SELECT MEM_NO,MEM_NAME,MEM_PID,MEM_EMAIL,MEM_PH,MEM_ADDRS,MEM_BIRTH,MEM_AUTH FROM member order by MEM_NO";
    private static final String GET_ONE_MEM =  //查詢全部會員資料(不包含照片、密碼、性別、黑名單)
            "SELECT MEM_NO,MEM_NAME,MEM_PID,MEM_EMAIL,MEM_PH,MEM_ADDRS,MEM_BIRTH,MEM_AUTH FROM member where MEM_NO = ?";
    private static final String DELETE =         //透過編號刪除
            "DELETE FROM member where MEM_NO = ?";
    private static final String UPDATE =         //透過編號更新資料
            "UPDATE member set MEM_NAME=?, MEM_PID=?, MEM_GENDER=?, MEM_PIC=?, MEM_EMAIL=?, MEM_PWD=?, MEM_PH=?, MEM_ADDRS=?, MEM_BIRTH=?, MEM_AUTH=?, MEM_VIO=? where MEM_NO = ?";

    private static final String GET_Email_PWD =
            "SELECT MEM_EMAIL,MEM_PWD FROM member";



    @Override
    public List<MemberVo> getAll() {
        List<MemberVo> list = new ArrayList<MemberVo>();
        MemberVo memberVo = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_MEM);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // empVO 也稱為 Domain objects
                memberVo = new MemberVo();
                memberVo.setMemNo(rs.getInt("MEM_NO"));
                memberVo.setMemName(rs.getString("MEM_NAME"));
                memberVo.setMemPid(rs.getString("MEM_PID"));
                memberVo.setMemEmail(rs.getString("MEM_EMAIL"));
                memberVo.setMemPh(rs.getString("MEM_PH"));
                memberVo.setMemAddress(rs.getString("MEM_ADDRS"));
                memberVo.setMemBirth(rs.getDate("MEM_BIRTH"));
                memberVo.setMemAuth(rs.getByte("MEM_AUTH"));
                list.add(memberVo); // Store the row in the list
            }

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
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
        System.out.println("------------------------------------------------");
        System.out.println(list.size());
        return list;
    }
    @Override
    public MemberVo findByPrimaryKey(Integer memNo) {

        MemberVo memberVo = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_MEM);
            pstmt.setInt(1, memNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                memberVo = new MemberVo();
                memberVo.setMemNo(rs.getInt("MEM_NO"));
                memberVo.setMemName(rs.getString("MEM_NAME"));
                memberVo.setMemPid(rs.getString("MEM_PID"));
                memberVo.setMemEmail(rs.getString("MEM_EMAIL"));
                memberVo.setMemPh(rs.getString("MEM_PH"));
                memberVo.setMemAddress(rs.getString("MEM_ADDRS"));
                memberVo.setMemBirth(rs.getDate("MEM_BIRTH"));
                memberVo.setMemAuth(rs.getByte("MEM_AUTH"));
            }

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
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
        return memberVo;
    }

    @Override
    public void delete(Integer memNo) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, memNo);

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

    }

    @Override
    public void update(MemberVo memberVo) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, memberVo.getMemName());
            pstmt.setString(2, memberVo.getMemPid());
            pstmt.setString(5, memberVo.getMemEmail());
            pstmt.setString(7, memberVo.getMemPh());
            pstmt.setString(8, memberVo.getMemAddress());
            pstmt.setDate(9, memberVo.getMemBirth());
            pstmt.setInt(10, memberVo.getMemAuth());

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

    }

    @Override
    public List<MemberVo> GETEmailPwd(){
        List<MemberVo> list = new ArrayList<MemberVo>();
        MemberVo memberVo = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_Email_PWD);
            rs = pstmt.executeQuery();


            while (rs.next()) {
                memberVo = new MemberVo();
                memberVo.setMemEmail(rs.getString("MEM_EMAIL"));
                memberVo.setMemPwd(rs.getString("MEM_PWD"));
                list.add(memberVo);
            }
        }catch (SQLException e) {
            // 處理數據庫錯誤
            e.printStackTrace();
        } finally {
            // 關閉資源，釋放連接
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }











}
