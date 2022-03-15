package com.one.controller.user.management;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.dto.NoticeVO;
import com.one.service.NoticeService;

@Controller
@RequestMapping("/user/management/notice")
public class NoticeController {
	
	@Resource(name="fileUploadPath")
	private String fileUploadPath;
	
	@Resource(name="noticeService")
	private NoticeService service;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws SQLException{
		String url = "/user/management/Notice/list";
		List<NoticeVO> imptNoticeList = null;
		if(cri.getPage()==1) {
			cri.setPerPageNum(3);
			cri.setSortType("i");
			// System.out.println(cri.getKeyword());
			imptNoticeList = service.getImportantNoticeList(cri);
			cri.setSortType("a");
			cri.setPerPageNum(12);
		}else {
			cri.setSortType("a");
			cri.setPerPageNum(15);
		}
		Map<String,Object> dataMap = service.getNoticeList(cri);		
		dataMap.put("imptNoticeList", imptNoticeList);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/detail.do")
	public ModelAndView detail(String noticeNo,  String from, ModelAndView mnv) throws Exception{
		String url = "/user/management/Notice/detail";
		NoticeVO notice = null;

		service.read(Integer.parseInt(noticeNo));

		
		notice = service.getNotice(Integer.parseInt(noticeNo));
		mnv.addObject("notice",notice);
		mnv.addObject("from",from);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/getFile.do")
	public String getFile(String fileName, Model model) throws Exception{
		String url = "downloadFile";
		
		model.addAttribute("savePath", fileUploadPath);
		model.addAttribute("fileName", fileName);
		
		return url;
	}
}
