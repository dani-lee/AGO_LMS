package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.FreeReplyVO;

public interface FreeReplyService {

	public Map<String,Object> getFreeReplyList(int freeNo, Criteria cri) throws SQLException;
	
	public int getFreeReplyCount(int freeNo) throws SQLException;

	public void registFreeReply(FreeReplyVO freeReplyVO) throws SQLException;
	
	public void modifyFreeReply(FreeReplyVO freeReplyVO) throws SQLException;
	
	public void removeFreeReply(int frreplyNo) throws SQLException;
	
	//게시물 삭제시 전체 삭제
	public void removeAllFreeReply(int freeNo) throws Exception;
}
