package com.one.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.MessageComand;
import com.one.dto.MessageVO;

public interface MessageDAO {

	public List<MessageVO> selectMessageList(Criteria cri) throws SQLException;
	
	public int selectMessageListCount(Criteria cri)throws SQLException;
	
	public MessageVO selectMessage(MessageComand msgCMD) throws SQLException;
	
	public void readMessage(MessageVO message) throws SQLException;

	public void insertMessage(MessageVO message) throws SQLException;
	
	public void insertMemMsg(MessageVO message) throws SQLException;
	
	public int selectMsgSequenceNextValue() throws SQLException;
	
	public void deleteMsg(Map<String, Object> dataMap) throws SQLException;
	
	public List<MessageVO> selectMsgList(Criteria cri) throws SQLException;
	
	public List<MessageVO> selectMemMsgByNo(int msgNo) throws SQLException;
	
	public int countMsg() throws SQLException;
	
	public MessageVO selectMsg(int msgNo) throws SQLException;
	
	public void deleteMsgBymanager(int msgNo) throws SQLException;

	public int selectUnreadMsgCount(String memEmail)throws SQLException;
}
