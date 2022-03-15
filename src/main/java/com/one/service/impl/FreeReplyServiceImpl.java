package com.one.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.FreeReplyDAO;
import com.one.dao.MemberDAO;
import com.one.dto.FreeReplyVO;
import com.one.dto.MemberVO;
import com.one.service.FreeReplyService;

public class FreeReplyServiceImpl implements FreeReplyService{

	private FreeReplyDAO freeReplyDAO;
	public void setFreeReplyDAO(FreeReplyDAO freeReplyDAO) {
		this.freeReplyDAO = freeReplyDAO;
	}

	@Override
	public Map<String, Object> getFreeReplyList(int freeNo, Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<FreeReplyVO> freeReplyList = freeReplyDAO.selectFreeReplyList(freeNo, cri);
		
		int totalCount = freeReplyDAO.countFreeReply(freeNo);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("freeReplyList", freeReplyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int getFreeReplyCount(int freeNo) throws SQLException {
		int count = freeReplyDAO.countFreeReply(freeNo);
		return count;
	}

	@Override
	public void registFreeReply(FreeReplyVO freeReplyVO) throws SQLException {
		int no = freeReplyDAO.selectFreeReplySeqNextValue();
		freeReplyVO.setFrreplyNo(no);
		freeReplyDAO.insertFreeReply(freeReplyVO);
	}

	@Override
	public void modifyFreeReply(FreeReplyVO freeReplyVO) throws SQLException {
		freeReplyDAO.updateFreeReply(freeReplyVO);
	}

	@Override
	public void removeFreeReply(int frreplyNo) throws SQLException {
		freeReplyDAO.deleteFreeReply(frreplyNo);
	}
	
	@Override
	public void removeAllFreeReply(int freeNo) throws Exception {
		freeReplyDAO.deleteAllFreeReply(freeNo);
	}

}
