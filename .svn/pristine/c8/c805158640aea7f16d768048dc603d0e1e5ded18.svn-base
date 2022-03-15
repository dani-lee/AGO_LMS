package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.FreeBoardDAO;
import com.one.dto.FreeBoardVO;

public class FreeBoardDAOImpl implements FreeBoardDAO{

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<FreeBoardVO> selectFreeBoardList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeBoardVO> freeBoardList = session.selectList("FreeBoard-Mapper.selectFreeBoardList", cri, rowBounds);
		return freeBoardList;
	}
	
	@Override
	public List<FreeBoardVO> selectFreeBoardSortList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeBoardVO> freeBoardList = session.selectList("FreeBoard-Mapper.selectFreeBoardSortList", cri, rowBounds);
		return freeBoardList;
	}

	@Override
	public FreeBoardVO selectFreeBoardByFreeNo(int freeNo) throws SQLException {
		FreeBoardVO freeBoard = session.selectOne("FreeBoard-Mapper.selectFreeBoardByFreeNo", freeNo);
		session.update("FreeBoard-Mapper.increaseViewCnt",freeNo);
		return freeBoard;
	}
	
	@Override
	public FreeBoardVO selectFreeBoardByFreeNoFromModify(int freeNo) throws SQLException {
		FreeBoardVO freeBoard = session.selectOne("FreeBoard-Mapper.selectFreeBoardByFreeNo", freeNo);
		return freeBoard;
	}

	@Override
	public int selectFreeBoardListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("FreeBoard-Mapper.selectFreeBoardListCount",cri);
		return count;
	}

	@Override
	public void deleteFreeBoard(int freeNo) throws SQLException {
		session.delete("FreeBoard-Mapper.deleteFreeBoard", freeNo);
	}

	@Override
	public void insertFreeBoard(FreeBoardVO freeBoard) throws SQLException {
		session.update("FreeBoard-Mapper.insertFreeBoard", freeBoard);
	}

	@Override
	public int increaseReportCnt(int freeNo) throws SQLException {
		return session.update("FreeBoard-Mapper.increaseReportCnt", freeNo);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoard) throws SQLException {
		session.update("FreeBoard-Mapper.updateFreeBoard", freeBoard);
	}

}
