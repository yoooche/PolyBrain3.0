package feature.mem.dao;


import feature.mem.vo.MemVo;


import java.util.List;

public interface MemDao {
    MemVo selectByMemName(String memName);
    void createMember(MemVo member);
    MemVo getMemberById(Integer memNo);
    void updateMember(MemVo member);
    void deleteMember(Integer memNo);
    List<MemVo> getAllMembers();
    boolean isEmailExists(String email);
    boolean isPidExists(String pid);
    boolean isPhoneExists(String phone);
    MemVo selectByMemEmailAndPwd(String memEmail, String memPwd);
    MemVo selectById(Integer memNo);

}
