package web.forum.dao;

import web.forum.vo.ArtVo;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.print.attribute.standard.PrinterStateReason;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ArtJDBCDao implements ArtDaoImpl{

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/polybrain?serverTimezone=Asia/Taipei";
    String userid = "root";
    String passwd = "general0419";
    private static final String INSERT_STMT =
            "INSERT INTO article (MEM_NO,ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_TIME,ARTICLE_STATE,ITEM_CLASS_NO) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT ARTICLE_NO,MEM_NO,ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_TIME,ARTICLE_STATE,ITEM_CLASS_NO FROM article order by ARTICLE_NO";
    private static final String GET_ONE_STMT =
            "SELECT ARTICLE_NO,MEM_NO,ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_TIME,ARTICLE_STATE,ITEM_CLASS_NO FROM article where ARTICLE_NO = ?";
    private static final String DELETE =
            "DELETE FROM article where ARTICLE_NO = ?";
    private static final String UPDATE =
            "UPDATE article set MEM_NO=?, ARTICLE_TITLE=?, ARTICLE_CONTENT=?, ARTICLE_TIME=?, ARTICLE_STATE=?, ITEM_CLASS_NO=? where ARTICLE_NO = ?";

    @Override
    public void insert(ArtVo artvo) {
        Connection con =null;
        PreparedStatement pstmt =null;
        ArtVo artVo =new ArtVo();

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1,artvo.getMemNo());
            pstmt.setString(2, artvo.getArtTitle());
            pstmt.setString(3, artvo.getArtCon());
            pstmt.setDate(4, (Date) artvo.getArtTime());
            pstmt.setByte(5,artvo.getArtState());
            pstmt.setInt(6,artvo.getItemNo());

            pstmt.executeUpdate();

        }catch (SQLException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
        } finally {
            if(pstmt !=null){
                try {
                    pstmt.close();
                }catch (SQLException e){
                    e.printStackTrace(System.err);
                }
            }
            if(con !=null){
                try {
                    con.close();
                }catch (Exception e){
                    e.printStackTrace(System.err);
                }
            }
        }

    }

    @Override
    public void update(ArtVo artvo) {
        Connection con =null;
        PreparedStatement pstmt =null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url,userid,passwd);
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1,artvo.getMemNo());
            pstmt.setString(2,artvo.getArtTitle());
            pstmt.setString(3,artvo.getArtCon());
            pstmt.setDate(4, (Date) artvo.getArtTime());
            pstmt.setByte(5,artvo.getArtState());
            pstmt.setInt(6,artvo.getItemNo());
            pstmt.setInt(7,artvo.getArtNo());

            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
    } catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        }finally {
            if (pstmt != null){
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con !=null){
                try {
                    con.close();
                }catch (Exception e){
                    e.printStackTrace(System.err);
                }

            }
        }

    }

    @Override
    public void delete(Integer artNo) {

        Connection con =null;
        PreparedStatement pstmt =null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url,userid,passwd);
            pstmt =con.prepareStatement(DELETE);

            pstmt.setInt(1,artNo);

            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        }finally {
            if (pstmt != null){
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con !=null){
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public ArtVo findByPrimaryKey(Integer ARTICLE_NO) {
        ArtVo artVo =null;
        Connection con =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1,ARTICLE_NO);

            rs =pstmt.executeQuery();

            while (rs.next()) {
                artVo = new ArtVo();
                artVo.setArtNo(rs.getInt("ARTICLE_NO"));
                artVo.setMemNo(rs.getInt("MEM_NO"));
                artVo.setArtTitle(rs.getString("ARTICLE_TITLE"));
                artVo.setArtCon(rs.getString("ARTICLE_CONTENT"));
                artVo.setArtTime(rs.getDate("ARTICLE_TIME"));
                artVo.setArtState(rs.getByte("ARTICLE_STATE"));
                artVo.setItemNo(rs.getInt("ITEM_CLASS_NO"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
        } finally {
            if(rs !=null){
                try {
                    rs.close();
                }catch (SQLException e){
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt !=null){
                try {
                    pstmt.close();
                }catch (SQLException e){
                    e.printStackTrace(System.err);
                }
            }
            if (con !=null){
                try {
                    con.close();
                }catch (Exception e){
                    e.printStackTrace(System.err);
                }
            }
        }
        return artVo;
    }

    @Override
    public List<ArtVo> getAll() {
        List<ArtVo> list =new ArrayList<ArtVo>();
        ArtVo artVo = null ;

        Connection con =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs =pstmt.executeQuery();

            while (rs.next()) {
                artVo = new ArtVo();
                artVo.setArtNo(rs.getInt("ARTICLE_NO"));
                artVo.setMemNo(rs.getInt("MEM_NO"));
                artVo.setArtTitle(rs.getString("ARTICLE_TITLE"));
                artVo.setArtCon(rs.getString("ARTICLE_CONTENT"));
                artVo.setArtTime(rs.getDate("ARTICLE_TIME"));
                artVo.setArtState(rs.getByte("ARTICLE_STATE"));
                artVo.setItemNo(rs.getInt("ITEM_CLASS_NO"));
                list.add(artVo);
            }
        } catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
        } finally {
            if(rs !=null){
                try {
                    rs.close();
                }catch (SQLException e){
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt !=null){
                try {
                    pstmt.close();
                }catch (SQLException e){
                    e.printStackTrace(System.err);
                }
            }
            if (con !=null){
                try {
                    con.close();
                }catch (Exception e){
                    e.printStackTrace(System.err);
                }
            }
        }
        return list;
    }

    @Override
    public List<ArtVo> findByItemNo(Integer itemNo) {
        return null;
    }

    public static void main(String[] args) {
        ArtJDBCDao dao = new ArtJDBCDao();

        // 查詢
//        ArtVo artVo1 = dao.findByPrimaryKey(5);
//        System.out.print(artVo1.getArtNo()+ ",");
//        System.out.print(artVo1.getMemNo() + ",");
//        System.out.print(artVo1.getArtTitle() + ",");
//        System.out.print(artVo1.getArtCon() + ",");
//        System.out.print(artVo1.getArtTime() + ",");
//        System.out.print(artVo1.getArtState() + ",");
//        System.out.println(artVo1.getArtGame());
//        System.out.println("<<<--------------------->>>");
//
//        // 查詢
//        List<ArtVo> list =dao.getAll();
//        for (ArtVo aa :list){
//            System.out.print(aa.getArtNo()+ ",");
//            System.out.print(aa.getMemNo() + ",");
//            System.out.print(aa.getArtTitle() + ",");
//            System.out.print(aa.getArtCon() + ",");
//            System.out.print(aa.getArtTime() + ",");
//            System.out.print(aa.getArtState() + ",");
//            System.out.println(aa.getArtGame());
//            System.out.println("---------------------");
//
//        }
//        // 新增
//        ArtVo artVo2 = new ArtVo();
//        artVo2.setMemNo(2);
//        artVo2.setArtTitle("【問題】 有人玩過三國殺嗎?");
//        artVo2.setArtCon("之前看過有人玩過 感覺好玩~ ");
//        artVo2.setArtTime(java.sql.Date.valueOf("2023-02-26"));
//        artVo2.setArtState((byte) 1);
//        artVo2.setArtGame(0);
//        dao.insert(artVo2);
//
//        // 修改
//        ArtVo artVo3 = new ArtVo();
//        artVo3.setArtNo(2);
//        artVo3.setMemNo(17);
//        artVo3.setArtTitle("88888888888888888888");
//        artVo3.setArtCon("8888888888888");
//        artVo3.setArtTime(java.sql.Date.valueOf("2023-03-01"));
//        artVo3.setArtState((byte) 1);
//        artVo3.setArtGame(0);
//        dao.update(artVo3);

//        // 刪除
//        dao.delete(5);

    }
}
