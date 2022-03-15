package com.one.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.DebateBoardDAO;
import com.one.dao.DebateReplyDAO;
import com.one.dto.DebateBoardVO;
import com.one.dto.DebateReplyVO;
import com.one.dto.FreeReplyVO;
import com.one.service.DebateBoardService;

public class DebateBoardServiceImpl implements DebateBoardService {

	private DebateBoardDAO debateBoardDAO;
	public void setDebateBoardDAO(DebateBoardDAO debateBoardDAO) {
		this.debateBoardDAO = debateBoardDAO;
	}
	private DebateReplyDAO debateReplyDAO;
	public void setDebateReplyDAO(DebateReplyDAO debateReplyDAO) {
		this.debateReplyDAO = debateReplyDAO;
	}

	@Override
	public Map<String, Object> getDebateBoardList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<DebateBoardVO> debateBoardList = debateBoardDAO.selectDebateBoardList(cri);
		
		for(DebateBoardVO debateBoard : debateBoardList) {
			int debateReplyCnt = debateReplyDAO.countDebateReply(debateBoard.getDboardNo());
			debateBoard.setReplyCnt(debateReplyCnt);
		}

		int totalCount = debateBoardDAO.selectDebateBoardListCount();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("debateBoardList", debateBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getSortDebateBoardList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<DebateBoardVO> debateBoardList = debateBoardDAO.selectDebateBoardSortList(cri);
		
		for(DebateBoardVO debateBoard : debateBoardList) {
			int debateReplyCnt = debateReplyDAO.countDebateReply(debateBoard.getDboardNo());
			debateBoard.setReplyCnt(debateReplyCnt);
		}

		int totalCount = debateBoardDAO.selectDebateBoardListCount();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("debateBoardList", debateBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public DebateBoardVO getDebateBoard(int dboardNo, Criteria cri) throws Exception {
		DebateBoardVO debateBoard =  debateBoardDAO.selectDebateBoardByDboardNo(dboardNo);
		debateBoard.setReplyCnt(debateReplyDAO.countDebateReply(dboardNo));
		if(!(cri.getKeyword().equals("noCount"))) {
			debateBoardDAO.increaseViewCnt(dboardNo);
		}
		
		return debateBoard;
	}
	
	@Override
	public DebateBoardVO getDebateBoardFromModify(int dboardNo) throws Exception {
		DebateBoardVO debateBoard =  debateBoardDAO.selectDebateBoardByDboardNo(dboardNo);
		debateBoard.setReplyCnt(debateReplyDAO.countDebateReply(dboardNo));
		return debateBoard;
	}

	@Override
	public void removeDebateBoard(int dboardNo, Criteria cri) throws Exception {
		List<DebateReplyVO> replyList = debateReplyDAO.selectDebateReplyList(dboardNo, cri);
		for(DebateReplyVO reply : replyList) {
			debateReplyDAO.deleteDebateReplyBydboardNo(reply.getDereplyNo());
		}
		debateBoardDAO.deleteDebateBoard(dboardNo);
	}

	@Override
	public void registDebate(DebateBoardVO debate) throws SQLException {
		int dboardNo = debateBoardDAO.selectDebateBoardSeqNext();
		debate.setDboardNo(dboardNo);
		debateBoardDAO.insertDebate(debate);
	}

	
	@Override
	public int modifyReportCnt(int dboardNo) throws SQLException {
		debateBoardDAO.increaseReportCnt(dboardNo);
		DebateBoardVO debate = debateBoardDAO.selectDebateBoardByDboardNo(dboardNo);
		int cnt = debate.getDeReportCnt();
		return cnt;
		
	}

	@Override
	public void modifyDebate(DebateBoardVO debate) throws SQLException {
		debateBoardDAO.updateDebate(debate);
	}

	

}
