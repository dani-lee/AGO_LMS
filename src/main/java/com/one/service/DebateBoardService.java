package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.DebateBoardVO;

public interface DebateBoardService {

	public Map<String, Object> getDebateBoardList(Criteria cri) throws Exception;

	public Map<String, Object> getSortDebateBoardList(Criteria cri) throws Exception;

	public DebateBoardVO getDebateBoard(int dboardNo, Criteria cri) throws Exception;
	public DebateBoardVO getDebateBoardFromModify(int dboardNo) throws Exception;

	public void removeDebateBoard(int dboardNo, Criteria cri) throws Exception;

	public void registDebate(DebateBoardVO debate) throws SQLException;
	
	public void modifyDebate(DebateBoardVO debate) throws SQLException;
	
	public int modifyReportCnt(int dboardNo) throws SQLException;
	
	
}
