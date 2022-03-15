package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.FreeBoardVO;

public interface FreeBoardService {

	public Map<String,Object> getFreeBoardList(Criteria cri) throws Exception;
	
	public Map<String,Object> getSortFreeBoardList(Criteria cri) throws Exception;
	
	public FreeBoardVO getFreeBoard(int freeNo) throws Exception;
	
	public FreeBoardVO getFreeBoardFromModify(int freeNo) throws Exception;
	
	public void registFreeBoard(FreeBoardVO freeBoard) throws Exception;
	
	public void removeFreeBoard(int freeNo, Criteria cri) throws Exception;
	
	public int modifyReportCnt(int freeNo) throws Exception;
	
	public void modifyFreeBoard(FreeBoardVO freeBoard) throws Exception;
	
}
