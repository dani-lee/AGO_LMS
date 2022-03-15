package com.one.command;

import com.one.dto.OrderClassVO;

public class DepartmentMemberClassCommand extends OrderClassVO{
	private String memEmail;
	private int progRate;
	private String memName;
	private String positionId;
	private String check;

	
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getProgRate() {
		return progRate;
	}
	public void setProgRate(int progRate) {
		this.progRate = progRate;
		setCheck("true");
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	
	
}
