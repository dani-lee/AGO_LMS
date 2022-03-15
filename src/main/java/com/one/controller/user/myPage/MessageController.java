package com.one.controller.user.myPage;

import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.one.command.Criteria;
import com.one.command.MessageComand;
import com.one.dto.AskVO;
import com.one.dto.MemberVO;
import com.one.dto.MessageVO;
import com.one.dto.NoticeVO;
import com.one.service.AskService;
import com.one.service.MessageService;
import com.one.service.NoticeService;

@Controller
@RequestMapping("/user/myPage/message")
public class MessageController {

	@Autowired
	MessageService messageService;

	
	@RequestMapping("/list.do")
	public ModelAndView list(Criteria cri, ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/user/myPage/Message/list";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		Map<String, Object>dataMap = messageService.getMessageList(member.getMemEmail(), cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/msgDetail.do")
	@ResponseBody
	public ResponseEntity<MessageVO> msgDetail(int msgNo, HttpSession session)throws Exception{
		ResponseEntity<MessageVO> entity = null;
		
		MessageComand msgCMD = new MessageComand();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		msgCMD.setMemEmail(member.getMemEmail());
		msgCMD.setMsgNo(msgNo);
		
		try {
			MessageVO message = messageService.getMessage(msgCMD);

			entity = new ResponseEntity<MessageVO>(message,HttpStatus.OK);
		}catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<MessageVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/removeMsg.do")
	public String removeMsg(int[] msgNo, HttpSession session)throws SQLException{
		String url = "redirect:/user/myPage/message/list.do";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("member", member.getMemEmail());
		dataMap.put("msgNo", msgNo);
		messageService.removeMsg(dataMap);
		
		return url;
		
	}

}
