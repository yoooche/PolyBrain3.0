package feature.mem.dao;

import feature.mem.vo.MemVo;

import java.util.List;

public interface MemDao {
    boolean updateById(MemVo newMemVo);
    MemVo selectByMemName(String memName);
    MemVo selectForLogin(String memEmail, String memPwd);
    List<MemVo> selectByVio(MemVo memVo);
}
