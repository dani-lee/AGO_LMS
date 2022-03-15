package com.one.command;

public class MessageComand {

	private String memEmail;
	private int msgNo;
	
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	@Override
	public String toString() {
		return "MessageComand [memEmail=" + memEmail + ", msgNo=" + msgNo + "]";
	}
	
	
}
