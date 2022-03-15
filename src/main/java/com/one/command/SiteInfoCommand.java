package com.one.command;

import java.util.Arrays;

import com.one.dto.SiteInfoVO;

public class SiteInfoCommand {
	private String compName;
	private String compAddr;
	private String compRetName;
	private String[] compTel;
	private String compFax;
	private String[] compEmail;
	private String corpNum;
	
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getCompAddr() {
		return compAddr;
	}
	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}
	public String getCompRetName() {
		return compRetName;
	}
	public void setCompRetName(String compRetName) {
		this.compRetName = compRetName;
	}
	public String[] getCompTel() {
		return compTel;
	}
	public void setCompTel(String[] compTel) {
		this.compTel = compTel;
	}
	public String getCompFax() {
		return compFax;
	}
	public void setCompFax(String compFax) {
		this.compFax = compFax;
	}
	public String[] getCompEmail() {
		return compEmail;
	}
	public void setCompEmail(String[] compEmail) {
		this.compEmail = compEmail;
	}
	public String getCorpNum() {
		return corpNum;
	}
	public void setCorpNum(String corpNum) {
		this.corpNum = corpNum;
	}
	
	@Override
	public String toString() {
		return "SiteInfoCommand [compName=" + compName + ", compAddr=" + compAddr + ", compRetName=" + compRetName
				+ ", compTel=" + Arrays.toString(compTel) + ", compFax=" + compFax + ", compEmail="
				+ Arrays.toString(compEmail) + ", corpNum=" + corpNum + "]";
	}
	
	public SiteInfoVO getSiteInfoVO() {
		SiteInfoVO siteInfo = new SiteInfoVO();
		
		siteInfo.setCompName(this.compName);
		siteInfo.setCompAddr(this.compAddr);
		siteInfo.setCompRetName(this.compRetName);
		siteInfo.setCompTel(this.compTel[0]+"-"+this.compTel[1]+"-"+this.compTel[2]);
		siteInfo.setCompFax(this.compFax);
		siteInfo.setCompEmail(this.compEmail[0]+"@"+this.compEmail[1]);
		siteInfo.setCorpNum(this.corpNum);
		
		return siteInfo;
	}
	
	
}
