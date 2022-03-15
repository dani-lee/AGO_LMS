package com.one.controller.user.management;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.command.Criteria;
import com.one.dto.AskVO;
import com.one.service.AskService;

@Controller
@RequestMapping("/user/management/ask")
public class AskController {

	@Autowired
	private AskService askService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView home(Criteria cri, ModelAndView mnv) throws SQLException {
		String url = "user/management/ask/list";
	
		Map<String,Object> dataMap = askService.getAskList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping(value = "/registForm.do", method = RequestMethod.GET)
	public String registForm() {
		String url = "user/management/ask/regist";
		return url;
	}
	
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String regist(AskVO ask, RedirectAttributes rttr) throws SQLException {
		String url = "redirect:/user/management/ask/list.do";
		
		askService.regist(ask);
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(int qnNo,ModelAndView mnv) throws SQLException {
		String url = "user/management/ask/detail";
		
		AskVO ask = askService.getAsk(qnNo);
		
		mnv.addObject("ask", ask);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
}
