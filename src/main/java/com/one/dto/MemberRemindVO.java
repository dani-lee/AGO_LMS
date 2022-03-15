package com.one.dto;

import java.util.Date;

public class MemberRemindVO implements Comparable<MemberRemindVO>{

	private int opcl;
	private int remdNo;			// 알림 번호(기본키)
	private String memEmail;	// 사용자 이메일
	private String remdContent;	// 알림내용
	private Date remdDate;		// 알림전송날짜
	private int remdRead;		// 알림을읽었는지 (읽음 1, 안읽음 0)
	private int memClNo; 		// 사용자 수강 번호
	private int remdType;		// 알림 타입 (1 : 관심 강의 마감 알림 유무
//										   2 : 실시간 강의 알림 유무
//										   3 : (부서장) 보고서 결재 알림
//										   4 : 보고서 마감 알림)
	
	
	// 날짜순 정렬을 위해 사용
	@Override
	public int compareTo(MemberRemindVO o) {
		return getRemdDate().compareTo(o.getRemdDate());
	}
	
	
	
	@Override
	public String toString() {
		return "MemberRemindVO [remdNo=" + remdNo + ", memEmail=" + memEmail + ", remdContent=" + remdContent
				+ ", remdDate=" + remdDate + ", remdRead=" + remdRead + ", memClNo=" + memClNo + ", remdType="
				+ remdType + "]";
	}



	public int getOpcl() {
		return opcl;
	}
	public void setOpcl(int opcl) {
		this.opcl = opcl;
	}
	public int getRemdNo() {
		return remdNo;
	}
	public int getRemdType() {
		return remdType;
	}
	public void setRemdType(int remdType) {
		this.remdType = remdType;
	}
	public void setRemdNo(int remdNo) {
		this.remdNo = remdNo;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getRemdContent() {
		return remdContent;
	}
	public void setRemdContent(String remdContent) {
		this.remdContent = remdContent;
	}
	public Date getRemdDate() {
		return remdDate;
	}
	public void setRemdDate(Date remdDate) {
		this.remdDate = remdDate;
	}
	public int getRemdRead() {
		return remdRead;
	}
	public void setRemdRead(int remdRead) {
		this.remdRead = remdRead;
	}
	public int getMemClNo() {
		return memClNo;
	}
	public void setMemClNo(int memClNo) {
		this.memClNo = memClNo;
	}
	
	
	
}
