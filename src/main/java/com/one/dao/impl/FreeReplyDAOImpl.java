package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.FreeReplyDAO;
import com.one.dto.FreeReplyVO;

public class FreeReplyDAOImpl implements FreeReplyDAO{

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int selectFreeReplySeqNextValue() throws SQLException {
		int frreplyNo = session.selectOne("FreeReply-Mapper.selectFreeReplySeqNextValue");
		return frreplyNo;
	}

	@Override
	public List<FreeReplyVO> selectFreeReplyList(int freeNo, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeReplyVO> freeReplyList = session.selectList("FreeReply-Mapper.selectFreeReplyList", freeNo, rowBounds);
		return freeReplyList;
	}

	@Override
	public int countFreeReply(int freeNo) throws SQLException {
		int count = session.selectOne("FreeReply-Mapper.countFreeReply", freeNo);
		return count;
	}

	@Override
	public void insertFreeReply(FreeReplyVO freeReplyVO) throws SQLException {
		session.insert("FreeReply-Mapper.insertFreeReply", freeReplyVO);
	}

	@Override
	public void updateFreeReply(FreeReplyVO freeReplyVO) throws SQLException {
		session.update("FreeReply-Mapper.updateFreeReply", freeReplyVO);
	}

	@Override
	public void deleteFreeReply(int frreplyNo) throws SQLException {
		session.delete("FreeReply-Mapper.deleteFreeReply", frreplyNo);
	}

	@Override
	public void deleteAllFreeReply(int freeNo) throws SQLException {
		session.update("FreeReply-Mapper.deleteAllFreeReply", freeNo);
	}
	
}
