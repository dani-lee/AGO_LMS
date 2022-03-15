package com.one.dto;

import java.util.Date;

public class DebateReplyVO {
	
	private int dereplyNo;
	private int dboardNo;
	private Date dereplyRegdate;
	private String dereplyContent;
	private String memId;
	private int dereplyPreantNo;
	
	private String department;
	
	private int prevReply;

	
	
	public int getPrevReply() {
		return prevReply;
	}

	public void setPrevReply(int prevReply) {
		this.prevReply = prevReply;
	}

	public int getDereplyNo() {
		return dereplyNo;
	}

	public void setDereplyNo(int dereplyNo) {
		this.dereplyNo = dereplyNo;
	}

	public int getDboardNo() {
		return dboardNo;
	}

	public void setDboardNo(int dboardNo) {
		this.dboardNo = dboardNo;
	}

	public Date getDereplyRegdate() {
		return dereplyRegdate;
	}

	public void setDereplyRegdate(Date dereplyRegdate) {
		this.dereplyRegdate = dereplyRegdate;
	}

	public String getDereplyContent() {
		return dereplyContent;
	}

	public void setDereplyContent(String dereplyContent) {
		this.dereplyContent = dereplyContent;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getDereplyPreantNo() {
		return dereplyPreantNo;
	}

	public void setDereplyPreantNo(int dereplyPreantNo) {
		this.dereplyPreantNo = dereplyPreantNo;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "DebateReplyVO [dereplyNo=" + dereplyNo + ", dboardNo=" + dboardNo + ", dereplyRegdate=" + dereplyRegdate + ", dereplyContent=" + dereplyContent + ", memId=" + memId + ", dereplyPreantNo=" + dereplyPreantNo + ", department=" + department + "]";
	}


	
}
