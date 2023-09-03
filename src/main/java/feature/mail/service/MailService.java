package feature.mail.service;


import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import java.io.File;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailService {

    // 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
    public void sendMail(String to, String subject, String messageText) {

        try {
            JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
            senderImpl.setHost("smtp.gmail.com");
            senderImpl.setPort(587);

            senderImpl.setUsername("ixlogic.wu@gmail.com");
            senderImpl.setPassword("ddjomltcnypgcstn");

            Properties props = senderImpl.getJavaMailProperties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            // 建立郵件訊息
            MimeMessage mailMessage = senderImpl.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage, true, "UTF-8");

            // 設定收件人、寄件人、主題與內文
            messageHelper.setTo(to);
            messageHelper.setFrom("noreply@baeldung.com");
            messageHelper.setSubject(subject);
            messageHelper.setText(messageText, true);

            FileSystemResource img = new FileSystemResource(
                    new File("C:\\Users\\T14 Gen 3\\Pictures\\Screenshots\\JennyBluePoly.png")); //這裡先寫死
            messageHelper.addInline("1", img);

            // 傳送郵件
            senderImpl.send(mailMessage);

            System.out.println("傳送成功");

        } catch (MessagingException e) {
            System.out.println("傳送失敗!");
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {

        //這是範例喔~~ messageText改成你要的html標籤~~ email頁面就會吃到標籤囉~~
        String to = "johnnesteacena@gmail.com";

        String subject = "密碼通知";

        String ch_name = "peter1";
        String passRandom = "111";
        String messageText = "<!DOCTYPE html>" + "<html lang=\"zh-Hant\">" + "<head>" + "<meta charset=\"UTF-8\">"
                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                + "</head>" +

                "<body style=\"color: #F0F8FF; text-align: center; \">"
                + "<div style=\"background-color: #212121; border-radius: 5px;\" >"
                + "<dir style=\"text-align: center;\">"
                + "<img class=\"mt-3 \" src=\"cid:1 \" height=\"50%\" width=\"50%\">" + "</dir>"

                + " <h2 style=\"text-align: center;\"><strong>PolyBrain 桌桌</strong> 感謝你的訂單</h2><br>"
                + " <div style=\"display: inline-block; text-align: left;\">" + "訂單狀態為: <span style=\"font-weight: bold\">處理中</span> <br>\r\n"
                + "            付款狀態為: <span style=\"font-weight: bold\">已付款 </span><br>\r\n"
                + "            送貨狀態為:<span style=\"font-weight: bold\"> 備貨中 </span> <br>\r\n"
                + "            有關訂單的查詢或要聯絡 <span style=\"font-weight: bold\">PolyBrain</span><br>\r\n"
                + "            請登入以下連結。<br>"
                + "<button style=\"background-color: #d2b48c; border-radius:5px; width: 85%; height: 40px;\">\r\n"
                + "                <a href=http://localhost:8080/PolyBrain\r\n"
                + "                    style=\"text-decoration: none ;color: #000000\">訂單連結</a></button><br>\r\n"
                + "            親愛的貴賓:<strong> 123</strong> <br>\r\n"
                + "            感謝您在<strong>PolyBrain桌桌訂購</strong><br>\r\n" + "            以下是訂單資訊 <br>\r\n"
                + "            訂單號碼:<strong> 123 </strong><br>\r\n" + "            結帳狀態: <strong>已付款 </strong><br>\r\n"
                + "            訂單總金額:<strong> 123 </strong><br>\r\n" + "        </div>\r\n" + "    </div>" + "</body>"
                + "</html>";

        MailService mailService = new MailService();
        mailService.sendMail(to, subject, messageText);
    }

}

