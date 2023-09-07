package feature.mem.service;

import feature.mem.dao.MemDao;
import feature.mem.dao.MemberDao;
import feature.mem.dao.MemberDaoImpl;
import feature.mem.vo.MemVo;
import feature.mem.vo.MemberVo;

import java.util.List;

public class loginService {

    private MemberDaoImpl dao;; // 注入MemberDAO的實例

    public loginService(){dao = new MemberDao();}


    public boolean isValidUser(String email, String password) {
        // 查詢所有會員
        List<MemberVo> members = dao.GETEmailPwd();

        // 遍歷所有會員，檢查是否有匹配的電子郵件和密碼
        for (MemberVo member : members) {
            if (email.equals(member.getMemEmail()) && password.equals(member.getMemPwd())) {
                return true; // 有效的用戶
            }
        }

        return false; // 無效的用戶
    }


}
