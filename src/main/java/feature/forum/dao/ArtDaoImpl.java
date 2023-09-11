package web.forum.dao;

import org.hibernate.sql.Update;
import web.forum.vo.ArtVo;

import java.util.*;

public interface ArtDaoImpl {
    public void insert(ArtVo artvo);
    public void update(ArtVo artvo);
    public void delete(Integer artNo);
    public  ArtVo findByPrimaryKey(Integer artNo);
    public List<ArtVo> getAll();
    public List<ArtVo> findByItemNo(Integer itemNo);

}