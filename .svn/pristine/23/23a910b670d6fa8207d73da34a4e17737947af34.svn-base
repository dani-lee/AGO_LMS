package com.one.controller.user.community;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
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
import com.one.dto.ClassVO.ClassVO;
import com.one.service.ClassReviewService;
import com.one.service.CommonService;

@Controller
@ResponseBody
@RequestMapping("/user/community/classReview")
public class RESTfulClassReviewController {
	
	@Autowired
	private ClassReviewService classReviewService;
	
	@Autowired
	private CommonService commonService;
	
	@Resource(name = "classUploadPath")
	private String picturePath;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView classReviewMain(ModelAndView mnv, Criteria cri) throws Exception{
		String url = "user/community/classReview/list";
		
		Map<String, Object> dataMap = classReviewService.getClassReviewList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getDebateRepltList(@RequestParam("opcl") int opcl) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> dataMap = classReviewService.getClassReviewDetail(opcl);
			ClassVO classDetail = (ClassVO) dataMap.get("classDetail");
			classDetail.setClCate(commonService.getCodeName1ByCommonCode(classDetail.getClCate()));
			classDetail.setClFormat(commonService.getCodeName1ByCommonCode(classDetail.getClFormat()));
			classDetail.setClDivision(commonService.getCodeName1ByCommonCode(classDetail.getClDivision()));
			dataMap.put("classDetail", classDetail);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String picture) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		try {

			in = new FileInputStream(new File(imgPath, picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} finally {
			in.close();
		}

		return entity;
	}
	
}




















