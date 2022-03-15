package com.one.controller.user.management;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.dto.FaqVO;
import com.one.service.FaqService;

@Controller
@RequestMapping("/user/management/faq")
public class FaqController {

	@Autowired
	private FaqService faqService;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "user/management/FAQ/list";
		Map<String, Object> dataMap = faqService.getFaqList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(int faqNo, ModelAndView mnv) throws Exception {
		String url = "user/management/FAQ/detail";
		FaqVO faq = faqService.getFaq(faqNo);

		mnv.addObject("faq", faq);
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
}
