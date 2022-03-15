package com.one.controller.manager.login;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.dto.ManagerVO;
import com.one.dto.MemberVO;
import com.one.service.MemberService;
import com.one.utils.MimeAttachNotifier;

@Controller
@RequestMapping("/manager/login/")
public class ManagerLoginController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MimeAttachNotifier notifier;

	@RequestMapping(value = "/searchForIdForm", method = RequestMethod.GET)
	public String mnSearchForId() {
		String url = "/manager/login/searchForId";
		return url;
	}

	@RequestMapping(value = "/searchMnId")
	public ResponseEntity<String> mnSearchId(String email) throws SQLException {
		ResponseEntity<String> entity = null;

		Map<String, Object> dataMap = memberService.getManagerByEmail(email);

		MemberVO member = (MemberVO) dataMap.get("member");
		ManagerVO manager = (ManagerVO) dataMap.get("manager");

		if (member != null && member.getAuthorityId().equals("A103")) {
			entity = new ResponseEntity<String>("MANAGER", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("impossible", HttpStatus.OK);
		}
		return entity;
	}

	@RequestMapping(value = "/searchForPwdForm", method = RequestMethod.GET)
	public String mnSearchForPwd() {
		String url = "/manager/login/searchForPwd";
		return url;
	}

	/*
	 * @RequestMapping(value = "/searchMnPwd") public ResponseEntity<String> mnSearchPwd(HttpServletRequest request)throws SQLException{ ResponseEntity<String> entity = null; String id = request.getParameter("memId"); String email = request.getParameter("memEmail");
	 *
	 * Map<String, Object> dataMap = memberService.getManagerByEmail(email);
	 *
	 * MemberVO member = (MemberVO) dataMap.get("member"); ManagerVO manager = (ManagerVO) dataMap.get("manager");
	 *
	 * if(member != null && member.getAuthorityId().equals("A103") && manager.getManagerId().equals(id)) { entity = new ResponseEntity<String>("Pass", HttpStatus.OK); }else { entity = new ResponseEntity<String>("Fail", HttpStatus.OK); } return entity; }
	 */

	@RequestMapping(value = "/searchMnPwd", method = RequestMethod.POST)
	public String mnSearchPwd(HttpServletRequest request, RedirectAttributes rttr) throws SQLException, Exception {
		String url = "";
		String message = "reject";
		String id = request.getParameter("id");
		String email = request.getParameter("email");

		Map<String, Object> dataMap = memberService.getManagerByEmail(email);

		MemberVO member = (MemberVO) dataMap.get("member");
		ManagerVO manager = (ManagerVO) dataMap.get("manager");

		if (member != null && member.getAuthorityId().equals("A103") && manager.getManagerId().equals(id)) {
			url = "/manager/login/searchMnPwd_success";
			notifier.sendMail(email);
		} else {
			url = "redirect:/manager/login/searchForPwdForm";
			rttr.addFlashAttribute("from", message);
		}

		return url;
	}

}
