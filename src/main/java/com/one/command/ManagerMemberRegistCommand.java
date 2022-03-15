package com.one.command;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.one.dto.MemberVO;

public class ManagerMemberRegistCommand {
	
	private String memEmail;
	private String memName;
	private String memBir;
	private String[] memPhone;
	private String positionId;
	private String dpId;
	private String authorityId;
	private String memStatus;
	
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String[] getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String[] memPhone) {
		this.memPhone = memPhone;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getDpId() {
		return dpId;
	}
	public void setDpId(String dpId) {
		this.dpId = dpId;
	}
	public String getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	
	public MemberVO toMemberVO() throws Exception {
		String phone = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date bir = sdf.parse(this.memBir);
		
		for(String data : this.memPhone) {
			phone += data;
		}
		phone = phone.substring(0, 3) + "-" + phone.substring(3,7) + "-" + phone.substring(7);
	
		
		MemberVO member = new MemberVO();
		member.setMemEmail(this.memEmail);
		member.setMemName(this.memName);
		member.setMemBir(bir);
		member.setMemPhone(phone);
		member.setPositionId(this.positionId);
		member.setDpId(this.dpId);
		member.setAuthorityId(this.authorityId);
		member.setMemStatus(this.memStatus);
		
		return member;
	}
	
}
