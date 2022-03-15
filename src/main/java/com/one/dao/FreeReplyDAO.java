package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.FreeReplyVO;

public interface FreeReplyDAO {

	public int selectFreeReplySeqNextValue() throws SQLException;
	
	public List<FreeReplyVO> selectFreeReplyList(int freeNo, Criteria cri) throws SQLException;

	public int countFreeReply(int freeNo) throws SQLException;
	
	public void insertFreeReply(FreeReplyVO freeReplyVO) throws SQLException;
	
	public void updateFreeReply(FreeReplyVO freeReplyVO) throws SQLException;
	
	public void deleteFreeReply(int frreplyNo) throws SQLException;
	
	//게시물 삭제시 전체 삭제
	public void deleteAllFreeReply(int freeNo) throws SQLException;
}
