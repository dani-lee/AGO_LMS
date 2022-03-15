package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.PopUpDAO;
import com.one.dto.FreeBoardVO;
import com.one.dto.PopUpVO;

public class PopUpDAOImpl implements PopUpDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertPopup(PopUpVO popUp) throws SQLException {
		session.update("PopUp-Mapper.insertPopup", popUp);
	}

	@Override
	public List<PopUpVO> selectPopupList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<PopUpVO> popupList = session.selectList("PopUp-Mapper.selectPopupList", cri, rowBounds);
		return popupList;
	}

	@Override
	public PopUpVO selectPopup(int popNo) throws SQLException {
		PopUpVO popup = session.selectOne("PopUp-Mapper.selectPopup", popNo);
		return popup;
	}

	@Override
	public int selectPopupSequenceNextValue() throws SQLException {
		int seq = session.selectOne("PopUp-Mapper.selectPopupSequenceNextValue");
		return seq;
	}

	@Override
	public int countPopup() throws SQLException {
		int totalCount = session.selectOne("PopUp-Mapper.countPopup");
		return totalCount;
	}

	@Override
	public List<PopUpVO> selectPopupListByDate() throws SQLException {
		List<PopUpVO> popupList = session.selectList("PopUp-Mapper.selectPopupListByDate");
		return popupList;
	}

	@Override
	public void updatePopup(PopUpVO popUp) throws SQLException {
		session.update("PopUp-Mapper.updatePopup", popUp);
	}

	@Override
	public void deletePopup(int popNo) throws SQLException {
		session.update("PopUp-Mapper.deletePopup", popNo);
	}

}
