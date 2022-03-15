package com.one.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.AskDAO;
import com.one.dto.AskVO;
import com.one.dto.PopUpVO;
import com.one.service.AskService;


public class AskServiceImpl implements AskService {

	private AskDAO askDAO;
	public void setAskDAO(AskDAO askDAO) {
		this.askDAO = askDAO;
	}

	@Override
	public Map<String, Object> getAskList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		

		List<AskVO> askList = askDAO.selectAskList(cri);
		
		int totalCount = askDAO.selectAskListCount(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("askList", askList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	@Override
	public Map<String, Object> getMyAskList(String memId, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<AskVO> askList = askDAO.selectAskList(memId, cri);
		
		int totalCount = askDAO.selectAskListCount(memId, cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("askList", askList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public AskVO getAsk(int askNo) throws SQLException {
		AskVO ask = askDAO.selectAskByAskNo(askNo);
		return ask;
	}


	@Override
	public void registAnswer(AskVO ask) throws SQLException {
		askDAO.updateAskAnswer(ask);

	}

	@Override
	public void regist(AskVO ask) throws SQLException {
		int askNo =	askDAO.selectQuestionsSeqNextValue();
		ask.setQnNo(askNo);
		askDAO.insertAsk(ask);
	}

	@Override
	public void remove(int[] qnNo) throws SQLException {
		askDAO.deleteAsk(qnNo);
		
	}


}
