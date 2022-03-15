package com.one.dto;

import java.util.Date;

public class CertificateListVO {
	private String clCode;
	private int opcl;
	private String clName;
	private Date ctfDate;
	
	public int getOpcl() {
		return opcl;
	}
	public void setOpcl(int opcl) {
		this.opcl = opcl;
	}
	public String getClName() {
		return clName;
	}
	public void setClName(String clName) {
		this.clName = clName;
	}
	public Date getCtfDate() {
		return ctfDate;
	}
	public void setCtfDate(Date ctfDate) {
		this.ctfDate = ctfDate;
	}
	public String getClCode() {
		return clCode;
	}
	public void setClCode(String clCode) {
		this.clCode = clCode;
	}
	
	
}
