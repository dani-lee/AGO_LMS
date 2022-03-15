package com.one.controller.manager.classManagement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.dto.ExamExcelVO;
import com.one.dto.ExamStastisDetailVO;
import com.one.service.ExamManagementService;
import com.one.service.ExamStatisService;

@Controller
@RequestMapping("/manager/exam")
public class ManagerExamController {

	@Autowired
	private ExamStatisService examStatisService;

	@Autowired
	private ExamManagementService examManagementService;
	
	@Resource(name = "excelTempPath")
	private String excelTempPath;
	
	
	@ResponseBody
	@RequestMapping(value="/getTest.do", method=RequestMethod.POST)
	public ResponseEntity<List<ExamExcelVO>> getTest(String fileName) throws Exception {
		ResponseEntity<List<ExamExcelVO>> entity = null;

		try {
			Map<String, Object> map = examManagementService.readExam(fileName);

			List<ExamExcelVO> data = (List<ExamExcelVO>) map.get("examList");

			entity = new ResponseEntity<List<ExamExcelVO>>(data, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<List<ExamExcelVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	// 시험 통계 메인
	@RequestMapping("/stastics.do")
	public ModelAndView stastics(Criteria cri, ModelAndView mnv, @RequestParam(value = "tabType", defaultValue = "true") boolean isStastisTab) throws Exception {
		String url = "/manager/exam/stastics/stasticsMain";
		
		cri.setPerPageNum(6);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap = examStatisService.getExamStatisList(cri);
		
		mnv.setViewName(url);
		mnv.addObject("dataMap", dataMap);
		
		mnv.setViewName(url);
		return mnv;
	}

	// 시험 통계 상세
	@RequestMapping("/scDetail.pop")
	public ModelAndView stasticsDetail(ModelAndView mnv, int opcl) throws Exception {
		String url = "/manager/exam/stastics/stasticsDetail";
		
		ExamStastisDetailVO examDetail = examStatisService.getExamStastisDetail(opcl, excelTempPath);
		
		mnv.addObject("examDetail", examDetail);
		mnv.setViewName(url);

		return mnv;
	}

}
