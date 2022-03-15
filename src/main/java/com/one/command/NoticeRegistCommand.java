package com.one.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.one.dto.NoticeVO;

public class NoticeRegistCommand {
	private String title;
	private String content;
	private List<MultipartFile> fileUpload;
	private int impt=1;
	
	
	public int getImpt() {
		return impt;
	}
	public void setImpt(String impt) {
		if(impt.equals("on")) {
			this.impt = 0;
		}else {
			this.impt = 1;
		}

	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	public List<MultipartFile> getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(List<MultipartFile> fileUpload) {
		this.fileUpload = fileUpload;
	}
	public NoticeVO toNoticeVO() {
		
		NoticeVO notice = new NoticeVO();
		
		notice.setNoticeTitle(this.title);
		notice.setNoticeContent(this.content);
		notice.setNoticeImpt(this.impt);
		return notice;
	}
}
