package feature.mem.service;

import feature.mem.dao.MemDaoImpl;
import feature.mem.vo.MemVo;

import java.util.List;

public class loginService {

    private MemDaoImpl memDao; // 注入MemberDAO的實例

    public loginService(){
        memDao = new MemDaoImpl();
    }

    public loginService(MemDaoImpl memDao) {
        this.memDao = memDao;
    }

    public boolean isValidUser(String email, String password) {
        // 查詢所有會員
        List<MemVo> members = memDao.getAllMembers();

        // 遍歷所有會員，檢查是否有匹配的電子郵件和密碼
        for (MemVo member : members) {
            if (email.equals(member.getMemEmail()) && password.equals(member.getMemPwd())) {
                return true; // 有效的用戶
            }
        }

        return false; // 無效的用戶
    }
}
