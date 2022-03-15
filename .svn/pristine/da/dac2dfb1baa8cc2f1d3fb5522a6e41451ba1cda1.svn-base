package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.AskVO;


public interface AskDAO {
	public List<AskVO> selectAskList(Criteria cri) throws SQLException;

	public List<AskVO> selectAskList(String memId, Criteria cri) throws SQLException;
	
	public int selectAskListCount(Criteria cri) throws SQLException;

	public int selectAskListCount(String memId, Criteria cri) throws SQLException;
	
	public AskVO selectAskByAskNo(int askNo) throws SQLException;

	public void updateAsk(AskVO ask) throws SQLException;
	
	public void updateAskAnswer(AskVO ask) throws SQLException;
	
	public void insertAsk(AskVO ask) throws SQLException;
	
	public void deleteAsk(int[] qnNo) throws SQLException;
	
	public int selectQuestionsSeqNextValue() throws SQLException;
}
