package com.one.dto;

import java.io.Serializable;

public class DepartmentVO implements Serializable{

	private String commonCode;
	private String groupCode;
	private String groupCodeNm;
	private String codeName1;
	private String useYn;
	
	public String getCommonCode() {
		return commonCode;
	}
	public void setCommonCode(String commonCode) {
		this.commonCode = commonCode;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getGroupCodeNm() {
		return groupCodeNm;
	}
	public void setGroupCodeNm(String groupCodeNm) {
		this.groupCodeNm = groupCodeNm;
	}
	public String getCodeName1() {
		return codeName1;
	}
	public void setCodeName1(String codeName1) {
		this.codeName1 = codeName1;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	@Override
	public String toString() {
		return "DepartmentVO [commonCode=" + commonCode + ", groupCode=" + groupCode + ", groupCodeNm=" + groupCodeNm
				+ ", codeName1=" + codeName1 + ", useYn=" + useYn + "]";
	}
	
	
	
	
}   
