package com.one.command;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReportClassCommand {
	private Date ctfDate = new Date();
	private String clName  ;
	private String clCate  ;
	private String memEmail;
	
	String pattern = "yyyy.MM.dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	
	public String getCtfDate() {
		return simpleDateFormat.format(ctfDate);
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
	public String getClCate() {
		return clCate;
	}
	public void setClCate(String clCate) {
		this.clCate = clCate;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
}
