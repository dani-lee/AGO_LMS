package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.DebateBoardVO;

public interface DebateBoardDAO {

	// 토론게시판 목록
	public List<DebateBoardVO> selectDebateBoardList(Criteria cri) throws SQLException;

	// 신고된 게시물 정렬 목록
	public List<DebateBoardVO> selectDebateBoardSortList(Criteria cri) throws SQLException;

	// 상세
	public DebateBoardVO selectDebateBoardByDboardNo(int dboardNo) throws SQLException;

	// 총 갯수
	public int selectDebateBoardListCount() throws SQLException;

	// 삭제
	public void deleteDebateBoard(int dboardNo) throws SQLException;
	
	public void insertDebate(DebateBoardVO debate) throws SQLException;
	
	public void updateDebate(DebateBoardVO debate) throws SQLException;
	
	public int selectDebateBoardSeqNext() throws SQLException;
	
	public void increaseViewCnt(int dboardNo) throws SQLException;
	
	public void increaseReportCnt(int dboardNo) throws SQLException;

}
