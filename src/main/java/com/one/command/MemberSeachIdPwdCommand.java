package com.one.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.one.dto.MemberVO;

public class MemberSeachIdPwdCommand {

	private String memName;
	private String memId;
	private String memPwd;
	private String[] memBir;
	private String[] memEmail;
	private String key;
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String[] getMemBir() {
		return memBir;
	}
	public void setMemBir(String[] memBir) {
		this.memBir = memBir;
	}
	public String[] getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String[] memEmail) {
		this.memEmail = memEmail;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
	
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public MemberVO toMemberVO() {
		MemberVO member = new MemberVO();
		
		String email = "";
		String bir = "";
		
		if(memEmail != null) {
			for(int i=0; i < memEmail.length; i++) {
				if(memEmail[1].startsWith("x")) {
					email = memEmail[0];
				}else {
					email = memEmail[0] + "@" + memEmail[1];
				}
			}
		}
		
		Date dateBir = null;
		if(memBir != null) {
			bir = memBir[0] + "-" + memBir[1] + "-" +memBir[2];
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				dateBir = sdf.parse(bir);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		member.setMemEmail(email);
		member.setMemBir(dateBir);
		member.setMemName(this.memName);
		member.setMemId(this.memId);
		member.setMemPwd(this.memPwd);
		return member;
	}
	

}
