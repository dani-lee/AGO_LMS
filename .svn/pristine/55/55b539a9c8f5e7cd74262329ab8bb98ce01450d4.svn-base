package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.AskVO;


public interface AskService {
	public Map<String, Object> getAskList(Criteria cri) throws SQLException;
	
	public Map<String, Object> getMyAskList(String memId, Criteria cri) throws SQLException;
	
	public AskVO getAsk(int askNo) throws SQLException;

	public void regist(AskVO ask) throws SQLException;

	public void registAnswer(AskVO ask) throws SQLException;
	
	public void remove(int[] qnNo) throws SQLException;
}
