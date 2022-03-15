package com.one.dto;

import java.util.Date;

public class FreeReplyVO {

	private int frreplyNo;
	private int freeNo;
	private Date frreplyRegdate;
	private String frreplyContent;
	private String memId;
	private String nickName;
	
	public int getFrreplyNo() {
		return frreplyNo;
	}
	public void setFrreplyNo(int frreplyNo) {
		this.frreplyNo = frreplyNo;
	}
	public int getFreeNo() {
		return freeNo;
	}
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}
	public Date getFrreplyRegdate() {
		return frreplyRegdate;
	}
	public void setFrreplyRegdate(Date frreplyRegdate) {
		this.frreplyRegdate = frreplyRegdate;
	}
	public String getFrreplyContent() {
		return frreplyContent;
	}
	public void setFrreplyContent(String frreplyContent) {
		this.frreplyContent = frreplyContent;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "FreeReplyVO [frreplyNo=" + frreplyNo + ", freeNo=" + freeNo + ", frreplyRegdate=" + frreplyRegdate
				+ ", frreplyContent=" + frreplyContent + ", memId=" + memId + ", nickName=" + nickName + "]";
	}
	
	

	
}
