package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.DebateBoardDAO;
import com.one.dto.DebateBoardVO;

public class DebateBoardDAOImpl implements DebateBoardDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<DebateBoardVO> selectDebateBoardList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<DebateBoardVO> debateBoardList = session.selectList("DebateBoard-Mapper.selectDebateBoardList", cri, rowBounds);
		
		return debateBoardList;
	}

	@Override
	public List<DebateBoardVO> selectDebateBoardSortList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<DebateBoardVO> debateBoardList = session.selectList("DebateBoard-Mapper.selectDebateBoardSortList", cri, rowBounds);
		
		return debateBoardList;
	}

	@Override
	public DebateBoardVO selectDebateBoardByDboardNo(int dboardNo) throws SQLException {
		return session.selectOne("DebateBoard-Mapper.selectDebateBoardByDboardNo", dboardNo);
	}

	@Override
	public int selectDebateBoardListCount() throws SQLException {
		int count = session.selectOne("DebateBoard-Mapper.selectDebateBoardListCount");
		return count;
	}

	@Override
	public void deleteDebateBoard(int dboardNo) throws SQLException {
		session.update("DebateBoard-Mapper.deleteDebateBoard", dboardNo);
	}

	@Override
	public void insertDebate(DebateBoardVO debate) throws SQLException {
		session.update("DebateBoard-Mapper.insertDebate",debate);
		
	}

	@Override
	public int selectDebateBoardSeqNext() throws SQLException {
		int num = session.selectOne("DebateBoard-Mapper.selectDebateBoardSeqNext");
		return num;
	}

	@Override
	public void increaseViewCnt(int dboardNo) throws SQLException {
		session.update("DebateBoard-Mapper.increaseViewCnt", dboardNo);
	}

	@Override
	public void increaseReportCnt(int dboardNo) throws SQLException {
		session.update("DebateBoard-Mapper.increaseReportCnt", dboardNo);
	}

	@Override
	public void updateDebate(DebateBoardVO debate) throws SQLException {
		session.update("DebateBoard-Mapper.updateDebate", debate);
	}

}
