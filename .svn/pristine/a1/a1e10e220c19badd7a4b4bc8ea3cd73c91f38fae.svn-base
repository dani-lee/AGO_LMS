package com.one.controller.manager.boardManagement;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.command.Criteria;
import com.one.dto.DebateBoardVO;
import com.one.service.DebateBoardService;
import com.one.service.DebateReplyService;

@Controller
@RequestMapping("/manager/debateReply")
public class ManagerDebateReplyController {
	
	@Autowired
	private DebateReplyService debateReplyService;
	@Autowired
	private DebateBoardService debateBoardService;
	
	@RequestMapping(value = "/{dboardNo}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getDebateRepltList(@PathVariable("dboardNo") int dboardNo, @PathVariable("page") int page) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Criteria cri = new Criteria();
		
		DebateBoardVO debateBoard = debateBoardService.getDebateBoard(dboardNo, cri);
		
		cri.setPerPageNum(15);
		cri.setPage(page);

		try {
			Map<String, Object> dataMap = debateReplyService.getDebateReplyList(dboardNo, cri);
			dataMap.put("debateBoard", debateBoard);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
}




















