package com.one.dto;

import java.util.Date;

public class NewRemindCheckVO {
	
	private String clName;
	private int opcl;
	private Date postSdate;
	private Date postEdate;
	private Date studyDate;
	private int reportCnt;
	private int memClNo;
	
	
	public int getMemClNo() {
		return memClNo;
	}
	public void setMemClNo(int memClNo) {
		this.memClNo = memClNo;
	}
	public String getClName() {
		return clName;
	}
	public void setClName(String clName) {
		this.clName = clName;
	}
	public int getOpcl() {
		return opcl;
	}
	public void setOpcl(int opcl) {
		this.opcl = opcl;
	}
	public Date getPostSdate() {
		return postSdate;
	}
	public void setPostSdate(Date postSdate) {
		this.postSdate = postSdate;
	}
	public Date getPostEdate() {
		return postEdate;
	}
	public void setPostEdate(Date postEdate) {
		this.postEdate = postEdate;
	}
	public Date getStudyDate() {
		return studyDate;
	}
	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	
	
	
}
