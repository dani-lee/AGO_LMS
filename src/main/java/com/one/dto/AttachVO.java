package com.one.dto;

import java.util.Date;

public class AttachVO {
	private int docNO;

	private int ano; // 파일 seq번호
	private int bno; // 게시물 번호
	private String fileName;
	private String fileRealName;
	private Date regDate;
	private int opcl;
	private int testNo;
	private String clCode;
	private String testStatus;
	
	
	
	

	
	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}

	public String getClCode() {
		return clCode;
	}

	public void setClCode(String clCode) {
		this.clCode = clCode;
	}

	public int getOpcl() {
		return opcl;
	}

	public void setOpcl(int opcl) {
		this.opcl = opcl;
	}

	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public int getDocNO() {
		return docNO;
	}

	public void setDocNO(int docNO) {
		this.docNO = docNO;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "AttachVO [docNO=" + docNO + ", ano=" + ano + ", bno=" + bno + ", fileName=" + fileName
				+ ", fileRealName=" + fileRealName + ", regDate=" + regDate + ", opcl=" + opcl + ", testNo=" + testNo
				+ ", clCode=" + clCode + "]";
	}




}
