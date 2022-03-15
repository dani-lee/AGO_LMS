package com.one.controller.manager.userManagement;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.command.Criteria;
import com.one.service.CommonService;
import com.one.service.ManagementMemberService;
import com.one.service.MemberService;

@Controller
@RequestMapping("/manager/userManagement/resign/regist")
public class ResignerRegistListController {

	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ManagementMemberService managementMemberService;
	@Autowired
	private CommonService commonService;
	
	//퇴사자 등록 화면
		
	@RequestMapping("/list.do")
	public ModelAndView registResignerForm(Criteria cri, ModelAndView mnv) throws SQLException{
		String url = "manager/userManagement/registResignerFF";
		
		cri.setPerPageNum(8);
		Map<String,Object> dataMap = managementMemberService.getMemberListExceptResigners(cri);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
			  
		return mnv;
	}
		 
	//퇴사자 일괄 등록
	@RequestMapping("/modifycheckedResigners")
	public String modifycheckedResigners(String [] memEmail, RedirectAttributes rttr)throws SQLException{
		String url = "redirect:/manager/userManagement/resign/regist/list.do";
			
		managementMemberService.modifyCheckedResigners(memEmail);
		rttr.addFlashAttribute("from","modifyResigners");
			
		return url;
	}
}
