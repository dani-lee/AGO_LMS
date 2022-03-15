package com.one.controller.user.community;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.command.Criteria;
import com.one.dto.DebateBoardVO;
import com.one.dto.DebateReplyVO;
import com.one.service.DebateBoardService;
import com.one.service.DebateReplyService;

@Controller
@RequestMapping("/user/debateReply")
public class DebateReplyController {
	@Autowired
	private DebateBoardService debateBoardService;
	@Autowired
	private DebateReplyService debateReplyService;
	
	@RequestMapping(value = "/{dboardNo}/{page}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getDebateRepltList(@PathVariable("dboardNo") int dboardNo, @PathVariable("page") int page) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;

		Criteria cri = new Criteria();
		cri.setPage(page);
		

		try {
			Map<String, Object> dataMap = debateReplyService.getDebateReplyList(dboardNo, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	@RequestMapping(value="/registReply.do",method=RequestMethod.POST, produces = "test/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> registReply(DebateReplyVO reply) throws Exception {
			ResponseEntity<String> entity = null;

			try {
				//int num = debateBoardService.getDBoardNo();
				//debate.setDboardNo(num);
				//debateBoardService.registDebate(debate);
				
				entity = new ResponseEntity<String>("등록되었습니다.", HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		return entity;
	}


}
