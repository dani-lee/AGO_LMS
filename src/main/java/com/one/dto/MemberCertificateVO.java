package com.one.dto;

import java.util.Date;

public class MemberCertificateVO {
	
	private String clCode;
	private Date ctfDate;
	private String clName;
	private int clCreditTime;
	private String memEmail;
	private String memName;
	private Date memBir;
	private int countPrint;
	
	public String getClCode() {
		return clCode;
	}
	public void setClCode(String clCode) {
		this.clCode = clCode;
	}
	public Date getCtfDate() {
		return ctfDate;
	}
	public void setCtfDate(Date ctfDate) {
		this.ctfDate = ctfDate;
	}
	public String getClName() {
		return clName;
	}
	public void setClName(String clName) {
		this.clName = clName;
	}
	public int getClCreditTime() {
		return clCreditTime;
	}
	public void setClCreditTime(int clCreditTime) {
		this.clCreditTime = clCreditTime;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getMemBir() {
		return memBir;
	}
	public void setMemBir(Date memBir) {
		this.memBir = memBir;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getCountPrint() {
		return countPrint;
	}
	public void setCountPrint(int countPrint) {
		this.countPrint = countPrint;
	}
	
	
}
