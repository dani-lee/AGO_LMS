package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dto.NoticeVO;


public interface NoticeDAO {
	public List<NoticeVO> selectNoticeList(Criteria cri) throws SQLException;
	
	public List<NoticeVO> selectImportantNoticeList(Criteria cri) throws SQLException;
	
	public List<NoticeVO> selectNomalNoticeList(Criteria cri) throws SQLException;

	public int selectNoticeListCount(Criteria cri) throws SQLException;
	
	public int selectImportantNoticeListCount(Criteria cri) throws SQLException;
	
	public int selectNomalNoticeListCount(Criteria cri) throws SQLException;

	public NoticeVO selectNoticeByNoticeNo(int noticeNo) throws SQLException;

	public void updateNotice(NoticeVO notice) throws SQLException;

	public void deleteNotice(int[] noticeNo) throws SQLException;

	public void insertNotice(NoticeVO notice) throws SQLException;

	public int selectNoticeSeqNextValue() throws SQLException;
	// viewcnt 증가
	void increaseViewCnt(int noticeNo)throws SQLException;

}
