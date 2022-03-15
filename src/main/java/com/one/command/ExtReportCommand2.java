package com.one.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ExtReportCommand2 {
	private int extNo;
	private String memName;
	private String clName;
	private String eduContent;
	private String eduReview;
	private String dpId;
	private String positionId;
	private String insertCtfDate; // 보고서 작성할때 날짜
	private String extCode; // 외부강의 코드
	private String attachDoc;
	private String memEmail;
	private String extSign;
	public int getExtNo() {
		return extNo;
	}
	public void setExtNo(int extNo) {
		this.extNo = extNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getClName() {
		return clName;
	}
	public void setClName(String clName) {
		this.clName = clName;
	}
	public String getEduContent() {
		return eduContent;
	}
	public void setEduContent(String eduContent) {
		this.eduContent = eduContent;
	}
	public String getEduReview() {
		return eduReview;
	}
	public void setEduReview(String eduReview) {
		this.eduReview = eduReview;
	}
	public String getDpId() {
		return dpId;
	}
	public void setDpId(String dpId) {
		this.dpId = dpId;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getInsertCtfDate() {
		return insertCtfDate;
	}
	public void setInsertCtfDate(String insertCtfDate) {
		this.insertCtfDate = insertCtfDate;
	}
	public String getExtCode() {
		return extCode;
	}
	public void setExtCode(String extCode) {
		this.extCode = extCode;
	}
	public String getAttachDoc() {
		return attachDoc;
	}
	public void setAttachDoc(String attachDoc) {
		this.attachDoc = attachDoc;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getExtSign() {
		return extSign;
	}
	public void setExtSign(String extSign) {
		this.extSign = extSign;
	}
	
	
}
