package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.DebateReplyVO;

public interface DebateReplyDAO {
	
	public int selectDebateReplySeqNextValue() throws SQLException;
	
	public List<DebateReplyVO> selectDebateReplyList(int dboardNo, Criteria cri) throws SQLException;

	public int countDebateReply(int dboardNo) throws SQLException;
	
	public void deleteDebateReplyBydboardNo(int dboardNo) throws SQLException;
	
	public void registDebateReply(DebateReplyVO debateReply) throws SQLException;
	
	public int getNextdereplyNo() throws SQLException;
	
	public void deleteReplyRep(DebateReplyVO reply) throws SQLException;
	
	public void modifyReply(DebateReplyVO reply) throws SQLException;
	
	public void modifyReReply(DebateReplyVO reply) throws SQLException;
}
