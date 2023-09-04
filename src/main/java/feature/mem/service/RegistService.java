package feature.mem.service;

import feature.mem.dao.MemberDAO;
import feature.mem.dao.MemberDAOImpl;
import feature.mem.vo.MemberVO;

import javax.servlet.ServletException;

public class RegistService {

    private MemberDAO memberDAO;

    public RegistService() {
        // 在构造函数中初始化MemberDAO
        memberDAO = new MemberDAOImpl();
    }

    public String checkDuplicate(String pid, String email, String phone) {
        // 检查是否有重复的信箱、身份证或电话号码
        if (memberDAO.isEmailExists(email) || memberDAO.isPidExists(pid) || memberDAO.isPhoneExists(phone)) {
            return "duplicate"; // 存在重复数据
        } else {
            return "success"; // 没有重复数据
        }
    }

    public String registerMember(String name, String pid, int gender, String email, String password, String phone, String address, String birth) throws ServletException {
        // 先检查是否存在重复的电子邮件、身份证或电话号码
        String duplicateCheckResult = checkDuplicate(pid, email, phone);

        if ("duplicate".equals(duplicateCheckResult)) {
            return "duplicate"; // 返回错误标识
        }

        // 创建一个新的 MemberVO 对象
        MemberVO member = new MemberVO();
        member.setMemName(name);
        member.setMemPid(pid);
        member.setMemGender((byte) gender);
        member.setMemEmail(email);
        member.setMemPwd(password);
        member.setMemPh(phone);
        member.setMemAddress(address);
        // 注意：memAuth和memVio在数据库中默认为0，不需要手动设置
        member.setMemBirth(java.sql.Date.valueOf(birth)); // 将生日字符串转换为日期

        // 调用DAO的createMember方法将会员数据存入数据库
        try {
            memberDAO.createMember(member);
            return "success"; // 注册成功
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("注册失败，请稍后重试", e); // 注册失败
        }
    }
}
