package feature.mem.service;

import feature.mem.dao.MemberDAO;
import feature.mem.dao.MemberDAOImpl;
import feature.mem.vo.MemberVO;

import java.util.List;

public class loginService {

    private MemberDAO memberDAO; // 注入MemberDAO的實例

    public loginService(){
        memberDAO = new MemberDAOImpl();
    }

    public loginService(MemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }

    public boolean isValidUser(String email, String password) {
        // 查詢所有會員
        List<MemberVO> members = memberDAO.getAllMembers();

        // 遍歷所有會員，檢查是否有匹配的電子郵件和密碼
        for (MemberVO member : members) {
            if (email.equals(member.getMemEmail()) && password.equals(member.getMemPwd())) {
                return true; // 有效的用戶
            }
        }

        return false; // 無效的用戶
    }
}
