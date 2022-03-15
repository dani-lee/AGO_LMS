package com.one.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.AskDAO;
import com.one.dto.AskVO;
import com.one.dto.FreeBoardVO;
import com.one.dto.NoticeVO;

public class AskDAOImpl implements AskDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AskVO> selectAskList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AskVO> askList = session.selectList("Ask-Mapper.selectAskList", cri, rowBounds);
		return askList;
	}
	
	@Override
	public List<AskVO> selectAskList(String memId, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sortType", cri.getSortType());
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		map.put("memId", memId);
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AskVO> askList = session.selectList("Ask-Mapper.selectMyAskList", map, rowBounds);

		return askList;
	}

	@Override
	public int selectAskListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Ask-Mapper.selectAskListCount", cri);
		return count;
	}

	@Override
	public int selectAskListCount(String memId, Criteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sortType", cri.getSortType());
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		map.put("memId", memId);
		
		return session.selectOne("Ask-Mapper.selectAskListCount", map);
	}

	
	@Override
	public AskVO selectAskByAskNo(int askNo) throws SQLException {
		return session.selectOne("Ask-Mapper.selectAskByAskNo", askNo);
	}

	@Override
	public void updateAsk(AskVO ask) throws SQLException {
		session.update("Ask-Mapper.updateAsk", ask);
		
	}

	@Override
	public void insertAsk(AskVO ask) throws SQLException {
		session.update("Ask-Mapper.insertAsk", ask);
		
	}

	@Override
	public void updateAskAnswer(AskVO ask) throws SQLException {
		session.update("Ask-Mapper.updateAnswer", ask);
		
	}

	
	@Override
	public void deleteAsk(int[] qnNo) throws SQLException {
		session.update("Ask-Mapper.deleteAsk", qnNo);
	}

	@Override
	public int selectQuestionsSeqNextValue() throws SQLException {
		int seq = session.selectOne("Ask-Mapper.selectQuestionsSeqNextValue");
		return seq;
	}

	


}
