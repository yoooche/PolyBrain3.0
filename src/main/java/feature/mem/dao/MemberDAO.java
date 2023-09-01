package feature.mem.dao;
import feature.mem.vo.MemberVO;

import java.util.List;

public interface MemberDAO {

    // 創建新會員
    void createMember(MemberVO member);

    // 根據會員編號獲取會員
    MemberVO getMemberById(Integer memNo);

    // 更新會員資訊
    void updateMember(MemberVO member);

    // 刪除會員
    void deleteMember(Integer memNo);

    // 獲取所有會員
    List<MemberVO> getAllMembers();

}
