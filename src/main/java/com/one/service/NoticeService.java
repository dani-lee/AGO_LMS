package com.one.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.AttachVO;
import com.one.dto.NoticeVO;

public interface NoticeService {
	public Map<String, Object> getNoticeList(Criteria cri) throws SQLException;
	
	public List<NoticeVO> getImportantNoticeList(Criteria cri) throws SQLException;
	
	public List<NoticeVO> getNomalNoticeList(Criteria cri) throws SQLException;
	
	public NoticeVO getNotice(int noticeNo) throws SQLException;

	public void regist(NoticeVO notice, List<AttachVO> attachList) throws SQLException;

	public void modify(NoticeVO notice, List<AttachVO> attachList) throws SQLException;

	public void remove(int[] noticeNo) throws SQLException;
	
	// 글읽기(조회수증가)
	public NoticeVO read(int noticeNo)throws SQLException;
	
	// 첨부파일 조회
	public AttachVO getAttachByAno(int ano)throws SQLException;
	
	// 파일정보 삭제
	public void removeAttachByAno(int ano)throws SQLException;
	
}
