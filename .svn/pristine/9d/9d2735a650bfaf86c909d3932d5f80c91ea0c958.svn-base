package com.one.command;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.one.dto.PopUpVO;

public class PopUpRegistCommand {

	private String popNo;
	private String popTitle;
	private String popSdate;
	private String popEdate;
	private String popWsize;
	private String popHsize;
	private String popX;
	private String popY;
	private String popLink;
	private String popContent;

	public String getPopNo() {
		return popNo;
	}

	public void setPopNo(String popNo) {
		this.popNo = popNo;
	}

	public String getPopTitle() {
		return popTitle;
	}

	public void setPopTitle(String popTitle) {
		this.popTitle = popTitle;
	}

	public String getPopSdate() {
		return popSdate;
	}

	public void setPopSdate(String popSdate) {
		this.popSdate = popSdate;
	}

	public String getPopEdate() {
		return popEdate;
	}

	public void setPopEdate(String popEdate) {
		this.popEdate = popEdate;
	}

	public String getPopWsize() {
		return popWsize;
	}

	public void setPopWsize(String popWsize) {
		this.popWsize = popWsize;
	}

	public String getPopHsize() {
		return popHsize;
	}

	public void setPopHsize(String popHsize) {
		this.popHsize = popHsize;
	}

	public String getPopX() {
		return popX;
	}

	public void setPopX(String popX) {
		this.popX = popX;
	}

	public String getPopY() {
		return popY;
	}

	public void setPopY(String popY) {
		this.popY = popY;
	}

	public String getPopLink() {
		return popLink;
	}

	public void setPopLink(String popLink) {
		this.popLink = popLink;
	}

	public String getPopContent() {
		return popContent;
	}

	public void setPopContent(String popContent) {
		this.popContent = popContent;
	}

	public PopUpVO toPopUpVO() {
		Date start = null;
		Date end = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			start = sdf.parse(this.popSdate);
			end = sdf.parse(this.popEdate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PopUpVO popup = new PopUpVO();
		if(this.popNo != null) {
			popup.setPopNo(Integer.parseInt(this.popNo));
		}
		popup.setPopTitle(this.popTitle);
		popup.setPopSdate(start);
		popup.setPopEdate(end);
		popup.setPopWsize(Integer.parseInt(this.popWsize));
		popup.setPopHsize(Integer.parseInt(this.popHsize));
		popup.setPopX(Integer.parseInt(this.popX));
		popup.setPopY(Integer.parseInt(this.popY));
		popup.setPopLink(this.popLink);
		popup.setPopContent(this.popContent);

		return popup;
	}

	@Override
	public String toString() {
		return "PopUpRegistCommand [popNo=" + popNo + ", popTitle=" + popTitle + ", popSdate=" + popSdate + ", popEdate=" + popEdate + ", popWsize=" + popWsize + ", popHsize=" + popHsize + ", popX=" + popX + ", popY=" + popY + ", popLink=" + popLink + ", popContent=" + popContent + "]";
	}

}
