package com.one.controller.manager.userManagement;

import java.sql.SQLException;
import java.util.Map;

import org.aspectj.lang.reflect.MemberSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.command.Criteria;
import com.one.dto.MemberVO;
import com.one.service.CommonService;
import com.one.service.ManagementMemberService;
import com.one.service.MemberService;

@Controller
@RequestMapping("/manager/userManagement/resign")
public class ResignerListController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ManagementMemberService managementMemberService;
	@Autowired
	private CommonService commonService;
	
	//회원 목록
	@RequestMapping("/list.do") 
	public ModelAndView resignList(Criteria cri, ModelAndView mnv) throws SQLException {
		  String url = "manager/userManagement/listResignUser";
		  Map<String, Object> dataMap = managementMemberService.getResignerList(cri);
		  mnv.addObject("dataMap",dataMap);
		  mnv.setViewName(url);
		  return mnv;
	}
	
	//퇴사자 상세
	@RequestMapping("/detailResigner.pop") 
	public ModelAndView userPage(String memEmail, ModelAndView mnv) throws SQLException{
		String url = "manager/userManagement/detailResigner";

		Map<String,Object> dataMap = memberService.getMemberDetail(memEmail);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	//퇴사자 상세에서 재직으로 변경
	@RequestMapping("/modifyStatus")
	public ResponseEntity<String> modifyMemStatus(String memStatus, String memEmail) throws SQLException{
		ResponseEntity<String> entity = null;
		MemberVO member = new MemberVO();
		System.out.println("킼킼ㅋ키킼키키키키키키"+memStatus);
		member.setMemEmail(memEmail);
		member.setMemStatus(memStatus);
		
		managementMemberService.modifyMemberStatus(member);
		String result = "success";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	
}
