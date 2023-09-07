package feature.mem.dao;


import feature.mem.vo.MemVo;


import java.util.List;

public interface MemDao {

    MemVo selectByMemName(String memName);

    // 創建新會員
    void createMember(MemVo member);

    // 根據會員編號獲取會員
    MemVo getMemberById(Integer memNo);

    // 更新會員資訊
    void updateMember(MemVo member);

    // 刪除會員
    void deleteMember(Integer memNo);

    // 獲取所有會員
    List<MemVo> getAllMembers();


    // 检查是否存在具有相同电子邮件的会员
    boolean isEmailExists(String email);

    // 检查是否存在具有相同电子邮件的会员
    boolean isPidExists(String pid);

    // 检查是否存在具有相同电子邮件的会员
    boolean isPhoneExists(String phone);


}
