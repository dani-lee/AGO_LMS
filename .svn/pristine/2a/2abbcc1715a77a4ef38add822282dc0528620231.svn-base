package com.one.controller.manager.boardManagement;

import java.util.Map;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.dto.DebateBoardVO;
import com.one.service.DebateBoardService;
import com.one.service.DebateReplyService;

@Controller
@RequestMapping("/manager/debate")
public class ManagerDebateBoardController {

	@Autowired
	private DebateBoardService debateBoardService;
	@Autowired
	private DebateReplyService debateReplyService;

	// 토론게시판 리스트
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView debate(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "/manager/boardManagement/debateBoard/listDebateBoard";
		cri.setPerPageNum(10);
		Map<String, Object> dataMap = debateBoardService.getDebateBoardList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	// 1번 이상 신고받은 토론게시판 리스트
	@RequestMapping(value = "/sortList.do", method = RequestMethod.GET)
	public ModelAndView sortList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "/manager/boardManagement/debateBoard/listDebateBoard";
		cri.setPerPageNum(10);
		Map<String, Object> dataMap = debateBoardService.getSortDebateBoardList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	// 토론게시판 상세
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView debatePage(int dboardNo, Criteria cri, ModelAndView mnv) throws Exception {
		String url = "/manager/boardManagement/debateBoard/debateBoardDetail";
		
		cri.setPerPageNum(15);
		DebateBoardVO debateBoard = debateBoardService.getDebateBoard(dboardNo, cri);
		Map<String, Object> dataMap = debateReplyService.getDebateReplyList(dboardNo, cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("debateBoard", debateBoard);
		mnv.setViewName(url);

		return mnv; 
	}

	@RequestMapping(value = "/remove.do", method = RequestMethod.POST)
	public String removeDebateBoard(int dboardNo, Criteria cri) throws Exception{
		String url = "redirect:list.do";
		debateReplyService.removeDebateReplyAll(dboardNo);
		debateBoardService.removeDebateBoard(dboardNo, cri);
		return url;
	}
	
	@RequestMapping(value = "/listremove.do", method = RequestMethod.GET)
	public String removeDebateBoardList(@RequestParam("dboardNo") int[] dboardNoArr, Criteria cri) throws Exception{
		String url = "redirect:list.do";
		
		for(int dboardNo : dboardNoArr) {
			debateReplyService.removeDebateReplyAll(dboardNo);
			debateBoardService.removeDebateBoard(dboardNo, cri);
		}
		return url;
	}

}
