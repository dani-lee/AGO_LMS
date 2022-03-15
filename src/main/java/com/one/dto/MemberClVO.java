package com.one.dto;

import java.util.Date;

import com.one.command.JsonCommand;

public class MemberClVO extends JsonCommand {
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
	private int memClNo;
	private int opcl;
	private int testCpl;
	private int studyCpl;
	private int progRate;
	private String memclState;
	private Date ctfDate;
	private Date studySdate;
	private Date studyEdate;
	private int midtestScore;
	private int fintestScore;
	
	private int clChap;
	private String clCode;
	private int progChap;

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

	public int getMemClNo() {
		return memClNo;
	}

	public void setMemClNo(int memClNo) {
		this.memClNo = memClNo;
	}

	public int getOpcl() {
		return opcl;
	}

	public void setOpcl(int opcl) {
		this.opcl = opcl;
	}

	public int getTestCpl() {
		return testCpl;
	}

	public void setTestCpl(int testCpl) {
		this.testCpl = testCpl;
	}

	public int getStudyCpl() {
		return studyCpl;
	}

	public void setStudyCpl(int studyCpl) {
		this.studyCpl = studyCpl;
	}

	public int getProgRate() {
		return progRate;
	}

	public void setProgRate(int progRate) {
		this.progRate = progRate;
	}

	public String getMemclState() {
		return memclState;
	}

	public void setMemclState(String memclState) {
		this.memclState = memclState;
	}

	public Date getCtfDate() {
		return ctfDate;
	}

	public void setCtfDate(Date ctfDate) {
		this.ctfDate = ctfDate;
	}

	public Date getStudySdate() {
		return studySdate;
	}

	public void setStudySdate(Date studySdate) {
		this.studySdate = studySdate;
	}

	public Date getStudyEdate() {
		return studyEdate;
	}

	public void setStudyEdate(Date studyEdate) {
		this.studyEdate = studyEdate;
	}

	public int getMidtestScore() {
		return midtestScore;
	}

	public void setMidtestScore(int midtestScore) {
		this.midtestScore = midtestScore;
	}

	public int getFintestScore() {
		return fintestScore;
	}

	public void setFintestScore(int fintestScore) {
		this.fintestScore = fintestScore;
	}

	public int getClChap() {
		return clChap;
	}

	public void setClChap(int clChap) {
		this.clChap = clChap;
	}
	public String getClCode() {
		return clCode;
	}

	public void setClCode(String clCode) {
		this.clCode = clCode;
	}

	public int getProgChap() {
		return progChap;
	}

	public void setProgChap(int progChap) {
		this.progChap = progChap;
	}
	

	@Override
	public String toString() {
		return "MemberClVO [memEmail=" + memEmail + ", memName=" + memName + ", memBir=" + memBir + ", memPhone="
				+ memPhone + ", memId=" + memId + ", memPwd=" + memPwd + ", memCredit=" + memCredit + ", positionId="
				+ positionId + ", dpId=" + dpId + ", authorityId=" + authorityId + ", memStatus=" + memStatus
				+ ", memClNo=" + memClNo + ", opcl=" + opcl + ", testCpl=" + testCpl + ", studyCpl=" + studyCpl
				+ ", progRate=" + progRate + ", memclState=" + memclState + ", ctfDate=" + ctfDate + ", studySdate="
				+ studySdate + ", studyEdate=" + studyEdate + ", midtestScore=" + midtestScore + ", fintestScore="
				+ fintestScore + "]";
	}

	public void changeId() {
		super.setId(this.opcl + "&&" + super.getId());
	}

}
