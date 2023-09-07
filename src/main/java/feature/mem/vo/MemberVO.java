package feature.mem.vo;

import lombok.*;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;


//@Entity(name = "member")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MemberVo implements Serializable {
    private Integer memNo;
    private String memName;
    private String memPid;
    private Byte memGender;
    private byte[] memPic;
    private String memEmail;
    private String memPwd;
    private String memPh;
    private String memAddress;
    private Date memBirth;
    private Byte memAuth;
    private Byte memVio;

    @Override
    public String toString() {
        return "MemVo{" +
                "memNo=" + memNo +
                ", memName='" + memName + '\'' +
                ", memPid='" + memPid + '\'' +
                ", memGender=" + memGender +
                ", memPic=" + Arrays.toString(memPic) +
                ", memEmail='" + memEmail + '\'' +
                ", memPwd='" + memPwd + '\'' +
                ", memPh='" + memPh + '\'' +
                ", memAddress='" + memAddress + '\'' +
                ", memBirth=" + memBirth +
                ", memAuth=" + memAuth +
                ", memVio=" + memVio +
                '}';
    }
}
