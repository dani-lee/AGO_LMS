package com.one.controller.user.myPage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.command.Criteria;
import com.one.dto.AskVO;
import com.one.dto.MemberVO;
import com.one.dto.NoticeVO;
import com.one.service.AskService;
import com.one.service.NoticeService;

@Controller
@RequestMapping("/user/myPage/myAsk")
public class MyASKController {
	
	@Resource(name="askService")
	private AskService service;

	
	 // 메인페이지
	@RequestMapping(value = "/main.do")
	public ModelAndView main(Criteria cri, ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/user/myPage/MyAsk/list";
		cri.setPerPageNum(15);
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
/*		System.out.println(cri.getKeyword());
		System.out.println(session.getAttribute("loginUser"));*/
		Map<String,Object> dataMap = service.getMyAskList(loginUser.getMemId(), cri);
/*		List<AskVO> askList = (List<AskVO>) dataMap.get("askList");
		System.out.println("asklistTitle => "+askList.get(0).getQnTitle());*/
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/list.do")
	public ModelAndView list(Criteria cri, ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/user/myPage/MyAsk/list";
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		// System.out.println("sort : "+cri.getKeyword());
		cri.setPerPageNum(10);
		// System.out.println(cri.getKeyword());
		Map<String,Object> dataMap = service.getMyAskList(loginUser.getMemId(),cri);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	 // 문의게시판 상세 페이지 
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(String askNo, ModelAndView mnv) throws Exception{
		String url = "/user/myPage/MyAsk/detail";
		AskVO ask = null;
		ask = service.getAsk(Integer.parseInt(askNo));
		mnv.addObject("ask",ask);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/remove.do")
	public String remove(int[] qnNo, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/user/myPage/myAsk/list.do";
		
		service.remove(qnNo);
		
		return url;
	}
	

		
}
