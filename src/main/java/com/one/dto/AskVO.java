package com.one.dto;

import java.util.Date;

public class AskVO {
	private int qnNo;
	private String qnTitle;
	private String qnContent;
	private String qnAnswer;
	private Date qnRegdate;
	private String memId;
	private String askSort;
	private String classFormat;
	private int privacy;
	
	public int getQnNo() {
		return qnNo;
	}
	public void setQnNo(int qnNo) {
		this.qnNo = qnNo;
	}
	public String getQnTitle() {
		return qnTitle;
	}
	public void setQnTitle(String qnTitle) {
		this.qnTitle = qnTitle;
	}
	public String getQnContent() {
		return qnContent;
	}
	public void setQnContent(String qnContent) {
		this.qnContent = qnContent;
	}
	public String getQnAnswer() {
		return qnAnswer;
	}
	public void setQnAnswer(String qnAnswer) {
		this.qnAnswer = qnAnswer;
	}
	public Date getQnRegdate() {
		return qnRegdate;
	}
	public void setQnRegdate(Date qnRegdate) {
		this.qnRegdate = qnRegdate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getAskSort() {
		return askSort;
	}
	public void setAskSort(String askSort) {
		this.askSort = askSort;
	}
	public String getClassFormat() {
		return classFormat;
	}
	public void setClassFormat(String classFormat) {
		this.classFormat = classFormat;
	}
	public int getPrivacy() {
		return privacy;
	}
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	@Override
	public String toString() {
		return "AskVO [qnNo=" + qnNo + ", qnTitle=" + qnTitle + ", qnContent=" + qnContent + ", qnAnswer=" + qnAnswer
				+ ", qnRegdate=" + qnRegdate + ", memId=" + memId + ", askSort=" + askSort + ", classFormat="
				+ classFormat + ", privacy=" + privacy + "]";
	}
	
	
	
}
