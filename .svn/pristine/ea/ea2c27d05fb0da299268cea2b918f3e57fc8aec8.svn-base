package com.one.command;

import com.one.dto.NoticeVO;

public class NoticeModifyCommand extends NoticeRegistCommand{
	
	private String noticeNo;
	private String[] deleteFile;
	

	
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public NoticeVO toNoticeVO() {
		NoticeVO notice = super.toNoticeVO();
		notice.setNoticeNo(Integer.parseInt(this.noticeNo));

		
		return notice;
	}
}
