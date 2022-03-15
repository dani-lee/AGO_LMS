package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.FreeBoardVO;

public interface FreeBoardDAO {

	//자유게시판 목록
	public List<FreeBoardVO> selectFreeBoardList(Criteria cri) throws SQLException;
	
	//신고된 게시물 정렬 목록
	public List<FreeBoardVO> selectFreeBoardSortList(Criteria cri) throws SQLException;
	
	//상세
	public FreeBoardVO selectFreeBoardByFreeNo(int freeNo) throws SQLException;
	
	// 카운트 안 올라가는 상세
	public FreeBoardVO selectFreeBoardByFreeNoFromModify(int freeNo) throws SQLException;
	
	//총 갯수
	public int selectFreeBoardListCount(Criteria cri) throws SQLException;
	
	// 글쓰기
	public void insertFreeBoard(FreeBoardVO freeBoard) throws SQLException;
	
	//삭제
	public void deleteFreeBoard(int freeNo) throws SQLException;
	
	//신고
	public int increaseReportCnt(int freeNo) throws SQLException;
	
	// 글 수정
	public void updateFreeBoard(FreeBoardVO freeBoard) throws SQLException;
	
}
