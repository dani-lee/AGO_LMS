package com.one.dto;

import java.util.Date;

public class ManagerVO extends MemberVO {

	private String managerId;
	private String managerPwd;

	public void setMember(MemberVO member)
	{
		this.setMemEmail(member.getMemEmail());
		this.setMemName(member.getMemName());
		this.setMemBir(member.getMemBir());
		this.setMemPhone(member.getMemPhone());
		this.setMemId(member.getMemId());
		this.setMemPwd(member.getMemPwd());
		this.setMemCredit(member.getMemCredit());
		this.setPositionId(member.getPositionId());
		this.setDpId(member.getDpId());
		this.setAuthorityId(member.getAuthorityId());
		this.setMemStatus(member.getMemStatus());
	}

	public String getManagerId() {
		return managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	@Override
	public String toString() {
		return "ManagerVO [managerId=" + managerId + ", managerPwd=" + managerPwd + "]";
	}

	
}
