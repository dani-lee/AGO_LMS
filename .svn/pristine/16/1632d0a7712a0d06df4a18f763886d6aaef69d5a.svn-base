package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.DebateReplyDAO;
import com.one.dto.DebateReplyVO;
import com.one.dto.FreeReplyVO;

public class DebateReplyDAOImpl implements DebateReplyDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int selectDebateReplySeqNextValue() throws SQLException {
		return 0;
	}

	@Override
	public List<DebateReplyVO> selectDebateReplyList(int dboardNo, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<DebateReplyVO> debateReplyList = session.selectList("DebateReply-Mapper.selectDebateReplyList", dboardNo);
		
		return debateReplyList;
	}

	@Override
	public int countDebateReply(int dboardNo) throws SQLException {
		return session.selectOne("DebateReply-Mapper.countDebateReply", dboardNo);
	}

	@Override
	public void deleteDebateReplyBydboardNo(int dereplyNo) throws SQLException {

		session.delete("DebateReply-Mapper.deleteDebateReplyBydboardNo",dereplyNo);
		session.delete("DebateReply-Mapper.deleteDebateReplyBypreant",dereplyNo);
	}

	@Override
	public void registDebateReply(DebateReplyVO debateReply) throws SQLException {
		session.update("DebateReply-Mapper.registDebateReply",debateReply);
		
	}

	@Override
	public int getNextdereplyNo() throws SQLException {
		int num = session.selectOne("DebateReply-Mapper.getNextdereplyNo");
		return num;
	}

	@Override
	public void deleteReplyRep(DebateReplyVO reply) throws SQLException {
		session.delete("DebateReply-Mapper.deleteReplyRep",reply);
	}

	@Override
	public void modifyReply(DebateReplyVO reply) throws SQLException {
		session.update("DebateReply-Mapper.modifyReply",reply);
		
	}

	@Override
	public void modifyReReply(DebateReplyVO reply) throws SQLException {
		session.update("DebateReply-Mapper.modifyReReply",reply);
		
	}

}
