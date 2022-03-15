package com.one.dto;

import java.util.Date;

import com.one.command.JsonCommand;

public class MemberVO extends JsonCommand {

	private String memEmail;
	private String memName;
	private Date memBir;
	private String memPhone;
	private String memId;
	private String memPwd;
	private int memCredit;
	private String positionId;
	private String dpId;
	private String authorityId;
	private String memStatus;
	private int memClassCnt;
	private String memclStatus;
	
	private int c101Cnt;	//수강중 강의 갯수
	private int c102Cnt;	//수강실패 강의 갯수
	private int c103Cnt;	//수강완료 강의 갯수
	
	// kr
	private String positionName;
	private String dpName;
	private String authorityName;
	private String memStatusName;

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getDpName() {
		return dpName;
	}

	public void setDpName(String dpName) {
		this.dpName = dpName;
	}

	public String getAuthorityName() {
		return authorityName;
	}

	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}

	public String getMemStatusName() {
		return memStatusName;
	}

	public void setMemStatusName(String memStatusName) {
		this.memStatusName = memStatusName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		super.setId(memEmail);
		this.memEmail = memEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		super.setText(memName);
		super.setIcon("fas fa-user");
		this.memName = memName;
	}

	public Date getMemBir() {
		return memBir;
	}

	public void setMemBir(Date memBir) {
		this.memBir = memBir;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public int getMemCredit() {
		return memCredit;
	}

	public void setMemCredit(int memCredit) {
		this.memCredit = memCredit;
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

	public int getMemClassCnt() {
		return memClassCnt;
	}

	public void setMemClassCnt(int memClassCnt) {
		this.memClassCnt = memClassCnt;
	}

	public String getMemclStatus() {
		return memclStatus;
	}

	public void setMemclStatus(String memclStatus) {
		this.memclStatus = memclStatus;
	}
	
	public int getC101Cnt() {
		return c101Cnt;
	}

	public void setC101Cnt(int c101Cnt) {
		this.c101Cnt = c101Cnt;
	}

	public int getC102Cnt() {
		return c102Cnt;
	}

	public void setC102Cnt(int c102Cnt) {
		this.c102Cnt = c102Cnt;
	}

	public int getC103Cnt() {
		return c103Cnt;
	}

	public void setC103Cnt(int c103Cnt) {
		this.c103Cnt = c103Cnt;
	}

	@Override
	public String toString() {
		return "MemberVO [memEmail=" + memEmail + ", memName=" + memName + ", memBir=" + memBir + ", memPhone=" + memPhone + ", memId=" + memId + ", memPwd=" + memPwd + ", memCredit=" + memCredit + ", positionId=" + positionId + ", dpId=" + dpId + ", authorityId=" + authorityId + ", memStatus=" + memStatus + ", memClassCnt=" + memClassCnt + "]";
	}

	public MemberVO getClone() {
		MemberVO mem = new MemberVO();
		mem.setMemEmail(this.memEmail);
		mem.setMemName(this.memName);
		mem.setMemBir(this.memBir);
		mem.setMemPhone(this.memPhone);
		mem.setMemId(this.memId);
		mem.setMemPwd(this.memPwd);
		mem.setMemCredit(this.memCredit);
		mem.setPositionId(this.positionId);
		mem.setDpId(this.dpId);
		mem.setAuthorityId(this.authorityId);
		mem.setMemStatus(this.memStatus);
		mem.setMemClassCnt(this.memClassCnt);

		return mem;
	}

}
