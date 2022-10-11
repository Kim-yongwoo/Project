package yw.basket.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

@Slf4j
public class MailUtil {

    public static int sendAuthEmail(String email, String title, String body){

        log.info("메일 전송 시작");


        HtmlEmail email1 = new HtmlEmail();
        email1.setHostName("smtp.naver.com");
        email1.setSmtpPort(465);
        String password = "";
        email1.setAuthentication("redgum0319@naver.com", password);

        email1.setSSLOnConnect(true);
        email1.setStartTLSEnabled(true);

        int res = 0;

        try{
            email1.setFrom("redgum0319@naver.com", "Basket Life", "utf-8");
            email1.addTo(email, "이름", "utf-8");
            email1.setSubject(title);

            StringBuffer msg = new StringBuffer();

            msg.append("Basket Life temporary Password : " + body);


            email1.setHtmlMsg(msg.toString());
            email1.send();
            res = 1;
        } catch (EmailException e) {
            e.printStackTrace();
        }

        log.info("메일 전송 완료");
        return  res;
    }
}
