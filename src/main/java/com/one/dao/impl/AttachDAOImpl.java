package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.one.dao.AttachDAO;
import com.one.dto.AttachVO;
import com.one.dto.ClassVO.ClassFileVO;

public class AttachDAOImpl implements AttachDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<AttachVO> selectAttachesByBno(int bno) throws SQLException {
		List<AttachVO> attachList=session.selectList("Attach-Mapper.selectAttachByBno",bno);
		return attachList;
	}

	@Override
	public AttachVO selectAttachByAno(int ano) throws SQLException {
		AttachVO attach=session.selectOne("Attach-Mapper.selectAttachByAno",ano);
		return attach;
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.insertAttach",attach);
	}

	@Override
	public void deleteAttach(int ano) throws SQLException {
		session.update("Attach-Mapper.deleteAttach",ano);
	}

	@Override
	public void deleteAllAttach(int bno) throws SQLException {
		session.update("Attach-Mapper.deleteAllAttach",bno);	
	}

	@Override
	public void insertClassFileclChapNameAttach(AttachVO attach) throws Exception {
		session.update("Attach-Mapper.insertClassFileclChapNameAttach",attach);
		
	}

	@Override
	public void insertClassFileclDocAttach(AttachVO attach) throws Exception {
		session.update("Attach-Mapper.insertClassFileclDocAttach",attach);
		
	}

	@Override
	public void insertClassFileMiddleTestAttach(AttachVO attach) throws Exception {
		session.update("Attach-Mapper.insertClassFileMiddleTestAttach",attach);
		
	}

	@Override
	public void insertClassFileFinalTestAttach(AttachVO attach) throws Exception {
		session.update("Attach-Mapper.insertClassFileFinalTestAttach",attach);
		
	}

	@Override
	public int getNextDocNo() throws SQLException {
		int DocNO = session.selectOne("Attach-Mapper.getNextDocNo");
		return DocNO;
	}

	@Override
	public void ModifyClassFileclDocAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.ModifyClassFileclDocAttach",attach);
		
	}

	@Override
	public void ModifyClassFileMiddleTestAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.ModifyClassFileMiddleTestAttach",attach);
		
	}

	@Override
	public void ModifyClassFileFinalTestAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.ModifyClassFileFinalTestAttach",attach);
		
	}






}
