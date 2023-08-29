package web.forum.dao;

import web.forum.vo.ArtVo;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.sql.Date;
import java.util.*;


public class ArtDao implements web.forum.dao.ArtDaoImpl {

    private  static DataSource ds =null;
    static {
        try {
            Context ctx =new InitialContext();
            ds =(DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");

        }catch (NamingException e){
            e.printStackTrace();
        }
    }

    private static final String INSERT_STMT =
            "INSERT INTO article (MEM_NO,ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_TIME,ARTICLE_STATE,ARTICLE_GAME) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT ARTICLE_NO,MEM_NO,ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_TIME,ARTICLE_STATE,ARTICLE_GAME FROM article order by ARTICLE_NO";
    private static final String GET_ONE_STMT =
            "SELECT ARTICLE_NO,MEM_NO,ARTICLE_TITLE,ARTICLE_CONTENT,ARTICLE_TIME,ARTICLE_STATE,ARTICLE_GAME FROM article where ARTICLE_NO = ?";
    private static final String DELETE =
            "DELETE FROM article where ARTICLE_NO = ?";
    private static final String UPDATE =
            "UPDATE article set MEM_NO=?, ARTICLE_TITLE=?, ARTICLE_CONTENT=?, ARTICLE_TIME=?, ARTICLE_STATE=?, ARTICLE_GAME=? where ARTICLE_NO = ?";

    @Override
    public void insert(ArtVo artVo) {
        Connection con =null;
        PreparedStatement pstmt =null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1,artVo.getMemNo());
            pstmt.setString(2, artVo.getArtTitle());
            pstmt.setString(3, artVo.getArtCon());
            pstmt.setDate(4, (Date) artVo.getArtTime());
            pstmt.setByte(5,artVo.getArtState());
            pstmt.setInt(6,artVo.getArtGame());

            pstmt.executeUpdate();

        }catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        }finally {
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
            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1,artvo.getMemNo());
            pstmt.setString(2,artvo.getArtTitle());
            pstmt.setString(3,artvo.getArtCon());
            pstmt.setDate(4, (Date) artvo.getArtTime());
            pstmt.setByte(5,artvo.getArtState());
            pstmt.setInt(6,artvo.getArtGame());
            pstmt.setInt(7,artvo.getArtNo());

            pstmt.executeUpdate();

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

            con = ds.getConnection();
            pstmt =con.prepareStatement(DELETE);

            pstmt.setInt(1,artNo);

            pstmt.executeUpdate();

        }  catch (SQLException e) {
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
    public ArtVo findByPrimaryKey(Integer artNo) {
        ArtVo artVo =null;
        Connection con =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;

        try {
            con =ds.getConnection();
            pstmt =con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1,artNo);

            rs =pstmt.executeQuery();

            while (rs.next()) {
                artVo = new ArtVo();
                artVo.setArtNo(rs.getInt("ARTICLE_NO"));
                artVo.setMemNo(rs.getInt("MEM_NO"));
                artVo.setArtTitle(rs.getString("ARTICLE_TITLE"));
                artVo.setArtCon(rs.getString("ARTICLE_CONTENT"));
                artVo.setArtTime(rs.getDate("ARTICLE_TIME"));
                artVo.setArtState(rs.getByte("ARTICLE_STATE"));
                artVo.setArtGame(rs.getInt("ARTICLE_GAME"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        }finally {
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
            con =ds.getConnection();
            pstmt =con.prepareStatement(GET_ALL_STMT);
            rs =pstmt.executeQuery();

            while (rs.next()) {
                artVo = new ArtVo();
                artVo.setArtNo(rs.getInt("ARTICLE_NO"));
                artVo.setMemNo(rs.getInt("MEM_NO"));
                artVo.setArtTitle(rs.getString("ARTICLE_TITLE"));
                artVo.setArtCon(rs.getString("ARTICLE_CONTENT"));
                artVo.setArtTime(rs.getDate("ARTICLE_TIME"));
                artVo.setArtState(rs.getByte("ARTICLE_STATE"));
                artVo.setArtGame(rs.getInt("ARTICLE_GAME"));
                list.add(artVo);
            }
        } catch (SQLException e) {
            throw new RuntimeException("A database error occurred. "
                    + e.getMessage());
        }finally {
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
}
