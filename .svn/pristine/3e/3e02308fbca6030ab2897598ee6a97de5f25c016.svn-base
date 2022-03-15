package com.one.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.MessageComand;
import com.one.dto.MessageVO;

public interface MessageService {

	public Map<String, Object> getMessageList(String memEmail, Criteria cri) throws SQLException;
	
	public MessageVO getMessage(MessageComand msgCMD)throws SQLException;
	
	public void registMessage(MessageVO message) throws SQLException;
	
	public void removeMsg(Map<String, Object> dataMap) throws SQLException;
	
	public Map<String,Object> getMsgList(Criteria cri) throws SQLException;
	
	//msg테이블에서 가져오기
	public MessageVO getMsg(int msgNo) throws SQLException;
	
	public void removeMsgByManager(int msgNo) throws SQLException;
	
	public int getUnreadMsgCnt(String memEmail)throws SQLException;
	
}
