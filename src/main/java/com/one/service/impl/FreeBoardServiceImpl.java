package com.one.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.FreeBoardDAO;
import com.one.dao.FreeReplyDAO;
import com.one.dto.FreeBoardVO;
import com.one.dto.FreeReplyVO;
import com.one.service.FreeBoardService;

public class FreeBoardServiceImpl implements FreeBoardService{
	
	private FreeBoardDAO freeBoardDAO;
	private FreeReplyDAO freeReplyDAO;
	public void setFreeBoardDAO(FreeBoardDAO freeBoardDAO) {
		this.freeBoardDAO = freeBoardDAO;
	}
	public void setFreeReplyDAO(FreeReplyDAO freeReplyDAO) {
		this.freeReplyDAO = freeReplyDAO;
	}

	@Override
	public Map<String, Object> getFreeBoardList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<FreeBoardVO> freeBoardList = freeBoardDAO.selectFreeBoardList(cri);
		
		for(FreeBoardVO freeBoard : freeBoardList) {
			int freeReplyCnt = freeReplyDAO.countFreeReply(freeBoard.getFreeNo());
			freeBoard.setFreeReplyCnt(freeReplyCnt);
		}

		int totalCount = freeBoardDAO.selectFreeBoardListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("freeBoardList", freeBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
		
	}

	@Override
	public Map<String, Object> getSortFreeBoardList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<FreeBoardVO> freeBoardList = freeBoardDAO.selectFreeBoardSortList(cri);
		
		for(FreeBoardVO freeBoard : freeBoardList) {
			int freeReplyCnt = freeReplyDAO.countFreeReply(freeBoard.getFreeNo());
			freeBoard.setFreeReplyCnt(freeReplyCnt);
		}

		int totalCount = freeBoardDAO.selectFreeBoardListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("freeBoardList", freeBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	@Override
	public FreeBoardVO getFreeBoard(int freeNo) throws Exception {
		FreeBoardVO freeBoard = freeBoardDAO.selectFreeBoardByFreeNo(freeNo);
		int freeReplyCnt = freeReplyDAO.countFreeReply(freeNo);
		freeBoard.setFreeReplyCnt(freeReplyCnt);
		return freeBoard;
	}
	
	@Override
	public FreeBoardVO getFreeBoardFromModify(int freeNo) throws Exception {
		FreeBoardVO freeBoard = freeBoardDAO.selectFreeBoardByFreeNoFromModify(freeNo);
		int freeReplyCnt = freeReplyDAO.countFreeReply(freeNo);
		freeBoard.setFreeReplyCnt(freeReplyCnt);
		return freeBoard;
	}
	
	@Override
	public void removeFreeBoard(int freeNo, Criteria cri) throws Exception {
		freeBoardDAO.deleteFreeBoard(freeNo);
	}
	
	
	@Override
	public void registFreeBoard(FreeBoardVO freeBoard) throws Exception {
		freeBoardDAO.insertFreeBoard(freeBoard);
	}
	@Override
	public int modifyReportCnt(int freeNo) throws Exception {
		freeBoardDAO.increaseReportCnt(freeNo);
		FreeBoardVO freeBoard = freeBoardDAO.selectFreeBoardByFreeNoFromModify(freeNo);
		return freeBoard.getFreeReportCnt();
	}
	@Override
	public void modifyFreeBoard(FreeBoardVO freeBoard) throws Exception {
		freeBoardDAO.updateFreeBoard(freeBoard);
	}

}
