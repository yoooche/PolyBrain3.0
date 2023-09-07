package feature.mem.dao;

import feature.mem.vo.MemberVo;

import java.util.List;

public interface MemberDaoImpl {
    public List<MemberVo> getAll();
    public MemberVo findByPrimaryKey(Integer memNo);
    public void delete(Integer memNo);
    public void update(MemberVo memNo);

    public List<MemberVo> GETEmailPwd();
}
