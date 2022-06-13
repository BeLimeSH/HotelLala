package edu.kh.hotellala.member.contorller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.member.model.service.MemberService;

@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String inputEmail = req.getParameter("inputEmail"); //입력받은 이메일
		String subject = "[Commnity 프로젝트] 회원 가입 이메일 인증번호"; // 제목
		String fromEmail = "knbdh97822@gmail.com"; // 보내는 사람으로 표시될 이메일
		String fromUsername = "관리자"; // 보내는 사람 이름
		String toEmail = inputEmail; // 받는사람, 콤마(,)로 여러개 나열 가능
		
	      // 구글 이메일을 이용한 메일 보내기 (SMTP)
	      // 1. 구글 계정 생성(기존 이메일 사용해도됨)
	      // 2. 계정 -> 보안 설정 진행  
	      //  1) 2단계 인증 추가
	      //  2) 앱 비밀번호 생성(메일, 서버컴퓨터 OS) -> 저장해두기 (ksciphrjsjdbmmlp)
		
	      final String smtpEmail = "nambawon1@gmail.com"; // 이메일
	      final String password = "ksciphrjsjdbmmlp"; // 발급 받은 비밀번호


	      // 메일 옵션 설정
	      Properties props = new Properties();
	      
	      // 중요
	      props.put("mail.transport.protocol", "smtp");
	      props.put("mail.smtp.host", "smtp.gmail.com");
	      props.put("mail.smtp.port", "587"); //465, 587
	      props.put("mail.smtp.auth", "true");

	      // 추가 옵션
	      props.put("mail.smtp.quitwait", "false");
	      props.put("mail.smtp.socketFactory.port", "587");
	      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	      props.put("mail.smtp.socketFactory.fallback", "true");
	      props.put("mail.smtp.starttls.enable", "true");
		
	      try {
	         // 메일 세션 생성
	         Session session = Session.getDefaultInstance(props);

	         // 메일 송/수신 옵션 설정(1명 보내기)
	         Message message = new MimeMessage(session);
	      
	         message.setFrom(new InternetAddress(fromEmail, fromUsername));    // 송신자(보내는 사람) 지정
	         
	         message.addRecipient(RecipientType.TO, new InternetAddress(toEmail)); // 수신자(받는사람) 지정
	         
	         message.setSubject(subject); // 이메일 제목 지정
	         
	         
	         
	         // 메일 콘텐츠 설정
	         Multipart mParts = new MimeMultipart();
	         MimeBodyPart mTextPart = new MimeBodyPart();

	         
	         //인증번호 6자리 생성코드(영어 대/소문 +숫자)
	         String cNumber = "";
	         for(int i=0 ; i< 6 ; i++) {
	            
	            int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1:영어
	            
	            if(sel1 == 0) {
	               
	               int num = (int)(Math.random() * 10); // 0~9
	               cNumber += num;
	               
	            }else {
	               
	               char ch = (char)(Math.random() * 26 + 65); // A~Z
	               
	               int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
	               
	               if(sel2 == 0) {
	                  ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
	               }
	               
	               cNumber += ch;
	            }
	            
	         }
	         // 메일에 출력할 텍스트
	         StringBuffer sb = new StringBuffer(); // 가변성 문자열 저장 객체
	         sb.append("<h3>[Community 프로젝트] 회원 가입 인증 번호입니다.</h3>\n");
	         sb.append("<h3>인증 번호 : <span style='color:red'>"+cNumber+"</span></h3>\n");
	         sb.append("<img src='data:image/jpeg;base64,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'>");
	         

	         String mailContent = sb.toString(); // 문자열로 반환
	         
	         // 메일 콘텐츠 - 내용 , 메일인코딩, "html" 추가 시 HTML 태그가 해석됨
	         mTextPart.setText(mailContent, "UTF-8", "html");
	         mParts.addBodyPart(mTextPart);

	         
	         // 메일 콘텐츠 지정
	         message.setContent(mParts);

	         
	         
	         // MIME 타입 설정 (이메일 내용이 깨질 때 사용)
	         /*MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	         MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	         MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	         MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	         MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	         MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	         CommandMap.setDefaultCommandMap(MailcapCmdMap);*/

	         // 메일 발송
	         Transport t = session.getTransport("smtp");
	         t.connect(smtpEmail, password);
	         t.sendMessage(message, message.getAllRecipients());
	         t.close();

	         //인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간 -> DB 삽입 
	         int result = new MemberService().insertCertification(inputEmail, cNumber);
	         resp.getWriter().print(result);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	         // ajax error 속성 활용을 위한 500에러를 응답으로 전달.
	         resp.setStatus(500);
	         resp.getWriter().print(e.getMessage());
	      }
	}
}
