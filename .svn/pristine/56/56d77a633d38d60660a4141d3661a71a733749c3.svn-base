package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.dto.AttachVO;
import com.one.dto.ClassVO.ClassFileVO;

public interface AttachDAO {
	public List<AttachVO> selectAttachesByBno(int bno) throws SQLException;
	
	public AttachVO selectAttachByAno(int ano) throws SQLException;
	
	public void insertAttach(AttachVO attach) throws SQLException;
	
	public void deleteAttach(int ano) throws SQLException;
	
	public void deleteAllAttach(int bno) throws SQLException;
	
	public void insertClassFileclChapNameAttach(AttachVO attach) throws Exception;
	
	public void insertClassFileclDocAttach(AttachVO attach) throws Exception;
	
	public void insertClassFileMiddleTestAttach(AttachVO attach) throws Exception;
	
	public void insertClassFileFinalTestAttach(AttachVO attach) throws Exception;
	
	public int getNextDocNo() throws SQLException;
	
	public void ModifyClassFileclDocAttach(AttachVO attach) throws SQLException;

	public void ModifyClassFileMiddleTestAttach(AttachVO attach) throws SQLException;
	
	public void ModifyClassFileFinalTestAttach(AttachVO attach) throws SQLException;
}
