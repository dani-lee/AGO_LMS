package com.one.command;

public class DstcsCommand {

	private String dpId;
	private int dstcsFirst;
	private int dstcsSecond;
	private int dstcsThird;
	
	public String getDpId() {
		return dpId;
	}
	public void setDpId(String dpId) {
		this.dpId = dpId;
	}
	public int getDstcsFirst() {
		return dstcsFirst;
	}
	public void setDstcsFirst(int dstcsFirst) {
		this.dstcsFirst = dstcsFirst;
	}
	public int getDstcsSecond() {
		return dstcsSecond;
	}
	public void setDstcsSecond(int dstcsSecond) {
		this.dstcsSecond = dstcsSecond;
	}
	public int getDstcsThird() {
		return dstcsThird;
	}
	public void setDstcsThird(int dstcsThird) {
		this.dstcsThird = dstcsThird;
	}
	@Override
	public String toString() {
		return "DstcsCommand [dpId=" + dpId + ", dstcsFirst=" + dstcsFirst + ", dstcsSecond=" + dstcsSecond
				+ ", dstcsThird=" + dstcsThird + "]";
	}
	
	
}
