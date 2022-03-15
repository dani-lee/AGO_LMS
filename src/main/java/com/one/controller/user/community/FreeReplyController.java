package com.one.controller.user.community;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.josephoconnell.html.HTMLInputFilter;
import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dto.FreeReplyVO;
import com.one.service.FreeReplyService;

@RestController
@RequestMapping("/user/frreply")
public class FreeReplyController {

	@Autowired
	private FreeReplyService freeReplyService;

	@RequestMapping(value="/{freeNo}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> freeReplyList(@PathVariable("freeNo") int freeNo, @PathVariable("page") int page) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		try {
			Map<String, Object> dataMap = freeReplyService.getFreeReplyList(freeNo, cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/registReply.do", method=RequestMethod.POST)
	public ResponseEntity<Map<String,Integer>> regist(@RequestBody FreeReplyVO freeReplyVO){
		
		ResponseEntity<Map<String,Integer>> entity = null;
		
		freeReplyVO.setFrreplyContent(HTMLInputFilter.htmlSpecialChars(freeReplyVO.getFrreplyContent()));
		
		try {
			freeReplyService.registFreeReply(freeReplyVO);
			
			Criteria cri = new Criteria();
			
			Map<String,Object> dataMap = freeReplyService.getFreeReplyList(freeReplyVO.getFreeNo(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			int replyCnt = freeReplyService.getFreeReplyCount(freeReplyVO.getFreeNo());
			
			Map<String,Integer> data = new HashMap<String, Integer>();
			data.put("realEndPage", realEndPage);
			data.put("replyCnt",replyCnt);
			
			entity = new ResponseEntity<Map<String,Integer>>(data, HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Integer>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/modifyReply.do", method=RequestMethod.POST)
	public ResponseEntity<String> modify(@RequestBody FreeReplyVO freeReplyVO){
		
		ResponseEntity<String> entity = null;
		
		freeReplyVO.setFrreplyContent(HTMLInputFilter.htmlSpecialChars(freeReplyVO.getFrreplyContent()));
		
		try {
			freeReplyService.modifyFreeReply(freeReplyVO);
			
			Criteria cri = new Criteria();
			
			Map<String,Object> dataMap = freeReplyService.getFreeReplyList(freeReplyVO.getFreeNo(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			entity = new ResponseEntity<String>(realEndPage+"", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/removeReply.do", method=RequestMethod.POST)
	public ResponseEntity<Map<String,String>> remove(int frreplyNo, int freeNo, int page) {
		ResponseEntity<Map<String,String>> entity = null;
		try {
			
			freeReplyService.removeFreeReply(frreplyNo);
			
			Criteria cri = new Criteria();
			
			Map<String,Object> dataMap = freeReplyService.getFreeReplyList(freeNo, cri);
			PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
			
			int realEndPage = pageMaker.getRealEndPage();
			if(page > realEndPage) { page  = realEndPage; }
			
			int replyCnt = freeReplyService.getFreeReplyCount(freeNo);
			Map<String,String> data = new HashMap<String, String>();
			data.put("page", page + "");
			data.put("replyCnt",replyCnt + "");
			
			entity = new ResponseEntity<Map<String,String>>(data, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
