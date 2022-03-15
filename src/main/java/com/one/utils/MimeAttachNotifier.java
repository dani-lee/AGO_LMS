package com.one.utils;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MimeAttachNotifier {

	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String email) throws Exception{
		// 메시지 생성
		MimeMessage message = mailSender.createMimeMessage();
		
		// 메시지 작성 헬퍼.
		MimeMessageHelper messagehelper = new MimeMessageHelper(message, true, "utf-8");
		
		// 받는 사람
		messagehelper.setTo(new InternetAddress(email));
		
		// 보내는 사람
		messagehelper.setFrom("jerrycock88@gmail.com", "AGO");
		
		//제목
		messagehelper.setSubject("운영자 계정 안내");
		
		//내용
		messagehelper.setText("운영자 계정 비밀번호는 [qweqwe]입니다.");
		
		//메일 보내기
		mailSender.send(message);
		
	}
	
	//사용자용 
	public void sendMail(String email, String subject, String text) throws Exception{
		// 메시지 생성
		MimeMessage message = mailSender.createMimeMessage();
		
		// 메시지 작성 헬퍼.
		MimeMessageHelper messagehelper = new MimeMessageHelper(message, true, "utf-8");
		
		// 받는 사람
		messagehelper.setTo(new InternetAddress(email));
		
		// 보내는 사람
		messagehelper.setFrom("jerrycock88@gmail.com", "AGO");
		
		//제목
		messagehelper.setSubject(subject);
		
		//내용
		messagehelper.setText(text, true);
		
		//메일 보내기
		mailSender.send(message);
		
	}
}
