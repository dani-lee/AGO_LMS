package com.one.controller.user.myClass;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.ptg.MemErrPtg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.dao.ClassStasticsDAO;
import com.one.dto.MemberVO;
import com.one.dto.ClassVO.ClassStasticsVO;
import com.one.service.LikeClassService;

@Controller
@RequestMapping("/user/myClass/clsLike")
public class clsLikeController {
	
	@Autowired
	LikeClassService likeClassService;
	
	@RequestMapping("/list.do")
	public ModelAndView listForclsLikeList(ModelAndView mnv, Criteria cri, HttpSession session) throws Exception {
		String url = "user/myClass/clsLike/list";
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		MemberVO member = loginUser.getClone();
		String memEmail = member.getMemEmail();
		String memDpId = member.getDpId();
		String memPost = member.getPositionId();
		
		Map<String, Object> dataMap =  likeClassService.getLikeClassList(memEmail, cri, memDpId);
		Map<String, Object> pointInfo = likeClassService.getLikeClPoint(memEmail);
		
		pointInfo.put("memCredit", member.getMemCredit());
		
		
		mnv.addObject("memPost", memPost);
		mnv.addObject("memDpId", memDpId);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("pointInfo", pointInfo);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/removeLikeCls.do")
	public String removeLikeCls(int[] opcl, HttpSession session)throws SQLException{
		String url = "redirect:/user/myClass/clsLike/list.do";
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		MemberVO member = loginUser.getClone();
		String memEmail = member.getMemEmail();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("member", memEmail);
		dataMap.put("opcl", opcl);
		likeClassService.removeLikeCls(dataMap);
		
		return url;
	}
}
