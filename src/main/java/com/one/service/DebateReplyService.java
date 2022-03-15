package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.DebateReplyVO;

public interface DebateReplyService {

	public Map<String,Object> getDebateReplyList(int dboardNo, Criteria cri) throws Exception;
	
	public int getDebateReplyCount(int dboardNo) throws Exception;

	public void registDebateReply(DebateReplyVO debateReply) throws Exception;
	
	public void modifyDebateReply(DebateReplyVO debateReply) throws Exception;
	
	public void removeDebateReplyAll(int dboardNo) throws Exception;
	
	public int getNextdereplyNo() throws Exception;
	
	public void deleteReply(int num) throws Exception;

	public void deleteReplyRep(DebateReplyVO reply) throws SQLException;
}
