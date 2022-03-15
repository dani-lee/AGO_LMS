package com.one.controller.manager.boardManagement;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.one.command.Criteria;
import com.one.service.FreeReplyService;

@RestController
@RequestMapping("/manager/frreply")
public class ManagerFreeReplyController {

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
}
