package com.one.dto;

public class ManageExamVO {

	private String clCode;
	private String clName;
	private String clCate;
	private String mtestFile;
	private String ftestFile;
	private int mtestAvgSco;
	private int ftestAvgSco;

	public String getClCode() {
		return clCode;
	}

	public void setClCode(String clCode) {
		this.clCode = clCode;
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

	public String getMtestFile() {
		return mtestFile;
	}

	public void setMtestFile(String mtestFile) {
		this.mtestFile = mtestFile;
	}

	public String getFtestFile() {
		return ftestFile;
	}

	public void setFtestFile(String ftestFile) {
		this.ftestFile = ftestFile;
	}

	public int getMtestAvgSco() {
		return mtestAvgSco;
	}

	public void setMtestAvgSco(int mtestAvgSco) {
		this.mtestAvgSco = mtestAvgSco;
	}

	public int getFtestAvgSco() {
		return ftestAvgSco;
	}

	public void setFtestAvgSco(int ftestAvgSco) {
		this.ftestAvgSco = ftestAvgSco;
	}

	@Override
	public String toString() {
		return "ManageExamVO [clCode=" + clCode + ", clName=" + clName + ", clCate=" + clCate + ", mtestAvgSco="
				+ mtestAvgSco + ", ftestAvgSco=" + ftestAvgSco + "]";
	}

}
