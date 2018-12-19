package com.sb.mall.member.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

//import com.bitcamp.memberboard.member.model.Member;

public class MemberLoginMailService {
   @Autowired
//   private MailSender mailSender;//실질적으로 메일을 보내주는 역할
   private JavaMailSender mailSender;//HTML형식으로 메일을 보내주기 위해 JavaMailSender로 선언
   
	@Autowired
	private AES256Util aes256;
   /*
    * public void sendMail(Member member) { SimpleMailMessage message = new
    * SimpleMailMessage(); message.setSubject("[Simple] 회원 가입을 축하합니다.");
    * message.setFrom("isincorp@gmail.com");//보내는사람 메일
    * message.setText("회원 가입을 환영합니다."); message.setTo(member.getMemberid()); try {
    * mailSender.send(message); } catch (MailException ex) { ex.printStackTrace();
    * } }
    */

   /*Mail 보내기*/
   public void sendMail(String memberemail,String resultpw) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

      // Context of mail(Mailaddress)
//      System.out.println("Sending Email...<sendMail>");
//      System.out.println("수신자 : "+memberemail);
      
      SimpleMailMessage message = new SimpleMailMessage();
      
      String decryptionPW = aes256.decrypt(resultpw);
      
      message.setSubject("[Simple] 비밀번호안내");
      message.setFrom("isincorp@gmail.com");
      message.setText("회원님의 비밀번호는 :" + decryptionPW + " 입니다.");
      message.setTo(memberemail);

      try {

         // mailSender가 메일 발송처리
         mailSender.send(message);

      } catch (MailException ex) {

         ex.printStackTrace();
      }
      System.out.println("end");

   }

   /*HTML형식 Mail 보내기*/
   public void mailSendHtml(String email,String pw) {

//      System.out.println("Sending Email...<mailSendHtml>");
//      System.out.println("수신자 : "+email);
      MimeMessage message = mailSender.createMimeMessage();

      try {
         message.setSubject("[SB] 비밀번호 찾기 안내", "utf-8");
         String htmlStr = 
        		 "<B>안녕하세요</B> 고객님 <br> " + 
        		 "고객님의 임시 비밀번호입니다 <br>"+ 
        				 "<h1>임시비밀번호:"+pw+"</h1>"+
        		 "<a href=\"http://localhost/mall/member/login\">사이트로 이동하시려면 클릭하세요</a>";

         message.setText(htmlStr, "utf-8", "html");

         message.addRecipient(RecipientType.TO, new InternetAddress(email));
         
         mailSender.send(message);
      } catch (MessagingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      System.out.println("end");
   }

}