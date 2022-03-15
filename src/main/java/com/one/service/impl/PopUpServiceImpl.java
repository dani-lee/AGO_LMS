package com.one.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.PopUpDAO;
import com.one.dto.PopUpVO;
import com.one.service.PopUpService;

public class PopUpServiceImpl implements PopUpService{

	private PopUpDAO popupDAO;
	public void setPopupDAO(PopUpDAO popupDAO) {
		this.popupDAO = popupDAO;
	}

	@Override
	public Map<String,Object> getPopUpList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<PopUpVO> popupList = popupDAO.selectPopupList(cri);
		
		int totalCount = popupDAO.countPopup();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("popupList", popupList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public PopUpVO getPopup(int popNo) throws SQLException {
		PopUpVO popup = popupDAO.selectPopup(popNo);
		return popup;
	}

	@Override
	public void registPopup(PopUpVO popUp) throws SQLException {
		int popNo = popupDAO.selectPopupSequenceNextValue();
		popUp.setPopNo(popNo);
		popupDAO.insertPopup(popUp);
	}

	@Override
	public List<PopUpVO> getPopupListByDate() throws SQLException {
		List<PopUpVO> popupList = popupDAO.selectPopupListByDate();
		return popupList;
	}

	@Override
	public void modifyPopup(PopUpVO popUp) throws SQLException {
		popupDAO.updatePopup(popUp);
	}

	@Override
	public void removePopup(int popNo) throws SQLException {
		popupDAO.deletePopup(popNo);
	}

	
}
