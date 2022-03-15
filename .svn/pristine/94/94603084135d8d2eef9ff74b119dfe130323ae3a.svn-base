package com.one.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.service.AdminService;

@Controller
@RequestMapping("/admin/managerManagement")
public class ManagerManagementController {

	@Autowired
	private AdminService service;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(Criteria cri, ModelAndView mnv, HttpSession session) throws Exception {
		String url = "admin/managerManagement/main";

		Map<String, Object> dataMap = service.selectMemberList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/update.do")
	public ResponseEntity<String> update(String[] memId, Boolean check, HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;

		service.updateAuthority(memId, check);

		entity = new ResponseEntity<String>("true", HttpStatus.OK);
		return entity;
	}
}
