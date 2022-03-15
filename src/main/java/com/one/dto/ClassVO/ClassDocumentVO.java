package com.one.dto.ClassVO;

import java.util.Date;

public class ClassDocumentVO {

	private int clDocNo;
	private String clCode;
	private String clDocName;
	private Date clDocRegdate;

	public int getClDocNo() {
		return clDocNo;
	}

	public void setClDocNo(int clDocNo) {
		this.clDocNo = clDocNo;
	}

	public String getClCode() {
		return clCode;
	}

	public void setClCode(String clCode) {
		this.clCode = clCode;
	}

	public String getClDocName() {
		return clDocName;
	}

	public void setClDocName(String clDocName) {
		this.clDocName = clDocName;
	}

	public Date getClDocRegdate() {
		return clDocRegdate;
	}

	public void setClDocRegdate(Date clDocRegdate) {
		this.clDocRegdate = clDocRegdate;
	}

}
