package com.one.controller.manager.management;

import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.dto.FaqVO;
import com.one.dto.NoticeVO;
import com.one.service.FaqService;

@Controller
@RequestMapping("manager/management/faq")
public class ManagerFAQController {

	@Autowired
	private FaqService faqService;

	// 자주묻는질문 리스트
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "manager/management/faq/newList";
		Map<String, Object> dataMap = faqService.getFaqList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	// 대시보드 리스트 이벤트
	@RequestMapping("/recent")
	@ResponseBody
	public ResponseEntity<List<FaqVO>> nomal(String sortType, String searchType) throws Exception {
		Criteria cri = new Criteria();
		cri.setSortType(sortType);
		cri.setSearchType(searchType);
		cri.setPerPageNum(4);
		ResponseEntity<List<FaqVO>> entity = null;
		List<FaqVO> faqList = faqService.getRecentFaqList(cri);
		entity = new ResponseEntity<List<FaqVO>>(faqList ,HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(int faqNo, ModelAndView mnv) throws Exception {
		String url = "manager/management/faq/detail2";
		FaqVO faq = faqService.getFaq(faqNo);

		mnv.addObject("faq", faq);
		mnv.setViewName(url);
		return mnv;
	}

	// 자주묻는질문 수정 폼
	@RequestMapping(value = "/modifyForm.do", method = RequestMethod.GET)
	public ModelAndView modifyForm(int faqNo, HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "/manager/management/faq/modify";
		HttpSession session = request.getSession();
		session.setAttribute("faqModify", true);

		FaqVO faq = faqService.getFaq(faqNo);
		mnv.addObject("faq", faq);
		mnv.setViewName(url);

		return mnv;
	}

	// 자주묻는질문 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public ModelAndView modify(FaqVO faq, HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "redirect:/manager/management/faq/detail.do?faqNo=" + faq.getFaqNo();
		HttpSession session = request.getSession();

		Boolean regist = (Boolean) session.getAttribute("faqModify");
		if (regist != null && regist) {
			faqService.modify(faq);
			session.removeAttribute("faqModify");
			mnv.addObject("message", "수정에 성공하셨습니다.");
		}
		mnv.setViewName(url);

		return mnv;
	}

	// 자주묻는질문 등록 폼
	@RequestMapping(value = "/registForm.do", method = RequestMethod.GET)
	public String registFrom(HttpServletRequest request) throws Exception {
		String url = "/manager/management/faq/regist";
		HttpSession session = request.getSession();
		session.setAttribute("faqRegist", true);

		return url;
	}

	// 자주묻는질문 등록
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public ModelAndView regist(FaqVO faq, HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "redirect:/manager/management/faq/list.do";
		HttpSession session = request.getSession();

		Boolean regist = (Boolean) session.getAttribute("faqRegist");
		if (regist != null && regist) {
			faqService.regist(faq);
			session.removeAttribute("faqRegist");
			mnv.addObject("message", "등록에 성공하셨습니다.");
		}

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/remove.do", method = RequestMethod.GET)
	public ModelAndView remove(int faqNo, ModelAndView mnv) throws Exception {
		String url = "redirect:/manager/management/faq/list.do";

		faqService.remove(faqNo);

		mnv.setViewName(url);
		return mnv;
	}
}
